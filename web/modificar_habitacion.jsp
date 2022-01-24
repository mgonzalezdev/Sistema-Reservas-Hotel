<%@page import="Logica.Habitacion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
        HttpSession sesion = request.getSession();
        String usu = (String) request.getSession().getAttribute("email_sesion");
        
        if (usu == null) {
            response.sendRedirect("login.jsp");
        } else {
        %>   
        
        <h1>Modificar Habitación</h1>
        
        <form action="ServletModificaHabitacion" method="get">
            <% Habitacion habit = (Habitacion) sesion.getAttribute("habitacion");
            {%>            
            <p>Datos de la habitación</p>
            <p>Número de habitación: <input type="text" name="num_habitacion" value="<%=habit.getNum_habitacion()%>" /></p>
            <p>Piso: <input type="text" name="piso" value="<%=habit.getPiso()%>" /></p>
            <p>Nombre temático: <input type="text" name="nombre" value="<%=habit.getNombre()%>" /></p>
            <p>Tipo: <select name="tipo">
                <option value="1" <% if (habit.getTipo()==1) { %> selected <% } %> >Single</option>
                <option value="2" <% if (habit.getTipo()==2) { %> selected <% } %> >Doble</option>
                <option value="3" <% if (habit.getTipo()==3) { %> selected <% } %> >Triple</option>
                <option value="4" <% if (habit.getTipo()==4) { %> selected <% } %> >Múltiple</option>
                </select>
            <p>Precio por día ($): <input type="text" name="precio" value="<%=habit.getPrecio()%>" /></p>
            <input type="hidden" name="id" value="<%=habit.getId() %>">
            <input type="submit" value="Modificar">

            <% } %>
        </form>        
        <% } %>        
    </body>
</html>
