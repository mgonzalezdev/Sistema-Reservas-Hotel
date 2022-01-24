 
package Logica;

import Persistencia.ControladoraPersistencia;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class Controladora {
    
    ControladoraPersistencia controlPersis = new ControladoraPersistencia();
        
    public void crearPersona(String nombre, int edad) {
        
        Persona pers = new Persona();
        pers.setNombre(nombre);
        pers.setEdad(edad);
        
        controlPersis.crearPersona(pers);
    }

    public void crearUsuario(String email, String clave, String nombre, String apellido, String dni, String direccion, String cargo) {
        
        Usuario user = new Usuario();
        user.setEmail(email);
        user.setClave(clave);
        user.setNombre(nombre);
        user.setApellido(apellido);
        user.setDni(dni);
        user.setDireccion(direccion);
        user.setCargo(cargo);
        
        controlPersis.crearUsuario(user);
    }
    
    public void crearHuesped(String dni, String nombre, String apellido, String direccion, String profesion, String telefono, String email, String fecha_nac) {
        
        Huesped hues = new Huesped();
        hues.setDni(dni);
        hues.setNombre(nombre);
        hues.setApellido(apellido);
        hues.setDireccion(direccion);
        hues.setProfesion(profesion);
        hues.setTelefono(telefono);
        hues.setEmail(email);
        
        // Tratamiento de fecha
        SimpleDateFormat formato = new SimpleDateFormat("yyyy-mm-dd");
        Date fecha = new Date();
        try {
            fecha = formato.parse(fecha_nac);
        } catch (ParseException ex) {
            Logger.getLogger(Controladora.class.getName()).log(Level.SEVERE, null, ex);
        }
        hues.setFecha_nac(fecha);
        
        controlPersis.crearHuesped(hues);
    }    
    
    public void crearHabitacion(int num_habitacion, int piso, String nombre, int tipo, float precio) {
        
        Habitacion habit = new Habitacion();
        habit.setNum_habitacion(num_habitacion);
        habit.setPiso(piso);
        habit.setNombre(nombre);
        habit.setTipo(tipo);
        habit.setPrecio(precio);
        
        controlPersis.crearHabitacion(habit);
    }

    public void eliminarHuesped(int id) {
        
        controlPersis.eliminarHuesped(id);
        
    }

    public void eliminarHabitacion(int id) {
        
        controlPersis.eliminarHabitacion(id);
        
    }
    
    public boolean comprobarIngreso(String email, String clave) {
        
        boolean siONo = false;
        List <Usuario> listaUsuarios = new ArrayList <Usuario> ();
        
        listaUsuarios = controlPersis.getUsuarios();
        
        for (Usuario usu:listaUsuarios) 
        {
            
            if (usu.getEmail().equals(email) && usu.getClave().equals(clave)) {
                
                siONo = true;
                return siONo;
                
            }
          
        }
        return siONo;
    }
    
   public List<Huesped> traerHuesped() {
       
       return controlPersis.traerHuesped();
       
   } 
   
   public List<Habitacion> traerHabitacion() {
       
       return controlPersis.traerHabitacion();
       
   }    

   public Huesped buscarHuesped(int id) {
       
       return controlPersis.buscarHuesped(id);
       
   }
   

   public Habitacion buscarHabitacion(int id) {
       
       return controlPersis.buscarHabitacion(id);
       
   }

   
   public void modificarHuesped(Huesped hues) {
       
       controlPersis.modificarHuesped(hues);
       
   }

   
   public void modificarHabitacion(Habitacion habit) {
       
       controlPersis.modificarHabitacion(habit);
       
   }
   
   
   
}
    

