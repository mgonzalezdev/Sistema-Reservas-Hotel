
package Servlets;

import Logica.Controladora;
import Logica.Huesped;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;


@WebServlet(name = "ServletModificaHuesped", urlPatterns = {"/ServletModificaHuesped"})
public class ServletModificaHuesped extends HttpServlet {


    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {


            int id = Integer.parseInt(request.getParameter("id"));
            String dni = request.getParameter("dni");
            String nombre = request.getParameter("nombre");
            String apellido = request.getParameter("apellido");
            String direccion = request.getParameter("direccion");
            String profesion = request.getParameter("profesion");
            String telefono = request.getParameter("telefono");
            String email = request.getParameter("email");
            String fechaRecibida = request.getParameter("fecha_nac");

            SimpleDateFormat formato = new SimpleDateFormat("yyyy-mm-dd");
            Date fecha_nac2 = new Date();
        try {
            fecha_nac2 = formato.parse(fechaRecibida);
        } catch (ParseException ex) {
            Logger.getLogger(ServletModificaHuesped.class.getName()).log(Level.SEVERE, null, ex);
        }
            
            Controladora control = new Controladora();
            Huesped hues = control.buscarHuesped(id);
            
            hues.setDni(dni);
            hues.setNombre(nombre);
            hues.setApellido(apellido);
            hues.setFecha_nac(fecha_nac2);
            hues.setDireccion(direccion);
            hues.setProfesion(profesion);
            hues.setTelefono(telefono);
            hues.setEmail(email);
            
            control.modificarHuesped(hues);
            
            request.getSession().setAttribute("listaHuesped", control.traerHuesped());
            
            response.sendRedirect("listar_huesped.jsp");        
        
    }
    
    
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("id"));
        
        Controladora control = new Controladora();
        Huesped hues = control.buscarHuesped(id);
        
        HttpSession sesion = request.getSession();
        sesion.setAttribute("huesped", hues);
        response.sendRedirect("modificar_huesped.jsp");        
        
        
        
        
        
    }


    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
