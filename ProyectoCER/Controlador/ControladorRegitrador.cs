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



        public List<Equipo> ListadoEquipos()
        {
            try
            {

                return contexto.Equipo.ToList();

            }
            catch (Exception) { return null; }
        }

        public List<object> BusquedaRecepcion()
        {

            try
            {
                var consulta = from recep in contexto.Recepcion where recep.Estado == "Sin Asignar" select recep;




                return consulta.ToList<object>();
            }
            catch (Exception)
            {

                return null;
            }
        }


        public bool EditarRecepcion(Recepcion nueva)
        {
            try
            {
                Recepcion anterior = new Recepcion();
                anterior = contexto.Recepcion.Find(nueva.IDRecepcion);
                anterior.Estado = nueva.Estado;

                return contexto.SaveChanges() > 0;
            }
            catch (Exception)
            {

                return false;
            }






        }


    }
}