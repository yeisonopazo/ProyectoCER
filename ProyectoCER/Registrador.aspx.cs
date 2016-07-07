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


            if (!IsPostBack)
            {
               
                MultiView1_Contenido.ActiveViewIndex = 0;
                cargarGridview();

                mostrarTecnicosYrecepciones();
            }
        }

        protected void btn_Crear_Recepcion_Click(object sender, EventArgs e)
        {

            MultiView1_Contenido.ActiveViewIndex = 1;
            txtTipo.Enabled = false;
            txtModelo.Enabled = false;
            txtMarca.Enabled = false;
            txtAccesorios.Enabled = false;
            txtProblema.Enabled = false;
            lbtnAgregarRecepcion.Enabled = false;

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

            if (txtRut.Text == "" || txtNombre.Text == "" || txtApellido.Text == "" || txtDireccion.Text == "" || txtDireccion.Text == ""
                || txtCorreo.Text == "" || txtTelefono.Text == "" || txtContraseña.Text == "")
            {
                LbtnAgregar_Cliente.CssClass = "btn btn-danger form-control";
                LbtnAgregar_Cliente.Text = "Faltan datos";

            }
            else
            {
                ControladorCliente control = new ControladorCliente();
                cliente nueva = new cliente

                {
                    Rut = txtRut.Text,
                    Nombre = txtNombre.Text,
                    Apellido = txtApellido.Text,
                    Direccion = txtDireccion.Text,
                    Correo = txtCorreo.Text,
                    Telefono = Convert.ToInt32(txtTelefono.Text),
                    Contraseña = txtContraseña.Text
                };

                if (control.agregarCliente(nueva))
                {
                    cargarCBOX();
                    cargarGridview();
                    LbtnAgregar_Cliente.CssClass = "btn btn-primary form-control";
                    LbtnAgregar_Cliente.Text = "Registrar Cliente";
                }
            }




        }

        protected void lbtnAgregarRecepcion_Click(object sender, EventArgs e)
        {

            if (txtRut_cliente.Text == "" || txtTipo.Text == "" || txtMarca.Text == "" || txtModelo.Text == "" || txtAccesorios.Text == "" || txtProblema.Text == "")
            {
                lbtnAgregarRecepcion.CssClass = "btn btn-danger form-control";
                lbtnAgregarRecepcion.Text = "Faltan Datos";

            }
            else
            {

                ControladorRegitrador control = new ControladorRegitrador();
                Equipo EqNuevo = new Equipo { Tipo = txtTipo.Text, Marca = txtMarca.Text, Modelo = txtMarca.Text };
                lb_equipo_nuevo.Text = "Equipo creado";

                if (control.agregarEquipo(EqNuevo))
                {
                    cargarCBOX();
                    cargarGridview();
                }

                int idequipo = control.ListadoEquipos().Count() + 1;

                Recepcion nueva = new Recepcion
                {
                    RUT_Cliente = txtRut_cliente.Text,
                    IDEquipo = idequipo,
                    Accesorios = txtAccesorios.Text,
                    Problema = txtProblema.Text,
                    Fecha = DateTime.Now

                };

                if (control.agregarRecepcion(nueva))
                {
                    cargarCBOX();
                    cargarGridview();
                }

            }
        }

        public void cargarCBOX()
        {


        }

        public void cargarGridview()
        {
            ControladorRegitrador control_R = new ControladorRegitrador();
            ControladorCliente control_C = new ControladorCliente();

            GridView_AsigarTec.DataSource = control_R.ListadoOrdenTrabajo();
            GridView_AsigarTec.DataBind();

            GridView_recepcion.DataSource = control_R.ListadoRecepcion();
            GridView_recepcion.DataBind();

            GridView_Clientes.DataSource = control_C.ListadoClientes();
            GridView_Clientes.DataBind();

        }

        protected void btn_Tecnico_Click(object sender, EventArgs e)
        {
            Response.Redirect("Tecnico.aspx");
        }

        protected void validar_rut_Click(object sender, EventArgs e)
        {
            ControladorCliente control = new ControladorCliente();

            if (IsValid)
            {

                if (control.validarRUT(txtRut_cliente.Text))
                {
                    lb_validarRut.Text = "Rut registrado";
                    txtTipo.Enabled = true;
                    txtModelo.Enabled = true;
                    txtMarca.Enabled = true;
                    txtAccesorios.Enabled = true;
                    txtProblema.Enabled = true;
                    lbtnAgregarRecepcion.Enabled = true;
                }
                else
                {


                    lb_validarRut.Text = "Rut no registrado";
                    txtRut.Text = txtRut_cliente.Text;
                    MultiView1_Contenido.ActiveViewIndex = 2;


                }
            }
        }



        protected void Lbtn_Asignartecnico_Click(object sender, EventArgs e)
        {

            LinkBut_AsignarTecnico.Visible = true;
            ModalPopupExtender1_add_eddit.Show();
        }

        public void mostrarTecnicosYrecepciones()
        {
            

            ControladorRegitrador control = new ControladorRegitrador();
            ControladorTecnico controlTec = new ControladorTecnico();
            cbTecnicos.DataSource = controlTec.TecnicoPortipo("tecnico");
            cbTecnicos.DataTextField = "Nombre";
            cbTecnicos.DataValueField = "RUT";
            cbTecnicos.DataBind();
            cbTecnicos.Items.Insert(0, "SELECCIONE TECNICO");


            cbRecepcione.DataSource = control.BusquedaRecepcion();
            cbRecepcione.DataTextField = "IDRecepcion";
            cbRecepcione.DataValueField = "IDRecepcion";
            cbRecepcione.DataBind();
            cbRecepcione.Items.Insert(0, "SELECCIONE RECEPCION");




        }

        protected void btn_cerrar_Click(object sender, EventArgs e)
        {
            Response.Redirect("index.aspx");
        }

        protected void LinkBut_AsignarTecnico_Click(object sender, EventArgs e)
        {
            if (cbRecepcione.SelectedIndex == 0 || cbTecnicos.SelectedIndex==0)
            {
                lbasignarTec.Text = "SELECCIONE LOS DOS CAMPOS";
             
               
            }else{
            
                ControladorRegitrador control = new ControladorRegitrador();
                Orden_Trabajo nueva = new Orden_Trabajo
                {
                    RUT_Usuario = cbTecnicos.SelectedValue,
                    ID_Recepcion = Convert.ToInt32(cbRecepcione.SelectedValue),
                    Estado = "En reparacion",
                    Observacion = "Sin Observacion",
                    Precio =3000,
                    Estado_pago = "pendiente",
                    ID_TipoPago = 1

                };

                Recepcion nuevo = new Recepcion{ IDRecepcion=Convert.ToInt32(cbRecepcione.SelectedValue), Estado="Asignada a tecnico"
                
                
                };

                if (control.agregarOrdenTrabajo(nueva))
                {
                    mostrarTecnicosYrecepciones();
                    cargarGridview();
                }
                if (control.EditarRecepcion(nuevo))
                {
                    mostrarTecnicosYrecepciones();
                    cargarGridview();
                }
            }

        }

        protected void GridView_recepcion_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            try
            {
                cargarGridview();
                GridView_recepcion.PageIndex = e.NewPageIndex;
                GridView_recepcion.DataBind();

            }
            catch (Exception)
            {
                
                
            }
        }

    }
}
    
