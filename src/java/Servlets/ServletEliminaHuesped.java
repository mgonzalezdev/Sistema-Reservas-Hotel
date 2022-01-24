
package Servlets;

import Logica.Controladora;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet(name = "ServletEliminaHuesped", urlPatterns = {"/ServletEliminaHuesped"})
public class ServletEliminaHuesped extends HttpServlet {


    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("id"));
        
        Controladora control = new Controladora();
        control.eliminarHuesped(id);
        
        request.getSession().setAttribute("listaHuesped", control.traerHuesped());
        response.sendRedirect("listar_huesped.jsp");



    }


    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
