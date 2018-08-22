/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;


import java.io.BufferedReader;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Base64;


import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import modeloDAO.TipoServicioDAO;
import modeloVO.TipoServicioVO;

/**
 *
 * @author Kevin
 */
@MultipartConfig
public class servletServicio extends HttpServlet {

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

            TipoServicioDAO servicioDAO;

            TipoServicioVO servicioVO;

            int idServicio;

            String opc = request.getParameter("opcion").toString();

            int opcion = Integer.parseInt(opc);

            switch (opcion) {
                case 1: // Listar agencia
                    servicioDAO = new TipoServicioDAO();

                    servicioDAO.listar();
                    
                    if(servicioDAO.getLista() != null && !servicioDAO.getLista().isEmpty()){
                        for(TipoServicioVO ts : servicioDAO.getLista()){
                            ts.setImagen(Base64.getEncoder().encodeToString(readBytes(ts.getInputImagen())));
                        }                    
                    }

                    request.setAttribute("servicio", servicioDAO.getLista());

                    vista = request.getRequestDispatcher("servicios/listarServicio.jsp");
                    break;
                case 2: // Vista formulario de ingreso de agencia
                    vista = request.getRequestDispatcher("servicios/ingresarServicio.jsp");
                    break;
                case 3: // Ingresar servicio
                    servicioDAO = new TipoServicioDAO();
                    servicioVO = new TipoServicioVO();

                    // Insertar valores del form
                    servicioVO.setNombre(request.getParameter("nombre").toString());
                    servicioVO.setTiempo(request.getParameter("tiempo").toString());
                    servicioVO.setPrecio(Float.parseFloat(request.getParameter("precio")));

                    servicioVO.setDescripcion(request.getParameter("descripcion").toString());
                    Part filePart = request.getPart("imagen");
                    String filePath = filePart.getSubmittedFileName();
                    Path p = Paths.get(filePath);
                    InputStream fileContent = filePart.getInputStream();
                    //InputStream fileContent = null;
                    //OutputStream os = null;

                    /*byte[] bytes = Files.readAllBytes(p);
                    String imagen = Base64.getEncoder().encodeToString(bytes);

                    try {
                    fileContent = filePart.getInputStream();
                    os = new FileOutputStream(new File(request.getContextPath()+"/"+filePath));
                    int read = 0;
                    byte[] bytes = new byte[1024];
                    
                    while ((read = fileContent.read(bytes)) != -1) {
			os.write(bytes, 0, read);
                    }
                    
                    } catch (IOException e) {
                            e.printStackTrace();
                    } finally {
                            if (fileContent != null) {
                                    try {
                                        fileContent.close();
                                    } catch (IOException e) {
                                            e.printStackTrace();
                                    }
                            }
                            if (os != null) {
                                    try {
                                            // outputStream.flush();
                                            os.close();
                                    } catch (IOException e) {
                                            e.printStackTrace();
                                    }

                            }
                    }
                    //String imagen = "";
                    

                    byte[] imagesBytes = new byte[(int)p.toFile().length()];
                    fileContent.read(imagesBytes, 0, imagesBytes.length);
                    fileContent.close();
                    String imagen = Base64.getEncoder().encodeToString(imagesBytes);*/
                    /*String imagen = Base64.getEncoder().encodeToString(readBytes(fileContent));
                    servicioVO.setImagen(imagen);*/
                    servicioVO.setInputImagen(fileContent);

                    //String imagen = servicioVO.getImagen();






                    // Inicializar el atributo de la clase aprendizVO
                    servicioDAO.setTipoServicioVO(servicioVO);

                    servicioDAO.AgregarRegistro();

                    request.setAttribute("mensaje", "tipoServicio " + servicioVO.getNombre() + " Ingresada con exito.");

                    vista = request.getRequestDispatcher("servicios/ingresarServicio.jsp");
                    break;

                case 4: // vista actuaizar servicio
                    servicioDAO = new TipoServicioDAO();
                    servicioVO = new TipoServicioVO();

                    idServicio = Integer.parseInt(request.getParameter("idServicio").toString());

                    servicioDAO.setIdTipoServicio(idServicio);

                    servicioDAO.consultaId();

                    request.setAttribute("servicio", servicioDAO.getTipoServicioVO());
                    
                    request.setAttribute("mensaje", "Actualización exitosa!");

                    vista = request.getRequestDispatcher("servicios/actServicio.jsp");
                    break;
                case 5: // Actuaizar agencia
                    servicioDAO = new TipoServicioDAO();
                    servicioVO = new TipoServicioVO();

                    servicioVO.setNombre(request.getParameter("nombre").toString());
                    servicioVO.setTiempo(request.getParameter("tiempo").toString());
                    servicioVO.setPrecio(Float.parseFloat(request.getParameter("precio")));

                    servicioVO.setDescripcion(request.getParameter("descripcion").toString());
                    servicioVO.setDescripcion(request.getParameter("imagen").toString());

                    servicioDAO.setTipoServicioVO(servicioVO);

                    servicioDAO.ActualizarRegistro();

                    request.setAttribute("mensaje", " Agencia " + servicioVO.getNombre() + " actualizado con exito");
                    servicioDAO.listar();

                    request.setAttribute("agencia", servicioDAO.getLista());

                    vista = request.getRequestDispatcher("servicios/listarServicio.jsp");
                    break;
                case 6: // Eliminar Agencia
                    idServicio = Integer.parseInt(request.getParameter("idServicio").toString());

                    servicioDAO = new TipoServicioDAO();
                    servicioVO = new TipoServicioVO();

                    servicioDAO.setIdTipoServicio(idServicio);

                    servicioDAO.eliminar();

                    request.setAttribute("mensaje", " Agencia eliminada");

                    servicioDAO.listar();

                    request.setAttribute("agencia", servicioDAO.getLista());

                    vista = request.getRequestDispatcher("servicios/listarServicio.jsp");

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
    
    public static byte[] readBytes(InputStream stream ) throws IOException {
      if (stream == null) return new byte[] {};
      byte[] buffer = new byte[1024];
      ByteArrayOutputStream output = new ByteArrayOutputStream();
      boolean error = false;
      try {
          int numRead = 0;
          while ((numRead = stream.read(buffer)) > -1) {
              output.write(buffer, 0, numRead);
          }
      } catch (IOException e) {
          error = true; // this error should be thrown, even if there is an error closing stream
          throw e;
      } catch (RuntimeException e) {
          error = true; // this error should be thrown, even if there is an error closing stream
          throw e;
      } finally {
          try {
              stream.close();
          } catch (IOException e) {
              if (!error) throw e;
          }
      }
      output.flush();
      return output.toByteArray();
  }

}
