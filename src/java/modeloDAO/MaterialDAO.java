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
import modeloVO.MaterialVO;

/**
 *
 * @author Kevin
 */
public class MaterialDAO extends conexioDAO {
 
     private MaterialVO materialVO;
  private long idMaterial;
 private ArrayList<MaterialVO> listaMaterial;
    
    public MaterialDAO(){
        listaMaterial = new ArrayList<MaterialVO>();
    }

    public MaterialVO getMaterialVO() {
        return materialVO;
    }

    public void setMaterialVO(MaterialVO materialVO) {
        this.materialVO = materialVO;
    }

    public long getIdMaterial() {
        return idMaterial;
    }

    public void setIdMaterial(long idMaterial) {
        this.idMaterial = idMaterial;
    }

    public ArrayList<MaterialVO> getListaMaterial() {
        return listaMaterial;
    }

    public void setListaMaterial(ArrayList<MaterialVO> listaMaterial) {
        this.listaMaterial = listaMaterial;
    }

  

    

    public void listar() {
        try {
        //Paso 1: Conectar a la base de datos
        conectar();
        //Paso 2: Ejecutar transacción
        //Paso 2.1: Declarar la sentencia
        String consulta = "CALL consultaMaterial();";
        //paso 2.2: Preparar la sentencia
        PreparedStatement pstm = this.con.prepareStatement(consulta);
        //paso 2.3: Ejecutar la sentencia
        ResultSet rs = pstm.executeQuery();
        while (rs.next()) {
        this.materialVO = new MaterialVO();
        
        this.materialVO.setIdMaterial(rs.getLong(1));
        this.materialVO.setNombre(rs.getString(2));
        this.materialVO.setDescripcion(rs.getString(3));
       
        this.listaMaterial.add(this.materialVO);
        }
        } catch (SQLException e) {
        System.out.println("Error:" + e.getMessage());
        } finally {
        //paso 3: Desconectar de la BD
        desconectar();
        }
}
  
    public MaterialVO consultaId(){
      try{
          conectar();
          
          String consulta = "SELECT * FROM rol WHERE idRol = ?";
          
          PreparedStatement pstm = this.con.prepareStatement(consulta);
          pstm.setLong(1, this.idMaterial);
          
          ResultSet rs = pstm.executeQuery();
          
          
          while(rs.next()){
              
              this.materialVO = new MaterialVO();
              
              this.materialVO.setIdMaterial(rs.getLong(1));
              this.materialVO.setNombre(rs.getString(2));
              this.materialVO.setDescripcion(rs.getString(3));

          }
          
          
      }catch(SQLException e){
          System.out.println("Error: "+e.getMessage());
      }finally{
          desconectar();
      }
      return this.materialVO;
  }
    
    
}
