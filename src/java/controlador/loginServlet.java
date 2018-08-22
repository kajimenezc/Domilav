/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import modeloDAO.ComentarioDAO;
import modeloDAO.PersonaDAO;
import modeloDAO.SolicitudDAO;
import modeloVO.ComentarioVO;
import modeloVO.PersonaVO;

/**
 *
 * @author Kevin
 */
@WebServlet(name = "loginServlet", urlPatterns = {"/loginServlet"})
public class loginServlet extends HttpServlet {

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
            PersonaDAO personaDAO;
            PersonaVO personaVO;
        

           
            String opc = request.getParameter("opcion").toString();
             int opcion = Integer.parseInt(opc);
            

            HttpSession misesion = (HttpSession) request.getSession();

            switch (opcion) {
                case 1: // login
                    request.getRequestDispatcher("login.jsp").forward(request, response);

                    break;
                case 2: //validar
                    personaDAO = new PersonaDAO();
                    personaVO = new PersonaVO();
                    ComentarioDAO cod = new ComentarioDAO();
                    ComentarioVO cov = new ComentarioVO();
                    SolicitudDAO sold = new SolicitudDAO();
                    String user = request.getParameter("user").toString();
                    String pass = request.getParameter("pass").toString();
                    int id = personaDAO.recogeIdRol(user);

                    long idPersona = personaDAO.recogeIdPersona(user);
                

                    
                    
                    if (personaDAO.autenticacion(user, pass)) {
                        
                        misesion.setAttribute("persona", personaDAO.sesiones(idPersona));
                        PersonaVO pvo = personaDAO.sesiones(idPersona);
                        misesion.setAttribute("nombrePersona", pvo.getNombres());

                        int estado = personaDAO.recogeEstado(idPersona);
                        
                        if(estado != 2){
                        
                        if (id == 1) {
                            
                          
                            request.getRequestDispatcher("indexCliente.jsp").forward(request, response);
                        } else if (id == 2 || id == 3) {
                           
                            request.getRequestDispatcher("indexDomilav.jsp").forward(request, response);
                        }

                        }else{
                            request.setAttribute("error", "Usuario cancelado, hable con la empresa.");
                            request.getRequestDispatcher("login.jsp").forward(request, response);
                            
                        }
                        
                        
                        
                    } else {
                          request.setAttribute("error", "El usuario no existe.");
                        request.getRequestDispatcher("login.jsp").forward(request, response);
                    }
                    break;
                case 3:

                    if (misesion != null) {
                        misesion.invalidate();
                        request.getRequestDispatcher("login.jsp").forward(request, response);
                    }

                    break;
                case 4: // Contacto
                    
                       request.getRequestDispatcher("contacto.jsp").forward(request, response);
                    
                    break;
                    
                    
            }

        } catch (Exception e) {
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
