/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import static controlador.servletServicio.readBytes;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Base64;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modeloDAO.TipoServicioDAO;
import modeloVO.TipoServicioVO;

/**
 *
 * @author Carolina
 */
public class servletMostrarServicios extends HttpServlet {
    
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
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        
        TipoServicioDAO tipoServicioDAO = new TipoServicioDAO();;
        
        tipoServicioDAO.listar();
        
        if(tipoServicioDAO.getLista() != null && !tipoServicioDAO.getLista().isEmpty()){
            for(TipoServicioVO ts : tipoServicioDAO.getLista()){
                ts.setImagen(Base64.getEncoder().encodeToString(readBytes(ts.getInputImagen())));
            }                    
        }
          
         request.setAttribute("servicio", tipoServicioDAO.getLista());
                    request.setAttribute("Actualizar", false);
       request.getRequestDispatcher("servicios/mostrarServicio.jsp").forward(request, response);
     
    }
    
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
