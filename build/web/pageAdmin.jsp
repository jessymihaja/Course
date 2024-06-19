<%-- 
    Document   : pageAdmin
    Created on : 1 juin 2024, 12:49:19
    Author     : jessy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="assets/css/pageAdmin.css"/>
        <link rel="stylesheet" href="assets/css/form.css"/>
    </head>
    <body>
    <nav>
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
        <h1>Hello Admin</h1>
        <h2>Importer donnee</h2>
            <form action="UploadDonneeServlet" method="post" enctype="multipart/form-data">
                <label for="file">etapes:</label>
                <input type="file" id="file" name="fileEtape" accept=".csv" required>
                <br>
                <br>
                <label for="file">resultat</label>
                <input type="file" id="file" name="fileResultat" accept=".csv" required>
                <br>
                <button type="submit" id="bouton">Importer</button>
            </form>
        
        <br><!-- comment -->
        <h2>importer Point</h2>
        <form action="UploadPointServlet" method="post" enctype="multipart/form-data">
            <label for="file">Points</label>
                <input type="file" id="file" name="filePoints" accept=".csv" required>
                <br>
                <button type="submit" id="bouton">Importer</button>
        </form>
            
        <br><!-- comment -->
        <form action="GenerateCategorieServlet" method="post">
            <input type="submit" value="generer Categorie" id="boutonG">
        </form>
        <br><!-- comment -->
    </body>
</html>
