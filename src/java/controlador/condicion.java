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
import modeloDAO.HorariosDAO;
import modeloVO.HorariosVO;

/**
 *
 * @author Kevin
 */
public class condicion extends HttpServlet {

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
        PrintWriter out = response.getWriter();

        
        
        HorariosVO hv;
        HorariosDAO hd;

       hv = new HorariosVO();
                    hd = new HorariosDAO();

                   int opcion = 0;
                    
                    
                    opcion = Integer.parseInt(request.getParameter("opc"));
                    
                    switch(opcion){
                        case 1:
                          
                             ArrayList<HorariosVO> lista = hd.listarHoras(1);

                    out.println("<select id=\"horaEntrega\" name='horaEntrega' style=\"height: 40px;\" class=\"form-control\" > ");
                    for (int i = 0; i < lista.size(); i++) {
                        hv = lista.get(i);
                        out.println("<option value='" + hv.getIdHorario() + "'>" + hv.getInicioHora() + "-" + hv.getFinalHora() + "</option>");

                    }
                    out.println("</select>");
                            
                            break;
                    
                        case 2:
                            
                            ArrayList<HorariosVO> listaDos = hd.consultaId(2);

                    out.println("<select id=\"horaInicio\" name='horaInicio' style=\"height: 40px;\" class=\"form-control\" > ");
                    for (int i = 0; i < listaDos.size(); i++) {
                        hv = listaDos.get(i);
                        out.println("<option value='" + hv.getIdHorario() + "'>" + hv.getInicioHora() + "-" + hv.getFinalHora() + "</option>");

                    }
                    out.println("</select>");
                            
                            
                            
                            break;
                            
                        case 3:
                             ArrayList<HorariosVO> listaTres = hd.consultaId(5);

                    out.println("<select id=\"horaEntrega\" name='horaEntrega' style=\"height: 40px;\" class=\"form-control\" > ");
                    for (int i = 0; i < listaTres.size(); i++) {
                        hv = listaTres.get(i);
                        out.println("<option value='" + hv.getIdHorario() + "'>" + hv.getInicioHora() + "-" + hv.getFinalHora() + "</option>");

                    }
                    out.println("</select>");
                            
                            break;
                        case 4:
                           out.println("<div class=\"alert-info\" >Seleccione por favor la entrega el dia de mañana.</div>");
                            break;
                        case 5:
                            ArrayList<HorariosVO> listaCuatro = hd.consultaId(5);

                    out.println("<select id=\"horaInicio\" name='horaInicio' style=\"height: 40px;\" class=\"form-control\" > ");
                    for (int i = 0; i < listaCuatro.size(); i++) {
                        hv = listaCuatro.get(i);
                        out.println("<option value='" + hv.getIdHorario() + "'>" + hv.getInicioHora() + "-" + hv.getFinalHora() + "</option>");

                    }
                    out.println("</select>");
                            break;
                        case 6: // Mostrar horarios diferentes 5
                             ArrayList<HorariosVO> listaCinco = hd.listarHoras(5);

                    out.println("<select id=\"horaInicio\" name='horaInicio' style=\"height: 40px;\" class=\"form-control\" > ");
                    for (int i = 0; i < listaCinco.size(); i++) {
                        hv = listaCinco.get(i);
                        out.println("<option value='" + hv.getIdHorario() + "'>" + hv.getInicioHora() + "-" + hv.getFinalHora() + "</option>");

                    }
                    out.println("</select>");
                            
                            
                            
                            break;
                        case 7: 
                            // Mostrar horas diferentes al primero
                             ArrayList<HorariosVO> listaSeis = hd.listarHoras(1);

                    out.println("<select id=\"horaEntrega\" name='horaEntrega' style=\"height: 40px;\" class=\"form-control\" > ");
                    for (int i = 0; i < listaSeis.size(); i++) {
                        hv = listaSeis.get(i);
                        out.println("<option value='" + hv.getIdHorario() + "'>" + hv.getInicioHora() + "-" + hv.getFinalHora() + "</option>");

                    }
                    out.println("</select>");
                            
                            
                            break;
                            
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
