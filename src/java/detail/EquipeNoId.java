/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package detail;

import crud.Dao;

/**
 *
 * @author jessy
 */
public class EquipeNoId extends Dao{
    String nom;
    String login;
    String password;

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public String getLogin() {
        return login;
    }

    public void setLogin(String login) {
        this.login = login;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public EquipeNoId() {
    }

    public EquipeNoId(String nom, String login, String password) {
        this.setNom(nom);
        this.setLogin(login);
        this.setPassword(password);
    }
    
    
}
