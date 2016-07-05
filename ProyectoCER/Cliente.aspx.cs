using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ProyectoCER.Controlador;

namespace ProyectoCER
{
    public partial class Cliente : System.Web.UI.Page
    {
         protected void Page_Load(object sender, EventArgs e)
        {

             if(!IsPostBack){
              ControladorRegitrador control = new ControladorRegitrador();
              ControladorCliente controlClt = new ControladorCliente();
              MultiView1_Contenido.ActiveViewIndex = 0;
             GridView1_EquiposEnRepa.DataSource = control.ListadoOrdenTrabajo();
             GridView1_EquiposEnRepa.DataBind();

             GridView2_UpdateInf.DataSource = controlClt.ListadoClientes();
             GridView2_UpdateInf.DataBind();
             }
        }

         protected void btn_VerER_Click(object sender, EventArgs e)
         {
             MultiView1_Contenido.ActiveViewIndex = 1;
         }

         protected void btn_ActualizarInfo_Click(object sender, EventArgs e)
         {
             MultiView1_Contenido.ActiveViewIndex = 2;
         }

        
         protected void btn_cerrar_Click(object sender, EventArgs e)
         {
             Response.Redirect("index.aspx");
         }

         protected void btn_Cominicartecnico_Click(object sender, EventArgs e)
         {
             MultiView1_Contenido.ActiveViewIndex = 3;
         }

         protected void btn_pagar_Click(object sender, EventArgs e)
         {
             Label4.Visible = true;
             Label5.Visible = true;
             Label6.Visible = true;
             Label7.Visible = true;
             Label8.Visible = true;
             Label9.Visible = true;

         }

        
        
      
        }
    }
