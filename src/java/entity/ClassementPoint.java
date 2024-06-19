/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

import crud.Dao;

/**
 *
 * @author jessy
 */
public class ClassementPoint extends Dao{
    int idClassementPoint;
    int idEtape;
    int classement;
    int points;

    public int getIdClassementPoint() {
        return idClassementPoint;
    }

    public void setIdClassementPoint(int idClassementPoint) {
        this.idClassementPoint = idClassementPoint;
    }

    public int getIdEtape() {
        return idEtape;
    }

    public void setIdEtape(int idEtape) {
        this.idEtape = idEtape;
    }

    public int getClassement() {
        return classement;
    }

    public void setClassement(int classement) {
        this.classement = classement;
    }

    public int getPoints() {
        return points;
    }

    public void setPoints(int points) {
        this.points = points;
    }

    public ClassementPoint() {
    }

    public ClassementPoint(int idEtape, int classement, int points) {
        this.setIdEtape(idEtape);
        this.setClassement(classement);
        this.setPoints(points);
    }
    
    
}
