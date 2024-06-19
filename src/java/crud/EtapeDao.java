/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package crud;

/**
 *
 * @author jessy
 */
import entity.Etape;
import java.sql.*;
import java.util.ArrayList;

public class EtapeDao {

    public ArrayList<Etape> selectAllEtapes() {
        ArrayList<Etape> etapeList = new ArrayList<>();
        Connection connection = PostgreConnection.connectPostgre(); // Assurez-vous que cette méthode établit correctement la connexion

        String query = "SELECT idetape, nom, longueur, nbCoureur, rang, heureDepart,dateDepart FROM etape";
        try {
            assert connection != null;
            Statement statement = connection.createStatement();
            ResultSet rs = statement.executeQuery(query);

            while (rs.next()) {
                Etape etape = new Etape();
                etape.setIdEtape(rs.getInt("idetape"));
                etape.setNom(rs.getString("nom"));
                etape.setLongueur(rs.getDouble("longueur"));
                etape.setNbCoureur(rs.getInt("nbCoureur"));
                etape.setRang(rs.getInt("rang"));
                etape.setHeuredepart(rs.getTime("heureDepart"));
                etape.setDateDepart(rs.getDate("dateDepart"));
                etapeList.add(etape);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (connection != null) {
                    connection.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return etapeList;
    }
    
    public ArrayList<Etape> selectAllEtapeString(String q) {
        ArrayList<Etape> etapeList = new ArrayList<>();
        Connection connection = PostgreConnection.connectPostgre(); // Assurez-vous que cette méthode établit correctement la connexion

        String query =q;
        try {
            assert connection != null;
            Statement statement = connection.createStatement();
            ResultSet rs = statement.executeQuery(query);

            while (rs.next()) {
                Etape etape = new Etape();
                etape.setIdEtape(rs.getInt("idetape"));
                etape.setNom(rs.getString("nom"));
                etape.setLongueur(rs.getDouble("longueur"));
                etape.setNbCoureur(rs.getInt("nbCoureur"));
                etape.setRang(rs.getInt("rang"));
                etape.setHeuredepart(rs.getTime("heureDepart"));
                etape.setDateDepart(rs.getDate("DateDepart"));

                etapeList.add(etape);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (connection != null) {
                    connection.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return etapeList;
    }
    public Etape selectOneEtape(String query){
        ArrayList<Etape> dataList = this.selectAllEtapeString(query);
        return dataList.get(0);
    }

    
}

