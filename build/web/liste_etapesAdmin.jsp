<%@ page import="entity.Etape" %>
<%@ page import="java.util.ArrayList" %>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Etape e=new Etape();
    ArrayList<Etape> etapes=e.getAllEtape();
    
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
        <h2>liste etapes</h2>
        <table id="example" class="display" style="width:100%">
        <thead>
            <tr>
                <th>nom</th>
                <th>Longueur</th>
                <th>rang</th>
                <th>heure depart</th>
                <th>Date depart</th>
                <th>affectation</th>
                <th>classement</th>
                
            </tr>
        </thead>
        <tbody>
           <% for(Etape etape: etapes) { %>
           <tr>
               <td><%= etape.getNom()%></td>
               <td><%= etape.getLongueur()%></td>
               <td><%= etape.getRang()%></td>
               <td><%= etape.getHeureDepart()%></td>
               <td><%= etape.getDateDepart()%></td>
               <td><a href="insertion_coureurTemps.jsp?idEtape=<%= etape.getIdEtape()%>">affecter un temps aux coureurs</a></td>
               <td><a href="classementEtape.jsp?idEtape=<%= etape.getIdEtape()%>">voir classement</a></td>
           </tr>
           
           <% } %>
        </tbody>
        <tfoot>
            <tr>
                <th>nom</th>
                <th>Longueur</th>
                <th>rang</th>
                <th>heure depart</th>
                <th>Date depart</th>
                <th>affectation</th>
                <th>classement</th>
                
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
        <p style="color:red;">Erreur: <%= request.getParameter("error") %> </p>
    <% } %>
</html>

