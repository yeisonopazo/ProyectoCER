using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using ProyectoCER.Modelo;

namespace ProyectoCER.Controlador
{
    public class ControladorTecnico
    {
        BDControl control = new BDControl();

        public List<Usuario> ListadoTecnicos()
        {
            
            try
            {

                return control.Usuario.ToList();

            }
            catch (Exception) { return null; }
        }

        public List<object> TecnicoPortipo(string tipo)
        {

            try
            {
                var consulta = from user in control.Usuario
                                
                               where user.Tipo.Equals(tipo) select user;
                               
                return consulta.ToList<object>();
            }
            catch (Exception)
            {

                return null;
            }
        }

        public bool EditarOrden(Orden_Trabajo nueva)
        {
            try
            {
                Orden_Trabajo anterior = new Orden_Trabajo();
                anterior = control.Orden_Trabajo.Find(nueva.ID_Orden);
                anterior.RUT_Usuario = nueva.RUT_Usuario;
                anterior.ID_Recepcion = nueva.ID_Recepcion;
                anterior.Estado = nueva.Estado;
                anterior.Observacion = nueva.Observacion;
                anterior.Precio = nueva.Precio;
                anterior.TipoPago = nueva.TipoPago;
                return control.SaveChanges() > 0;
            }
            catch (Exception)
            {

                return false;
            }


        }

    }
}