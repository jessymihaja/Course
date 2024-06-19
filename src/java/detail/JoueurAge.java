/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package detail;

import assossiation.CoureurCategorie;
import crud.Dao;
import java.util.ArrayList;

/**
 *
 * @author jessy
 */
public class JoueurAge extends Dao{
    int idCoureur;
    String Genre;
    int age;

    public int getIdCoureur() {
        return idCoureur;
    }

    public void setIdCoureur(int idCoureur) {
        this.idCoureur = idCoureur;
    }

    public String getGenre() {
        return Genre;
    }

    public void setGenre(String Genre) {
        this.Genre = Genre;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }
    
    public JoueurAge(){}
    
    public ArrayList<JoueurAge> getAllJoueurAge(){
        JoueurAge j= new JoueurAge();
        return j.selectAll("select * from joueurage");
    }
    public CoureurCategorie GenererCategorie(){
        CoureurCategorie cCat=new CoureurCategorie();
        if("F".equals(this.getGenre())){
            cCat.setIdCategorie(4);
        }else if("M".equals(this.getGenre())){
            cCat.setIdCategorie(3);
        }
        cCat.setIdCoureur(this.getIdCoureur());
        return cCat;
    }
    
}
