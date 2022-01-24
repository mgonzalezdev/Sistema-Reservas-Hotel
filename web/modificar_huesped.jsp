<%@page import="Logica.Huesped"%>
<%@page import="java.text.SimpleDateFormat"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Hotel El Glaciar - Modificar Huesped</title>
            
    </head>
    <body>
        <%
        HttpSession sesion = request.getSession();
        String usu = (String) request.getSession().getAttribute("email_sesion");
        
        if (usu == null) {
            response.sendRedirect("login.jsp");
        } else {
        %>        
        <h1>Modificar Huesped</h1>
        <form action="ServletModificaHuesped" method="get">
            <% Huesped hues = (Huesped) sesion.getAttribute("huesped");
            {%>
            <p>Apellido: <input type="text" name="apellido" value="<%=hues.getApellido()%>"/></p>
            <p>Nombre: <input type="text" name="nombre" value="<%=hues.getNombre() %>"/></p>            
            <p>Documento de Identidad: <input type="text" name="dni" value="<%=hues.getDni() %>"/></p>
            <p>Dirección: <input type="text" name="direccion" value="<%=hues.getDireccion() %>"/></p>
            <p>Profesion: <input type="text" name="profesion" value="<%=hues.getProfesion() %>"/></p>
            <p>Teléfono: <input type="text" name="telefono" value="<%=hues.getTelefono() %>"/></p>
            <p>Correo electrónico: <input type="email" name="email" value="<%=hues.getEmail() %>"/></p>
            
            <% 
                SimpleDateFormat formato = new SimpleDateFormat("dd/MM/yyyy"); 
                String fechaComoCadena = formato.format(hues.getFecha_nac()); 
            %>
            <p>Fecha de nacimiento: <input type="text" name="fecha_nac" id="fecha-nacimiento" value="<%=fechaComoCadena %>"/></p>
            <input type="hidden" name="id" value="<%=hues.getId() %>">
            <input type="submit" value="Modificar">
            <%} %>
        </form>
          
        <%
        }
        %>    
    </body>
</html>
