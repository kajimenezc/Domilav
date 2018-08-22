/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import modeloDAO.ComentarioDAO;
import modeloVO.ComentarioVO;
import modeloVO.PersonaVO;

/**
 *
 * @author Kevin
 */
public class servletComentario extends HttpServlet {

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

            ComentarioDAO comentarioDAO;

            ComentarioVO comentarioVO;
            
             // Configuracion del formato del ordenador.
                  DateFormat formato = new SimpleDateFormat("YYYY/MM/DD");
                  
            HttpSession misesion = (HttpSession) request.getSession();
            PersonaVO personaVO = (PersonaVO)misesion.getAttribute("persona");

            int idComentario;

            String opc = request.getParameter("opcion").toString();

            int opcion = Integer.parseInt(opc);

            switch (opcion) {
                case 1: // Listar comentario
                    comentarioDAO = new ComentarioDAO();

                    comentarioDAO.listar();

                    request.setAttribute("comentario", comentarioDAO.getListaComentario());
                    request.setAttribute("Actualizar", false);

                    vista = request.getRequestDispatcher("comentario/listarComentario.jsp");
                    break;
                case 2: // Vista formulario de ingreso de comentario
                    if(personaVO != null){
                        vista = request.getRequestDispatcher("comentario/ingresarComentario.jsp");
                    }
                    else{
                        request.setAttribute("tipoMsj", "error");
                        request.setAttribute("mensaje", "Debe loguearse para poder registrar comentarios");
                        vista = request.getRequestDispatcher("index.jsp");
                    }
                    break;
                case 3: // Ingresar agencia
                    comentarioDAO = new ComentarioDAO();
                    comentarioVO = new ComentarioVO();
                  
                    // Insertar valores del form
                
                   comentarioVO.setIdPersona((int)personaVO.getIdPersona());
                    comentarioVO.setDescripcion(request.getParameter("comentario"));
                   
                 
                

                    // Inicializar el atributo de la clase aprendizVO
                    comentarioDAO.setComentarioVO(comentarioVO);

                    comentarioDAO.AgregarRegistro();

                    
                    request.setAttribute("mensaje", "Comentario ingresado con exito");
                    
                    vista = request.getRequestDispatcher("indexCliente.jsp");
                    
                    break;
                    
                    
                case 4: 
                   comentarioVO = new ComentarioVO();

                    comentarioDAO = new ComentarioDAO();

                    
                    
          
                  
                    // Insertar valores del form
               
                   comentarioVO.setIdComentario(Integer.parseInt(request.getParameter("idComentario")));
                    comentarioVO.setDescripcion(request.getParameter("comentario").toString());
                   
                   

                    comentarioDAO.setComentarioVO(comentarioVO);

                    comentarioDAO.ActualizarRegistro();

                    request.setAttribute("mensaje", " comentario actualizado con exito");
              

               
                      vista = request.getRequestDispatcher("indexCliente.jsp");
                   
                    break;
                case 5: // Actuaizar agencia
                    
                    break;
                case 6: // Eliminar Agencia
                    idComentario = Integer.parseInt(request.getParameter("idComentario").toString());

                    comentarioDAO = new ComentarioDAO();

                    comentarioDAO.setIdComentario(idComentario);

                    comentarioDAO.eliminar();

                    request.setAttribute("mensaje", " comentario eliminada");

                    request.setAttribute("opcion", "1");

                    vista = request.getRequestDispatcher("Respuesta.jsp");

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
