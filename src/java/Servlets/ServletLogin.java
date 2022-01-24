package Servlets;

import Logica.Controladora;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "ServletLogin", urlPatterns = {"/ServletLogin"})
public class ServletLogin extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // Traer email y contrseña
        String email = request.getParameter("email");
        String clave = request.getParameter("clave");
        
        // Variable verifica 
        boolean estaONo = false;
        
        // Crea instancia con Controladora para conectarse a la lógica
        Controladora control = new Controladora();
        
        // Asigno 
        estaONo = control.comprobarIngreso(email, clave);
        
        if (estaONo == true) {
            
            // Verificar que existe una session
            HttpSession sesion = request.getSession(true);
            sesion.setAttribute("email_sesion", email);
            sesion.setAttribute(clave, clave);
            response.sendRedirect ("index.jsp");
                        
        } else {
            
            response.sendRedirect("login_error.jsp");
        }
        // Comprobación si se dejo entrar o no
    
    }


    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
