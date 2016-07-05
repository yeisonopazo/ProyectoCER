using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls; 


namespace ProyectoCER
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnIngresar_Click(object sender, EventArgs e)
        {

            if (txtUser.Text.Equals("registrador"))
            {
                Response.Redirect("Registrador.aspx");                

            }
            else if (txtUser.Text.Equals("tecnico"))
            {

                Response.Redirect("Tecnico.aspx");
            }
            else if (txtUser.Text.Equals("cliente"))
            {

                Response.Redirect("Cliente.aspx");
            }
        }

    }
}