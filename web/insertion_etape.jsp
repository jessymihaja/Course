<%-- 
    Document   : insertion_etape
    Created on : 1 juin 2024, 13:10:32
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
        <h1>insertion etape</h1>
        <div id="form">
            <form action="EtapeServlet" method="post">
                <div class="writeInInputs">
                    <h3><label>nom</label></h3>
                    <input type="text" name="nom">
                    <h3><label>longueur</label></h3>
                    <input type="number" name="longueur">
                    <h3><label>rang</label></h3>
                    <input type="number" name="rang">
                </div>
                <input type="submit" value="inserer" id="bouton">
            </form>
        </div>
        
    </body>
</html>
