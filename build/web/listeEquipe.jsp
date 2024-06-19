<%-- 
    Document   : listeEquipe
    Created on : 2 juin 2024, 18:54:30
    Author     : jessy
--%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="entity.Equipe" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Equipe l=new Equipe();
    ArrayList<Equipe> liste=l.getAllEquipe();
    
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
        <h2>Liste Equipe</h2>
        <table id="example" class="display" style="width:100%">
        <thead>
            <tr>
                <th>idequipe</th>
                <th>nom</th>
                <th>login</th>
                <th>Classement</th>
                
                
            </tr>
        </thead>
        <tbody>
           <% for(Equipe classe : liste) { %>
           <tr>
               <td><%= classe.getIdEquipe()%></td>
               <td><%= classe.getNom()%></td>
               <td><%= classe.getLogin()%></td>
               <td><a href="classementEquipe.jsp?idEquipe=<%= classe.getIdEquipe()%>">voir classement</a></td>
               
           </tr>
           
           <% } %>
        </tbody>
        <tfoot>
            <tr>
                <th>idequipe</th>
                <th>nom</th>
                <th>login</th>
                <th>Classement</th>
                
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

