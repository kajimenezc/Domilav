/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import modeloDAO.ColorDAO;
import modeloDAO.HorariosDAO;
import modeloDAO.PersonaDAO;
import modeloDAO.SolicitudDAO;
import modeloDAO.TipoPrendaDAO;
import modeloDAO.TipoServicioDAO;
import modeloDAO.javaGmail;
import modeloVO.ColorVO;
import modeloVO.HorariosVO;

import modeloVO.PersonaVO;
import modeloVO.SolicitudVO;
import modeloVO.TipoServicioVO;

/**
 *
 * @author Kevin
 */
public class servletSolicitud extends HttpServlet {

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

            PersonaDAO personaDAO;
            PersonaVO personaVO;
            javaGmail javaMail;

            TipoServicioDAO servicioDAO;
            SolicitudDAO solicitudDAO;
            SolicitudVO solicitudVO;
            ColorDAO cod;

            ColorVO cov;

            HorariosDAO horariosDAO = null;

            HttpSession sesion = (HttpSession) request.getSession();
            PersonaVO pv = (PersonaVO) sesion.getAttribute("persona");

            // Configuracion del formato del ordenador.
            DateFormat formato = new SimpleDateFormat("yyyy/MM/dd");
            DateFormat forma = new SimpleDateFormat("yyyy-MM-dd");

            int idSolicitud;
            long estadoSoli;
            float precio = 5000;
            String fecha = "";
            String recoge = "";
            String opc = request.getParameter("opcion").toString();

            int opcion = Integer.parseInt(opc);

            switch (opcion) {

                case 1: // Vista listar Solicitud

                    vista = request.getRequestDispatcher("indexDomilav.jsp");

                    break;

                case 2:      // Registrar               
                    servicioDAO = new TipoServicioDAO();

                    servicioDAO.listar();

                    request.setAttribute("servicio", servicioDAO.getLista());

                    vista = request.getRequestDispatcher("solicitud/registroSolicitud.jsp");

                    break;
                case 3: // L solicitud

                    vista = request.getRequestDispatcher("solicitud/listarSolicitudCliente.jsp");

                    break;

                case 4: // Vista actualizar estado de la solicitud
                    vista = request.getRequestDispatcher("solicitud/actSolicitud.jsp");
                    break;
                case 5: // Ingresar solicitud y logear cliente

                    personaDAO = new PersonaDAO();
                    personaVO = new PersonaVO();
                    cod = new ColorDAO();

                    javaMail = new javaGmail();

                    int agencia = 1;
                    int barrio = 2;
                    int tiDoc = 1;
                    int rol = 1;
                    int estado = 1;

                    servicioDAO = new TipoServicioDAO();

                    servicioDAO.listar();

                    request.setAttribute("servicio", servicioDAO.getLista());

// Insertar valores del form
                    String documento = (request.getParameter("documento"));

                    if (personaDAO.consultaDocumento(documento)) {

                        request.setAttribute("mensaje", "Documento existente.");
                        vista = request.getRequestDispatcher("index.jsp");

                    } else {

                        personaVO.setRol(rol);
                        personaVO.setIdAgencia(agencia);
                        personaVO.setBarrio(barrio);
                        personaVO.setIdDocumento(tiDoc);
                        personaVO.setEstado(estado);

                        // personaVO.setIdPersona(id);
                        personaVO.setDocumento(request.getParameter("documento"));
                        personaVO.setNombres(request.getParameter("nombre").toString());

                        personaVO.setNumCelular(request.getParameter("tel"));

                        personaVO.setDireccion(request.getParameter("direccion").toString());
                        personaVO.setCorreo(request.getParameter("correo").toString());

                        personaDAO = new PersonaDAO();

                        // Inicializar el atributo de la clase aprendizVO
                        personaDAO.setPersonaVO(personaVO);

                        personaDAO.registroCliente();

                        solicitudDAO = new SolicitudDAO();
                        solicitudVO = new SolicitudVO();

                        int estadoSo = 1;

                        // int doc = 1;
                        // Insertar valores del form
                        solicitudVO.setIdPersona(personaDAO.recogeId(personaVO.getDocumento()));
                        solicitudVO.setIdServicio(Integer.parseInt(request.getParameter("servicio")));
                        solicitudVO.setEstadoSolicitud(estadoSo);

                        solicitudVO.setFechaCreacion(forma.format(new Date()));

                        recoge = request.getParameter("recoger");
                        solicitudVO.setFechaRecoleccion(recoge);
                        solicitudVO.setFechaEntrega(request.getParameter("entrega").toString());
                        solicitudVO.setHoraRecoge(Integer.parseInt(request.getParameter("horaInicio")));
                        solicitudVO.setHoraEntrega(Integer.parseInt(request.getParameter("horaEntrega")));

                        String color = request.getParameter("color").toString();
                        String descripcion = request.getParameter("descripcion").toString();

                        if (solicitudVO.getIdServicio() == 2) {
                            String nombreColor = cod.colorId(color);
                            solicitudVO.setDescripcion(descripcion + ", Color a tinturar: " + nombreColor);
                        } else {
                            solicitudVO.setDescripcion(descripcion);
                        }

                        if (recoge.equals(forma.format(new Date()))) {
                            solicitudVO.setPrecio(precio);
                        } else {
                            precio = 0;
                            solicitudVO.setPrecio(precio);
                        }

                        // Inicializar el atributo de la clase aprendizVO
                        solicitudDAO.setSolicitudVO(solicitudVO);

                        solicitudDAO.AgregarRegistro();

                        request.setAttribute("mensaje", " solicitud de " + personaVO.getNombres() + " registrada con exito");

                        String asunto = "Confirmación de Registro";

                        javaMail.send(request.getParameter("correo").toString(), asunto, "Solicitud Registrada con exito.");

                        vista = request.getRequestDispatcher("index.jsp");

                    }

                    break;

                case 6: // Muiestra formlulario para actualizar

                    idSolicitud = Integer.parseInt(request.getParameter("idSolicitud").toString());

                    solicitudDAO = new SolicitudDAO();

                    solicitudDAO.setIdSolicitud(idSolicitud);

                    solicitudDAO.consultaId();

                    request.setAttribute("solicitudVO", solicitudDAO.getSolicitudVO());

                    vista = request.getRequestDispatcher("solicitud/actEstadoSol.jsp");
                    break;

                case 7: // Actualizar solicitud

                    solicitudVO = new SolicitudVO();
                    solicitudDAO = new SolicitudDAO();

                    solicitudVO.setEstadoSolicitud(Integer.parseInt(request.getParameter("estado")));
                    solicitudVO.setHoraRecoge(Integer.parseInt(request.getParameter("horaInicio")));
                    solicitudVO.setHoraEntrega(Integer.parseInt(request.getParameter("horaEntrega")));
                    solicitudVO.setDescripcion(request.getParameter("descripcion").toString());

                    solicitudDAO.setSolicitudVO(solicitudVO);

                    solicitudDAO.AgregarRegistro();

                    request.setAttribute("mensaje", " solicitud " + solicitudVO.getIdSolicitud() + " actualizado con exito");
                    request.setAttribute("opcion", "1");

                    vista = request.getRequestDispatcher("Respuesta.jsp");

                    break;

                case 8: // Cambiar estado Solicitud
                    solicitudDAO = new SolicitudDAO();
                    int cambio = 0;
                    Calendar calendario = Calendar.getInstance();
                    int horaPc = calendario.get(Calendar.HOUR_OF_DAY);

                    idSolicitud = Integer.parseInt(request.getParameter("idSolicitud"));
                    cambio = Integer.parseInt(request.getParameter("change"));

                    // estadoSoli = solicitudDAO.consultaEstado(idSolicitud);
                    solicitudVO = solicitudDAO.consulta(idSolicitud);

                    // mensaje  mail
                    // CAncelar solicitud
                    if (cambio == 2) {

                        String fechaHoy = forma.format(new Date());
                        String fechaSolicitud = solicitudVO.getFechaRecoleccion();
                        int horaRecoge = solicitudVO.getHoraRecoge();

                        if (fechaHoy.equals(fechaSolicitud)) {

                            if (horaRecoge == 1) {

                                if (horaPc >= 9) {
                                    request.setAttribute("mensaje", "La cancelacion debe ser con dos horas de tiempo.."+ horaPc);
                                } else {
                                    solicitudDAO.ActualizarRegistro(idSolicitud, cambio);
                                    request.setAttribute("mensaje", "cancelacion realizada");
                                    String mensaje = "Lamentamos informarle que la entrega de la solicitud ha sido cancelada "
                                            + "por inconvenientes internos. En el transcurso del día, un empleado se comunicará con usted "
                                            + "para acordar una nueva fecha de entrega.";
                                    javaGmail.send(pv.getCorreo(), "Cancelación Entrega", mensaje);
                                }

                            }else if (horaRecoge == 2){
                                
                                 if (horaPc >= 13) {
                                    request.setAttribute("mensaje", "La cancelacion debe ser con dos horas de tiempo.."+ horaPc);
                                } else {
                                    solicitudDAO.ActualizarRegistro(idSolicitud, cambio);
                                    request.setAttribute("mensaje", "cancelacion realizada");
                                    String mensaje = "Lamentamos informarle que la entrega de la solicitud ha sido cancelada "
                                            + "por inconvenientes internos. En el transcurso del día, un empleado se comunicará con usted "
                                            + "para acordar una nueva fecha de entrega.";
                                    javaGmail.send(pv.getCorreo(), "Cancelación Entrega", mensaje);
                                }
                                
                            }else if(horaRecoge == 5){
                                
                                 if (horaPc >= 17) {
                                    request.setAttribute("mensaje", "La cancelacion debe ser con dos horas de tiempo.."+ horaPc);
                                } else {
                                    solicitudDAO.ActualizarRegistro(idSolicitud, cambio);
                                    request.setAttribute("mensaje", "cancelacion realizada");
                                    String mensaje = "Lamentamos informarle que la entrega de la solicitud ha sido cancelada "
                                            + "por inconvenientes internos. En el transcurso del día, un empleado se comunicará con usted "
                                            + "para acordar una nueva fecha de entrega.";
                                    javaGmail.send(pv.getCorreo(), "Cancelación Entrega", mensaje);
                                }
                                
                            }

                        } else {

                            solicitudDAO.ActualizarRegistro(idSolicitud, cambio);
                            request.setAttribute("mensaje", " Cambio realizado.");
                            solicitudDAO.setIdSolicitud(idSolicitud);
                            solicitudDAO.consultaId();
                            //  PersonaDAO persona = new PersonaDAO();
                            // persona.setIdPersona(solicitudDAO.getSolicitudVO().getIdPersona());
                            //persona.consultaId();
                            //  request.setAttribute("mensaje", " Se Canceló la entrega de la solicitud.");
                            String mensaje = "Lamentamos informarle que la entrega de la solicitud ha sido cancelada "
                                    + "por inconvenientes internos. En el transcurso del día, un empleado se comunicará con usted "
                                    + "para acordar una nueva fecha de entrega.";
                            javaGmail.send(pv.getCorreo(), "Cancelación Entrega", mensaje);

                        }

                    } else {
                        // Cambio diferente a cancelar

                        solicitudDAO.ActualizarRegistro(idSolicitud, cambio);
                        request.setAttribute("mensaje", " Cambio realizado.");

                    }
                    /*solicitudDAO.listar();

                     request.setAttribute("solicitud", solicitudDAO.getListaSolicitud());*/

                    vista = request.getRequestDispatcher("indexDomilav.jsp");

                    //solicitudDAO.setIdSolicitud(idSolicitud);
                    // cargar datos
                    break;

                case 9: // Registrar logueado

                    servicioDAO = new TipoServicioDAO();
                    horariosDAO = new HorariosDAO();

                    servicioDAO.listar();

                    request.setAttribute("servicio", servicioDAO.getLista());
                    horariosDAO.listar();

                    request.setAttribute("horarios", horariosDAO.getListaHorario());

                    vista = request.getRequestDispatcher("solicitud/regSolicitudLogueado.jsp");

                    break;

                default:
                    request.setAttribute("mensaje", "Esta opcion no esta");

                    request.setAttribute("opcion", "7");

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
