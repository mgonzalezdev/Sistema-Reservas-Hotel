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

                        <h2 class="mt-4">Mostrar disponibilidad</h2>
<table class="table table-striped table-bordered" style="width:100%">
  <thead>
    <tr>
      <th scope="col">Número Habitación</th>
      <th scope="col">Piso</th>
      <th scope="col">Nombre Temático</th>
      <th scope="col">Tipo</th>
      <th scope="col">Precio</th>
      <th scope="col">Seleccionar</th>
    </tr>
  </thead>
  <tbody>

      <% Controladora control = new Controladora();
        List <Habitacion> listaHabitacion = control.traerHabitacion();
        for (Habitacion habit : listaHabitacion) {
      %>
      <tr>
        <%int idT = habit.getId();%>
        <%int num_hab = habit.getNum_habitacion();%>
        <td> <%= num_hab %> </td>
        <%int piso = habit.getPiso();%>
        <td> <%= piso %> </td>
        <%String nombre = habit.getNombre();%>
        <td> <%= nombre %> </td>            
        <%  //char tipo = habit.getTipo();
            String tipoT = "";
            if (habit.getTipo() == 1) {
                tipoT="Single";
            } else if (habit.getTipo() == 2) {
                tipoT="Doble";
            } else if (habit.getTipo() == 3) {
                tipoT="Triple";
            } else if (habit.getTipo() == 4) {
                tipoT="Múltiple";
            }
            //int tipoT = habit.getTipo();
        %>
        <td> <%=tipoT %> </td>
        <%float precio = habit.getPrecio();%>
        <td> <%= precio %> </td>
        <td> 
            <form name="btnSeleccionaHabitacion" action="ServletReservaHabitacion" method="post" style="display:inline">
                <input type="hidden" name="id" value="<%=idT %>">
                <button type="submit" class="btn btn-danger btn-xs" data-title="Delete" style="display:inline"><i class="fa fa-trash"></i></button>
            </form>
        </td>
      </tr>
      <% } %>
  </tbody>
</table>
    </body>
</html>
