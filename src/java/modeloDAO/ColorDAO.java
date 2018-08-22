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
import modeloVO.ColorVO;

/**
 *
 * @author Kevin
 */
public class ColorDAO extends conexioDAO {
    
     private ColorVO colorVO;
  private long idColor;
 private ArrayList<ColorVO> listaColor;
    
    public ColorDAO(){
        listaColor = new ArrayList<ColorVO>();
    }

    public ColorVO getColorVO() {
        return colorVO;
    }

    public void setColorVO(ColorVO colorVO) {
        this.colorVO = colorVO;
    }

    public long getIdColor() {
        return idColor;
    }

    public void setIdColor(long idColor) {
        this.idColor = idColor;
    }

  

    public ArrayList<ColorVO> getListaColor() {
        return listaColor;
    }

    public void setListaColor(ArrayList<ColorVO> listaColor) {
        this.listaColor = listaColor;
    }

    

    public void listar() {
        try {
        //Paso 1: Conectar a la base de datos
        conectar();
        //Paso 2: Ejecutar transacción
        //Paso 2.1: Declarar la sentencia
        String consulta = "CALL consultaColor();";
        //paso 2.2: Preparar la sentencia
        PreparedStatement pstm = this.con.prepareStatement(consulta);
        //paso 2.3: Ejecutar la sentencia
        ResultSet rs = pstm.executeQuery();
        while (rs.next()) {
        this.colorVO = new ColorVO();
        
        this.colorVO.setIdColor(rs.getLong(1));
        this.colorVO.setNombre(rs.getString(2));
        this.colorVO.setDescripcion(rs.getString(3));
       
        this.listaColor.add(this.colorVO);
        }
        } catch (SQLException e) {
        System.out.println("Error:" + e.getMessage());
        } finally {
        //paso 3: Desconectar de la BD
        desconectar();
        }
}
  
    public ColorVO consultaId(){
      try{
          conectar();
          
          String consulta = "SELECT * FROM rol WHERE idRol = ?";
          
          PreparedStatement pstm = this.con.prepareStatement(consulta);
          pstm.setLong(1, this.idColor);
          
          ResultSet rs = pstm.executeQuery();
          
          
          while(rs.next()){
              
              this.colorVO = new ColorVO();
              
              this.colorVO.setIdColor(rs.getLong(1));
              this.colorVO.setNombre(rs.getString(2));
              this.colorVO.setDescripcion(rs.getString(3));

          }
          
          
      }catch(SQLException e){
          System.out.println("Error: "+e.getMessage());
      }finally{
          desconectar();
      }
      return this.colorVO;
  }
    
    
    public ArrayList<ColorVO> colorArray(){
       ArrayList<ColorVO> listado = new ArrayList<ColorVO>();
       try{
           conectar();
           PreparedStatement pstm = this.con.prepareStatement("SELECT * FROM color;");
           ResultSet rs  = pstm.executeQuery();
           while(rs.next()){
               ColorVO cv = new ColorVO();
               
               cv.setIdColor(rs.getLong(1));
               cv.setNombre(rs.getString(2));
               cv.setDescripcion(rs.getString(3));
               
               listado.add(cv);
           }
           
           
           
           
           
           
       }catch(SQLException e){
           System.out.println("Eroor: "+e.getMessage());
       }finally{
           desconectar();
       }
       
        return listado;
    }
    
    public String colorId(String id){
        int idColor = Integer.parseInt(id);
    ColorVO cv = new ColorVO();
      try{
          conectar();
          
          String consulta = "SELECT nombre FROM color WHERE idColor ='"+idColor+"';";
          
          PreparedStatement pstm = this.con.prepareStatement(consulta);
      
          
          ResultSet rs = pstm.executeQuery();
          
          
          while(rs.next()){
              
            
              
             
              cv.setNombre(rs.getString(1));
             

          }
          
          
      }catch(SQLException e){
          System.out.println("Error: "+e.getMessage());
      }finally{
          desconectar();
      }

      return cv.getNombre() ;
  }
    
    
}
