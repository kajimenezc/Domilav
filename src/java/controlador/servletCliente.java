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
import modeloDAO.PersonaDAO;
import modeloDAO.SolicitudDAO;
import modeloDAO.javaGmail;

import modeloVO.PersonaVO;

/**
 *
 * @author prueva
 */
public class servletCliente extends HttpServlet {

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

            PersonaDAO personaDAO;
            PersonaVO personaVO;

            HttpSession misesion = (HttpSession) request.getSession();
            PersonaVO pv = (PersonaVO) misesion.getAttribute("persona");

            String opc = request.getParameter("opcion").toString();

            int opcion = Integer.parseInt(opc);

            switch (opcion) {
                case 1:

                    vista = request.getRequestDispatcher("cliente/regisstraaaa.jsp");
                    break;
                case 2:
                    try {

                        // Insertar cliente
                        personaDAO = new PersonaDAO();
                        personaVO = new PersonaVO();

                        JavaMail = new javaGmail();
// Insertar valores del form
                        int agencia = 1;
                        int estado = 1;
                        int barrio = 2;
                        int tiDoc = 1;
                        int rol = 1;

                        personaVO.setIdAgencia(agencia);

                        personaVO.setRol(rol);
                        personaVO.setBarrio(barrio);
                        personaVO.setIdDocumento(tiDoc);
                        personaVO.setUsuario(request.getParameter("user"));

                        // personaVO.setIdPersona(id);
                        personaVO.setDocumento(request.getParameter("documento"));
                        personaVO.setNombres(request.getParameter("nombres").toString());
                        personaVO.setApellidos(request.getParameter("apellidos").toString());
                        personaVO.setGenero(request.getParameter("genero"));
                        personaVO.setNumCelular(request.getParameter("celular"));
                        personaVO.setNumFijo(request.getParameter("fijo"));
                        personaVO.setPassword((request.getParameter("confirma").toString()));
                        personaVO.setDireccion(request.getParameter("direccion").toString());
                        personaVO.setCorreo(request.getParameter("correo").toString());
                        personaVO.setEstado(estado);

                        if (personaDAO.consultaDocumento(personaVO.getDocumento())) {
                            request.setAttribute("doc", "Documento ya exite.");

                           vista = request.getRequestDispatcher("cliente/regisstraaaa.jsp");
                        } else if (personaDAO.consultaCorreo(personaVO.getCorreo())) {
                            request.setAttribute("correo", "Correo ya existe.");

                           vista = request.getRequestDispatcher("cliente/regisstraaaa.jsp");
                        } else if (personaDAO.consultaUser(personaVO.getUsuario())) {
                            request.setAttribute("user", "Usuario ya existe.");

                           vista = request.getRequestDispatcher("cliente/regisstraaaa.jsp");
                        } else {

                            // Inicializar el atributo de la clase aprendizVO
                            personaDAO.setPersonaVO(personaVO);

                            personaDAO.AgregarRegistro();

                            String asunto = "Confirmación de Registro";
                            String mensaje = "Cliente " + personaVO.getNombres() + " Ingresado con exito.\nUsuario: " + personaVO.getUsuario() + "\nContraseña: " + personaVO.getPassword();
                            //mail.send(request.getParameter("correo").toString(), asunto, "Registro satisfactorio.");
                            JavaMail.send(request.getParameter("correo").toString(), asunto, mensaje);
                            request.setAttribute("mensaje", "Registro Satisfactorio");

                          vista = request.getRequestDispatcher("cliente/regisstraaaa.jsp");
                        }
                    } catch(Exception e){
                         System.out.println("Problemas con el javaMail :(" + e.getMessage());
                         request.setAttribute("mensaje", "Ocurrió un error enviando el correo de confirmación");
                         vista = request.getRequestDispatcher("cliente/regisstraaaa.jsp");
                    }  
                        break;

                    
                    case 3: // vista listar cliente

                    vista = request.getRequestDispatcher("cliente/clientes.jsp");
                    break;

                case 4:

                    vista = request.getRequestDispatcher("cliente/actualizarDatos.jsp");

                    break;

                case 5:
                    int idp = 0;

                    personaVO = new PersonaVO();
                    personaDAO = new PersonaDAO();

                    String cel = request.getParameter("celular");
                    String tel = request.getParameter("fijo");
                    String dicc = request.getParameter("direccion");
                    String correo = request.getParameter("correo");
                    idp = Integer.parseInt(request.getParameter("idPersona"));

                    personaDAO.setIdPersona(idp);
                    personaDAO.setPersonaVO(personaVO);

                    if (personaDAO.ActualizaEmpl(idp, cel, tel, dicc, correo)) {

                        misesion.isNew();
                        misesion.setAttribute("persona", personaDAO.sesiones(idp));

                        request.setAttribute("exito", "PERFIL ACTUALIZADO CON EXITO");
                        vista = request.getRequestDispatcher("cliente//actualizarDatos.jsp");
                    } else {
                        request.setAttribute("error", "PERFIL NO ACTUALIZADO.");
                        vista = request.getRequestDispatcher("cliente//actualizarDatos.jsp");
                    }

                    break;
                case 6: // Act contraseña

                    
                    personaVO = new PersonaVO();
                    personaDAO = new PersonaDAO();

                    String nueva = request.getParameter("nueva");
                    String actual = request.getParameter("SHA1(actual)");
                    String confirmar = pv.getPassword();
                   
                    int idpe = Integer.parseInt(request.getParameter("idPersona"));

                  //if (!confirmar.equals(actual)) {

                        //request.setAttribute("error", "CONTRASEÑA ACTUAL INCORRECTA.");
                        vista = request.getRequestDispatcher("cliente/actualizarDatos.jsp");
               //     } else {

                        if (personaDAO.CambiarContra(idpe, nueva)) {

                            misesion.isNew();
                            misesion.setAttribute("persona", personaDAO.sesiones(idpe));

                            request.setAttribute("exito", "CONTRASEÑA ACTUALIZADA");
                            vista = request.getRequestDispatcher("cliente/actualizarDatos.jsp");
                        } else {
                            request.setAttribute("error", "NO SE COMPLETO LA ACCION.");
                            vista = request.getRequestDispatcher("cliente/actualizarDatos.jsp");
                        }

                //  }

                    break;
                case 7: // Cancelar Solicitud
                   /* SolicitudDAO solicitudDAO = new SolicitudDAO();

                     int idSolicitud = Integer.parseInt(request.getParameter("idSolicitud"));

                     long estadoSoli = solicitudDAO.consultaEstado(idSolicitud);

                     if (estadoSoli == 3) {

                     request.setAttribute("mensaje", "Hable con la empresa para poder cancelar.");

                     solicitudDAO.listar();

                     request.setAttribute("solicitud", solicitudDAO.getListaSolicitud());

                     vista = request.getRequestDispatcher("solicitud/listarSolicitud.jsp");

                     } else {

                     solicitudDAO.ActualizarRegistro(idSolicitud);

                     request.setAttribute("mensaje", " solicitud cancelada.");
                     //solicitudDAO.listar();

                     //request.setAttribute("solicitud", solicitudDAO.getListaSolicitud());
                     vista = request.getRequestDispatcher("solicitud/listarSolicitudCliente.jsp");

                     }

                     //solicitudDAO.setIdSolicitud(idSolicitud);
                     // cargar datos*/
                    break;
                case 8:
                    personaVO = new PersonaVO();
                    personaDAO = new PersonaDAO();

                    int id = Integer.parseInt(request.getParameter("idPersona"));

                    personaDAO.cambiarEstado(id, 2);
                    misesion.invalidate();

                    vista = request.getRequestDispatcher("cliente/cuentaEliminada.jsp");

                    break;
                case 9:
                    personaDAO = new PersonaDAO();

                    long idper = Long.parseLong(request.getParameter("idPersona"));
                    int cambio = Integer.parseInt(request.getParameter("cambio"));

                    if (personaDAO.cambiarEstado(idper, cambio)) {
                        personaDAO.listarEmpleado();

                        request.setAttribute("empleado", personaDAO.getListaPersona());
                        request.setAttribute("exito", "Se completo el cambio.");
                        vista = request.getRequestDispatcher("cliente/clientes.jsp");
                    } else {
                        personaDAO.listarEmpleado();

                        request.setAttribute("empleado", personaDAO.getListaPersona());
                        request.setAttribute("error", "No se ha podido completar el cambio.");
                        vista = request.getRequestDispatcher("cliente/clientes.jsp");
                    }

                    break;
                default:
                    request.setAttribute("mensaje", "Esta opcion no esta");

                    request.setAttribute("opcion", "1");

                    vista = request.getRequestDispatcher("Respuesta.jsp");

            }
            vista.forward(request, response);

            }catch (NumberFormatException | IOException e) {
            System.out.println("Error servlet cliente: " + e.getMessage());
        }
        }

        /**
         * Returns a short description of the servlet.
         *
         * @return a String containing servlet description
         */
        @Override
        public String getServletInfo
        
            () {
        return "Short description";
        }// </editor-fold>

    }
