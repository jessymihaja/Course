<%-- 
    Document   : insertion_coureur
    Created on : 1 juin 2024, 14:11:19
    Author     : jessy
--%>
<%@ page import="entity.Equipe" %>
<%@ page import="java.util.ArrayList" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<% 
   
    Equipe e= new Equipe();
    ArrayList<Equipe> Eliste= e.getAllEquipe();
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
                        <link rel="stylesheet" href="assets/css/form.css"/>

    </head>
    <body>
        <h1>insertion coureur</h1>
        <div id="form">
            <form action="CoureurServlet" method="post">
                <div class="writeInInputs">
                    <h3><label>nom</label></h3>
                    <input type="text" name="nom">
                    <h3><label>numero</label></h3>
                    <input type="number" name="numero">
               </div>
            <div class="chooseInput">   
                <h3><label>genre</label></h3> 
                <input type="radio" id="genre" name="genre" value="homme"/>femme<br/>
                <input type="radio" id="genre" name="genre" value="femme" /> homme<br/>
            </div>
                <div class="writeInInputs">
                <h3><label>Date de naissance<label/></h3>
                <input type="date" id="appt_date" name="dtn"/>
                <br/><br/>
            </div>
            <div class="chooseInput">
            <h3><label>Equipe</label></h3>
            <br/>
            <select id="equipe" name="idequipe">
                <% for(Equipe eq : Eliste){ %>
              <option value="<%= eq.getIdEquipe()%>"><%= eq.getNom() %></option>
              <% } %>
              
            </select>
            <br/>
        </div>    
                
                
                    <input type="submit" value="inserer" id="bouton">
            </form>
        </div>
    </body>
</html>
