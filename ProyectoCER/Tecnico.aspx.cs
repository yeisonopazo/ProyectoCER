using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ProyectoCER.Controlador;
using ProyectoCER.Modelo;

namespace ProyectoCER
{
    public partial class Tecnico : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                cargarBOX();

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

       

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;

            cargarBOX();

        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {

        }

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {

            GridView1.EditIndex = -1;
            cargarBOX();
        }

        private void cargarBOX() {

            ControladorRegitrador control = new ControladorRegitrador();

            GridView1.DataSource = control.ListadoOrdenTrabajo();
            GridView1.DataBind();
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            ControladorTecnico control = new ControladorTecnico();
            GridViewRow fila = GridView1.Rows[e.RowIndex];
            int id_orden = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Values[0]);

            string RutTec = (fila.FindControl("Label2") as Label).Text;
            int ID_recep = Convert.ToInt32((fila.FindControl("Label3") as Label).Text);
            string estado = (fila.FindControl("txtEstado") as TextBox).Text;
           string observa = (fila.FindControl("txtObservacion") as TextBox).Text;
            int precio = Convert.ToInt32((fila.FindControl("txtPrecio") as TextBox).Text);
            string estadopago = (fila.FindControl("txtEstadoPago") as TextBox).Text;
            int tipo = Convert.ToInt32((fila.FindControl("Label4") as Label).Text);

            Orden_Trabajo orden = new Orden_Trabajo
            {
                ID_Orden = id_orden,
                RUT_Usuario = RutTec,
                ID_Recepcion = ID_recep,
                Estado= estado,
                Observacion=observa,
                Precio=precio,
                Estado_pago=estadopago,
                ID_TipoPago = tipo

            };

            control.EditarOrden(orden);
            GridView1.EditIndex = -1;
            cargarBOX();
        }

    }
}