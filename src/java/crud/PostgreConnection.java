package crud;

import java.sql.Connection;
import java.sql.DriverManager;

public class PostgreConnection {
    public static Connection connectPostgre() {
        try {
            String url ="jdbc:postgresql://localhost:5432/eval2";
            String userName ="postgres";
            String password ="admin";

            Class.forName("org.postgresql.Driver"); //register jdbc driver
            Connection conn = DriverManager.getConnection(url, userName, password);
            return conn;

        } catch (Exception e) {
            System.out.println("Connection Failed");
            return null;
        }

    }
}