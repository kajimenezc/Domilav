/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modeloDAO.ColorDAO;
import modeloDAO.DetallePrendaDAO;
import modeloDAO.MaterialDAO;
import modeloDAO.SolicitudDAO;
import modeloDAO.TipoPrendaDAO;
import modeloDAO.TipoServicioDAO;
import modeloVO.ColorVO;
import modeloVO.DetallePrendaVO;
import modeloVO.MaterialVO;
import modeloVO.SolicitudVO;

/**
 *
 * @author Kevin
 */
public class servletDetalle extends HttpServlet {

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

            MaterialDAO materialDAO;

            TipoServicioDAO servicio;

            ColorDAO colorDAO;

            TipoPrendaDAO tipoPrendaDAO;
            DetallePrendaDAO detallePrendaDAO;
            DetallePrendaVO detallePrendaVO;

            int idDetalle;

            String opc = request.getParameter("opcion").toString();

            int opcion = Integer.parseInt(opc);

            switch (opcion) {
                case 1:

                    break;

                case 2: // ingresar detalle

                    tipoPrendaDAO = new TipoPrendaDAO();
                    tipoPrendaDAO.listar();
                    request.setAttribute("prenda", tipoPrendaDAO.getListaTipoPrenda());

                    colorDAO = new ColorDAO();
                    colorDAO.listar();
                    request.setAttribute("color", colorDAO.getListaColor());

                    materialDAO = new MaterialDAO();
                    materialDAO.listar();
                    request.setAttribute("material", materialDAO.getListaMaterial());

                    servicio = new TipoServicioDAO();
                    servicio.listar();
                    request.setAttribute("servicio", servicio.getLista());

                    solicitudDAO = new SolicitudDAO();
                    idDetalle = Integer.parseInt(request.getParameter("idSolicitud").toString());

                    solicitudDAO.setIdSolicitud(idDetalle);
                    solicitudDAO.consultaId();

                    request.setAttribute("solicitud", solicitudDAO.getSolicitudVO());

                    vista = request.getRequestDispatcher("solicitud/detalleSolicitud.jsp");

                    break;
                case 3:

                    detallePrendaDAO = new DetallePrendaDAO();
                    detallePrendaVO = new DetallePrendaVO();

               
                    // Insertar valores del form
                    detallePrendaVO.setIdSolicitud(Integer.parseInt(request.getParameter("idSolicitud")));
                    detallePrendaVO.setIdTipoPrenda(Integer.parseInt(request.getParameter("prenda")));

                    detallePrendaVO.setIdColor(Integer.parseInt(request.getParameter("color").toString()));
                    detallePrendaVO.setIdMaterial(Integer.parseInt(request.getParameter("material").toString()));
                    detallePrendaVO.setIdServicio(Integer.parseInt(request.getParameter("servicio").toString()));
                    detallePrendaVO.setDescripcion(request.getParameter("descripcion").toString());
                    detallePrendaVO.setPrecdio(Double.parseDouble(request.getParameter("precio")));

                    // Inicializar el atributo de la clase aprendizVO
                    detallePrendaDAO.setDetallePrendaVO(detallePrendaVO);

                    if (detallePrendaDAO.AgregarRegistro()) {

                        tipoPrendaDAO = new TipoPrendaDAO();
                        tipoPrendaDAO.listar();
                        request.setAttribute("prenda", tipoPrendaDAO.getListaTipoPrenda());

                        colorDAO = new ColorDAO();
                        colorDAO.listar();
                        request.setAttribute("color", colorDAO.getListaColor());

                        materialDAO = new MaterialDAO();
                        materialDAO.listar();
                        request.setAttribute("material", materialDAO.getListaMaterial());
                        servicio = new TipoServicioDAO();

                        servicio.listar();
                        request.setAttribute("servicio", servicio.getLista());

                        solicitudDAO = new SolicitudDAO();
                        idDetalle = Integer.parseInt(request.getParameter("idSolicitud").toString());

                        solicitudDAO.setIdSolicitud(idDetalle);
                        solicitudDAO.consultaId();

                        request.setAttribute("solicitud", solicitudDAO.getSolicitudVO());
                        
                         request.setAttribute("mensaje", "Solicitud  Ingresada con exito.");

                        vista = request.getRequestDispatcher("solicitud/detalleSolicitud.jsp");

                    } else {

                        tipoPrendaDAO = new TipoPrendaDAO();
                        tipoPrendaDAO.listar();
                        request.setAttribute("prenda", tipoPrendaDAO.getListaTipoPrenda());

                        colorDAO = new ColorDAO();
                        colorDAO.listar();
                        request.setAttribute("color", colorDAO.getListaColor());

                        materialDAO = new MaterialDAO();
                        materialDAO.listar();
                        request.setAttribute("material", materialDAO.getListaMaterial());
                        servicio = new TipoServicioDAO();
                        servicio.listar();
                        request.setAttribute("servicio", servicio.getLista());

                        solicitudDAO = new SolicitudDAO();
                        idDetalle = Integer.parseInt(request.getParameter("idSolicitud").toString());

                        solicitudDAO.setIdSolicitud(idDetalle);
                        solicitudDAO.consultaId();

                        request.setAttribute("solicitud", solicitudDAO.getSolicitudVO());

                         request.setAttribute("mensaje", "Solicitud  no Ingresada con exito.");
                        
                        vista = request.getRequestDispatcher("solicitud/detalleSolicitud.jsp");
                    }

                   
            

                    break;

                case 4:
                    break;
                case 5:
                    break;

                case 6:
                    break;

                default:
                    request.setAttribute("mensaje", "Esta opcion no esta");

                    request.setAttribute("opcion", "1");

                    vista = request.getRequestDispatcher("Respuesta.jsp");
            }

            vista.forward(request, response);

        } catch (NumberFormatException | IOException e) {
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
