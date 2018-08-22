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
import javax.servlet.http.HttpSession;
import modeloDAO.AgenciaDAO;
//import modeloDAO.DetallePreguntaDAO;
import modeloDAO.PersonaDAO;
//import modeloDAO.PreguntaDAO;
import modeloDAO.javaGmail;
//import modeloVO.DetallePreguntaVO;
import modeloVO.PersonaVO;

/**
 *
 * @author prueva
 */
public class servletContra extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8");
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
            javaGmail JavaMail;

            PersonaDAO personaDAO = new PersonaDAO();
            PersonaVO personaVO = new PersonaVO();

            HttpSession misesion = (HttpSession) request.getSession();
            PersonaVO pv = (PersonaVO) misesion.getAttribute("persona");

            String opc = request.getParameter("opcion").toString();

            int opcion = Integer.parseInt(opc);

            switch (opcion) {

                case 1:
                    vista = request.getRequestDispatcher("cuentas/recuperaContra.jsp");                    
                    break;
                case 2:
                    personaVO.setCorreo(request.getParameter("correo"));
                    String correo = request.getParameter("correo");
                    String doc = request.getParameter("doc");

                    String pass = personaDAO.consultarPassword(correo, doc);
                    String url = "http://localhost:8080/domilav/nuevaContra.jsp";

                    if (pass != null) {                       
                        javaGmail.send(correo, "recordatorio de contraseña",
                                "Señor Usuario, Ingrese a la siguiente pagina para continuar con el proceso de recuperación de contraseña: " + url);
                        request.setAttribute("mensaje", "Se ha enviado un enlace de confirmaciòn a su correo electrónico.");
                        request.setAttribute("tipoMsj", "success");
                    } else {
                        request.setAttribute("mensaje", "La información ingresada no es correcta, por favor verifique");
                        request.setAttribute("tipoMsj", "error");
                    }
                    vista = request.getRequestDispatcher("cuentas/recuperaContra.jsp");
                    break;
                case 3:
                    String documento = request.getParameter("doc");
                    String nueva = request.getParameter("nueva");
                    if (personaDAO.consultaDocumento(documento)) {
                        long idP = personaDAO.recogeId(documento);
                        if (personaDAO.CambiarContra((int)idP, nueva)) {

                            misesion.isNew();
                            misesion.setAttribute("persona", personaDAO.sesiones(idP));

                            request.setAttribute("exito", "CONTRASEÑA ACTUALIZADA");
                            vista = request.getRequestDispatcher("nuevaContra.jsp");
                        } else {
                            request.setAttribute("error", "NO SE COMPLETO LA ACCION.");
                            vista = request.getRequestDispatcher("nuevaContra.jsp");
                        }
                        
                    }
                    break;
                default:
                    request.setAttribute("mensaje", "Esta opcion no esta");

                    request.setAttribute("opcion", "1");

                    vista = request.getRequestDispatcher("Respuesta.jsp");

            }
            vista.forward(request, response);

        } catch (NumberFormatException | IOException e) {
            System.out.println("Error servlet cliente: " + e.getMessage());
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
