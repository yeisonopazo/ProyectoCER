using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using ProyectoCER.Modelo;

namespace ProyectoCER.Controlador
{
    public class ControladorAdmin
    {
    
          BDControl contexto = new BDControl();

          public bool agregarUsuario(Usuario nuevo)
        {
            try
            {
                contexto.Usuario.Add(nuevo);
                return contexto.SaveChanges() > 0;
            }
            catch (Exception)
            {

                return false;
            }
        }

          public bool EliminarUsuario(string rut)
          {
              try
              {
                  contexto.Usuario.Remove(contexto.Usuario.Find(rut));
                  return contexto.SaveChanges() > 0;
              }
              catch (Exception) { return false; }

          }
          public bool EditarUsuario(Usuario nueva)
          {
              try
              {
                  Usuario anterior = new Usuario();
                  anterior = contexto.Usuario.Find(nueva.RUT);
                  anterior.Nombre = nueva.Nombre;
                  anterior.Direccion = nueva.Direccion;
                  anterior.Correo = nueva.Correo;
                  anterior.Telefono = nueva.Telefono;
                  anterior.Contraseña = nueva.Contraseña;
                  anterior.Tipo = nueva.Tipo;
                  return contexto.SaveChanges() > 0;
              }
              catch (Exception)
              {

                  return false;
              }


          }
          public List<Usuario> ListadoUsuarios(){
                  
                    try
                    {

                        return contexto.Usuario.ToList();

                   }
                   catch (Exception) {
                   return null; 
                   }   
                }
    }
}