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
import modeloVO.SolicitudVO;

/**
 *
 * @author Kevin
 */
public class SolicitudDAO extends conexioDAO {

    private SolicitudVO solicitudVO;
    private long idSolicitud;
    private ArrayList<SolicitudVO> listaSolicitud;

    public SolicitudDAO() {
        listaSolicitud = new ArrayList<SolicitudVO>();
    }

    public SolicitudVO getSolicitudVO() {
        return solicitudVO;
    }

    public void setSolicitudVO(SolicitudVO solicitudVO) {
        this.solicitudVO = solicitudVO;
    }

    public long getIdSolicitud() {
        return idSolicitud;
    }

    public void setIdSolicitud(long idSolicitud) {
        this.idSolicitud = idSolicitud;
    }

    public ArrayList<SolicitudVO> getListaSolicitud() {
        return listaSolicitud;
    }

    public void setListaSolicitud(ArrayList<SolicitudVO> listaSolicitud) {
        this.listaSolicitud = listaSolicitud;
    }

    // Modificar metodos
    public void AgregarRegistro() {

        try { // Registro logueado
            conectar();

            String insertar = "CALL registroSolicitud(?,?,?,?,?,?,?,?,?,?);";

            // Preparar la sentencia
            PreparedStatement pstm = this.con.prepareStatement(insertar);

            pstm.setLong(1, this.solicitudVO.getIdPersona());
            pstm.setLong(2, this.solicitudVO.getEstadoSolicitud());

            pstm.setString(3, this.solicitudVO.getFechaCreacion());
            pstm.setString(4, this.solicitudVO.getFechaRecoleccion());
            pstm.setString(5, this.solicitudVO.getFechaEntrega());

            pstm.setInt(7, this.solicitudVO.getHoraEntrega());
            pstm.setInt(6, this.solicitudVO.getHoraRecoge());
            pstm.setString(8, this.solicitudVO.getDescripcion());
            pstm.setLong(9, this.solicitudVO.getIdServicio());
            pstm.setDouble(10, this.solicitudVO.getPrecio());
            pstm.executeUpdate();

        } catch (SQLException e) {

            System.out.println("Error:" + e);
        } finally {
            desconectar();
        }
    }

    public void ActualizarRegistro(int id,int estado) {
        try {
            conectar();

            String actualiza = "CALL estadoSolicitud("+id+","+estado+");";

            PreparedStatement pstm = this.con.prepareStatement(actualiza);

           
            pstm.executeUpdate();

        } catch (SQLException e) {
            System.out.println("Error: " + e);
        } finally {
            desconectar();
        }

    }

    /*public void listar() {
     try {
     //Paso 1: Conectar a la base de datos
     conectar();
     //Paso 2: Ejecutar transacción
     //Paso 2.1: Declarar la sentencia
     // String consulta = "SELECT idSolicitud,PERSONA_Documento,estadoSolicitud,fechaCreaSolicitud,fechaRecoleccion,"+
     //"fechaEntrega,horaInicialRecoleccion,horaFinalRecoleccion,descripcion"+"FROM solicitud;";
     String consulta = ("CALL listarSolicitud();");

     //paso 2.2: Preparar la sentencia
     PreparedStatement pstm = this.con.prepareStatement(consulta);
     //paso 2.3: Ejecutar la sentencia
     ResultSet rs = pstm.executeQuery();
     while (rs.next()) {
     this.solicitudVO = new SolicitudVO();

     this.solicitudVO.setIdSolicitud(rs.getLong(1));
     this.solicitudVO.setNombre(rs.getString(2));
     this.solicitudVO.setNombreEstado(rs.getString(3));
     this.solicitudVO.setNombreServicio(rs.getString(4));

     this.solicitudVO.setFechaCreacion(rs.getString(5));
     this.solicitudVO.setFechaRecoleccion(rs.getString(6));
     this.solicitudVO.setFechaEntrega(rs.getString(7));

     this.solicitudVO.sethInicioIni(rs.getString(8));
     this.solicitudVO.sethInicioFin(rs.getString(9));
     this.solicitudVO.sethEntregaIni(rs.getString(10));
     this.solicitudVO.sethEntregaFin(rs.getString(11));
     this.solicitudVO.setDescripcion(rs.getString(12));

     this.listaSolicitud.add(this.solicitudVO);
     }
     } catch (SQLException e) {
     System.out.println("Error  al listar :" + e.getMessage());
     } finally {
     //paso 3: Desconectar de la BD
     desconectar();
     }
     }*/
    public ArrayList<SolicitudVO> listar() {
        ArrayList<SolicitudVO> lista = new ArrayList<SolicitudVO>();
        try {
            //Paso 1: Conectar a la base de datos
            conectar();
            //Paso 2: Ejecutar transacción
            //Paso 2.1: Declarar la sentencia
            // String consulta = "SELECT idSolicitud,PERSONA_Documento,estadoSolicitud,fechaCreaSolicitud,fechaRecoleccion,"+
            //"fechaEntrega,horaInicialRecoleccion,horaFinalRecoleccion,descripcion"+"FROM solicitud;";
            String consulta = ("CALL listarSolicitud();");

//paso 2.2: Preparar la sentencia
            PreparedStatement pstm = this.con.prepareStatement(consulta);
            //paso 2.3: Ejecutar la sentencia
            ResultSet rs = pstm.executeQuery();
            while (rs.next()) {
                SolicitudVO sv = new SolicitudVO();

                sv.setIdSolicitud(rs.getLong(1));
                sv.setNombre(rs.getString(2));
                sv.setNombreEstado(rs.getString(3));
                sv.setNombreServicio(rs.getString(4));

                sv.setFechaCreacion(rs.getString(5));
                sv.setFechaRecoleccion(rs.getString(6));
                sv.setFechaEntrega(rs.getString(7));

                sv.sethInicioIni(rs.getString(8));
                sv.sethInicioFin(rs.getString(9));
                sv.sethEntregaIni(rs.getString(10));
                sv.sethEntregaFin(rs.getString(11));
                sv.setDescripcion(rs.getString(12));
                sv.setEstadoSolicitud(rs.getLong(13));
                sv.setPrecio(rs.getDouble(14));

                lista.add(sv);
            }
        } catch (SQLException e) {
            System.out.println("Error  al listar :" + e.getMessage());
        } finally {
            //paso 3: Desconectar de la BD
            desconectar();
        }
        return lista;
    }

    public ArrayList<SolicitudVO> solicitudCliente(long id) {
        ArrayList<SolicitudVO> lista = new ArrayList<SolicitudVO>();
        try {
            //Paso 1: Conectar a la base de datos
            conectar();
            //Paso 2: Ejecutar transacción
            //Paso 2.1: Declarar la sentencia
            // String consulta = "SELECT idSolicitud,PERSONA_Documento,estadoSolicitud,fechaCreaSolicitud,fechaRecoleccion,"+
            //"fechaEntrega,horaInicialRecoleccion,horaFinalRecoleccion,descripcion"+"FROM solicitud;";
            String consulta = ("CALL solicitudCliente(" + id + ");");

//paso 2.2: Preparar la sentencia
            PreparedStatement pstm = this.con.prepareStatement(consulta);
            //paso 2.3: Ejecutar la sentencia
            ResultSet rs = pstm.executeQuery();
            while (rs.next()) {
                SolicitudVO sv = new SolicitudVO();

                sv.setIdSolicitud(rs.getLong(1));
                sv.setNombre(rs.getString(2));
                sv.setNombreEstado(rs.getString(3));
                sv.setNombreServicio(rs.getString(4));

                sv.setFechaCreacion(rs.getString(5));
                sv.setFechaRecoleccion(rs.getString(6));
                sv.setFechaEntrega(rs.getString(7));

                sv.sethInicioIni(rs.getString(8));
                sv.sethInicioFin(rs.getString(9));
                sv.sethEntregaIni(rs.getString(10));
                sv.sethEntregaFin(rs.getString(11));
                sv.setDescripcion(rs.getString(12));
                sv.setEstadoSolicitud(rs.getInt(13));
                  sv.setPrecio(rs.getDouble(14));
                
                lista.add(sv);
            }
        } catch (SQLException e) {
            System.out.println("Error  al listar :" + e.getMessage());
        } finally {
            //paso 3: Desconectar de la BD
            desconectar();
        }
        return lista;
    }

    public void consultaId() {
        try {
            conectar();

            String consulta = "SELECT * FROM solicitud WHERE idSolicitud = ?";

            PreparedStatement pstm = this.con.prepareStatement(consulta);
            pstm.setLong(1, this.idSolicitud);

            ResultSet rs = pstm.executeQuery();

            while (rs.next()) {

                this.solicitudVO = new SolicitudVO();

                this.solicitudVO.setIdSolicitud(rs.getInt(1));
                this.solicitudVO.setIdPersona(rs.getInt(2));
                this.solicitudVO.setEstadoSolicitud(rs.getInt(4));
                this.solicitudVO.setIdServicio(rs.getInt(3));

                this.solicitudVO.setFechaCreacion(rs.getString(5));
                this.solicitudVO.setFechaRecoleccion(rs.getString(6));
                this.solicitudVO.setFechaEntrega(rs.getString(7));

                this.solicitudVO.setHoraEntrega(rs.getInt(9));
                this.solicitudVO.setHoraRecoge(rs.getInt(8));
                this.solicitudVO.setDescripcion(rs.getString(10));
                this.solicitudVO.setPrecio(rs.getDouble(11));
            }

        } catch (SQLException e) {
            System.out.println("Error: " + e.getMessage());
        } finally {
            desconectar();
        }
    }

    public long consultaIdRecoger(int id) {
        try {
            conectar();

            String consulta = "SELECT * FROM solicitud WHERE idSolicitud =" + id + ";";

            PreparedStatement pstm = this.con.prepareStatement(consulta);

            ResultSet rs = pstm.executeQuery();

            while (rs.next()) {

                this.solicitudVO = new SolicitudVO();

                pstm.setLong(1, this.solicitudVO.getIdPersona());

            }

        } catch (SQLException e) {
            System.out.println("Error: " + e.getMessage());
        } finally {
            desconectar();
        }
        return this.solicitudVO.getIdSolicitud();
    }

    public void eliminar() {
        try {
            conectar();

            String eliminar = "DELETE FROM solicitud WHERE idSolicitud = ? ";

            PreparedStatement pstm = this.con.prepareStatement(eliminar);

            pstm.setLong(1, this.idSolicitud);

            pstm.executeUpdate();

        } catch (SQLException e) {
            System.out.println("Error. " + e.getMessage());
        } finally {
            desconectar();
        }
    }

    public void consultaRecibo(int id) {
        this.solicitudVO = new SolicitudVO();
        try {
            conectar();

            String consulta = "CALL recibo(" + id + ");";

            PreparedStatement pstm = this.con.prepareStatement(consulta);

            ResultSet rs = pstm.executeQuery();

            while (rs.next()) {

                this.solicitudVO.setNombre(rs.getString(1));
                this.solicitudVO.setNumDoc(rs.getString(2));
                this.solicitudVO.setDireccion(rs.getString(3));
                this.solicitudVO.setNumCel(rs.getString(4));
                this.solicitudVO.setCorreo(rs.getString(5));

                this.solicitudVO.setFechaRecoleccion(rs.getString(6));
                this.solicitudVO.setFechaEntrega(rs.getString(7));
                this.solicitudVO.setHoraEntrega(rs.getInt(8));
                this.solicitudVO.setHoraRecoge(rs.getInt(9));

                this.solicitudVO.setNombreServicio(rs.getString(10));
                this.solicitudVO.setPrecio(rs.getDouble(11));

                this.listaSolicitud.add(this.solicitudVO);
            }

        } catch (SQLException e) {
            System.out.println("Error: " + e.getMessage());
        } finally {
            desconectar();
        }

    }

   
    
    

    public long consultaEstado(int id) {
        this.solicitudVO = new SolicitudVO();
        try {
            conectar();

            String consulta = "CALL recogerEstado(" + id + ");";

            PreparedStatement pstm = this.con.prepareStatement(consulta);

            ResultSet rs = pstm.executeQuery();

            while (rs.next()) {

                this.solicitudVO.setEstadoSolicitud(rs.getInt(1));

                this.listaSolicitud.add(this.solicitudVO);
            }

        } catch (SQLException e) {
            System.out.println("Error: " + e.getMessage());
        } finally {
            desconectar();
        }

        return this.solicitudVO.getEstadoSolicitud();
    }

    public ArrayList<SolicitudVO> pedido(String fecha) {
        ArrayList<SolicitudVO> lista = new ArrayList<SolicitudVO>();
        try {

            conectar();

            PreparedStatement pstm = this.con.prepareStatement("CALL pedidos('" + fecha + "');");

            ResultSet rs = pstm.executeQuery();

            while (rs.next()) {

                SolicitudVO sv = new SolicitudVO();

                sv.setIdSolicitud(rs.getLong(1));
                sv.setNombre(rs.getString(2));
                sv.setApellido(rs.getString(3));
                sv.setNombreEstado(rs.getString(4));
                sv.setNombreServicio(rs.getString(5));
                sv.setFechaCreacion(rs.getString(6));
                sv.setFechaRecoleccion(rs.getString(7));
                sv.setFechaEntrega(rs.getString(8));

                sv.sethInicioIni(rs.getString(9));
                sv.sethInicioFin(rs.getString(10));

                sv.sethEntregaIni(rs.getString(11));
                sv.sethEntregaFin(rs.getString(12));
                sv.setDescripcion(rs.getString(13));
                sv.setPrecio(rs.getDouble(14));

                lista.add(sv);

            }

        } catch (SQLException e) {
            System.out.println("Error " + e.getMessage());
        }

        return lista;
    }
   

    public SolicitudVO consulta(int id) {
        //ArrayList<SolicitudVO> lista = new ArrayList<SolicitudVO>();
           SolicitudVO sv = new SolicitudVO();
        try {
            conectar();

            String consulta = "CALL cancelacion("+id+");";

            PreparedStatement pstm = this.con.prepareStatement(consulta);


            ResultSet rs = pstm.executeQuery();

            while (rs.next()) {

               

                sv.setIdSolicitud(rs.getInt(1));
                sv.setIdPersona(rs.getInt(2));
                sv.setEstadoSolicitud(rs.getInt(4));
                sv.setIdServicio(rs.getInt(3));

                sv.setFechaCreacion(rs.getString(5));
               sv.setFechaRecoleccion(rs.getString(6));
                sv.setFechaEntrega(rs.getString(7));

                sv.setHoraEntrega(rs.getInt(8));
                sv.setHoraRecoge(rs.getInt(9));
                sv.setDescripcion(rs.getString(10));
                sv.setPrecio(rs.getDouble(11));
                
                
            }

        } catch (SQLException e) {
            System.out.println("Error: " + e.getMessage());
        } finally {
            desconectar();
        }
        return sv;
    }
    
    
}
