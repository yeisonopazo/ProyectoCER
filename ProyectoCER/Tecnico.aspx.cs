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
            if (IsPostBack)
            {
                ControladorRegitrador control = new ControladorRegitrador();

                GridView1.DataSource = control.ListadoOrdenTrabajo();
                GridView1.DataBind();

                MultiView1_Contenido.ActiveViewIndex = 0;
            }
        }

        protected void btn_Actualizar_OT_Click(object sender, EventArgs e)
        {
            MultiView1_Contenido.ActiveViewIndex = 1;
        }

        protected void btn_Recepcion_Click(object sender, EventArgs e)
        {
            Response.Redirect("Registrador.aspx");
        }

        protected void btn_CominicarCLiente_Click(object sender, EventArgs e)
        {
            MultiView1_Contenido.ActiveViewIndex = 2;
        }

        protected void btn_cerrar_Click(object sender, EventArgs e)
        {
            Response.Redirect("index.aspx");
        }
    }
}