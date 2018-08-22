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
import modeloVO.ComentarioVO;

/**
 *
 * @author Kevin
 */
public class ComentarioDAO extends conexioDAO {

    private ComentarioVO comentarioVO;
    private long idComentario;
    private ArrayList<ComentarioVO> listaComentario;

    public ComentarioDAO() {
        listaComentario = new ArrayList<ComentarioVO>();
    }

    public ComentarioVO getComentarioVO() {
        return comentarioVO;
    }

    public void setComentarioVO(ComentarioVO comentarioVO) {
        this.comentarioVO = comentarioVO;
    }

    public long getIdComentario() {
        return idComentario;
    }

    public void setIdComentario(long idComentario) {
        this.idComentario = idComentario;
    }

    public ArrayList<ComentarioVO> getListaComentario() {
        return listaComentario;
    }

    public void setListaComentario(ArrayList<ComentarioVO> listaComentario) {
        this.listaComentario = listaComentario;
    }

    public void AgregarRegistro() {
        try {
            conectar();

            String insertar = "CALL ingresarComentario(?,?)";

            // Preparar la sentencia
            PreparedStatement pstm = this.con.prepareStatement(insertar);

            pstm.setInt(1, this.comentarioVO.getIdPersona());
            pstm.setString(2, this.comentarioVO.getDescripcion());
           // pstm.setString(3, this.comentarioVO.getFecha());

            pstm.executeUpdate();

        } catch (SQLException e) {

            System.out.println("Error:" + e);
        } finally {
            desconectar();
        }
    }

    public void ActualizarRegistro() {
        try {
            conectar();

            String actualiza = "CALL actualizarComentario(?,?);";

            PreparedStatement pstm = this.con.prepareStatement(actualiza);

            pstm.setLong(1, this.comentarioVO.getIdComentario());
       
            pstm.setString(2, this.comentarioVO.getDescripcion());
       

      

            pstm.executeUpdate();

        } catch (SQLException e) {
            System.out.println("Error: " + e);
        } finally {
            desconectar();
        }

    }

    public ArrayList<ComentarioVO> listar() {
        ArrayList<ComentarioVO> lista = new ArrayList<ComentarioVO>();
        try {
            //Paso 1: Conectar a la base de datos
            conectar();
            //Paso 2: Ejecutar transacción
            //Paso 2.1: Declarar la sentencia
             
            //paso 2.2: Preparar la sentencia
            PreparedStatement pstm = this.con.prepareStatement("CALL listarComentario();");
            //paso 2.3: Ejecutar la sentencia
            ResultSet rs = pstm.executeQuery();
            while (rs.next()) {
                ComentarioVO cvo = new ComentarioVO();

                cvo.setIdComentario(rs.getLong(1));
                cvo.setDescripcion(rs.getString(3));
                cvo.setFecha(rs.getString(4));
                cvo.setNombre(rs.getString(2));
          

               lista.add(cvo);
            }
        } catch (SQLException e) {
            System.out.println("Error:" + e.getMessage());
        } finally {
            //paso 3: Desconectar de la BD
            desconectar();
        }
        return lista;
    }

    public boolean consultaId(long id) {
    
        try {
            conectar();

            String consulta = "SELECT idComentario FROM comentario WHERE PERSONA_idPersona = "+id+";";

            PreparedStatement pstm = this.con.prepareStatement(consulta);
           

            ResultSet rs = pstm.executeQuery();

            if(rs.absolute(1)){
                return  true;
            }

        } catch (SQLException e) {
            System.out.println("Error: " + e.getMessage());
        } finally {
            desconectar();
        }
        return false;
    }
    public ComentarioVO consulta(long id) {
          ComentarioVO cvo = new ComentarioVO();
        try {
            conectar();

            String consulta = "CALL listarComentarioId("+id+");";

            PreparedStatement pstm = this.con.prepareStatement(consulta);
           

            ResultSet rs = pstm.executeQuery();

            while (rs.next()) {

           
                cvo.setIdComentario(rs.getInt(1));
                cvo.setIdPersona(rs.getInt(2));
                cvo.setNombre(rs.getString(3));
                cvo.setDescripcion(rs.getString(4));
                cvo.setFecha(rs.getString(5));
                
   
                
                
            }

        } catch (SQLException e) {
            System.out.println("Error: " + e.getMessage());
        } finally {
            desconectar();
        }
        
        return cvo;
    }
    
    public ArrayList<ComentarioVO> consultaComentarios(long id) {
        ArrayList<ComentarioVO> cvoList = new ArrayList<>();  
        try {
            conectar();
            String consulta = "CALL listarComentarioId("+id+");";
            PreparedStatement pstm = this.con.prepareStatement(consulta);
            ResultSet rs = pstm.executeQuery();

            while (rs.next()) {
                ComentarioVO cvo = new ComentarioVO();
                cvo.setIdComentario(rs.getInt(1));
                cvo.setIdPersona(rs.getInt(2));
                cvo.setNombre(rs.getString(3));
                cvo.setDescripcion(rs.getString(4));
                cvo.setFecha(rs.getString(5));
                cvoList.add(cvo);
            }

        } catch (SQLException e) {
            System.out.println("Error: " + e.getMessage());
        } finally {
            desconectar();
        }
        
        return cvoList;
    }

    public void eliminar() {
        try {
            conectar();

            String eliminar = "DELETE FROM comentario WHERE idComentario = ? ";

            PreparedStatement pstm = this.con.prepareStatement(eliminar);

            pstm.setLong(1, this.idComentario);

            pstm.executeUpdate();

        } catch (SQLException e) {
            System.out.println("Error. " + e.getMessage());
        } finally {
            desconectar();
        }
    }
}
