/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modeloDAO;

import com.mysql.jdbc.exceptions.MySQLIntegrityConstraintViolationException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import modeloVO.DetallePrendaVO;

/**
 *
 * @author Kevin
 */
public class DetallePrendaDAO extends conexioDAO {

    private DetallePrendaVO detallePrendaVO;
    private long idDetallePrenda;
    private ArrayList<DetallePrendaVO> listaDetalle;
    boolean listo = false;

    public DetallePrendaDAO() {
        listaDetalle = new ArrayList<DetallePrendaVO>();
    }

    public DetallePrendaVO getDetallePrendaVO() {
        return detallePrendaVO;
    }

    public void setDetallePrendaVO(DetallePrendaVO detallePrendaVO) {
        this.detallePrendaVO = detallePrendaVO;
    }

    public long getIdDetallePrenda() {
        return idDetallePrenda;
    }

    public void setIdDetallePrenda(long idDetallePrenda) {
        this.idDetallePrenda = idDetallePrenda;
    }

 

    public ArrayList<DetallePrendaVO> getListaDetalle() {
        return listaDetalle;
    }

    public void setListaDetalle(ArrayList<DetallePrendaVO> listaDetalle) {
        this.listaDetalle = listaDetalle;
    }

    

    public boolean AgregarRegistro() {

        try {
            conectar();

            String insertar = "CALL insertarDetalle(?,?,?,?,?,?,?);"; 

            // Preparar la sentencia
            PreparedStatement pstm = this.con.prepareStatement(insertar);

            pstm.setInt(2, this.detallePrendaVO.getIdTipoPrenda());
            pstm.setInt(1, this.detallePrendaVO.getIdSolicitud());
            pstm.setInt(4, this.detallePrendaVO.getIdMaterial());
            pstm.setInt(3, this.detallePrendaVO.getIdColor());
            pstm.setInt(5, this.detallePrendaVO.getIdServicio());
            pstm.setDouble(6, this.detallePrendaVO.getPrecdio());
            
            pstm.setString(7, this.detallePrendaVO.getDescripcion());

            pstm.executeUpdate();
            
            listo =true;

        } catch (SQLException e) {

            System.out.println("Error:" + e);
        } 
        catch(Exception e){
            System.out.println("Error:"+e.getMessage());
        }
        finally {
            desconectar();
        }
        return listo;
    }

   /* public void ActualizarRegistro() {
        try {
            conectar();

            String actualiza = "actDetallePrenda(?,?,?,?,?);";

            PreparedStatement pstm = this.con.prepareStatement(actualiza);

      
            pstm.setInt(2, this.detallePrendaVO.getIdSolicitud());
            pstm.setString(3, this.detallePrendaVO.getMaterial());
            pstm.setString(4, this.detallePrendaVO.getColor());
            pstm.setString(5, this.detallePrendaVO.getDescripcion());
        
            pstm.setInt(1, this.detallePrendaVO.getIdTipoPrenda());

            pstm.executeUpdate();

        } catch (SQLException e) {
            System.out.println("Error: " + e);
        } finally {
            desconectar();
        }

    }
*/
    public void listar(int id) {
         
        try {
            //Paso 1: Conectar a la base de datos
            conectar();
        //Paso 2: Ejecutar transacción
            //Paso 2.1: Declarar la sentencia
            String consulta = "CALL listarPrendas("+id+");";
            //paso 2.2: Preparar la sentencia
            PreparedStatement pstm = this.con.prepareStatement(consulta);
            //paso 2.3: Ejecutar la sentencia
            ResultSet rs = pstm.executeQuery();
            while (rs.next()) {
              this.detallePrendaVO = new DetallePrendaVO();
                 
            this.detallePrendaVO.setIdDetalle(rs.getInt(1));
            this.detallePrendaVO.setNombrePrenda(rs.getString(2));
            this.detallePrendaVO.setNombreColor(rs.getString(3));
            this.detallePrendaVO.setNombreMaterial(rs.getString(4));
            this.detallePrendaVO.setNombreServicio(rs.getString(5));
            this.detallePrendaVO.setPrecdio(rs.getDouble(6));
       
            this.detallePrendaVO.setDescripcion(rs.getString(7));

                this.listaDetalle.add(this.detallePrendaVO);
            }
        } catch (SQLException e) {
            System.out.println("Error:" + e.getMessage());
        } finally {
            //paso 3: Desconectar de la BD
            desconectar();
        }
    }

   /* public void consultaId() {
        try {
            conectar();

            String consulta = "SELECT * FROM detallePrenda WHERE idDetallePrenda = ?";

            PreparedStatement pstm = this.con.prepareStatement(consulta);
            pstm.setLong(1, this.idDetallePrenda);

            ResultSet rs = pstm.executeQuery();

            while (rs.next()) {

                this.detallePrendaVO = new DetallePrendaVO();

               this.detallePrendaVO.setIdTipoPrenda(rs.getInt(1));
            this.detallePrendaVO.setIdSolicitud(rs.getInt(2));
            this.detallePrendaVO.setMaterial(rs.getString(3));
            this.detallePrendaVO.setColor(rs.getString(4));
            this.detallePrendaVO.setDescripcion(rs.getString(5));

            }

        } catch (SQLException e) {
            System.out.println("Error: " + e.getMessage());
        } finally {
            desconectar();
        }
    }*/

    public double totalDetalle(int id){
        double total = 0;
        try {
            conectar();
            PreparedStatement pst = this.con.prepareStatement("CALL totalDetalle("+id+");");
            
            ResultSet rs = pst.executeQuery();
            
            while(rs.next()){
                total = rs.getDouble(1);
            }
            
            
            
        } catch (SQLException e) {
            System.out.println("Error total: "+e.getMessage());
        }finally{
            desconectar();
        }
        
        
        
        
        return total;
    }
    
    
    public void eliminar() {
        try {
            conectar();

            String eliminar = "DELETE FROM detallePrenda WHERE idDetallePrenda = ? ";

            PreparedStatement pstm = this.con.prepareStatement(eliminar);

            pstm.setLong(1, this.idDetallePrenda);

            pstm.executeUpdate();

        } catch (SQLException e) {
            System.out.println("Error. " + e.getMessage());
        } finally {
            desconectar();
        }
    }

}
