<%-- 
    Document   : insertion_coureurEtape
    Created on : 1 juin 2024, 18:06:11
    Author     : jessy
--%>

<%@ page import="entity.Equipe" %>
<%@ page import="detail.V_coureurEtapeTempsUpgrade" %>
<%@ page import="entity.Coureur" %>
<%@ page import="java.util.ArrayList" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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

    // Vous pouvez maintenant utiliser idEtape comme vous le souhaitez dans votre JSP
                Equipe e=(Equipe) session.getAttribute("equipe");
               ArrayList<Coureur> coureurs=e.getCoureursValides(idEtape);
               V_coureurEtapeTempsUpgrade v=new V_coureurEtapeTempsUpgrade();
               ArrayList<V_coureurEtapeTempsUpgrade> detailListe=v.getAllChronoByEquipe(e.getIdEquipe(),idEtape);
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
        <link rel="stylesheet" href="assets/css/form.css"/>
    </head>
    <body>
                <%@include file='navClient.jsp' %>

        <h1>affectation etape a un coureur</h1>
        <div id="form">
            <form action="CoureurEtapeServlet" method="post">
                
                <div class="chooseInput">
                    <h3><label>Equipe</label></h3>
                    <br/>
                    <select id="coureur" name="idCoureur">
                        <% for(Coureur eq : coureurs){ %>
                            <option value="<%= eq.getIdCoureur()%>"><%= eq.getNom() %></option>
                        <% } %>
              
                        </select>
                        <input type="hidden" id="id" name="idEtape" value="<%=idEtape%>">
                    <br/>
                 </div>    
                
                
                    <input type="submit" value="inserer" id="bouton">
            </form>
        </div>
        <table id="example" class="display" style="width:50%">
        <thead>
            <tr>
                <th>nom</th>
                <th>temps chrono</th>  
            </tr>
        </thead>
        <tbody>
           <% for(V_coureurEtapeTempsUpgrade classe : detailListe) { %>
           <tr>
               <td><%= classe.getCoureur().getNom()%></td>
               <td><%= v.convertSecondsToTime(classe.getDifference_temps())%></td>
               
               
           </tr>
           
           <% } %>
        </tbody>
        <tfoot>
            <tr>
                <th>nom</th>
                <th>temps chrono</th>
            </tr>
        </tfoot>
    </table>
         <script>
        $(document).ready(function() {
            $('#example').DataTable();
        });
    </script>
    </body>
</html>
