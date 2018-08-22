/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import java.io.IOException;
import static java.lang.Math.random;
import java.util.Random;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import modeloDAO.AgenciaDAO;
import modeloDAO.BarrioDAO;
import modeloDAO.PersonaDAO;
import modeloDAO.RolDAO;
import modeloDAO.javaGmail;
import modeloVO.PersonaVO;

/**
 *
 * @author Kevin
 */
public class servletUser extends HttpServlet {

    private Object JavaMail;

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
            AgenciaDAO agenciaDAO;
            javaGmail JavaMail;
            BarrioDAO barrioDAO;
            Random random;

            PersonaDAO personaDAO;
            PersonaVO personaVO;

            String opc = request.getParameter("opcion").toString();

            int opcion = Integer.parseInt(opc);
            int id;
             
            switch (opcion) {
                case 1: // login
                  //  vista = request.getRequestDispatcher("login.jsp");

                    break;
                case 2:
                   /* personaDAO = new PersonaDAO();
                    personaVO = new PersonaVO();

                    String user = request.getParameter("user").toString();
                    String pass = request.getParameter("pass").toString();

                    int id = personaDAO.recogeIdUser(user);

                    if (personaDAO.autenticacion(user, pass)) {

                        if (id == 1) {
                            vista = request.getRequestDispatcher("indexCliente.jsp");
                        } else if (id == 2 || id == 3) {
                            vista = request.getRequestDispatcher("indexDomilav.jsp");
                        }

                    } else {
                        vista = request.getRequestDispatcher("login.jsp");
                    }*/
                    break;

                case 4: // listar
                    personaDAO = new PersonaDAO();

                    personaDAO.listar();

                    request.setAttribute("persona", personaDAO.getListaPersona());

                    vista = request.getRequestDispatcher("cuentas/listarPersona.jsp");
                    break;

                case 5: // vista registrar empleado

                    agenciaDAO = new AgenciaDAO();

                    agenciaDAO.listar();

                    barrioDAO = new BarrioDAO();

                    barrioDAO.listar();

                    request.setAttribute("listaBarrio", barrioDAO.getListaBarrio());
                    request.setAttribute("lista", agenciaDAO.getLista());
                    vista = request.getRequestDispatcher("cuentas/registrarEmpleado.jsp");

                    break;

                case 6:
                   

                    break;
                case 7:
                    id = Integer.parseInt(request.getParameter("idPersona").toString());

                    personaDAO = new PersonaDAO();

                    personaDAO.setIdPersona(id);

                    personaDAO.consultaId();

                    request.setAttribute("persona", personaDAO.getPersonaVO());
                    vista = request.getRequestDispatcher("cuentas/actualizarEmpleado.jsp");
                    //vista = request.getRequestDispatcher("cuentas/CambioContraseña.jsp");
                    break;
                case 8:
                    vista = request.getRequestDispatcher("login_1.jsp");
                    break;
                case 9:

                    personaDAO = new PersonaDAO();
                    personaVO = new PersonaVO();

                    String user = request.getParameter("user").toString();
                    String pass = request.getParameter("pass").toString();

                    long idP = personaDAO.recogeIdPersona(user);

                    if (personaDAO.autenticacion(user, pass)) {

                        id = Integer.parseInt(request.getParameter("idPersona").toString());

                        personaDAO = new PersonaDAO();

                        personaDAO.setIdPersona(idP);

                        personaDAO.consultaId();

                        request.setAttribute("persona", personaDAO.getPersonaVO());
                        vista = request.getRequestDispatcher("cuentas/actualizarEmpleado.jsp");
                    }
                    break;
                case 10:
                    personaVO = new PersonaVO();

                    personaDAO = new PersonaDAO();

                    personaVO.setDocumento(request.getParameter("documento").toString());
                    personaVO.setIdDocumento(Integer.parseInt(request.getParameter("tipoDoc").toString()));
                    personaVO.setIdAgencia(Integer.parseInt(request.getParameter("agencia").toString()));
                    personaVO.setBarrio(Integer.parseInt(request.getParameter("barrio").toString()));
                    personaVO.setRol(Integer.parseInt(request.getParameter("rol").toString()));
                    personaVO.setNombres(request.getParameter("nombres").toString());
                    personaVO.setApellidos(request.getParameter("apellidos").toString());
                    personaVO.setGenero(request.getParameter("genero").toString());
                    personaVO.setNumCelular(request.getParameter("celular").toString());
                    personaVO.setNumFijo(request.getParameter("NumFijo").toString());
                    personaVO.setDireccion(request.getParameter("direccion").toString());
                    personaVO.setCorreo(request.getParameter("correo").toString());
                    personaVO.setPassword(request.getParameter("pswd").toString());
                    personaVO.setEstado(Integer.parseInt(request.getParameter("estado").toString()));

                    personaDAO.setPersonaVO(personaVO);

                    personaDAO.ActualizarCliente();

                    request.setAttribute("mensaje", " Empleado" + personaVO.getNombres() + " actualizado con exito");

                    vista = request.getRequestDispatcher("cuentas/listarPersona.jsp");

                    break;
                case 12:
                    personaVO = new PersonaVO();

                    personaDAO = new PersonaDAO();

                    String contra1 = request.getParameter("pswd").toString();
                    String contra2 = request.getParameter("pswd2").toString();
                    if (contra1==contra2) {
                        
                    personaVO.setPassword(contra1);
                    }

                    personaDAO.setPersonaVO(personaVO);

                    //personaDAO.CambiarContra();

                    request.setAttribute("mensaje", " Empleado" + personaVO.getNombres() + " actualizado con exito");

                    vista = request.getRequestDispatcher("cuentas/listarPersona.jsp");

                    break;
                default:

                    request.setAttribute("mensaje", "Esta opcion no esta");

                    request.setAttribute("opcion", "1");

                    vista = request.getRequestDispatcher("Respuesta.jsp");

            }
            vista.forward(request, response);

        } catch (NumberFormatException | IOException e) {
            System.out.println("Error servlet: " + e.getMessage());
        } catch (RuntimeException re) {
            System.out.println("Error servlet: " + re.getMessage());
            request.setAttribute("mensaje", re.getMessage());
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
