<%-- 
    Document   : insertion_categorie
    Created on : 1 juin 2024, 13:42:18
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
        <h1>insertion Categorie</h1>
        <div id="form">
            <form action="CategorieServlet" method="post">
                <div class="writeInInputs">
                    <h3><label>nom</label></h3>
                    <input type="text" name="nom">
                </div>
                <input type="submit" value="inserer" id="bouton">
            </form>
        </div>
    </body>
</html>
