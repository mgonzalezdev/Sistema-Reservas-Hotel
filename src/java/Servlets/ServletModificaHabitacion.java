
package Servlets;

import Logica.Controladora;
import Logica.Habitacion;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "ServletModificaHabitacion", urlPatterns = {"/ServletModificaHabitacion"})
public class ServletModificaHabitacion extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
    }


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("id"));        
        int num_habitacion = Integer.parseInt(request.getParameter("num_habitacion"));
        int piso = Integer.parseInt(request.getParameter("piso"));
        String nombre = request.getParameter("nombre");
        int tipo = Integer.parseInt(request.getParameter("tipo"));
        float precio = Float.parseFloat(request.getParameter("precio"));
        
        Controladora control = new Controladora();
        Habitacion habit = control.buscarHabitacion(id);
        
        habit.setNum_habitacion(num_habitacion);        
        habit.setPiso(piso);
        habit.setNombre(nombre);
        habit.setTipo(tipo);
        habit.setPrecio(precio);

        control.modificarHabitacion(habit);
        
        request.getSession().setAttribute("listaHabitacion", control.traerHabitacion());
        
        response.sendRedirect("listar_habitacion.jsp");

    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        int id = Integer.parseInt(request.getParameter("id"));
        
        Controladora control = new Controladora();
        Habitacion habit = control.buscarHabitacion(id);
        
        HttpSession sesion = request.getSession();
        sesion.setAttribute("habitacion", habit);
        response.sendRedirect("modificar_habitacion.jsp");
        
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
