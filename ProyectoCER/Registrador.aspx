<%@ Page Title="" Language="C#" MasterPageFile="~/plantilla2.Master" AutoEventWireup="true" CodeBehind="Registrador.aspx.cs" Inherits="ProyectoCER.Registrador" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head_login" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="CPH_login" runat="server">

    <h2>Registrador</h2>
  

    <div class="row">
        <div class="col-md-2">
            <asp:Button ID="btn_inicio" CssClass="btn btn-primary  btn-block" runat="server" Text="Menu" />
            <asp:Button ID="btn_Crear_Recepcion" CssClass="btn btn-default  btn-block" runat="server" Text="Crear Recepcion" OnClick="btn_Crear_Recepcion_Click" />
            <asp:Button ID="btn_RegistrarCliente" CssClass="btn btn-default  btn-block" runat="server" Text="Registrar Cliente" OnClick="btn_RegistrarCliente_Click" />
            <asp:Button ID="btn_AsignarTecnico" CssClass="btn btn-default  btn-block" runat="server" Text="Asignar Tecnico a O.T." OnClick="btn_AsignarTecnico_Click"  />
        </div>
        <div class="col-md-10">
            <div class="row">
                <div class="col-md-10">
                    <asp:UpdatePanel ID="UpdatePanel1_contenido" runat="server">
                        <ContentTemplate>
                            <asp:MultiView ID="MultiView1_Contenido" runat="server">
                                <asp:View ID="View0_Inicio" runat="server">
                                    <h3>Bienvenido Registrador </h3>
                                </asp:View>
                                <asp:View ID="View1_CrearRecepcion" runat="server">
                                    <div class="col-md-4">
                                    <asp:Label ID="Label3" CssClass="page-header" runat="server" Text="Datos de Recepcion"></asp:Label><br />
                                    <br />
                                    
                                        <asp:DropDownList ID="cbClientes" CssClass="form-control" runat="server"></asp:DropDownList><br />
                                    <asp:TextBox ID="txtTipo" CssClass="form-control" placeholder="Tipo" runat="server"></asp:TextBox><br />
                                    <asp:TextBox ID="txtMarca" CssClass="form-control" placeholder="Marca" runat="server"></asp:TextBox><br />
                                    <asp:TextBox ID="txtModelo" CssClass="form-control" placeholder="Modelo" runat="server"></asp:TextBox><br />                                                                    
                                    <asp:TextBox ID="txtAccesorios" CssClass="form-control" placeholder="Accesorios" runat="server"></asp:TextBox><br />
                                    <asp:TextBox ID="txtProblema" CssClass="form-control" placeholder="Problema" runat="server"></asp:TextBox><br />
                                    <asp:LinkButton CssClass="btn btn-primary" ID="lbtnAgregarRecepcion" OnClick="lbtnAgregarRecepcion_Click" runat="server">Agregar Recepcion</asp:LinkButton>
                                    </div>
                                    <div class="col-md-6">
                                        <asp:Label ID="Label4" CssClass="page-header" runat="server" Text="Recepciones creadas"></asp:Label><br /><br />
                                        <asp:GridView ID="GridView_recepcion" class="table table-striped" runat="server"></asp:GridView>
                                    </div>
                                </asp:View>
                                <asp:View ID="View2_RegistrarCliente" runat="server">
                                    <div class="col-md-4">
                                        <asp:Label ID="Label1" CssClass="page-header" runat="server" Text="Datos de Cliente"></asp:Label><br />
                                        <br />
                                        <asp:TextBox ID="txtRut" runat="server" placeholder="RUT" CssClass="form-control"></asp:TextBox><br />
                                        <asp:TextBox ID="txtNombre" runat="server" placeholder="Nombre" CssClass="form-control"></asp:TextBox><br />
                                        <asp:TextBox ID="txtApellido" runat="server" placeholder="Apellido" CssClass="form-control"></asp:TextBox><br />
                                        <asp:TextBox ID="txtDireccion" runat="server" placeholder="Direccion" CssClass="form-control"></asp:TextBox><br />
                                        <asp:TextBox ID="txtCorreo" runat="server" placeholder="Correo" CssClass="form-control"></asp:TextBox><br />
                                        <asp:TextBox ID="txtTelefono" runat="server" placeholder="Telefono" CssClass="form-control"></asp:TextBox><br />
                                        <asp:TextBox ID="txtContraseña" runat="server" placeholder="Contraseña" CssClass="form-control"></asp:TextBox><br />
                                        <asp:LinkButton CssClass="btn btn-primary" ID="LbtnAgregar_Cliente" runat="server" OnClick="LbtnAgregar_Cliente_Click">Registrar Cliente</asp:LinkButton>
                                    </div>
                                    <div class="col-md-6">
                                         <asp:Label ID="Label2" CssClass="page-header" runat="server" Text="Clientes Registrados"></asp:Label><br /><br />
                                        <asp:GridView ID="GridView_Clientes" CssClass="table table-striped" runat="server"></asp:GridView>
                                    </div>
                                </asp:View>
                                <asp:View ID="View3_AsigarTecnico" runat="server">
                                    <asp:GridView ID="GridView_AsigarTec" class="table table-striped" runat="server"></asp:GridView>
                                </asp:View>
                            </asp:MultiView>
                        </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="btn_Crear_Recepcion" EventName="Click" />
                        </Triggers>
                    </asp:UpdatePanel>
                </div>
            </div>
        </div>

    </div>

</asp:Content>
