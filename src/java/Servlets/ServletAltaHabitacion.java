package Servlets;

import Logica.Controladora;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "ServletAltaHabitacion", urlPatterns = {"/ServletAltaHabitacion"})
public class ServletAltaHabitacion extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String num_habitacion = request.getParameter("num_habitacion");
        String piso = request.getParameter("piso");
        String nombre = request.getParameter("nombre");
        String tipo = request.getParameter("tipo");
        String precio = request.getParameter("precio");
        
        request.getSession().setAttribute("num_habitacion", num_habitacion);
        request.getSession().setAttribute("piso", piso);
        request.getSession().setAttribute("nombre", nombre);
        request.getSession().setAttribute("tipo", tipo);
        request.getSession().setAttribute("precio", precio);
        
        int numT = Integer.parseInt(num_habitacion);
        int pisoT = Integer.parseInt(piso);
        int tipoT = Integer.parseInt(tipo);
        float precioT = Float.parseFloat(precio);
        
        Controladora control = new Controladora();
        control.crearHabitacion(numT, pisoT, nombre, tipoT, precioT);

        response.sendRedirect("index.jsp");

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
