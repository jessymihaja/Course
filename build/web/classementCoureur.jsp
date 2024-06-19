<%@ page import="java.util.ArrayList" %>
<%@ page import="detail.Detail_coureur" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% String idEquipeParam = request.getParameter("idEquipe");

Detail_coureur v=new Detail_coureur();
ArrayList<Detail_coureur> liste=v.getListeByEquipe(Integer.parseInt(idEquipeParam));

%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
                <link rel="stylesheet" href="assets/css/tablecss.css"/> 
    </head>
    <body>
     <%@include file='navAdmin.jsp' %>
        <h2>Classement</h2>
        <table id="example" class="display" style="width:40%">
        <thead>
            <tr>
                <th>Coureur</th>
                <th>Points</th>
                
                
                
                
            </tr>
        </thead>
        <tbody>
           <% for(Detail_coureur classe : liste) { %>
           <tr>

               
               <td><%= classe.getCoureur().getNom()%></td>
               <td><%= classe.getPoints()%></td>
               
           </tr>
           
           <% } %>
        </tbody>
        <tfoot>
            <tr>
                
                
                <th>coureur</th>
                <th>points</th>
                
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
