package crud;

import java.lang.reflect.Field;
import java.sql.*;
import java.time.LocalTime;
import java.util.ArrayList;

public class Dao {

//<-----------------------SELECT ------------------------------------------------------------------------------------------------>

    public  <T> ArrayList<T> selectAll(String query) {
        ArrayList<T> dataList = new ArrayList<T>();
        // Connection Posgres
       Connection connection = PostgreConnection.connectPostgre();

        //Connection Oracle
        //Connection connection = OracleConnection.connectOracle();
        Class<? extends Dao> objectClass = this.getClass();
        try {
            assert connection != null;
            Statement statement = connection.createStatement();
            ResultSet rs = statement.executeQuery(query);
            ResultSetMetaData rsmd = rs.getMetaData();


            while (rs.next()) {
                Object object = objectClass.getConstructor().newInstance();
                Field[] fields = object.getClass().getDeclaredFields();
                for (int i = 0; i < rsmd.getColumnCount(); i++) {
                    fields[i].setAccessible(true);
                    if(fields[i].getType().equals(int.class)){
                        int columnValue = rs.getInt(i + 1);
                        fields[i].setInt(object, columnValue);
                    } else if (fields[i].getType().equals(double.class)) {
                        double columnValue = rs.getDouble(i + 1);
                        fields[i].setDouble(object, columnValue);
                    }else if (fields[i].getType().equals(float.class)){
                        float columnValue = rs.getFloat( i+1);
                        fields[i].setFloat(object, columnValue);
                    } else if (fields[i].getType().equals(boolean.class)) {
                        boolean columnValue = rs.getBoolean(i+1);
                        fields[i].setBoolean(object, columnValue);
                    } else {
                        Object columnValue = rs.getObject(i + 1);
                        fields[i].set(object, columnValue);
                    }
                }
                dataList.add((T) objectClass.cast(object));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return dataList;
    }

    public <T> T selectOne(String query){
        ArrayList<T> dataList = this.selectAll(query);
        return dataList.get(0);
    }

    //<----------------------- INSERT ------------------------------------------------------------------------------------------------>

    public ArrayList<String> getFieldNames() {
        ArrayList<String> fieldNames = new ArrayList<>();
        Field[] fields = this.getClass().getDeclaredFields();
        for (Field field : fields) {
            fieldNames.add(field.getName());
        }
        return fieldNames;
    }


    public  String getValuesString(){
        int number = this.getFieldNames().size();
        String value = " values(?";

        for(int i = 0; i < number-1; i++){
            value += ",?";
        }
        return value += ")";
    }

    public  String getValuesStringWithoutId(){
        int number = this.getFieldNames().size() - 1;
        String value = " values(?";

        for(int i = 0; i < number-1; i++){
            value += ",?";
        }
        return value += ")";
    }

    public String getColumNames() {
        //initialize the returned String
        String returnedString = "(";

        //Get the fields name
        ArrayList<String> fieldname = this.getFieldNames();

        for (int i = 0; i < fieldname.size(); i++){
            returnedString += fieldname.get(i) + ",";
        }

        returnedString = returnedString.substring(0, returnedString.length() -1) + ")";

        return returnedString;
    }

    public String getColumNamesWithoutId() {
        //initialize the returned String
        String returnedString = "(";

        //Get the fields name
        ArrayList<String> fieldname = this.getFieldNames();

        for (int i = 1; i < fieldname.size(); i++){
            returnedString += fieldname.get(i) + ",";
        }

        returnedString = returnedString.substring(0, returnedString.length() -1) + ")";

        return returnedString;
    }

    public String getStatementWithoutId(String tableName){
        String statement = "insert into ";
        statement += tableName;
        statement += this.getColumNamesWithoutId();
        statement +=  this.getValuesStringWithoutId();

        return statement;
    }

    //return string used for the statement query
    public String getStatement(String tableName){
        String statement = "insert into ";
        statement += tableName;
        statement += this.getColumNames();
        statement +=  this.getValuesString();

        return statement;
    }

    public ArrayList<Object> listObject() throws Exception{
        ArrayList<Object> arr = new ArrayList<>();
        Field[] fields = this.getClass().getDeclaredFields();
        for (int i = 0; i < fields.length; i++) {
            //make the field accessible
            fields[i].setAccessible(true);
            arr.add(fields[i].get(this));
        }
        return arr;
    }

    public ArrayList<Object> listObjectWithoutId() throws Exception{
        ArrayList<Object> arr = new ArrayList<>();
        Field[] fields = this.getClass().getDeclaredFields();
        for (int i = 1; i < fields.length; i++) {
            //make the field accessible
            fields[i].setAccessible(true);
            arr.add(fields[i].get(this));
        }
        return arr;
    }

    public void executeUpdate(String query) throws Exception {
        //Connect to Oracle
        //Connection con = OracleConnection.connectOracle();

        //Connect to posgres
        Connection con = PostgreConnection.connectPostgre();

        assert con != null;
        ArrayList<Object> arr = listObject();
        PreparedStatement ps = con.prepareStatement(query);

        for(int i = 0; i < arr.size(); i++){
            ps.setObject(i + 1, arr.get(i));
        }

        ps.executeUpdate();
        con.close();
        ps.close();
    }

    public void executeUpdateWithoutId(String query) throws Exception {
        //Connect to Oracle
        //Connection con = OracleConnection.connectOracle();

        //Connect to posgres
        Connection con = PostgreConnection.connectPostgre();

        assert con != null;
        ArrayList<Object> arr = listObjectWithoutId();
        PreparedStatement ps = con.prepareStatement(query);

        for(int i = 0; i < arr.size(); i++){
            ps.setObject(i + 1, arr.get(i));
        }

        ps.executeUpdate();
        con.close();
        ps.close();
    }

    public void insertWithoutId(String tableName) throws Exception {
        //this.executeUpdate(this.getStatementWithoutId(tableName));
        this.executeUpdateWithoutId(this.getStatementWithoutId(tableName));
        System.out.println("values inserted");
    }

    public void insertObject(String tableName) throws Exception {
        this.executeUpdate(this.getStatement(tableName));
        System.out.println("values inserted");
    }

    //<----------------------- UPDATE ------------------------------------------------------------------------------------------------>

    public String  createUpdateString(String tableName, String whereCondition){
        ArrayList<String> list = this.getFieldNames();
        String query = "UPDATE " + tableName + " SET ";

        for (String field: list) {
            query += field + " = ?, ";
        }

        return query.substring(0, query.length()-2) + " " + whereCondition;
    }




    public void updateObject(String tableName, String whereCondition) throws Exception {
        this.executeUpdate(this.createUpdateString(tableName, whereCondition));
    }


    //<----------------------- DELETE ------------------------------------------------------------------------------------------------>

    public void executeUpdateModified(String query) throws Exception {
        //Connect to Oracle
        //Connection con = OracleConnection.connectOracle();

        //Connect to posgres
        Connection con = PostgreConnection.connectPostgre();

        assert con != null;
        ArrayList<Object> arr = listObject();
        PreparedStatement ps = con.prepareStatement(query);

        ps.executeUpdate();
        con.close();
        ps.close();
    }



    public String createDeleteString(String tableName, String whereCondition){
        return "DELETE FROM " + tableName + " " + whereCondition;
    }


    public String createDeleteString(String tableName){
        String query = "DELETE FROM " + tableName + " WHERE ";
        ArrayList<String> list = this.getFieldNames();

        for (String fieldName: list) {
            query +=  fieldName + " = ? AND ";
        }

        return  query.substring(0, query.length()-4);
    }

    public void deleteObject(String tableName, String whereCondition) throws Exception {
        this.executeUpdateModified(this.createDeleteString(tableName, whereCondition));
    }

    public void deleteObject(String tableName) throws Exception {
        this.executeUpdate(this.createDeleteString(tableName));
    }
    public void deleteAllObject(String tablename) throws Exception{
        Connection con = PostgreConnection.connectPostgre();

        assert con != null;
        PreparedStatement ps = con.prepareStatement("delete from "+tablename);

        ps.executeUpdate();
        con.close();
        ps.close();
    }
    public void executeQuery(String query) throws Exception{
        Connection con = PostgreConnection.connectPostgre();

        assert con != null;
        PreparedStatement ps = con.prepareStatement(query);

        ps.executeUpdate();
        con.close();
        ps.close();
    }

    //-------------------------------------- CREATE ----------------------------------------

    public String createTableFromObjectString() {
        StringBuilder sb = new StringBuilder();
        sb.append("CREATE TABLE ").append(this.getClass().getSimpleName()).append(" (\n");
        for (Field field : this.getClass().getDeclaredFields()) {
            sb.append("\t").append(field.getName()).append(" ").append(getSQLType(field)).append(",\n");
        }
        sb.deleteCharAt(sb.lastIndexOf(","));
        sb.append("\n);");
        return sb.toString();
    }
//Only Work to postgres
    private String getSQLType(Field field) {
        Class<?> type = field.getType();
        if (type == String.class) {
            return "VARCHAR(255)";
        } else if (type == int.class || type == Integer.class) {
            return "INT";
        } else if (type == boolean.class || type == Boolean.class) {
            return "BOOL";
        } else if (type == float.class || type == Float.class) {
            return "float4";
        } else if (type == double.class || type == Double.class) {
            return "float8";
        } else if (type == long.class || type == Long.class) {
            return "BIGINT";
        } else if (type == java.sql.Timestamp.class ) {
            return "TIMESTAMP";
        } else if (type == java.sql.Date.class) {
            return "DATE";
        } else if (type == java.math.BigDecimal.class) {
            return "NUMERIC";
        } else if (type == java.sql.Time.class) {
            return "TIME";
        }
        // Add additional cases for other data types as needed
        return "";
    }

    public void createTableFromObject() throws Exception {
        this.executeUpdateModified(this.createTableFromObjectString());
    }
     
}
