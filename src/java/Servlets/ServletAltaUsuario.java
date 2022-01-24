package Servlets;

import Logica.Controladora;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "ServletAltaUsuario", urlPatterns = {"/ServletAltaUsuario"})
public class ServletAltaUsuario extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        

        String email = request.getParameter("email");
        String clave = request.getParameter("clave");
        String nombre = request.getParameter("nombre");
        String apellido = request.getParameter("apellido");
        String dni = request.getParameter("dni");
        String direccion = request.getParameter("direccion");
        String cargo = request.getParameter("cargo");
                
        request.getSession().setAttribute("email", email);
        request.getSession().setAttribute("clave", clave);
        request.getSession().setAttribute("nombre", nombre);
        request.getSession().setAttribute("apellido", apellido);
        request.getSession().setAttribute("dni", dni);
        request.getSession().setAttribute("direccion", direccion);
        request.getSession().setAttribute("cargo", cargo);
        
        response.sendRedirect("index.jsp");
        
        Controladora control = new Controladora();
        control.crearUsuario(email, clave, nombre, apellido, dni, direccion, cargo);

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
