<%@ page import="java.util.ArrayList" %>
<%@ page import="detail.V_classementFinal" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
            <%
                 // Récupérer le paramètre idEtape depuis l'URL
    String idEquipeParam = request.getParameter("idEquipe");

    // Assurez-vous que le paramètre n'est pas nul et convertissez-le en entier
    int idEquipe = 0;
    if (idEquipeParam != null) {
        try {
            idEquipe = Integer.parseInt(idEquipeParam);
        } catch (NumberFormatException e) {
            // Gérez le cas où idEtape n'est pas un entier valide
            out.println("ID de l'équipe invalide.");
            return;
        }
    } else {
        out.println("ID de l'équipe non fourni.");
        return;
    }

            V_classementFinal v=new V_classementFinal();
            ArrayList<V_classementFinal> liste=v.getListeByEquipe(idEquipe);

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
                <th>etape</th>
                <th>classement</th>
                <th>points</th>
                <th>coureur</th>
                
                
                
            </tr>
        </thead>
        <tbody>
           <% for(V_classementFinal classe : liste) { %>
           <tr>
               <td><%= classe.getEtape().getNom()%></td>
               <td><%= classe.getClassement()%></td>
               <td><%= classe.getPoints()%></td>
               <td><%= classe.getCoureur().getNom()%></td>
               
               
           </tr>
           
           <% } %>
        </tbody>
        <tfoot>
            <tr>
                <th>etape</th>
                <th>classement</th>
                <th>points</th>
                <th>coureur</th>
                
                
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