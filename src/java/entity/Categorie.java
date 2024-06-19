/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

import crud.Dao;
import java.util.ArrayList;

/**
 *
 * @author jessy
 */
public class Categorie extends Dao{
    int idCategorie;
    String nom;

    public int getIdCategorie() {
        return idCategorie;
    }

    public void setIdCategorie(int idCategorie) {
        this.idCategorie = idCategorie;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public Categorie(String nom) {
        this.setNom(nom);
    }
    public Categorie(){}
    public ArrayList<Categorie> getAllCategorie(){
        Categorie c= new Categorie();
        return c.selectAll("select * from categorie");
    }
    
}
