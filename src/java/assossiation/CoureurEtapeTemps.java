/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package assossiation;

import crud.Dao;
import entity.Etape;
import java.sql.Time;
import java.sql.Date;

/**
 *
 * @author jessy
 */
public class CoureurEtapeTemps extends Dao{
    int idCoureurEtapeTemps;
    Time heureArrivee;
    int idCoureur;
    int idEtape;
    Date dateArrivee;

    public Date getDateArrivee() {
        return dateArrivee;
    }

    public void setDateArrivee(Date dateArrivee) {
        this.dateArrivee = dateArrivee;
    }
    

    public int getIdCoureurEtapeTemps() {
        return idCoureurEtapeTemps;
    }

    public void setIdCoureurEtapeTemps(int idCoureurEtapeTemps) {
        this.idCoureurEtapeTemps = idCoureurEtapeTemps;
    }

    public Time getHeureArrivee() {
        return heureArrivee;
    }

    public void setHeureArrivee(Time heureArrivee) {
        this.heureArrivee = heureArrivee;
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

    public CoureurEtapeTemps(Time heureArrivee, int idCoureur, int idEtape,Date dateArrivee) {
        this.setHeureArrivee(heureArrivee);
        this.setIdCoureur(idCoureur);
        this.setIdEtape(idEtape);
        this.setDateArrivee(dateArrivee);
    }
    public Etape getEtape(){
        Etape e=new Etape();
        return e.selectOne("select * from etape where idetape="+this.getIdEtape());
    }
    
    
}
