/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modeloVO;

/**
 *
 * @author Kevin
 */
public class SolicitudVO {
    
    // variables de la tabla
    private long idSolicitud;
    private long idPersona,idServicio,estadoSolicitud;
    private String fechaCreacion,fechaEntrega,fechaRecoleccion,descripcion;
    private int horaRecoge,horaEntrega;
    
    // otras
    private String nombre,apellido,nombreEstado,nombreServicio,numDoc,direccion,numCel,correo,hEntregaIni,hEntregaFin,hInicioIni,hInicioFin;
    private double precio;
    
    
    public long getIdSolicitud() {
        return idSolicitud;
    }

    public void setIdSolicitud(long idSolicitud) {
        this.idSolicitud = idSolicitud;
    }

    public long getIdPersona() {
        return idPersona;
    }

    public String getApellido() {
        return apellido;
    }

    public void setApellido(String apellido) {
        this.apellido = apellido;
    }

    
    public void setIdPersona(long idPersona) {
        this.idPersona = idPersona;
    }

    public long getIdServicio() {
        return idServicio;
    }

    public String gethInicioIni() {
        return hInicioIni;
    }

    public void sethInicioIni(String hInicioIni) {
        this.hInicioIni = hInicioIni;
    }

    public String gethInicioFin() {
        return hInicioFin;
    }

    public void sethInicioFin(String hInicioFin) {
        this.hInicioFin = hInicioFin;
    }
    

    public void setIdServicio(long idServicio) {
        this.idServicio = idServicio;
    }

    public long getEstadoSolicitud() {
        return estadoSolicitud;
    }

    public void setEstadoSolicitud(long estadoSolicitud) {
        this.estadoSolicitud = estadoSolicitud;
    }

    public String gethEntregaIni() {
        return hEntregaIni;
    }

    public void sethEntregaIni(String hEntregaIni) {
        this.hEntregaIni = hEntregaIni;
    }

    public String gethEntregaFin() {
        return hEntregaFin;
    }

    public void sethEntregaFin(String hEntregaFin) {
        this.hEntregaFin = hEntregaFin;
    }

    
    
    public String getFechaCreacion() {
        return fechaCreacion;
    }

    public void setFechaCreacion(String fechaCreacion) {
        this.fechaCreacion = fechaCreacion;
    }

    public String getFechaEntrega() {
        return fechaEntrega;
    }

    public void setFechaEntrega(String fechaEntrega) {
        this.fechaEntrega = fechaEntrega;
    }

    public String getFechaRecoleccion() {
        return fechaRecoleccion;
    }

    public void setFechaRecoleccion(String fechaRecoleccion) {
        this.fechaRecoleccion = fechaRecoleccion;
    }

    public int getHoraRecoge() {
        return horaRecoge;
    }

    public void setHoraRecoge(int horaRecoge) {
        this.horaRecoge = horaRecoge;
    }

    public int getHoraEntrega() {
        return horaEntrega;
    }

    public void setHoraEntrega(int horaEntrega) {
        this.horaEntrega = horaEntrega;
    }

   

    

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getNombreEstado() {
        return nombreEstado;
    }

    public void setNombreEstado(String nombreEstado) {
        this.nombreEstado = nombreEstado;
    }

    public String getNombreServicio() {
        return nombreServicio;
    }

    public void setNombreServicio(String nombreServicio) {
        this.nombreServicio = nombreServicio;
    }
    
   // REcibo

    public String getNumDoc() {
        return numDoc;
    }

    public void setNumDoc(String numDoc) {
        this.numDoc = numDoc;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public String getNumCel() {
        return numCel;
    }

    public void setNumCel(String numCel) {
        this.numCel = numCel;
    }

   

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public double getPrecio() {
        return precio;
    }

    public void setPrecio(double precio) {
        this.precio = precio;
    }

   


} // fin solicitudVO
