/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import java.io.IOException;
import java.io.PrintWriter;
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
import modeloDAO.javaGmail;
import modeloVO.PersonaVO;

/**
 *
 * @author Kevin
 */
public class servletEmpleado extends HttpServlet {

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
            javaGmail javaMail;

            PersonaDAO personaDAO;
            PersonaVO personaVO;

            HttpSession misesion = (HttpSession) request.getSession();
            PersonaVO pv = (PersonaVO) misesion.getAttribute("persona");

            String opc = request.getParameter("opcion").toString();

            int opcion = Integer.parseInt(opc);

            switch (opcion) {
                case 1: // listar empleado
                    personaDAO = new PersonaDAO();

                    personaDAO.listarEmpleado();

                    request.setAttribute("empleado", personaDAO.getListaPersona());

                    vista = request.getRequestDispatcher("empleados/listarEmpl.jsp");

                    break;
                case 2: // vista registrar empleado
                    agenciaDAO = new AgenciaDAO();

                    agenciaDAO.listar();

                    BarrioDAO barrioDAO = new BarrioDAO();

                    barrioDAO.listar();

                    request.setAttribute("barrio", barrioDAO.getListaBarrio());
                    request.setAttribute("agencia", agenciaDAO.getLista());
                    request.setAttribute("lista", agenciaDAO.getLista());

                    vista = request.getRequestDispatcher("empleados/registrarEmpleado.jsp");

                    break;
                case 3:

                    // Insertar empleado
                    personaDAO = new PersonaDAO();
                    personaVO = new PersonaVO();
                    javaMail = new javaGmail();

                 Random aleatorio = new Random(System.currentTimeMillis());

       int rand = aleatorio.nextInt(10000);

                    int password = rand;

// Insertar valores del form
                    int tiDoc = 1;
                    int rol = 3;
                    int estado = 1;
                    String usu = request.getParameter("nombreEmpl").toString();
                    String mensaje;

                    personaVO.setIdAgencia(Integer.parseInt(request.getParameter("agencia")));

                    personaVO.setRol(rol);
                    personaVO.setBarrio(Integer.parseInt(request.getParameter("barrio")));
                    personaVO.setIdDocumento(tiDoc);
                    personaVO.setUsuario(usu + "Domilav");

                    personaVO.setDocumento(request.getParameter("documento"));
                    personaVO.setNombres(usu);
                    personaVO.setApellidos(request.getParameter("apellidos").toString());
                    personaVO.setGenero(request.getParameter("genero"));
                    personaVO.setNumCelular(request.getParameter("celular"));
                    personaVO.setNumFijo(request.getParameter("fijo"));
                    personaVO.setPassword(password+"Domilav");
                    personaVO.setDireccion(request.getParameter("direccion").toString());
                    personaVO.setCorreo(request.getParameter("correo").toString());
                    personaVO.setEstado(estado);

                    // Inicializar el atributo de la clase aprendizVO
                    personaDAO.setPersonaVO(personaVO);

                    personaDAO.AgregarRegistro();

                    mensaje = "Emplead@ " + personaVO.getNombres() + " Ingresado con exito.\nUsuario: " + personaVO.getUsuario() + "\nContraseña: " + personaVO.getPassword();
                    String asunto = "Confirmación de Registro";

                    javaGmail.send(request.getParameter("correo").toString(), asunto, mensaje);

                    request.setAttribute("exito","Empleado registrado.");

                      personaDAO.listarEmpleado();

                    request.setAttribute("empleado", personaDAO.getListaPersona());

                    vista = request.getRequestDispatcher("empleados/listarEmpl.jsp");

      

                    break;
                case 4: //vista actualizar datos

                    vista = request.getRequestDispatcher("empleados/actualizarEmpl.jsp");

                    break;
                case 5: // Actualizar datos
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
                    
                    if (!personaDAO.consultaDocumento(pv.getDocumento())) {
                    

            //        if (personaDAO.ActualizaEmpl(idp, cel, tel, dicc, correo)) {

                        misesion.isNew();
                        misesion.setAttribute("persona", personaDAO.sesiones(idp));

                        request.setAttribute("exito", "PERFIL ACTUALIZADO CON EXITO");
                        vista = request.getRequestDispatcher("empleados/actualizarEmpl.jsp");
                    } else {
                        request.setAttribute("error", "PERFIL NO ACTUALIZADO.");
                        vista = request.getRequestDispatcher("empleados/actualizarEmpl.jsp");
                    }
                 

                    break;
                case 6: // Act contraseña

                    personaVO = new PersonaVO();
                    personaDAO = new PersonaDAO();

                    String nueva = request.getParameter("nueva");
                    String actual = request.getParameter("actual");
                    int idpe = Integer.parseInt(request.getParameter("idPersona"));

                    if (personaDAO.confirmContra(actual)) {
                        if (personaDAO.CambiarContra(idpe, nueva)) {

                            misesion.isNew();
                            misesion.setAttribute("persona", personaDAO.sesiones(idpe));

                            request.setAttribute("exito", "CONTRASEÑA ACTUALIZADA");
                            vista = request.getRequestDispatcher("empleados/actualizarEmpl.jsp");
                        } else {
                            request.setAttribute("error", "NO SE COMPLETO LA ACCION.");
                            vista = request.getRequestDispatcher("empleados/actualizarEmpl.jsp");
                        }

                    } else {
                        request.setAttribute("error", "Ingrese la contraseña actual..");
                        vista = request.getRequestDispatcher("empleados/actualizarEmpl.jsp");
                    }

                    break;
                case 7: // cancelar empleado

                   
                    personaDAO = new PersonaDAO();
               
                    long id = Long.parseLong(request.getParameter("idPersona"));
                    int cambio = Integer.parseInt(request.getParameter("cambio"));
                    
                    if (personaDAO.cambiarEstado(id,cambio)) {
                        personaDAO.listarEmpleado();
                       

                        request.setAttribute("empleado", personaDAO.getListaPersona());
                         request.setAttribute("exito", "Se completo el cambio.");
                        vista = request.getRequestDispatcher("empleados/listarEmpl.jsp");
                    } else {
                        personaDAO.listarEmpleado();

                        request.setAttribute("empleado", personaDAO.getListaPersona());
                        request.setAttribute("error", "No se ha podido completar el cambio.");
                        vista = request.getRequestDispatcher("empleados/listarEmpl.jsp");
                    }

                    break;
                default:
                    request.setAttribute("mensaje", "Esta opcion no esta");
                    request.setAttribute("opcion", "1");
                    vista = request.getRequestDispatcher("Respuesta.jsp");
            }
            vista.forward(request, response);

        } catch (NumberFormatException | IOException e) {
            System.out.println("Error servlet: " + e.getMessage());
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
