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
import modeloDAO.TipoServicioDAO;
import modeloDAO.javaGmail;
import modeloVO.PersonaVO;
import modeloVO.SolicitudVO;

/**
 *
 * @author Sena
 */
public class servletSolcitudCliente extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet servletSolcitudCliente</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet servletSolcitudCliente at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
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
            javaGmail javaMail;

            TipoServicioDAO servicioDAO;
            SolicitudDAO solicitudDAO;
            SolicitudVO solicitudVO;
            ColorDAO cod;

            HorariosDAO horariosDAO = null;

            HttpSession sesion = (HttpSession) request.getSession();
            PersonaVO pv = (PersonaVO) sesion.getAttribute("persona");

             // Configuracion del formato del ordenador.
            DateFormat formato = new SimpleDateFormat("yyyy/MM/dd");
            DateFormat forma = new SimpleDateFormat("yyyy-MM-dd");

      
            float precio = 5000;
            String fecha = "";
            String recoge = "";
            
            int idSolicitud = 0;
            long estadoSoli = 0;
            String opc = request.getParameter("opcion").toString();

            int opcion = Integer.parseInt(opc);

            switch (opcion) {

                case 1: // Cancelar Solicitud
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
                                    request.setAttribute("mensaje", "La cancelacion debe ser con dos horas de tiempo..");
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
                                    request.setAttribute("mensaje", "La cancelacion debe ser con dos horas de tiempo..");
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
                                    request.setAttribute("mensaje", "La cancelacion debe ser con dos horas de tiempo..");
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
                    break;

                case 2:

                  String fechaHoy = formato.format(new Date());

                    solicitudDAO = new SolicitudDAO();
                    int cambios = 0;
                    fecha = "";
                    idSolicitud = Integer.parseInt(request.getParameter("idSolicitud"));
                    cambios = Integer.parseInt(request.getParameter("change"));
                    fecha = request.getParameter("fecha");

                    if(!fechaHoy.equals(fecha) ){
                        // estadoSoli = solicitudDAO.consultaEstado(idSolicitud);
                    solicitudDAO.ActualizarRegistro(idSolicitud, cambios);                            
                    request.setAttribute("mensaje", " solicitud cancelada. Un empleado de la lavandería se estará"
                            + " comunicando con usted para agendar nuevamente la entrega o la recogida.");
                    solicitudDAO.listar();
                    
                    String mensaje = "La solicitud Número: "+idSolicitud+ " ha sido cancelada por el cliente, "
                            + "por favor pongase en contacto con el cliente para un nuevo agendamiento.";
                    javaGmail.send("domilavservicio@gmail.com", "Cancelación Solicitud", mensaje);

                    request.setAttribute("solicitud", solicitudDAO.getListaSolicitud());

                    request.getRequestDispatcher("solicitud/listarSolicitudCliente.jsp").forward(request, response);

                    }else{
                        
                          request.setAttribute("mensaje", "No se puede cancelar el mismo dia.");
                    solicitudDAO.listar();

                    request.setAttribute("solicitud", solicitudDAO.getListaSolicitud());

                    request.getRequestDispatcher("solicitud/listarSolicitudCliente.jsp").forward(request, response);

                        
                    }
                    
                    
                    
                    break;
                case 3: // Registro telefonico
                    
                    servicioDAO = new TipoServicioDAO();
                 

                    servicioDAO.listar();
                

               
                    request.setAttribute("servicio", servicioDAO.getLista());

                   request.getRequestDispatcher("solicitud/registroTelefonico.jsp").forward(request, response); 
                    
                    
                    break;
                case 4:
                    request.getRequestDispatcher("solicitud/estadoSolicitud.jsp").forward(request, response); 
                    break;
                    
                case 5: // Registro telefonico
                    
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

                    // Si el documento existe
                    if (personaDAO.consultaDocumento(documento)) {

                        request.setAttribute("mensaje", "Documento existente.");
                       request.getRequestDispatcher("solicitud/registroTelefonico.jsp").forward(request, response); 

                    } else {
// Creacion del usuario
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

                        solicitudVO.setFechaCreacion(formato.format(new Date()));

                       recoge = request.getParameter("recoger");
                        solicitudVO.setFechaRecoleccion(recoge);
                        solicitudVO.setFechaEntrega(request.getParameter("entrega").toString());
                        solicitudVO.setHoraRecoge(Integer.parseInt(request.getParameter("horaInicio")));
                        solicitudVO.setHoraEntrega(Integer.parseInt(request.getParameter("horaEntrega")));
                        
                        String color = request.getParameter("color").toString();
                        String descripcion = request.getParameter("descripcion").toString();
                        
                        // Si es servicio de tintoreria
                        if(solicitudVO.getIdServicio() == 2){
                        String nombreColor = cod.colorId(color);
                        solicitudVO.setDescripcion(descripcion+", Color a tinturar: "+nombreColor);
                        }else{
                            solicitudVO.setDescripcion(descripcion);
                        }
                        
                        
                        // Si es el mismo dia se le agrega recargo
                        if(recoge.equals(forma.format(new Date()))){
                            solicitudVO.setPrecio(precio);
                        }else{
                            precio = 0;
                            solicitudVO.setPrecio(precio);
                        }
                        
                        
                        // Inicializar el atributo de la clase aprendizVO
                        solicitudDAO.setSolicitudVO(solicitudVO);

                        solicitudDAO.AgregarRegistro();

                        request.setAttribute("mensaje", " solicitud de " + personaVO.getNombres() + " registrada con exito");

                        String asunto = "Confirmación de Registro";

                        javaMail.send(request.getParameter("correo").toString(), asunto, "Solicitud Registrada con exito.");

                 request.getRequestDispatcher("solicitud/registroTelefonico.jsp").forward(request, response); 

                    }
                     
                    break;
                case 6:
                    solicitudDAO = new SolicitudDAO();
                    solicitudVO = new SolicitudVO();
                    cod = new ColorDAO();
                    
                    
                    javaMail = new javaGmail();

                    estado = 1;

                    solicitudVO.setIdPersona(pv.getIdPersona());
                    solicitudVO.setIdServicio(Integer.parseInt(request.getParameter("servicio")));
                    solicitudVO.setEstadoSolicitud(estado);

                    solicitudVO.setFechaCreacion(formato.format(new Date()));

                    recoge = request.getParameter("recoger");
                    solicitudVO.setFechaRecoleccion(recoge);
                    solicitudVO.setFechaEntrega(request.getParameter("entrega").toString());
                    solicitudVO.setHoraRecoge(Integer.parseInt(request.getParameter("horaInicio")));
                    solicitudVO.setHoraEntrega(Integer.parseInt(request.getParameter("horaEntrega")));
                   String color = request.getParameter("color").toString();
                        String descripcion = request.getParameter("descripcion").toString();

                    // Mismo dia se le agrega recargo
                      if(recoge.equals(forma.format(new Date()))){
                            solicitudVO.setPrecio(precio);
                        }else{
                            precio = 0;
                            solicitudVO.setPrecio(precio);
                        }
                      
                      
                       // Si es servicio de tintoreria
                        if(solicitudVO.getIdServicio() == 2){
                        String nombreColor = cod.colorId(color);
                        solicitudVO.setDescripcion(descripcion+", Color a tinturar: "+nombreColor);
                        }else{
                            solicitudVO.setDescripcion(descripcion);
                        }
                    
                    
                    // Inicializar el atributo de la clase aprendizVO
                    solicitudDAO.setSolicitudVO(solicitudVO);

                    solicitudDAO.AgregarRegistro();

                    String asuntoReg = "Confirmación de Registro";

                    servicioDAO = new TipoServicioDAO();

                    servicioDAO.listar();

                    request.setAttribute("servicio", servicioDAO.getLista());

                    request.setAttribute("mensaje", "<script>alert('solicitud registrada con exito.');</script>");
                   request.getRequestDispatcher("solicitud/regSolicitudLogueado.jsp").forward(request, response);
                    
                    break;
            }
        } catch (Exception e) {
            System.out.println("Error: " + e.getMessage());
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
