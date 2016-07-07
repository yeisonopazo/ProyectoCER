using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using ProyectoCER.Modelo;

namespace ProyectoCER.Controlador
{
    public class ControladorCliente
    {
        private BDControl contexto = new BDControl();

        public bool agregarCliente(cliente nueva)
        {
            try
            {
                contexto.cliente.Add(nueva);

                return contexto.SaveChanges() > 0;
            }
            catch (Exception)
            {

                return false;
            }
        }

        public bool EditarCliente(cliente nueva)
        {
            try
            {
                cliente anterior = new cliente();
                anterior = contexto.cliente.Find(nueva.Rut);
                anterior.Nombre = nueva.Nombre;
                anterior.Direccion = nueva.Direccion;
                anterior.Correo = nueva.Correo;
                anterior.Telefono = nueva.Telefono;
                anterior.Contraseña = nueva.Contraseña;

                return contexto.SaveChanges() > 0;
            }
            catch (Exception)
            {

                return false;
            }
        }

        public bool BloquearCliente(string rut)
        {
            try
            {
                contexto.cliente.Remove(contexto.cliente.Find(rut));
                return contexto.SaveChanges() > 0;
            }
            catch (Exception) { return false; }

        }

        public List<cliente> ListadoClientes()
        {
            try
            {

                return contexto.cliente.ToList();

            }
            catch (Exception) { return null; }
        }

        public bool validarRUT(string rut)
        {

            try
            {
                var consulta = from ui in contexto.cliente
                               where ui.Rut.Equals(rut) select ui;
                bool valido = consulta.Count() == 1;               
                return valido;
            }
            catch (Exception)
            {

                return false;
            }

        }

    }
}