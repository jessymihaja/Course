/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package detail;

import crud.Dao;
import entity.Coureur;
import entity.Equipe;
import java.util.ArrayList;
import java.sql.Time;
import java.time.Duration;
import org.postgresql.util.PGInterval;
/**
 *
 * @author jessy
 */
public class V_classement_jour4 extends Dao{
    int idEtape;
    int idCoureur;
    int difference_temps;
    PGInterval penalite;
    int tempsFinal;
    int classement;

    public int getClassement() {
        return classement;
    }

    public void setClassement(int classement) {
        this.classement = classement;
    }

    public int getIdEtape() {
        return idEtape;
    }

    public void setIdEtape(int idEtape) {
        this.idEtape = idEtape;
    }

    public int getIdCoureur() {
        return idCoureur;
    }

    public void setIdCoureur(int idCoureur) {
        this.idCoureur = idCoureur;
    }

    public int getDifference_temps() {
        return difference_temps;
    }

    public void setDifference_temps(int difference_temps) {
        this.difference_temps = difference_temps;
    }

    public PGInterval getPenalite() {
        return penalite;
    }

    public void setPenalite(PGInterval penalite) {
        this.penalite = penalite;
    }

    public int getTempsFinal() {
        return tempsFinal;
    }

    public void setTempsFinal(int tempsFinal) {
        this.tempsFinal = tempsFinal;
    }
    
      public Coureur getCoureur(){
        Coureur c= new Coureur();
        return c.selectOne("select * from coureur where idcoureur="+this.getIdCoureur());
    }
    public V_classement_jour4() {
    }
      
    public ArrayList<V_classement_jour4> getListeByEtape(int idEtape){
        V_classement_jour4 v=new V_classement_jour4();
        return v.selectAll("select * from V_classement_jour4 where idetape="+idEtape);
    }
     public static String convertSecondsToTime(int seconds) {
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
     public static String convertPGIntervalToString(PGInterval pgInterval) {
        // Extract the hours, minutes, and seconds from the PGInterval
        int hours = pgInterval.getHours();
        int minutes = pgInterval.getMinutes();
        int seconds = (int) pgInterval.getSeconds();

        // Convert to total milliseconds
     String time=hours+":"+minutes+":"+seconds;
     return time;

        // Create java.sql.Time object
    }
}
