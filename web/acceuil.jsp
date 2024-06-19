<%-- 
    Document   : acceuil
    Created on : 1 juin 2024, 15:15:05
    Author     : jessy
--%>
<%@ page import="entity.Equipe" %>

<%@ page import="java.util.ArrayList" %>
<%@ page import="detail.Classement_equipe" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<% 
    Classement_equipe c=new Classement_equipe();
    ArrayList<Classement_equipe> listeGlobal =c.getListeGlobal();
    ArrayList<Classement_equipe> listeJunior=c.getListeByCategorie(1);
    ArrayList<Classement_equipe> listeHomme=c.getListeByCategorie(3);
    ArrayList<Classement_equipe> listeFemme=c.getListeByCategorie(4);
    %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="assets/css/pageAdmin.css"/>
        <link rel="stylesheet" href="assets/css/tablecss.css"/>
    </head>
    <body>
    <nav>
        <a href="#">HOME</a>
        <a href="liste_etapes.jsp">Etapes</a>

        <a href="DeconnexionServlet">Deconnexion</a>
        <div id="indicator"></div>
    </nav>
        <%
                session = request.getSession(false);
                if (session!= null) {
                    Equipe equipe = (Equipe) session.getAttribute("equipe");
                    if (equipe!= null) {
            %>
            <%
                } else {
            %>
                Vous n'êtes pas connecté.
            <%
                    }
               }
            %>
      <div class="tablediv">    
        <h3>Toute categorie</h3>
        <table border="1">
              <thead>
                  <tr>
                      <th>classement</th>
                      <th>equipe</th>
                      <th>points</th>
                  </tr>
              </thead>
              <tbody>
                  <% for(Classement_equipe classe: listeGlobal) { %>
                  <tr>
                      <td><%= classe.getClassementEquipe()%></td>
                      <td><%= classe.getNom()%></td>
                      <td><%= classe.getTotal_points()%></td>
                  </tr>
                  <% } %>
              </tbody>
          </table>
      </div>
      <div class="tablediv">         
         <h3>Junior</h3>
         <table border="1">
            <thead>
                <tr>
                    <th>classement</th>
                    <th>equipe</th>
                    <th>points</th>
                </tr>
            </thead>
            <tbody>
                <% for(Classement_equipe classe: listeJunior) { %>
                <tr>
                    <td><%= classe.getClassementEquipe()%></td>
                    <td><%= classe.getNom()%></td>
                    <td><%= classe.getTotal_points()%></td>
                </tr>
                <% } %>
            </tbody>
        </table>
      </div>
      <div class="tablediv">
         <h3>Homme</h3>
         <table border="1">
            <thead>
                <tr>
                    <th>classement</th>
                    <th>equipe</th>
                    <th>points</th>
                </tr>
            </thead>
            <tbody>
                <% for(Classement_equipe classe: listeHomme) { %>
                <tr>
                    <td><%= classe.getClassementEquipe()%></td>
                    <td><%= classe.getNom()%></td>
                    <td><%= classe.getTotal_points()%></td>
                </tr>
                <% } %>
            </tbody>
        </table>
      </div>
      <div class="tablediv">
            <h3>Femme</h3>
         <table border="1">
            <thead>
                <tr>
                    <th>classement</th>
                    <th>equipe</th>
                    <th>points</th>
                </tr>
            </thead>
            <tbody>
                <% for(Classement_equipe classe: listeFemme) { %>
                <tr>
                    <td><%= classe.getClassementEquipe()%></td>
                    <td><%= classe.getNom()%></td>
                    <td><%= classe.getTotal_points()%></td>
                </tr>
                <% } %>
            </tbody>
        </table>
      </div>
    </body>
</html>