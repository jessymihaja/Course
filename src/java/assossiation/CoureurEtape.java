/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package assossiation;

import crud.Dao;
import crud.EtapeDao;
import entity.Coureur;
import entity.Etape;
import helper.NbCoureur;
import java.util.ArrayList;

/**
 *
 * @author jessy
 */
public class CoureurEtape extends Dao{
    int idCoureurEtape;
    int idCoureur;
    int idEtape;

    public int getIdCoureurEtape() {
        return idCoureurEtape;
    }

    public void setIdCoureurEtape(int idCoureurEtape) {
        this.idCoureurEtape = idCoureurEtape;
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

    public CoureurEtape(int idCoureur, int idEtape) {
        this.setIdCoureur(idCoureur);
        this.setIdEtape(idEtape);
    }
    public Etape getEtape(){
        EtapeDao e=new EtapeDao();
        return e.selectOneEtape("select * from etape where idetape="+this.getIdEtape());
    }
    public Coureur getCoureur(){
        Coureur c=new Coureur();
        return c.selectOne("select * from coureur where idcoureur="+this.getIdCoureur());
    }
    public double checkNbCoureurEtape(){  
        NbCoureur n=new NbCoureur();
        NbCoureur val= n.selectOne("select count(*) from etapeequipe where idequipe="+this.getCoureur().getIdEquipe()+" and idetape="+this.getIdEtape());
        return val.getNombre();
    }
    public boolean isValid(){
        if(this.checkNbCoureurEtape()<this.getEtape().getNbCoureur()){
            return true;
        }
        return false;
    }
    public CoureurEtape(){}
    public ArrayList<Coureur> getCoureursfromEtape(int idEtape){
        CoureurEtape ce=new CoureurEtape();
        ArrayList<CoureurEtape> ces=ce.selectAll("select * from coureurEtape where idetape="+idEtape);
        ArrayList<Coureur> liste=new ArrayList<>();
        for (CoureurEtape c : ces) {
            liste.add(c.getCoureur());
        }
        return liste;
    }
    public ArrayList<Coureur> getCoureursfromEtapeVAlides(int idEtape){
        CoureurEtape ce=new CoureurEtape();
        ArrayList<CoureurEtape> ces=ce.selectAll("SELECT * FROM coureurEtape c WHERE c.idetape ="+idEtape+"  AND NOT EXISTS ( SELECT 1 FROM CoureurEtapeTemps cet WHERE c.idcoureur = cet.idcoureur and cet.idEtape="+idEtape+")");
        ArrayList<Coureur> liste=new ArrayList<>();
        for (CoureurEtape c : ces) {
            liste.add(c.getCoureur());
        }
        return liste;
    }

    
    
}
