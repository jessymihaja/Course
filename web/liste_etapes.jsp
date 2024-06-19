<%-- 
    Document   : liste_etapes
    Created on : 1 juin 2024, 15:17:26
    Author     : jessy
--%>
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
             <%@include file='navClient.jsp' %>

        <h2>liste etapes</h2>
        <table id="example" class="display" style="width:100%">
        <thead>
            <tr>
                <th>nom</th>
                <th>Longueur</th>
                <th>rang</th>
                <th>nombre coureur</th>
                <th>affectation</th>
                
            </tr>
        </thead>
        <tbody>
           <% for(Etape etape: etapes) { %>
           <tr>
               <td><%= etape.getNom()%></td>
               <td><%= etape.getLongueur()%></td>
               <td><%= etape.getRang()%></td>
               <td><%= etape.getNbCoureur()%></td>
               <td><a href="insertion_coureurEtape.jsp?idEtape=<%= etape.getIdEtape()%>">affecter un coureur</a></td>
           </tr>
           
           <% } %>
        </tbody>
        <tfoot>
            <tr>
                <th>nom</th>
                <th>Longueur</th>
                <th>rang</th>
                <th>nombre coureur</th>
                <th>affectation</th>
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
        <p style="color:white;background-color: red;width: 350px;border-radius: 20px;padding: 5px">Erreur: <%= request.getParameter("error") %> </p>
    <% } %>
</html>
