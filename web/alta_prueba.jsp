<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Hotel "El Glaciar"</title>
        <link href="css/styles.css" rel="stylesheet" />
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>
      
        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/bs4/dt-1.10.25/datatables.min.css"/>
 
        <script type="text/javascript" src="https://cdn.datatables.net/v/bs4/dt-1.10.25/datatables.min.js"></script>   
        
                <link href="css/the-datepicker.css" rel="stylesheet" />
        <script src="js/the-datepicker.js"></script>   
        
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
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
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
                            <li class="breadcrumb-item active">Alta de Huesped</li>
                        </ol>       
        
        <form action="ServletAltaHuesped" method="POST">
            <p>Apellido: <input type="text" name="apellido"/></p>
            <p>Nombre: <input type="text" name="nombre"/></p>            
            <p>Documento de Identidad: <input type="text" name="dni"/></p>
            <p>Dirección: <input type="text" name="direccion"/></p>
            <p>Profesion: <input type="text" name="profesion"/></p>
            <p>Teléfono: <input type="text" name="telefono"/></p>
            <p>Correo electrónico: <input type="email" name="email"/></p>
            <p>Fecha de nacimiento: <input type="text" name="fecha_nac" id="fecha-nacimiento"/></p>
            <input type="submit" value="Dar de alta">
        </form>
    <script>
        (function () {
            const input = document.getElementById('fecha-nacimiento');
            const datepicker = new TheDatepicker.Datepicker(input);
            datepicker.options.setInputFormat("Y-m-j");
            datepicker.render();
        })();
    </script>

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
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="js/scripts.js"></script>
        <%
        }
        %>
    </body>
</html>
    