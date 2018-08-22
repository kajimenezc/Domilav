/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modeloDAO;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import modeloVO.HorariosVO;

/**
 *
 * @author Kevin
 */
public class HorariosDAO extends conexioDAO {

    private int idHorario;
    private HorariosVO horario;
    private ArrayList<HorariosVO> listaHorario;

    public HorariosDAO() {
        listaHorario = new ArrayList<HorariosVO>();
    }

    public int getIdHorario() {
        return idHorario;
    }

    public void setIdHorario(int idHorario) {
        this.idHorario = idHorario;
    }

    public HorariosVO getHorario() {
        return horario;
    }

    public void setHorario(HorariosVO horario) {
        this.horario = horario;
    }

    public ArrayList<HorariosVO> getListaHorario() {
        return listaHorario;
    }

    public void setListaHorario(ArrayList<HorariosVO> listaHorario) {
        this.listaHorario = listaHorario;
    }
    
    
    
    

    public ArrayList<HorariosVO> listar(){
        ArrayList<HorariosVO> listaHorario = new ArrayList<HorariosVO>();
        try {
        //Paso 1: Conectar a la base de datos
        conectar();
    
        PreparedStatement pstm = this.con.prepareStatement("CALL consultaHorarios();");
        //paso 2.3: Ejecutar la sentencia
        ResultSet rs = pstm.executeQuery();
        while (rs.next()) {
        HorariosVO hv = new HorariosVO();
                
                hv.setIdHorario(rs.getInt(1));
                hv.setInicioHora(rs.getString(2));
                hv.setFinalHora(rs.getString(3));
                
                listaHorario.add(hv);
        }
        } catch (SQLException e) {
        System.out.println("Error:" + e.getMessage());
        } finally {
        //paso 3: Desconectar de la BD
        desconectar();
        }
        return listaHorario;
    }
    
    
    
    
    
    
    public ArrayList<HorariosVO> listarHoras(int id){
        ArrayList<HorariosVO> listaHorario = new ArrayList<HorariosVO>();
                
        try {
            conectar();
            
            PreparedStatement pst = this.con.prepareStatement("CALL consultaHoras("+id+");");
            ResultSet rs = pst.executeQuery();
            
            while(rs.next()){
                HorariosVO hv = new HorariosVO();
                
                hv.setIdHorario(rs.getInt(1));
                hv.setInicioHora(rs.getString(2));
                hv.setFinalHora(rs.getString(3));
                
                listaHorario.add(hv);
                
            }
            
        } catch (SQLException e) {
            System.out.println("ERrror: "+e.getMessage());
        }finally{
            desconectar();
        }
        return listaHorario;
    }
    public ArrayList<HorariosVO> consultaId(int id){
        ArrayList<HorariosVO> listaHorario = new ArrayList<HorariosVO>();
                
        try {
            conectar();
            
            PreparedStatement pst = this.con.prepareStatement("CALL consultarHorasId("+id+");");
            ResultSet rs = pst.executeQuery();
            
            while(rs.next()){
                HorariosVO hv = new HorariosVO();
                
                hv.setIdHorario(rs.getInt(1));
                hv.setInicioHora(rs.getString(2));
                hv.setFinalHora(rs.getString(3));
                
                listaHorario.add(hv);
                
            }
            
        } catch (SQLException e) {
            System.out.println("ERrror: "+e.getMessage());
        }finally{
            desconectar();
        }
        return listaHorario;
    }
    
    
     public int contadorSolicitud(String fecha, int rango) {
        int contador = 0;
        try {
            conectar();
            
            PreparedStatement pstm = this.con.prepareStatement("CALL contSolicitudes('" + fecha + "'," + rango + ");");

            ResultSet rs = pstm.executeQuery();

            while (rs.next()) {
                contador = rs.getInt(1);
            }

        } catch (SQLException e) {
            System.out.println("Error: " + e.getMessage());
        }finally{
            desconectar();
        }

        return contador;
    }
     public int contadorEntrega(String fecha, int rango) {
        int contador = 0;
        try {
            conectar();
            
            PreparedStatement pstm = this.con.prepareStatement("CALL contEntrega(" + rango + ",'" + fecha + "');");

            ResultSet rs = pstm.executeQuery();

            while (rs.next()) {
                contador = rs.getInt(1);
            }

        } catch (SQLException e) {
            System.out.println("Error: " + e.getMessage());
        }finally{
            desconectar();
        }

        return contador;
    }
    
    
    
}
