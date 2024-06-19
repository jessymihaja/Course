<%-- 
    Document   : liste_penalite
    Created on : 4 juin 2024, 13:44:19
    Author     : jessy
--%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="entity.Penalite" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% 
    Penalite p=new Penalite();
    ArrayList<Penalite> liste=p.getAllPenalite();
%>
<!DOCTYPE html>
<html>
     <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="assets/css/form.css"/>
        <!-- jQuery -->
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <!-- DataTables CSS -->
    <link rel="stylesheet" type="text/css" href="assets/DataTables/datatables.min.css">
    <!-- DataTables JS -->
    <script type="text/javascript" charset="utf8" src="assets/DataTables/datatables.min.js"></script>
    <script type="text/javascript">
        function showPopup(id) {
            var userResponse = confirm("Voulez-vous supprimer cette penalité ?");
            if (userResponse) {

            window.location.href = "DeletePenaliteServlet?idPenalite=" + id; // Remplacez "YourServletURL" par l'URL de votre servlet
            
        } else {
                
                alert("Vous restez sur cette page.");
            }
        }
    </script>
    </head>
    <body>
        <%@include file='navAdmin.jsp' %>
        <h2>Liste Penalite</h2>
        <table id="example" class="display" style="width:50%">
        <thead>
            <tr>
                <th>Equipe</th>
                <th>etape</th>
                <th>Temps penalite</th>
                <th>delete</th>
                
                
            </tr>
        </thead>
        <tbody>
           <% for(Penalite classe : liste) { %>
           <tr>
               <td><%= classe.getEquipe().getNom()%></td>
               <td><%= classe.getEtape().getNom()%></td>
               <td><%= classe.getTemps_penalite()%></td>
               <td><button onclick="showPopup(<%= classe.getIdPenalite() %>)">delete</button></td>
               
           </tr>
           
           <% } %>
        </tbody>
        <tfoot>
            <tr>
                <th>Equipe</th>
                <th>etape</th>
                <th>Temps penalite</th>
                <th>delete</th>
                
            </tr>
        </tfoot>
    </table>
         <script>
        $(document).ready(function() {
            $('#example').DataTable();
        });
    </script>
    <br><!-- comment -->
    <a href="insertion_penalite.jsp"><button id="bouton" style="font-size: 50px;height: 100px">+</button></a>
    </body>
    <% if (request.getParameter("error")!= null) { %>
        <p style="color:red;">Erreur: <%= request.getParameter("error") %> </p>
    <% } %>
</html>

