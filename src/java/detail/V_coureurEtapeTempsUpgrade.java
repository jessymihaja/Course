/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package detail;

import crud.Dao;
import entity.Coureur;
import entity.Etape;
import java.sql.Time;
import java.time.LocalTime;
import java.util.ArrayList;

/**
 *
 * @author jessy
 */
public class V_coureurEtapeTempsUpgrade extends Dao{
    int idCoureurEtapeTemps;
    int idCoureur;
    int idEtape;
    double difference_temps;

    public int getIdCoureurEtapeTemps() {
        return idCoureurEtapeTemps;
    }

    public void setIdCoureurEtapeTemps(int idCoureurEtapeTemps) {
        this.idCoureurEtapeTemps = idCoureurEtapeTemps;
    }

    public int getIdCoureur() {
        return idCoureur;
    }

    public void setIdCoureur(int idCoureur) {
        this.idCoureur = idCoureur;
    }

    public int getIdEtape() {
        return idEtape;
    }

    public void setIdEtape(int idEtape) {
        this.idEtape = idEtape;
    }

    public double getDifference_temps() {
        return difference_temps;
    }

    public void setDifference_temps(double difference_temps) {
        this.difference_temps = difference_temps;
    }
    public Coureur getCoureur(){
        Coureur c=new Coureur();
        return c.selectOne("select * from Coureur where idcoureur="+this.getIdCoureur());
        
    }
    public V_coureurEtapeTempsUpgrade(){}
    public ArrayList<V_coureurEtapeTempsUpgrade> getAllChronoByEquipe(int idequipe,int idetape){
        V_coureurEtapeTempsUpgrade v= new V_coureurEtapeTempsUpgrade();
        return v.selectAll("select idcoureuretapetemps,v.idcoureur,idetape,difference_temps from v_coureuretapeTempsUpgradeDateCategorie as v join coureur as c on c.idcoureur=v.idcoureur  where v.idequipe="+idequipe+" and idetape="+idetape);
    }
    public static String convertSecondsToTime(double seconds) {
        // Convertir le nombre de secondes en heures, minutes et secondes
        if(seconds==0){
            return " ";
        }
        int hours = (int) (seconds / 3600);
        int minutes = (int) ((seconds % 3600) / 60);
        int secs = (int) (seconds % 60);

        
        String localtemps = String.valueOf(hours)+":"+String.valueOf(minutes)+":"+String.valueOf(secs);
        
        return localtemps;
    }
    
    
    
}
