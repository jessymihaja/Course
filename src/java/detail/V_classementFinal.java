/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package detail;

import crud.Dao;
import crud.EtapeDao;
import entity.Coureur;
import entity.Equipe;
import entity.Etape;
import java.util.ArrayList;

/**
 *
 * @author jessy
 */
public class V_classementFinal extends Dao{
    int idEtape;
    int idCoureur;
    int idEquipe;
    int Classement;
    int points;

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

    public int getIdEquipe() {
        return idEquipe;
    }

    public void setIdEquipe(int idEquipe) {
        this.idEquipe = idEquipe;
    }

    public int getClassement() {
        return Classement;
    }

    public void setClassement(int Classement) {
        this.Classement = Classement;
    }

    public int getPoints() {
        return points;
    }

    public void setPoints(int points) {
        this.points = points;
    }
    public V_classementFinal(){}
    public ArrayList<V_classementFinal> getListeByEtape(int idEtape){
        V_classementFinal v=new V_classementFinal();
        return v.selectAll("select * from v_classementfinal where idetape="+idEtape);
    }
    public ArrayList<V_classementFinal> getListeByEquipe(int idEquipe){
        V_classementFinal v=new V_classementFinal();
        return v.selectAll("select * from v_classementfinal where idequipe="+idEquipe);
    }
    
    public Coureur getCoureur(){
        Coureur c= new Coureur();
        return c.selectOne("select * from coureur where idcoureur="+this.getIdCoureur());
    }
    public Equipe getEquipe(){
        Equipe e=new Equipe();
        return e.selectOne("select * from equipe where idequipe="+this.getIdEquipe());
    }
    public Etape getEtape(){
        EtapeDao e= new EtapeDao();
        return e.selectOneEtape("select * from etape where idetape="+this.getIdEtape());
    }
}
