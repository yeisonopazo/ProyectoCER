using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using ProyectoCER.Modelo;

namespace ProyectoCER.Controlador
{
   
    public class ControladorRegitrador
    {
     
      private BDControl contexto = new BDControl();

      public bool agregarEquipo(Equipo nuevo)
      {
          try
          {
              contexto.Equipo.Add(nuevo);
              return contexto.SaveChanges() > 0;
          }
          catch (Exception)
          {

              return false;
          }
      }

      public bool agregarRecepcion(Recepcion nueva)
      {
          try
          {
              contexto.Recepcion.Add(nueva);
              return contexto.SaveChanges() > 0;
          }
          catch (Exception)
          {

              return false;
          }
      }

      public bool agregarOrdenTrabajo(Orden_Trabajo nuevo)
      {
          try
          {
              contexto.Orden_Trabajo.Add(nuevo);
              return contexto.SaveChanges() > 0;
          }
          catch (Exception)
          {

              return false;
          }
      }

      public List<Recepcion> ListadoRecepcion()
      {
          try
          {

              return contexto.Recepcion.ToList();
          }
          catch (Exception) { return null; }
      }

      public List<Orden_Trabajo> ListadoOrdenTrabajo()
      {
          try
          {

              return contexto.Orden_Trabajo.ToList();

          }
          catch (Exception) { return null; }
      }

   

    }
}