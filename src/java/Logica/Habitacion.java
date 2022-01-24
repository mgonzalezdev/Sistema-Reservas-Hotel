package Logica;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Habitacion implements Serializable {
        
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE)        
    int id;
    @Basic
    int num_habitacion;
    int piso;
    String nombre;
    int tipo;  // 1:single 2:doble 3:triple 4: multiple
    float precio;

    public Habitacion() {
    }

    public Habitacion(int id, int num_habitacion, int piso, String nombre, int tipo, float precio) {
        this.id = id;
        this.num_habitacion = num_habitacion;
        this.piso = piso;
        this.nombre = nombre;
        this.tipo = tipo;
        this.precio = precio;
    }

    public int getId() {
        return id;
    }

    public int getNum_habitacion() {
        return num_habitacion;
    }

    public int getPiso() {
        return piso;
    }

    public String getNombre() {
        return nombre;
    }

    public int getTipo() {
        return tipo;
    }

    public float getPrecio() {
        return precio;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setNum_habitacion(int num_habitacion) {
        this.num_habitacion = num_habitacion;
    }

    public void setPiso(int piso) {
        this.piso = piso;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public void setTipo(int tipo) {
        this.tipo = tipo;
    }

    public void setPrecio(float precio) {
        this.precio = precio;
    }

    
    
}
