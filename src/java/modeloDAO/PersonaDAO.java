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
import modeloVO.PersonaVO;
import modeloVO.RolVO;

/**
 *
 * @author kev_i
 */
public class PersonaDAO extends conexioDAO {

    public RolVO rolVO;
    private PersonaVO personaVO;
    private long idPersona;
    private ArrayList<PersonaVO> listaPersona;
    Boolean listo = false;

    public PersonaDAO() {
        listaPersona = new ArrayList<PersonaVO>();
    }

    public PersonaVO getPersonaVO() {
        return personaVO;
    }

    public void setPersonaVO(PersonaVO personaVO) {
        this.personaVO = personaVO;
    }

    public long getIdPersona() {
        return idPersona;
    }

    public void setIdPersona(long idPersona) {
        this.idPersona = idPersona;
    }

    public ArrayList<PersonaVO> getListaPersona() {
        return listaPersona;
    }

    public void setListaPersona(ArrayList<PersonaVO> listaPersona) {
        this.listaPersona = listaPersona;
    }

    public boolean autenticacion(String user, String pass) {
        try {
            conectar();
            String consulta = "SELECT * FROM persona WHERE usuario = ? AND passwo = SHA1(?);";

            PreparedStatement pst = this.con.prepareStatement(consulta);

            pst.setString(1, user);
            pst.setString(2, pass);

            ResultSet rs = pst.executeQuery();

            if (rs.absolute(1)) {
                return true;
            }
        } catch (SQLException e) {
            System.out.println("Error login:" + e.getMessage());
        } finally {
            desconectar();
        }
        return false;
    }

    public void AgregarRegistro() {
        try {
            conectar();

            String insertarPersona = "CALL insertarUsuario(?,?,?,?,?,?,?,?,?,?,?,?,SHA1(?),?,?);";

            PreparedStatement pstm = this.con.prepareStatement(insertarPersona);

            // pstm.setLong(1, this.personaVO.getIdPersona());
            pstm.setString(1, this.personaVO.getDocumento());
            pstm.setInt(2, this.personaVO.getIdDocumento());
            pstm.setInt(3, this.personaVO.getIdAgencia());
            pstm.setInt(4, this.personaVO.getBarrio());
            pstm.setInt(5, this.personaVO.getRol());

            pstm.setString(6, this.personaVO.getNombres());
            pstm.setString(7, this.personaVO.getApellidos());
            pstm.setString(8, this.personaVO.getGenero());
            pstm.setString(9, this.personaVO.getNumCelular());

            pstm.setString(10, this.personaVO.getNumFijo());
            pstm.setString(11, this.personaVO.getDireccion());
            pstm.setString(12, this.personaVO.getCorreo());
            pstm.setString(13, this.personaVO.getPassword());
            pstm.setInt(14, this.personaVO.getEstado());
            pstm.setString(15, this.personaVO.getUsuario());

            pstm.executeUpdate();

        } catch (SQLException e) {
            System.out.println("Error en esta parte: " + e.getMessage());
        } catch (Exception e) {
            System.out.println("error: " + e.getMessage());
        } finally {
            desconectar();
        }
    }

    public void registroCliente() {
        try {
            conectar();

            String insertarPersona = "CALL registroCliente(?,?,?,?,?,?,?,?,?,?);";

            PreparedStatement pstm = this.con.prepareStatement(insertarPersona);

            // pstm.setLong(1, this.personaVO.getIdPersona());
            pstm.setString(1, this.personaVO.getDocumento());
            pstm.setInt(2, this.personaVO.getIdDocumento());
            pstm.setInt(3, this.personaVO.getIdAgencia());
            pstm.setInt(4, this.personaVO.getBarrio());
            pstm.setInt(5, this.personaVO.getRol());

            pstm.setString(6, this.personaVO.getNombres());

            pstm.setString(7, this.personaVO.getNumCelular());
            pstm.setString(8, this.personaVO.getDireccion());
            pstm.setString(9, this.personaVO.getCorreo());

            pstm.setInt(10, this.personaVO.getEstado());

            pstm.executeUpdate();

        } catch (SQLException e) {
            System.out.println("Error en esta parte: " + e.getMessage());
        } finally {
            desconectar();
        }
    }

    public void listar() {
        try {
            conectar();

            String consulta = "CALL listarPersona()";

            PreparedStatement pstm = this.con.prepareStatement(consulta);

            ResultSet rs = pstm.executeQuery();

            while (rs.next()) {
                this.personaVO = new PersonaVO();

                this.personaVO.setIdPersona(rs.getInt(1));
                this.personaVO.setNombreRol(rs.getString(2));
                //this.personaVO.setRol(rs.getInt(2));
                this.personaVO.setNombres(rs.getString(3));
                this.personaVO.setApellidos(rs.getString(4));

                this.listaPersona.add(this.personaVO);

            }

        } catch (SQLException e) {
            System.out.println("Error: " + e.getMessage());
        } finally {
            desconectar();
        }
    }

    public ArrayList<PersonaVO> listarCliente() {
        ArrayList<PersonaVO> lp = new ArrayList<PersonaVO>();
           
        try {
            conectar();

            String consulta = "CALL listarCliente()";

            PreparedStatement pstm = this.con.prepareStatement(consulta);

            ResultSet rs = pstm.executeQuery();

            while (rs.next()) {
             PersonaVO pv = new PersonaVO();

                pv.setIdPersona(rs.getInt(1));
                pv.setNombres(rs.getString(2));

                pv.setApellidos(rs.getString(3));
                pv.setTipoDoc(rs.getString(4));
                pv.setDocumento(rs.getString(5));
                pv.setDireccion(rs.getString(6));

                pv.setNumCelular(rs.getString(7));
                pv.setNombreEstado(rs.getString(8));
                pv.setEstado(rs.getInt(9));

                lp.add(pv);

            }

        } catch (SQLException e) {
            System.out.println("Error: " + e.getMessage());
        } finally {
            desconectar();
        }
        return lp;
    }

    public void listarEmpleado() {
        try {
            conectar();

            String consulta = "CALL listarEmpleado()";

            PreparedStatement pstm = this.con.prepareStatement(consulta);

            ResultSet rs = pstm.executeQuery();

            while (rs.next()) {
                this.personaVO = new PersonaVO();

                this.personaVO.setIdPersona(rs.getInt(1));
                this.personaVO.setNombres(rs.getString(2));
                this.personaVO.setApellidos(rs.getString(3));
                this.personaVO.setDocumento(rs.getString(4));
                this.personaVO.setDireccion(rs.getString(5));
                this.personaVO.setCorreo(rs.getString(6));
                this.personaVO.setNumCelular(rs.getString(7));
                this.personaVO.setNombreBarrio(rs.getString(9));
                this.personaVO.setNombreAgen(rs.getString(8));
                this.personaVO.setNombreEstado(rs.getString(10));
                this.personaVO.setEstado(rs.getInt(11));

                this.listaPersona.add(this.personaVO);

            }

        } catch (SQLException e) {
            System.out.println("Error: " + e.getMessage());
        } finally {
            desconectar();
        }
    }

    public void consultaId() {
        try {
            conectar();

            String consulta = "SELECT * FROM persona WHERE idPersona = ?";

            PreparedStatement pstm = this.con.prepareStatement(consulta);
            pstm.setLong(1, this.idPersona);

            ResultSet rs = pstm.executeQuery();

            while (rs.next()) {

                this.personaVO = new PersonaVO();

                this.personaVO.setIdPersona(rs.getLong(1));
                this.personaVO.setDocumento(rs.getString(2));
                this.personaVO.setIdAgencia(rs.getInt(3));
                this.personaVO.setIdDocumento(rs.getInt(4));
                this.personaVO.setBarrio(rs.getInt(5));
                this.personaVO.setRol(rs.getInt(6));
                this.personaVO.setNombres(rs.getString(7));
                this.personaVO.setApellidos(rs.getString(8));
                this.personaVO.setGenero(rs.getString(9));
                this.personaVO.setNumCelular(rs.getString(10));
                this.personaVO.setNumFijo(rs.getString(11));
                this.personaVO.setDireccion(rs.getString(12));
                this.personaVO.setCorreo(rs.getString(13));
                this.personaVO.setPassword(rs.getString(14));
                this.personaVO.setEstado(rs.getInt(15));

            }

        } catch (SQLException e) {
            System.out.println("Error: " + e.getMessage());
        } finally {
            desconectar();
        }
    }

    public boolean consultaDocumento(String doc) {
        try {
            conectar();

            conectar();
            String consulta = "SELECT * FROM persona WHERE documento = '" + doc + "';";

            PreparedStatement pst = this.con.prepareStatement(consulta);

            ResultSet rs = pst.executeQuery();

            if (rs.absolute(1)) {
                listo = true;
            }

        } catch (SQLException e) {
            System.out.println("Error: " + e.getMessage());
        } finally {
            desconectar();
        }
        return listo;
    }

    public Boolean cambiarEstado(long id,int estado){
        
        try {
            
            conectar();
            PreparedStatement pst = this.con.prepareStatement("CALL estadoPersona("+id+","+estado+");");
                       
            pst.executeUpdate();
            
            
            
            listo = true;
            
        } catch (SQLException e) {
            System.out.println("Error: "+e.getMessage());
        }
        
        return listo;
    }
    
    
    public long recogeId(String doc) {

        try {
            conectar();
            int id;
            conectar();
            String consulta = "SELECT idPersona FROM persona WHERE documento = " + doc + ";";

            PreparedStatement pst = this.con.prepareStatement(consulta);

            ResultSet rs = pst.executeQuery();
            while (rs.next()) {

                this.personaVO = new PersonaVO();

                this.personaVO.setIdPersona(rs.getLong(1));

            }

        } catch (SQLException e) {
            System.out.println("Error: " + e.getMessage());
        } finally {
            desconectar();
        }
        return personaVO.getIdPersona();
    }
    public int recogeEstado(long id) {

        try {
            conectar();
          
         
            String consulta = "SELECT idEstado FROM persona WHERE idPersona = " + id + ";";

            PreparedStatement pst = this.con.prepareStatement(consulta);

            ResultSet rs = pst.executeQuery();
            while (rs.next()) {

                this.personaVO = new PersonaVO();

                this.personaVO.setEstado(rs.getInt(1));

            }

        } catch (SQLException e) {
            System.out.println("Error: " + e.getMessage());
        } finally {
            desconectar();
        }
        return personaVO.getEstado();
    }

    public long recogeIdPersona(String usu) {

        try {
            conectar();

            conectar();
            String consulta = "SELECT idPersona FROM persona WHERE usuario = '" + usu + "';";

            PreparedStatement pst = this.con.prepareStatement(consulta);

            ResultSet rs = pst.executeQuery();
            while (rs.next()) {

                this.personaVO = new PersonaVO();

                this.personaVO.setIdPersona(rs.getLong(1));

            }

        } catch (SQLException e) {
            System.out.println("Error: " + e.getMessage());
        } finally {
            desconectar();
        }
        return personaVO.getIdPersona();
    }

    public int recogeIdRol(String user) {
        this.personaVO = new PersonaVO();
        try {
            conectar();
            String consulta = "SELECT ROL_idRol FROM persona WHERE usuario = '" + user + "';";

            PreparedStatement pst = this.con.prepareStatement(consulta);

            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                this.personaVO.setRol(rs.getInt(1));
            }

        } catch (SQLException e) {
            System.out.println("Error: " + e.getMessage());
        } catch (Exception e) {
            System.out.println("Error: " + e.getMessage());
        } finally {
            desconectar();
        }
        return personaVO.getRol();
    }

    
    
    public PersonaVO sesiones(long id) {
        try {
            conectar();

            String consulta = "CALL sesiones("+id+");";

            PreparedStatement pstm = this.con.prepareStatement(consulta);

            ResultSet rs = pstm.executeQuery();

            while (rs.next()) {

                this.personaVO = new PersonaVO();

                this.personaVO.setIdPersona(rs.getLong(1));

                this.personaVO.setIdAgencia(rs.getInt(2));
                this.personaVO.setIdDocumento(rs.getInt(3));
                this.personaVO.setBarrio(rs.getInt(4));
                this.personaVO.setRol(rs.getInt(5));
                this.personaVO.setDocumento(rs.getString(6));
                this.personaVO.setNombres(rs.getString(7));
                this.personaVO.setApellidos(rs.getString(8));
                this.personaVO.setGenero(rs.getString(9));
                this.personaVO.setNumCelular(rs.getString(10));
                this.personaVO.setNumFijo(rs.getString(11));
                this.personaVO.setDireccion(rs.getString(12));
                this.personaVO.setCorreo(rs.getString(13));
                this.personaVO.setUsuario(rs.getString(14));
                this.personaVO.setPassword(rs.getString(15));
                this.personaVO.setEstado(rs.getInt(16));
                this.personaVO.setNombreRol(rs.getString(17));
            }

        } catch (SQLException e) {
            System.out.println("Error: " + e.getMessage());
        } finally {
            desconectar();
        }
        return personaVO;
    }

    public Boolean ActualizarCliente() {
        try {
            conectar();

            String actualiza = "CALL ActualizarCliente(?,?,?,?,?,?);";

            PreparedStatement pstm = this.con.prepareStatement(actualiza);

            pstm.setInt(1, this.personaVO.getIdAgencia());

            pstm.setString(2, this.personaVO.getNumCelular());

            pstm.setString(3, this.personaVO.getNumFijo());
            pstm.setString(4, this.personaVO.getDireccion());
            pstm.setString(5, this.personaVO.getCorreo());
            pstm.setLong(6, this.personaVO.getIdPersona());

            pstm.executeUpdate();

            listo = true;

        } catch (SQLException e) {
            System.out.println("Error: " + e);
        } finally {
            desconectar();
        }
        return listo;
    }

    public Boolean ActualizaEmpl(int id, String cel, String tel, String dicc, String correo) {
        try {
            conectar();

            PreparedStatement pstm = this.con.prepareStatement("CALL actEmpleado(?,?,?,?,?);");

            pstm.setInt(1, id);
            pstm.setString(2, cel);
            pstm.setString(3, tel);
            pstm.setString(4, dicc);
            pstm.setString(5, correo);

            pstm.executeUpdate();

            listo = true;

        } catch (SQLException e) {
            System.out.println("Error: " + e.getMessage());
        }
        return listo;
    }

    public boolean CambiarContra(int id, String nueva) {
        try {
            conectar();

            String actualiza = "CALL cambiarContra(?,?);";

            PreparedStatement pstm = this.con.prepareStatement(actualiza);

            pstm.setLong(2, id);
            pstm.setString(1, nueva);

            pstm.executeUpdate();
            listo = true;

        } catch (SQLException e) {
            System.out.println("Error: " + e);
        } finally {
            desconectar();
        }
        return listo;
    }

    public Boolean confirmContra(String actual) {

        try {
            conectar();

            ResultSet rs = this.con.prepareStatement("SELECT * FROM persona WHERE passwo = '" + actual + "';").executeQuery();

            while (rs.next()) {
                if (rs.absolute(1)) {
                    listo = true;
                }
            }

        } catch (Exception e) {
        }

        return listo;
    }

    public int cantidadsoli(int id) {
        int cantidad = 0;
        try {
            PreparedStatement pstm = con.prepareStatement("CALL cantidadSoli(" + id + ");");

            ResultSet rs = pstm.executeQuery();

            while (rs.next()) {
                pstm.setInt(1, cantidad);
            }

        } catch (SQLException e) {
            System.out.println("Error: " + e.getMessage());
        }

        return cantidad;
    }

    public void eliminar() {
        try {
            conectar();

            String eliminar = "CALL eliminarPersona;";

            PreparedStatement pstm = this.con.prepareStatement(eliminar);

            pstm.setLong(1, this.idPersona);

            pstm.executeUpdate();

        } catch (Exception e) {
            System.out.println("Error. " + e.getMessage());
        } finally {
            desconectar();
        }
    }
    public void eliminarCuenta(int id) {
        try {
            conectar();

            String eliminar = "";

            PreparedStatement pstm = this.con.prepareStatement(eliminar);

            pstm.setLong(1, this.idPersona);

            pstm.executeUpdate();

        } catch (Exception e) {
            System.out.println("Error. " + e.getMessage());
        } finally {
            desconectar();
        }
    }
    
    public String consultarPassword(String correo, String documento) {
        String result = null;
        try {
            conectar();

            String consulta = "CALL consultarPassword(?,?)";

            PreparedStatement pstm = this.con.prepareStatement(consulta);
            pstm.setString(1, correo);
            pstm.setString(2, documento);
            
            ResultSet rs = pstm.executeQuery();

            while (rs.next()) {
                result = rs.getString(1);
            }

        } catch (SQLException e) {
            System.out.println("Error: " + e.getMessage());
        } finally {
            desconectar();
        }
        return result;
    }
    
    public boolean consultaUser(String user) {
        try {
       

            conectar();
            String consulta = "SELECT * FROM persona WHERE usuario = '" + user + "';";

            PreparedStatement pst = this.con.prepareStatement(consulta);

            ResultSet rs = pst.executeQuery();

            if (rs.absolute(1)) {
                listo = true;
            }

        } catch (SQLException e) {
            System.out.println("Error: " + e.getMessage());
        } finally {
            desconectar();
        }
        return listo;
    }
    public boolean consultaCorreo(String correo) {
        try {
       

            conectar();
            String consulta = "SELECT * FROM persona WHERE correo = '" + correo + "';";

            PreparedStatement pst = this.con.prepareStatement(consulta);

            ResultSet rs = pst.executeQuery();

            if (rs.absolute(1)) {
                listo = true;
            }

        } catch (SQLException e) {
            System.out.println("Error: " + e.getMessage());
        } finally {
            desconectar();
        }
        return listo;
    }

} // Fin clase personaDAPO
