/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modeloDAO.BarrioDAO;
import modeloVO.BarrioVO;
import modeloVO.upz;

/**
 *
 * @author Kevin
 */
public class muestraBarrios extends HttpServlet {

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
            
            BarrioDAO bdv = new BarrioDAO();
            BarrioVO bv = new BarrioVO();
            upz up = new upz();
            String id =  request.getParameter("idupz");
            int idUpz = 0;
            
            if(!id.equals("a")){
                idUpz = Integer.parseInt(id);
            }
            
       
            
            out.println("<div class=\"form-group\">");
            out.println("<label for=\"barrios\" class=\"control-label col-sm-2\">Barrios: </label>");
            out.println("<div class=\"col-sm-10\">");
            out.println("<select name=\"barrio\" class=\"form-control\">");
            
  
                          
                               
                               ArrayList<BarrioVO> lista = bdv.consultaIdArray(idUpz);
                           
                           
                          
                              
                               for(int i = 0;i < lista.size();i++){ 
                                   bv = lista.get(i);
                               
                             
                               
                             
            
            
            out.println("<option value="+bv.getIdBarrio()+">"+bv.getNombre()+"</option>" );            
         
                               }
            out.println("</select>");
            
            
            
            out.println("</div>");
            out.println("</div>");
            
            
                        
                        
                           
                        
                
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
        processRequest(request, response);
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
