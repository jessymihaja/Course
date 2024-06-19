<%-- 
    Document   : classementEtape
    Created on : 2 juin 2024, 18:34:43
    Author     : jessy
--%>

<%@ page import="java.util.ArrayList" %>
<%@ page import="detail.V_classementFinal" %>
<%@ page import="detail.V_classement_jour4" %>
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

            V_classement_jour4 v=new V_classement_jour4();
            ArrayList<V_classement_jour4> liste=v.getListeByEtape(idEtape);

                %>
<!DOCTYPE html>
<html>
     <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <!-- jQuery -->
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <!-- DataTables CSS -->
    <link rel="stylesheet" type="text/css" href="assets/DataTables/datatables.min.css">
    <!-- DataTables JS -->
    <script type="text/javascript" charset="utf8" src="assets/DataTables/datatables.min.js"></script>

    </head>
    <body>
    <%@include file='navAdmin.jsp' %>
        <h2>Classement</h2>
        <table id="example" class="display" style="width:100%">
        <thead>
            <tr>
                <th>classement</th>
                <th>coureur</th>
                <th>genre</th>
                <th>chrono</th>
                <th>penalite</th>
                <th>temps final</th>
                
                
            </tr>
        </thead>
        <tbody>
           <% for(V_classement_jour4 classe : liste) { %>
           <tr>
               <td><%= classe.getClassement()%></td>
               <td><%= classe.getCoureur().getNom()%></td>
               <td><%= classe.getCoureur().getGenre()%></td>
                <td><%= v.convertSecondsToTime(classe.getDifference_temps())%></td>
                 <td><%= v.convertPGIntervalToString(classe.getPenalite())%></td>
                 <td><%= v.convertSecondsToTime(classe.getTempsFinal())%></td>
                
           </tr>
           
           <% } %>
        </tbody>
        <tfoot>
            <tr>
                <th>classement</th>
                <th>coureur</th>
                <th>genre</th>
                <th>chrono</th>
                <th>penalite</th>
                <th>temps final</th>
                
            </tr>
        </tfoot>
    </table>
         <script>
        $(document).ready(function() {
            $('#example').DataTable();
        });
    </script>
    </body>
    <% if (request.getParameter("error")!= null) { %>
        <p style="color:white;background-color: red">Erreur: <%= request.getParameter("error") %> </p>
    <% } %>
</html>
