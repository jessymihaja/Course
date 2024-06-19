<%-- 
    Document   : insertion_penalite
    Created on : 4 juin 2024, 13:05:45
    Author     : jessy
--%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="entity.Equipe" %>
<%@ page import="entity.Etape" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Equipe e=new Equipe();
    ArrayList<Equipe> listeEquipe=e.getAllEquipe();
    Etape et=new Etape();
    ArrayList<Etape> listeEtape=et.getAllEtape();
    %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="assets/css/form.css"/>
        
    </head>
    <body>
        <%@include file='navAdmin.jsp' %>
        <h1>Insertion de penalité</h1>
        <div id="form">
            <form action="PenaliteServlet" method="post">
                <div class="chooseInput">
                    <h3><label>etape</label></h3>
                    <br><!-- comment -->
                    <select id="id" name="idEtape">
                        <% for(Etape etape : listeEtape ) { %>
                        <option value="<%= etape.getIdEtape()%>"><%= etape.getNom()%></option>
                        <% } %>
                    </select>
                </div>
                <div class="chooseInput">
                    <h3><label>equipe</label></h3>
                    <br><!-- comment -->
                    <select id="id" name="idEquipe">
                        <% for(Equipe equipe : listeEquipe ) { %>
                        <option value="<%= equipe.getIdEquipe()%>"><%= equipe.getNom()%></option>
                        <% } %>
                    </select>
                </div>
                <div class="writeInInputs">
                    <h3><label>Temps penalite</label></h3>
                    <input type="time" id="id" step="1" name="temps_penalite">
                </div>
                    <br><!-- comment -->
                    <input type="submit" value="valider" id="bouton">
            </form>
        </div>
    </body>
</html>
