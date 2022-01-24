<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Hotel "El Glaciar" - Reserva de Habitaciones</title>
        
        <!------ daterangepicker ------>
        <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
        <script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
        <script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
        <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>         
        
    </head>
    <body>
        <%
        HttpSession sesion = request.getSession();
        String usu = (String) request.getSession().getAttribute("email_sesion");
        
        if (usu == null) {
            response.sendRedirect("login.jsp");
        } else {
        %>        
        <h1>Reserva de Habitación</h1>
        <form action="MostrarDisponibilidad.jsp" method="POST">
            <div ></div>
            <h3>Fecha de Entrada y Salida</h3><input type="text" name="daterange" />
            <p>Tipo de habitación: <select name="tipo">
                <option value="1">Single</option>
                <option value="2">Doble</option>
                <option value="3">Triple</option>
                <option value="4">Múltiple</option></select><br><br>
            <input type="hidden" name="usuario" value="<%=usu%>">
            <input type="submit" value="Ver disponibilidad">
        </form>
        
        <%
        }
        %>   
<script>
$(function() {
  $('input[name="daterange"]').daterangepicker({
    opens: 'left'
  }, function(start, end, label) {
    console.log("A new date selection was made: " + start.format('YYYY-MM-DD') + ' to ' + end.format('YYYY-MM-DD'));
  });
});
</script>
       
    </body>
</html>