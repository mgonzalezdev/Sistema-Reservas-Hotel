
package Persistencia;

import Logica.Habitacion;
import Logica.Huesped;
import Logica.Persona;
import Logica.Usuario;
import Persistencia.exceptions.NonexistentEntityException;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class ControladoraPersistencia {
    
    PersonaJpaController jpaPersona = new PersonaJpaController();
    UsuarioJpaController jpaUsuario = new UsuarioJpaController();
    HuespedJpaController jpaHuesped = new HuespedJpaController();
    ReservaJpaController jpaReserva = new ReservaJpaController();
    HabitacionJpaController jpaHabitacion = new HabitacionJpaController();
    
    
    public void crearPersona(Persona pers) {
        
        jpaPersona.create(pers);
        
    }
    
    public void crearUsuario(Usuario pers) {
        
        jpaUsuario.create(pers);
        
    }

    public void crearHuesped(Huesped hues) {
        
        jpaHuesped.create(hues);
        
    }

    public void crearHabitacion(Habitacion habit) {
        
        jpaHabitacion.create(habit);
        
    }
    
    public List<Usuario> getUsuarios() {
        
        return jpaUsuario.findUsuarioEntities();
        
    }
    
    public List<Huesped> traerHuesped() {
        
        return jpaHuesped.findHuespedEntities();
        
    }
    
    public List<Habitacion> traerHabitacion() {
        
        return jpaHabitacion.findHabitacionEntities();
        
    }

    public void eliminarHuesped(int id) {
        
        try {
            jpaHuesped.destroy(id);
        } catch (NonexistentEntityException ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    public void eliminarHabitacion(int id) {
       
        try {
            jpaHabitacion.destroy(id);
        } catch (NonexistentEntityException ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    
    public Huesped buscarHuesped(int id) {
        
        return jpaHuesped.findHuesped(id);
        
    }
    
    public Habitacion buscarHabitacion(int id) {
       
        return jpaHabitacion.findHabitacion(id);
        
    }


    public void modificarHuesped(Huesped hues) {
        
        try {
            jpaHuesped.edit(hues);
        } catch (Exception ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public void modificarHabitacion(Habitacion habit) {
        
        try {
            jpaHabitacion.edit(habit);
        } catch (Exception ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
        
    }
    
    public List<Habitacion> disponibilidadHabitacion(Date fechaCheckin, Date fechaCheckout) {
        
        
        
        return jpaHabitacion.findHabitacionEntities();
        
    }
    
    
}
