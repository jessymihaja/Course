/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package detail;

import crud.Dao;
import entity.Equipe;
import java.sql.Timestamp;
import java.sql.Date;
import java.util.ArrayList;
import org.mindrot.jbcrypt.BCrypt;

/**
 *
 * @author jessy
 */
public class Resultat extends Dao{
    int etape_rang;
    int numero_dossard;
    String nom;
    String genre;
    Date date_naissance;
    String equipe;
    Timestamp arrivee;

    public Timestamp getArrivee() {
        return arrivee;
    }

    public void setArrivee(Timestamp arrivee) {
        this.arrivee = arrivee;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    
    public int getEtape_rang() {
        return etape_rang;
    }

    public void setEtape_rang(int etape_rang) {
        this.etape_rang = etape_rang;
    }

    public int getNumero_dossard() {
        return numero_dossard;
    }

    public void setNumero_dossard(int numero_dossard) {
        this.numero_dossard = numero_dossard;
    }

    public String getGenre() {
        return genre;
    }

    public void setGenre(String genre) {
        this.genre = genre;
    }

    public Date getDate_naissance() {
        return date_naissance;
    }

    public void setDate_naissance(Date date_naissance) {
        this.date_naissance = date_naissance;
    }

    public String getEquipe() {
        return equipe;
    }

    public void setEquipe(String equipe) {
        this.equipe = equipe;
    }

    public Resultat() {
    }

    public Resultat(int etape_rang, int numero_dossard,String nom, String genre, Date date_naissance, String equipe,Timestamp arrivee) {
        this.setEtape_rang(etape_rang);
        this.setNumero_dossard(numero_dossard);
        this.setNom(nom);
        this.setGenre(genre);
        this.setDate_naissance(date_naissance);
        this.setEquipe(equipe);
        this.setArrivee(arrivee);
    }
    
    ArrayList<Equipe> getEquipeCSV(){
        ArrayList<Equipe>listeEquipe=new ArrayList<>();
        EquipeNoId equipeNoId=new EquipeNoId();
        ArrayList<EquipeNoId>eListe=equipeNoId.selectAll("select distinct equipe,equipe,equipe from resultat");
        for (EquipeNoId noId: eListe) {
            String hashedPassword = BCrypt.hashpw(noId.getPassword(), BCrypt.gensalt());
            Equipe eqp=new Equipe(noId.getNom(), noId.getLogin(),hashedPassword);
            listeEquipe.add(eqp);
        }
        return listeEquipe;
    }
    public void insertEquipeCSV() throws Exception{
        Resultat rs=new Resultat();
        ArrayList<Equipe> liste=rs.getEquipeCSV();
        for (Equipe equipe1 : liste) {
            equipe1.insertWithoutId("equipe");
        }
    }
    public void insertCoureurCSV() throws Exception{
        Resultat rs=new Resultat();
        rs.executeQuery("INSERT INTO coureur (nom, numero, genre, dtn, idEquipe) select distinct r.nom,r.numero_dossard as numero,r.genre,r.date_naissance as dtn,e.idequipe from resultat as r join equipe as e on e.nom=r.equipe");
    }
    public void insertCoureurEtapeTempsCSV() throws Exception{
        String request="insert into CoureurEtapeTemps(heureArrivee,idcoureur,idetape,DateArrivee) select CAST(TO_CHAR(r.arrivee, 'HH24:MI:SS')AS TIME) AS heureArrivee,c.idcoureur,e.idetape,CAST(TO_CHAR(r.arrivee, 'YYYY-MM-DD')AS DATE) AS dateArrivee from resultat as r join etape as e on e.rang=r.etape_rang join coureur as c on c.nom=r.nom"; 
        Resultat rs=new Resultat();
        rs.executeQuery(request);
        
    }
    public void insertCoureurEtape() throws Exception{
        String request="insert into CoureurEtape(idcoureur,idetape) select c.idcoureur,e.idetape from resultat as r join etape as e on e.rang=r.etape_rang join coureur as c on c.nom=r.nom";
        Resultat rs=new Resultat();
        rs.executeQuery(request);
    }
    
    
    
    
    
    
    public static void main(String[] args) throws Exception {
            Resultat r=new Resultat();
        ArrayList<Equipe> Liste =r.getEquipeCSV();
        for (Equipe equipe : Liste) {
            System.out.println(equipe.getPassword());
        }
        r.insertCoureurEtape();
        //r.insertCoureurCSV();
        //r.insertCoureurEtapeTempsCSV();
        
      
    }
    
    
}
