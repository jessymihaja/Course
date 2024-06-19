<%-- 
    Document   : insertion_equipe
    Created on : 1 juin 2024, 13:57:03
    Author     : jessy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
                <link rel="stylesheet" href="assets/css/form.css"/>
    </head>
    <body>
        <h1>insertion equipe</h1>
        <div id="form">
            <form action="EquipeServlet" method="post">
                <div class="writeInInputs">
                    <h3><label>nom</label></h3>
                    <input type="text" name="nom">
                    <h3><label>login</label></h3>
                    <input type="text" name="login">
                    <h3><label>mot de passe</label></h3>
                    <input type="password" name="mdp">
                </div>
                <input type="submit" value="inserer" id="bouton">
            </form>
        </div>
    </body>
</html>
