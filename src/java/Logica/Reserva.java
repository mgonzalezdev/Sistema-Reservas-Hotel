package Logica;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Basic;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
public class Reserva implements Serializable{
    
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE)
    int id;
    @Basic
    int total;  
    @Temporal(TemporalType.DATE)
    Date fecha_checkin;
    @Temporal(TemporalType.DATE)
    Date fecha_checkout;
    @OneToOne
    Usuario usuario;
    @OneToOne
    Huesped huesped;
    @OneToOne
    Habitacion habitacion;

    public Reserva() {
    }

    public Reserva(int id, Date fecha_checkin, Date fecha_checkout, int total, Usuario usuario, Huesped huesped, Habitacion habitacion) {
        this.id = id;
        this.fecha_checkin = fecha_checkin;
        this.fecha_checkout = fecha_checkout;
        this.total = total;
        this.usuario = usuario;
        this.huesped = huesped;
        this.habitacion = habitacion;
    }

    public int getId() {
        return id;
    }

    public Date getFecha_checkin() {
        return fecha_checkin;
    }

    public Date getFecha_checkout() {
        return fecha_checkout;
    }

    public int getTotal() {
        return total;
    }

    public Usuario getUsuario() {
        return usuario;
    }

    public Huesped getHuesped() {
        return huesped;
    }

    public Habitacion getHabitacion() {
        return habitacion;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setFecha_checkin(Date fecha_checkin) {
        this.fecha_checkin = fecha_checkin;
    }

    public void setFecha_checkout(Date fecha_checkout) {
        this.fecha_checkout = fecha_checkout;
    }

    public void setTotal(int total) {
        this.total = total;
    }

    public void setUsuario(Usuario usuario) {
        this.usuario = usuario;
    }

    public void setHuesped(Huesped huesped) {
        this.huesped = huesped;
    }

    public void setHabitacion(Habitacion habitacion) {
        this.habitacion = habitacion;
    }
    
    
}
