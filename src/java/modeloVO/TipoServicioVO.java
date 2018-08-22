/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modeloVO;

import java.io.InputStream;

/**
 *
 * @author Kevin
 */
public class TipoServicioVO {
    
    long idTipoServicio;
  String nombre,descripcion,tiempo,imagen;
  InputStream inputImagen;
 
  float precio;

    public InputStream getInputImagen(){
    return inputImagen;
    }
    
    public void setInputImagen(InputStream inputImagen){
        this.inputImagen = inputImagen;
    }
            
    public long getIdTipoServicio() {
        return idTipoServicio;
    }

    public void setIdTipoServicio(long idTipoServicio) {
        this.idTipoServicio = idTipoServicio;
    }

    
    public String getNombre() {
        return nombre;
    }

    public String getImagen() {
        return imagen;
    }

    public void setImagen(String imagen) {
        this.imagen = imagen;
    }

    
    
    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public String getTiempo() {
        return tiempo;
    }

    public void setTiempo(String tiempo) {
        this.tiempo = tiempo;
    }

   

    public float getPrecio() {
        return precio;
    }

    public void setPrecio(float precio) {
        this.precio = precio;
    }
}
