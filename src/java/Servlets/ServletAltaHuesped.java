
package Servlets;

import Logica.Controladora;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet(name = "ServletAltaHuesped", urlPatterns = {"/ServletAltaHuesped"})
public class ServletAltaHuesped extends HttpServlet {


    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
 
    String dni = request.getParameter("dni");
    String nombre = request.getParameter("nombre");
    String apellido = request.getParameter("apellido");
    String direccion = request.getParameter("direccion");
    String profesion = request.getParameter("profesion");
    String telefono = request.getParameter("telefono");
    String email = request.getParameter("email");
    String fecha_nac = request.getParameter("fecha_nac");
        
    request.getSession().setAttribute("dni", dni);
    request.getSession().setAttribute("nombre", nombre);
    request.getSession().setAttribute("apellido", apellido);
    request.getSession().setAttribute("direccion", direccion);
    request.getSession().setAttribute("profesion", profesion);
    request.getSession().setAttribute("telefono", telefono);
    request.getSession().setAttribute("email", email);
    request.getSession().setAttribute("fecha_nac", fecha_nac);
    
    response.sendRedirect("index.jsp");
        
    Controladora control = new Controladora();
    control.crearHuesped(dni, nombre, apellido, direccion, profesion, telefono, email, fecha_nac);
        
    }


    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
