<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Los datos enviados son:</h1>
        <h3>Nombre: <%=session.getAttribute("nombre")%></h3>
        <h3>Apellido: <%=session.getAttribute("edad")%></h3>    
    </body>
</html>
