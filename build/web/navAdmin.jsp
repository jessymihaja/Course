<%-- 
    Document   : navAdmin
    Created on : 4 juin 2024, 15:53:57
    Author     : jessy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<nav>
    <link rel="stylesheet" href="assets/css/pageAdmin.css"/>
        <a href="pageAdmin.jsp">HOME</a>
        <a href="liste_etapesAdmin.jsp">Etape</a>
        <a href="listeEquipe.jsp">Equipe</a>
        <a href="insertion_coureur.jsp">Coureur</a>
        <a href="liste_penalite.jsp">Penalite</a>
        <a href="classement.jsp">Classement</a>

        <a href="ResetServlet">reset</a>
        <a href="DeconnexionServlet">Deconnexion</a>
        <div id="indicator"></div>
    </nav>
