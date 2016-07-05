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
    }
}