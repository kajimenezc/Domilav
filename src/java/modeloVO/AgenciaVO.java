/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modeloVO;

/**
 *
 * @author Sena
 */
public class AgenciaVO {
    
  private String nombreAgen, direccionAgen,correoAgen,  telUno, telDos,nombreEstado;
  private int estado;
 
  private long idAgencia;

    public String getNombreAgen() {
        return nombreAgen;
    }

    public void setNombreAgen(String nombreAgen) {
        this.nombreAgen = nombreAgen;
    }

    public String getDireccionAgen() {
        return direccionAgen;
    }

    public void setDireccionAgen(String direccionAgen) {
        this.direccionAgen = direccionAgen;
    }

    public String getCorreoAgen() {
        return correoAgen;
    }

    public void setCorreoAgen(String correoAgen) {
        this.correoAgen = correoAgen;
    }

    public String getTelUno() {
        return telUno;
    }

    public void setTelUno(String telUno) {
        this.telUno = telUno;
    }

    public String getTelDos() {
        return telDos;
    }

    public void setTelDos(String telDos) {
        this.telDos = telDos;
    }
 

    public long getIdAgencia() {
        return idAgencia;
    }

    public void setIdAgencia(long idAgencia) {
        this.idAgencia = idAgencia;
    }

    public String getNombreEstado() {
        return nombreEstado;
    }

    public void setNombreEstado(String nombreEstado) {
        this.nombreEstado = nombreEstado;
    }

    public int getEstado() {
        return estado;
    }

    public void setEstado(int estado) {
        this.estado = estado;
    }
  
    
  
  
  
}
