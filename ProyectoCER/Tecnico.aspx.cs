using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ProyectoCER.Controlador;

namespace ProyectoCER
{
    public partial class Tecnico : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ControladorRegitrador control = new ControladorRegitrador();

            GridView1.DataSource = control.ListadoOrdenTrabajo();
            GridView1.DataBind();
        }
    }
}