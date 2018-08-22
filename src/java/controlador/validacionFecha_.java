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
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modeloDAO.HorariosDAO;
import modeloDAO.SolicitudDAO;
import modeloVO.HorariosVO;
import modeloVO.SolicitudVO;

/**
 *
 * @author Kevin
 */
public class validacionFecha_ extends HttpServlet {

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

            String fecha = request.getParameter("fecha");

            HorariosDAO sd = new HorariosDAO();

            HorariosVO hv;
            HorariosDAO hd;

            int rango1 = sd.contadorSolicitud(fecha, 1);
            int rango2 = sd.contadorSolicitud(fecha, 2);
            int rango5 = sd.contadorSolicitud(fecha, 5);

            

            if (rango1 >= 5 & rango2 >= 5 & rango5 >= 5) {

                out.println("<div class=\"alert-danger\" >SELECCIONE OTRO DIA POR FAVOR.</div>");
            } else {

                if (rango1 >= 5 & rango2 >= 5) {

                    hv = new HorariosVO();
                    hd = new HorariosDAO();

                    ArrayList<HorariosVO> lista = hd.consultaId(5);

                    out.println("<select id=\"horaInicio\" name='horaInicio' style=\"height: 40px;\" class=\"form-control\" > ");
                    for (int i = 0; i < lista.size(); i++) {
                        hv = lista.get(i);
                        out.println("<option value='" + hv.getIdHorario() + "'>" + hv.getInicioHora() + "-" + hv.getFinalHora() + "</option>");

                    }
                    out.println("</select>");

                } else if (rango1 >= 5 & rango5 >= 5) {

                    hv = new HorariosVO();
                    hd = new HorariosDAO();

                    ArrayList<HorariosVO> lista = hd.consultaId(2);

                    out.println("<select id=\"horaInicio\" name='horaInicio' style=\"height: 40px;\" class=\"form-control\" > ");
                    for (int i = 0; i < lista.size(); i++) {
                        hv = lista.get(i);
                        out.println("<option id=\"hora\" value='" + hv.getIdHorario() + "'>" + hv.getInicioHora() + "-" + hv.getFinalHora() + "</option>");

                    }
                    out.println("</select>");
                } else if (rango2 >= 5 & rango5 >= 5) {

                    hv = new HorariosVO();
                    hd = new HorariosDAO();

                    ArrayList<HorariosVO> lista = hd.consultaId(1);

                    out.println("<select id=\"horaInicio\" name='horaInicio' style=\"height: 40px;\" class=\"form-control\" > ");
                    for (int i = 0; i < lista.size(); i++) {
                        hv = lista.get(i);
                        out.println("<option id=\"opc\" value='" + hv.getIdHorario() + "'>" + hv.getInicioHora() + "-" + hv.getFinalHora() + "</option>");

                    }
                    out.println("</select>");

                } else if (rango1 >= 5) {
                    hv = new HorariosVO();
                    hd = new HorariosDAO();

                    ArrayList<HorariosVO> lista = hd.listarHoras(1);

                    out.println("<select id=\"horaInicio\" name='horaInicio' style=\"height: 40px;\" class=\"form-control\" > ");
                    for (int i = 0; i < lista.size(); i++) {
                        hv = lista.get(i);
                        out.println("<option value='" + hv.getIdHorario() + "'>" + hv.getInicioHora() + "-" + hv.getFinalHora() + "</option>");

                    }
                    out.println("</select>");

                } else if (rango2 >= 5) {

                    hv = new HorariosVO();
                    hd = new HorariosDAO();
                    // Listar diferentes al id entregado
                    ArrayList<HorariosVO> lista = hd.listarHoras(2);

                    out.println("<select id=\"horaInicio\" name='horaInicio' style=\"height: 40px;\" class=\"form-control\" > ");
                    for (int i = 0; i < lista.size(); i++) {
                        hv = lista.get(i);
                        out.println("<option value='" + hv.getIdHorario() + "'>" + hv.getInicioHora() + "-" + hv.getFinalHora() + "</option>");

                    }
                    out.println("</select>");

                } else if (rango5 >= 5) {

                    hv = new HorariosVO();
                    hd = new HorariosDAO();

                    ArrayList<HorariosVO> lista = hd.listarHoras(5);

                    out.println("<select id=\"horaInicio\" name='horaInicio' style=\"height: 40px;\" class=\"form-control\" > ");
                    for (int i = 0; i < lista.size(); i++) {
                        hv = lista.get(i);
                        out.println("<option value='" + hv.getIdHorario() + "'>" + hv.getInicioHora() + "-" + hv.getFinalHora() + "</option>");

                    }
                    out.println("</select>");

                } else if (rango1 < 5 & rango2 < 5 & rango5 < 5) {
                    hv = new HorariosVO();
                    hd = new HorariosDAO();

                    ArrayList<HorariosVO> lista = hd.listar();

                    out.println("<select id=\"horaInicio\" name='horaInicio' style=\"height: 40px;\" class=\"form-control\" > ");
                    for (int i = 0; i < lista.size(); i++) {
                        hv = lista.get(i);
                        out.println("<option value='" + hv.getIdHorario() + "'>" + hv.getInicioHora() + "-" + hv.getFinalHora() + "</option>");

                    }
                    out.println("</select>");
                }
            }
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
