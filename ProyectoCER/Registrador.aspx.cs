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
    public partial class Registrador : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ControladorRegitrador control_R = new ControladorRegitrador();
            ControladorCliente control_C = new ControladorCliente();


            if (!IsPostBack)
            {
                cargarCBOX();
                MultiView1_Contenido.ActiveViewIndex = 0;
                GridView_AsigarTec.DataSource = control_R.ListadoOrdenTrabajo();
                GridView_AsigarTec.DataBind();

                GridView_recepcion.DataSource = control_R.ListadoRecepcion();
                GridView_recepcion.DataBind();

                GridView_Clientes.DataSource = control_C.ListadoClientes();
                GridView_Clientes.DataBind();
            }
        }

        protected void btn_Crear_Recepcion_Click(object sender, EventArgs e)
        {
            MultiView1_Contenido.ActiveViewIndex = 1;
        } 

        protected void btn_RegistrarCliente_Click(object sender, EventArgs e)
        {
            MultiView1_Contenido.ActiveViewIndex = 2;
        }

        protected void btn_AsignarTecnico_Click(object sender, EventArgs e)
        {
            MultiView1_Contenido.ActiveViewIndex = 3;
        }

        protected void LbtnAgregar_Cliente_Click(object sender, EventArgs e)
        {
            ControladorCliente control = new ControladorCliente();

           cliente nueva = new cliente

            {
                Rut= txtRut.Text,
               Nombre= txtNombre.Text,
               Apellido = txtApellido.Text,
               Direccion = txtDireccion.Text,
                Correo = txtCorreo.Text,
               Telefono = Convert.ToInt32(txtTelefono.Text),
               Contraseña = txtContraseña.Text
            };

            if (control.agregarCliente(nueva))
            {
                GridView_Clientes.DataSource = control.ListadoClientes();
                GridView_Clientes.DataBind();
            }
            

         
        }

        protected void lbtnAgregarRecepcion_Click(object sender, EventArgs e)
        {
            ControladorRegitrador control = new ControladorRegitrador();
           
            Recepcion nueva = new Recepcion

            {
                RUT_Cliente = cbClientes.SelectedValue,
                IDEquipo = 2,
                Accesorios = txtAccesorios.Text,
                Problema = txtProblema.Text,
                Fecha = DateTime.Now

            };

            if (control.agregarRecepcion(nueva))
            {
                GridView_recepcion.DataSource = control.ListadoRecepcion();
                GridView_recepcion.DataBind();
            }
        }

        public void cargarCBOX()
        {
            ControladorCliente carga = new ControladorCliente();
            cbClientes.DataSource = carga.ListadoClientes();

            cbClientes.DataTextField = "Nombre";
            cbClientes.DataValueField = "Rut";
            cbClientes.DataBind();

        }
    }
}