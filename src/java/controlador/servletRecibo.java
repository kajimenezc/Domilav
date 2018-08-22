/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modeloDAO.DetallePrendaDAO;

import modeloDAO.SolicitudDAO;





/**
 *
 * @author Kevin
 */
@WebServlet(name = "servletRecibo", urlPatterns = {"/servletRecibo"})
public class servletRecibo extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {

            RequestDispatcher vista = null;

            SolicitudDAO solicitudDAO;
            DetallePrendaDAO detallePrendaDAO;

            int idRecibo;

            String opc = request.getParameter("opcion").toString();

            int opcion = Integer.parseInt(opc);

            switch (opcion) {

                case 1: // Vista listar Recibo

                    solicitudDAO = new SolicitudDAO();
                    detallePrendaDAO = new DetallePrendaDAO();

                    idRecibo = Integer.parseInt(request.getParameter("idSolicitud"));

                    solicitudDAO.consultaRecibo(idRecibo);

                    request.setAttribute("recibo", solicitudDAO.getListaSolicitud());
                    
                    
                    detallePrendaDAO.listar(idRecibo);
                     request.setAttribute("prendas", detallePrendaDAO.getListaDetalle());
                    
                   double total =  detallePrendaDAO.totalDetalle(idRecibo);
                     
                       request.setAttribute("id",total );
                    vista = request.getRequestDispatcher("recibo/vistaRecibo.jsp");

                    break;

                case 2: // Vista recibo cliente
                    
                     solicitudDAO = new SolicitudDAO();
                    detallePrendaDAO = new DetallePrendaDAO();

                    idRecibo = Integer.parseInt(request.getParameter("idSolicitud"));

                    solicitudDAO.consultaRecibo(idRecibo);

                    request.setAttribute("recibo", solicitudDAO.getListaSolicitud());
                    
                    
                    detallePrendaDAO.listar(idRecibo);
                     request.setAttribute("prendas", detallePrendaDAO.getListaDetalle());
               
                      double total2 =  detallePrendaDAO.totalDetalle(idRecibo);
                     
                       request.setAttribute("id",total2 );

                    vista = request.getRequestDispatcher("recibo/vistaReciboCliente.jsp");

                    break;
                case 3: // Insertar solicitud

                    break;

                case 4: // Vista actualizar estado de la solicitud

                    break;
                case 5: // Ingresar solicitud y logear cliente

                    break;

                case 6: // Muiestra formlulario para actualizar

                    break;

                case 7: // Actualizar solicitud

                    break;

                case 8:

                    break;

                default:
                    request.setAttribute("mensaje", "Esta opcion no esta");

                    request.setAttribute("opcion", "7");

                    vista = request.getRequestDispatcher("Respuesta.jsp");
            }

            vista.forward(request, response);

        } catch (NumberFormatException e) {
            System.out.println("Error aqui: " + e.getMessage());
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
