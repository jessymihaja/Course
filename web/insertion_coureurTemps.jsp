<%-- 
    Document   : insertion_coureurEtape
    Created on : 1 juin 2024, 18:06:11
    Author     : jessy
--%>

<%@ page import="entity.Equipe" %>
<%@ page import="entity.Coureur" %>
<%@ page import="assossiation.CoureurEtape" %>
<%@ page import="java.util.ArrayList" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
            <%
                 // Récupérer le paramètre idEtape depuis l'URL
    String idEtapeParam = request.getParameter("idEtape");

    // Assurez-vous que le paramètre n'est pas nul et convertissez-le en entier
    int idEtape = 0;
    if (idEtapeParam != null) {
        try {
            idEtape = Integer.parseInt(idEtapeParam);
        } catch (NumberFormatException e) {
            // Gérez le cas où idEtape n'est pas un entier valide
            out.println("ID de l'étape invalide.");
            return;
        }
    } else {
        out.println("ID de l'étape non fourni.");
        return;
    }

    CoureurEtape ce=new CoureurEtape();
    ArrayList<Coureur> coureurs=ce.getCoureursfromEtapeVAlides(idEtape);
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
        <h1>affectation Heure a un coureur</h1>
        <div id="form">
            <form action="EtapeCoureurTempsServlet" method="post">
                
                <div class="chooseInput">
                    <h3><label>Joueur</label></h3>
                    <br/>
                    <select id="coureur" name="idCoureur">
                        <% for(Coureur eq : coureurs){ %>
                            <option value="<%= eq.getIdCoureur()%>"><%= eq.getNom() %></option>
                        <% } %>
              
                        </select>
                        <input type="hidden" id="id" name="idEtape" value="<%=idEtape%>">
                    <br/>
                    </div>
                    <div class="writeInInputs">
                        <h3><label>Date de arrivee<label/></h3>
                        <input type="date" id="appt_date" name="dateArrivee"/>
                        <br/><br/>
                    </div>
                    <div class="writeInInputs">
                        <h3><label>heure d'arrivée<label/></h3>
                        <label for="hours">Heures:</label>
                        <input type="number" id="hours" name="hours" min="0" max="23" required>
                        <br>
        
                        <label for="minutes">Minutes:</label>
                        <input type="number" id="minutes" name="minutes" min="0" max="59" required>
                        <br>
                        <label for="seconds">Secondes:</label>
                        <input type="number" id="seconds" name="seconds" min="0" max="59" required>
                                        <br/><br/>
                    </div>
                    
                
                
                    <input type="submit" value="inserer" id="bouton">
            </form>
        </div>
    </body>
</html>