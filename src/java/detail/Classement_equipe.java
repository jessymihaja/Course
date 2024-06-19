/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package detail;

import crud.Dao;
import entity.ClassementPoint;
import java.util.ArrayList;

/**
 *
 * @author jessy
 */
public class Classement_equipe extends Dao{
    int idEquipe;
    String nom;
    int total_points;
    int classementEquipe;

    public int getClassementEquipe() {
        return classementEquipe;
    }

    public void setClassementEquipe(int classementEquipe) {
        this.classementEquipe = classementEquipe;
    }

    public int getIdEquipe() {
        return idEquipe;
    }

    public void setIdEquipe(int idEquipe) {
        this.idEquipe = idEquipe;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public int getTotal_points() {
        return total_points;
    }

    public void setTotal_points(int total_points) {
        this.total_points = total_points;
    }
    public Classement_equipe(){}
    public ArrayList<Classement_equipe> getListeGlobal(){
        Classement_equipe c = new Classement_equipe();
        return c.selectAll("select * from v_classement_equipe");
    }
    public ArrayList<Classement_equipe> getListeByCategorie(int idCategorie){
        Classement_equipe c=new Classement_equipe();
        return c.selectAll("select idequipe,nom,total_points,classement_equipe from v_classement_equipe_categorie where idCategorie="+idCategorie);
    }
    
}
