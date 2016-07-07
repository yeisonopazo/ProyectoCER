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
    public partial class Administrador : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
             
                MultiView1_Contenido.ActiveViewIndex = 0;
                cargarBOX();
              
            }

        }

        protected void btn_cerrar_Click(object sender, EventArgs e)
        {
            Response.Redirect("index.aspx");
        }

        protected void btn_CrearUsuario_Click(object sender, EventArgs e)
        {
            MultiView1_Contenido.ActiveViewIndex = 1;
        }

        protected void lbtnAgregarUser_Click(object sender, EventArgs e)
        {
            if (txtRut.Text == "" || txtNombre.Text == "" || txtDireccion.Text == "" || txtDireccion.Text == ""
               || txtCorreo.Text == "" || txtTelefono.Text == "" || txtContraseña.Text == "" || dbTipoUser.SelectedIndex==0 )
            {
                lbtnAgregarUser.CssClass = "btn btn-danger form-control";
                lbtnAgregarUser.Text = "Faltan datos";

            }
            else
            {
                ControladorAdmin control = new ControladorAdmin();
                Usuario nuevo = new Usuario

                {
                    RUT = txtRut.Text,
                    Nombre = txtNombre.Text,                
                    Direccion = txtDireccion.Text,
                    Correo = txtCorreo.Text,
                    Telefono = Convert.ToInt32(txtTelefono.Text),
                    Contraseña = txtContraseña.Text,
                    Tipo= dbTipoUser.SelectedValue
                };

                if (control.agregarUsuario(nuevo))
                {
                    cargarBOX();
                    lbtnAgregarUser.CssClass = "btn btn-primary form-control";
                    lbtnAgregarUser.Text = "Registrar Cliente";
                    txtRut.Text = "";
                    txtNombre.Text = "";
                    txtDireccion.Text = "";
                    txtDireccion.Text = "";
                    txtCorreo.Text = "";
                    txtTelefono.Text = "";
                    txtContraseña.Text = "";
                    dbTipoUser.SelectedIndex = 0; 

                }
            }

        }

        public void cargarBOX() {

            ControladorAdmin control = new ControladorAdmin();

            dbTipoUser.Items.Insert(0, "Seleccione Tipo Usuario");
            dbTipoUser.Items.Insert(1,"Administrador");
            dbTipoUser.Items.Insert(2, "Registrador");
            dbTipoUser.Items.Insert(3, "Tecnico");

            GridView_Usuarios.DataSource = control.ListadoUsuarios();
            GridView_Usuarios.DataBind();
        
        }

        protected void btn_GestionUser_Click(object sender, EventArgs e)
        {
            MultiView1_Contenido.ActiveViewIndex = 2;
        }

        protected void GridView_Usuarios_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            ControladorAdmin control = new ControladorAdmin();
            string rut = GridView_Usuarios.DataKeys[e.RowIndex].Values[0].ToString();

            control.EliminarUsuario(rut);
            GridView_Usuarios.EditIndex = -1;
                
                cargarBOX();
            
        }

        protected void GridView_Usuarios_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView_Usuarios.EditIndex = e.NewEditIndex;

            cargarBOX();
        }

        protected void GridView_Usuarios_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            ControladorAdmin control = new ControladorAdmin();
            GridViewRow fila = GridView_Usuarios.Rows[e.RowIndex];
            string rut = GridView_Usuarios.DataKeys[e.RowIndex].Values[0].ToString();

            string nombre = (fila.FindControl("txtNombreG") as TextBox).Text;
            string direccion = (fila.FindControl("txtDireccionG") as TextBox).Text;
            string correo = (fila.FindControl("txtCorreoG") as TextBox).Text;
            int telefono = Convert.ToInt32((fila.FindControl("txtTelefonoG") as TextBox).Text);
            string contraseña = (fila.FindControl("txtContraseñaG") as TextBox).Text;
            string tipo = (fila.FindControl("txtTipoG") as TextBox).Text;

            Usuario user = new Usuario
            {
                RUT = rut,
                Nombre = nombre,
                Direccion = direccion,
                Correo = correo,
                Telefono = telefono,
                Contraseña = contraseña,
                Tipo = tipo

            };

            control.EditarUsuario(user);
            GridView_Usuarios.EditIndex = -1;
            cargarBOX();
            


        }

        protected void GridView_Usuarios_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView_Usuarios.EditIndex = -1;
            cargarBOX();
        }

     

  
        

       
       

    }
}