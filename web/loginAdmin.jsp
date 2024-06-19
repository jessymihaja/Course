<%-- 
    Document   : loginAdmin
    Created on : 1 juin 2024, 10:51:04
    Author     : jessy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="assets/css/loginAdmin.css"/>
        <title>JSP Page</title>
    </head>
    <body>
    <form action="LoginAdminServlet" method="post">
        <div class="login-box">
            <div class="login-header">
                <header>Login Admin</header>
            </div>
            <div class="input-box">
                <input type="text" name="username" class="input-field" placeholder="nom" autocomplete="off" required value="admin">
            </div>
            <div class="input-box">
                <input type="password" name="password" class="input-field" placeholder="mot de passe" autocomplete="off" required value="admin">
            </div>
            <div class="input-submit">
                <input type="submit" value="Se connecter"  class="submit-btn" id="submit" style="color: white">
            </div>
        </div>
    </form>
        <% if (request.getParameter("error")!= null) { %>
        <p style="color:red;">Erreur: <%= request.getParameter("error") %> </p>
    <% } %>
</body>
</html>
