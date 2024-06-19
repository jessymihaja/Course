/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package detail;

import crud.Dao;
import entity.Coureur;
import java.util.ArrayList;

/**
 *
 * @author jessy
 */
public class Detail_coureur extends Dao{
    int idCoureur;
    int idEquipe;
    int points;

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

    public int getPoints() {
        return points;
    }

    public void setPoints(int points) {
        this.points = points;
    }

    public Detail_coureur() {
    }

    public Detail_coureur(int idCoureur, int idEquipe, int points) {
        this.idCoureur = idCoureur;
        this.idEquipe = idEquipe;
        this.points = points;
    }
    public ArrayList<Detail_coureur> getListeByEquipe(int idEquipe){
        Detail_coureur v=new Detail_coureur();
        return v.selectAll("select idcoureur,idequipe,sum(points) as points  from V_classementFinal where idequipe="+idEquipe+" group by  idcoureur,idequipe;");
    }
     
    public Coureur getCoureur(){
        Coureur c= new Coureur();
        return c.selectOne("select * from coureur where idcoureur="+this.getIdCoureur());
    }
    
}
