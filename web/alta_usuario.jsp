<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Hotel "El Glaciar" - Alta de usuario</title>
    </head>
    <body>
        <%
        HttpSession sesion = request.getSession();
        String usu = (String) request.getSession().getAttribute("email_sesion");
        
        if (usu == null) {
            response.sendRedirect("login.jsp");
        } else {
        %>        
        <h1>Alta de Usuario</h1>
        <form action="ServletAltaUsuario" method="POST">
            <p>Datos de acceso</p>
            <p>Correo Electrónico: <input type="email" name="email"/></p>
            <p>Contraseña: <input type="password" name="clave"/></p>            
            <p>Datos del Usuario</p>
            <p>Nombre: <input type="text" name="nombre"/></p>
            <p>Apellido: <input type="text" name="apellido"/></p>
            <p>Documento: <input type="text" name="dni"/></p>
            <p>Dirección: <input type="text" name="direccion"/></p>
            <p>Cargo: <input type="text" name="cargo"/></p>
            <input type="submit" value="Dar de alta">
        </form>
        <%
        }
        %>        
    </body>
</html>
