<%@page import="Logica.Huesped"%>
<%@page import="java.util.List"%>
<%@page import="Logica.Controladora"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Hotel "El Glaciar"</title>

        <!---- PLANTILLA --------->
        <link href="css/styles.css" rel="stylesheet" />
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>
        
        <!---- DATATABLES ------->
        <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.2/css/bootstrap.css"/>
        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.25/css/dataTables.bootstrap4.min.css"/>
        
    </head>
    <body class="sb-nav-fixed">
        <%
        HttpSession sesion = request.getSession();
        String usu = (String) request.getSession().getAttribute("email_sesion");
        
        if (usu == null) {
            response.sendRedirect("login.jsp");
        } else {
        %>
        <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
            <!-- Navbar Brand-->
            <a class="navbar-brand ps-3" href="index.html">HOTEL EL GLACIAR</a>
            <!-- Sidebar Toggle-->
            <button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle" href="#!"><i class="fas fa-bars"></i></button>
            <!-- Navbar-->
            <ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"><%=session.getAttribute("email_sesion")%></a>
                    <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                        <li><a class="dropdown-item" href="#!">Salir</a></li>
                    </ul>
                </li>
            </ul>
        </nav>
        <div id="layoutSidenav">
            <div id="layoutSidenav_nav">
                <nav class="sb-sidenav accordion sb-sidenav-light" id="sidenavAccordion">
                    <div class="sb-sidenav-menu">
                        <div class="nav">
                            <div class="sb-sidenav-menu-heading"></div>
                            <a class="nav-link" href="index.jsp">
                                <div class="sb-nav-link-icon"><i class="fas fa-bed"></i></div>
                                RESERVAS
                            </a>
                            <div class="sb-sidenav-menu-heading">ADMINISTRAR</div>
                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseHabitacion" aria-expanded="false" aria-controls="collapseHabitacion">
                                <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
                                Habitaciones
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapseHabitacion" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav">
                                    <a class="nav-link" href="alta_habitacion.jsp">Alta habitación</a>
                                    <a class="nav-link" href="listar_habitacion.jsp">Listar / Editar / Eliminar</a>
                                </nav>
                            </div>
                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseHuesped" aria-expanded="false" aria-controls="collapseHuesped">
                                <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
                                Huéspedes
                                <div class="sb-sidenav-collapse -arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapseHuesped" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav">
                                    <a class="nav-link" href="alta_huesped.jsp">Alta huésped</a>
                                    <a class="nav-link" href="listar_huesped.jsp">Listar / Editar / Borrar</a>
                                </nav>
                            </div>
                            <div class="sb-sidenav-menu-heading">INFORMES</div>
                            <a class="nav-link" href="charts.html">
                                <div class="sb-nav-link-icon"><i class="fas fa-chart-area"></i></div>
                                Reservas por día
                            </a>
                            <a class="nav-link" href="tables.html">
                                <div class="sb-nav-link-icon"><i class="fas fa-table"></i></div>
                                Listado de Huéspedes
                            </a>
                            <a class="nav-link" href="tables.html">
                                <div class="sb-nav-link-icon"><i class="fas fa-table"></i></div>
                                Reservas por empleados
                            </a>                            
                            <a class="nav-link" href="tables.html">
                                <div class="sb-nav-link-icon"><i class="fas fa-table"></i></div>
                                Reservas por Huéspedes
                            </a>                                                        
                            
                        </div>
                    </div>
                </nav>
            </div>
            <div id="layoutSidenav_content">
 <!--------    INICIO PÁGINA PRINCIPAL -------------------------------------------------------------------->
                <main>
                    <div class="container-fluid px-4">
                        <br>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item"><a href="index.jsp">Página Principal</a></li>
                            <li class="breadcrumb-item active">Listado de Huéspedes</li>
                        </ol>
                        <h2 class="mt-4">Listado de Huéspedes</h2>
                         <div class="card-body">
<table id="example" class="table table-striped table-bordered" style="width:100%">
  <thead>
    <tr>
      <th scope="col">Documento</th>
      <th scope="col">Nombre</th>
      <th scope="col">Apellido</th>
      <th scope="col">Eliminar</th>
      <th scope="col">Modificar</th>
    </tr>
  </thead>
  <tbody>

      <% Controladora control = new Controladora();
        List <Huesped> listaHuesped = control.traerHuesped();
        for (Huesped hues : listaHuesped) {
      %>
      <tr>
          <%int idT = hues.getId();%>
          <%String dni = hues.getDni();%>
        <td> <%= dni %> </td>        
        <%String nombre = hues.getNombre();%>
        <td> <%= nombre %> </td>            
        <%String apellido = hues.getApellido();%>
        <td> <%= apellido %> </td>
        <td> 
            <form name="btnEliminaHuesped" action="ServletEliminaHuesped" method="post" style="display:inline">
                <input type="hidden" name="id" value="<%=idT %>">
                <button type="submit" class="btn btn-danger btn-xs" data-title="Delete" style="display:inline"><i class="fa fa-trash"></i></button>
            </form>
        </td>
        <td> 
            <form name="btnModificaHuesped" action="ServletModificaHuesped" method="post" style="display:inline">
                <input type="hidden" name="id" value="<%=idT %>">
                <button type="submit" class="btn btn-primary btn-xs" data-title="Edit" style="display:inline"><i class="fa fa-pencil-alt"></i></button>
            </form>
        </td>
      </tr>

      
      <% } %>
  </tbody>
</table>
                         </div>

                    </div>
                </main>
 <!--------    FIN PÁGINA PRINCIPAL -------------------------------------------------------------------->
               <footer class="py-4 bg-light mt-auto">
                    <div class="container-fluid px-4">
                        <div class="d-flex align-items-center justify-content-between small">
                            <div class="text-muted">Copyright &copy; Hotel El Glaciar 2021 - Desarrollado por Marcelo González</div>
                        </div>
                    </div>
                </footer>
            </div>
        </div>

  
  
        <%
        }
        %>

        <!----- plantilla ------>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="js/scripts.js"></script>        
        
        <!----- datatables ------>
        <script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.js"></script>
        <script type="text/javascript" src="https://cdn.datatables.net/1.10.25/js/jquery.dataTables.min.js"></script>
        <script type="text/javascript" src="https://cdn.datatables.net/1.10.25/js/dataTables.bootstrap4.min.js"></script>
        
        <script>
            
$(document).ready(function() {
    $('#example').DataTable( {
        "language": {
            "url": "//cdn.datatables.net/plug-ins/1.10.15/i18n/Spanish.json"
        }
    } );
} );        
            
        </script>

        } );
        
    </body>
</html>