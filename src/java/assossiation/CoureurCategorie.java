/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package assossiation;

import crud.Dao;

/**
 *
 * @author jessy
 */
public class CoureurCategorie extends Dao{
    int idCoureurCategorie;
    int idCoureur;
    int idCategorie;

    public int getIdCoureurCategorie() {
        return idCoureurCategorie;
    }

    public void setIdCoureurCategorie(int idCoureurCategorie) {
        this.idCoureurCategorie = idCoureurCategorie;
    }

    public int getIdCoureur() {
        return idCoureur;
    }

    public void setIdCoureur(int idCoureur) {
        this.idCoureur = idCoureur;
    }

    public int getIdCategorie() {
        return idCategorie;
    }

    public void setIdCategorie(int idCategorie) {
        this.idCategorie = idCategorie;
    }

    public CoureurCategorie(int idCoureur, int idCategorie) {
        this.setIdCoureur(idCoureur);
        this.setIdCategorie(idCategorie);
    }

    public CoureurCategorie() {
    }
    
    
}
