//------------------------------------------------------------------------------
// <auto-generated>
//    Este código se generó a partir de una plantilla.
//
//    Los cambios manuales en este archivo pueden causar un comportamiento inesperado de la aplicación.
//    Los cambios manuales en este archivo se sobrescribirán si se regenera el código.
// </auto-generated>
//------------------------------------------------------------------------------

namespace ProyectoCER.Modelo
{
    using System;
    using System.Collections.Generic;
    
    public partial class Recepcion
    {
        public Recepcion()
        {
            this.Orden_Trabajo = new HashSet<Orden_Trabajo>();
        }
    
        public int IDRecepcion { get; set; }
        public string RUT_Cliente { get; set; }
        public int IDEquipo { get; set; }
        public string Accesorios { get; set; }
        public string Problema { get; set; }
        public System.DateTime Fecha { get; set; }
    
        public virtual cliente cliente { get; set; }
        public virtual Equipo Equipo { get; set; }
        public virtual ICollection<Orden_Trabajo> Orden_Trabajo { get; set; }
    }
}