<%@ Page Title="" Language="C#" MasterPageFile="~/plantilla2.Master" AutoEventWireup="true" CodeBehind="Registrador.aspx.cs" Inherits="ProyectoCER.Registrador" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
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
            <asp:Button ID="btn_Tecnico" CssClass="btn btn-default btn-block" runat="server" Text="Regresar Panel Tecncio" OnClick="btn_Tecnico_Click" />
            <asp:Button ID="btn_cerrar" CssClass="btn btn-default btn-block" runat="server" Text="Cerrar sesion" OnClick="btn_cerrar_Click" />           

             </div>
        <div class="col-md-10">
            <div class="row">
                <div class="col-md-10">
                    <asp:UpdatePanel ID="UpdatePanel1_contenido" runat="server">
                        <ContentTemplate>
                            <asp:MultiView ID="MultiView1_Contenido" runat="server">
                                <asp:View ID="View0_Inicio" runat="server">
                                  
                                </asp:View>

                                <%--crear una recepcion--%>

                                <asp:View ID="View1_CrearRecepcion" runat="server">
                                    <div class="col-md-4">
                                    <asp:Label ID="Label3" CssClass="page-header" runat="server" Text="Datos de Recepcion"></asp:Label><br />
                                    <br />                                    
                                        <asp:TextBox ID="txtRut_cliente" CssClass="form-control" placeholder="RUT" runat="server"></asp:TextBox><asp:Button ID="validar_rut" runat="server" Text="Validar Rut" OnClick="validar_rut_Click" /><br />
                                        <asp:Label ID="lb_validarRut" runat="server" Text=""></asp:Label>
                                        <asp:TextBox ID="txtTipo" CssClass="form-control" placeholder="Tipo" runat="server"></asp:TextBox><br />
                                    <asp:TextBox ID="txtMarca" CssClass="form-control" placeholder="Marca" runat="server"></asp:TextBox><br />
                                    <asp:TextBox ID="txtModelo" CssClass="form-control" placeholder="Modelo" runat="server"></asp:TextBox><br />                                                                    
                                    <asp:TextBox ID="txtAccesorios" CssClass="form-control" placeholder="Accesorios" runat="server"></asp:TextBox><br />
                                    <asp:TextBox ID="txtProblema" CssClass="form-control" placeholder="Problema" runat="server"></asp:TextBox><br />
                                    <asp:LinkButton CssClass="btn btn-success form-control" ID="lbtnAgregarRecepcion" OnClick="lbtnAgregarRecepcion_Click" runat="server">Agregar Recepcion</asp:LinkButton>
                                        <asp:Label ID="lb_equipo_nuevo" runat="server" Text=""></asp:Label>
                                    </div>
                                    <div class="col-md-6">
                                        <asp:Label ID="Label4" CssClass="page-header" runat="server" Text="Recepciones creadas"></asp:Label><br />
                                        <br />
                                        <asp:GridView ID="GridView_recepcion" PageSize="5"
                                            AllowPaging="true" CssClass="table table-striped small" runat="server" OnPageIndexChanging="GridView_recepcion_PageIndexChanging">
                                        </asp:GridView>
                                    </div>
                                </asp:View>

                               <%-- VieW agregar cliente--%>

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
                                        <asp:LinkButton CssClass="btn btn-primary form-control" ID="LbtnAgregar_Cliente" runat="server" OnClick="LbtnAgregar_Cliente_Click">Registrar Cliente</asp:LinkButton>
                                    </div>
                                    <div class="col-md-6">
                                         <asp:Label ID="Label2" CssClass="page-header" runat="server" Text="Clientes Registrados"></asp:Label><br /><br />
                                        <div class="input-group">
                                            <asp:TextBox ID="txt_buscar_cliente" CssClass="form-control" placeholder="ingrese Rut Cliente" runat="server"></asp:TextBox>
                                            <div class="input-group-btn">
                                                <div class="btn-group" role="group">
                                                    <asp:LinkButton ID="lbtnBuscarCLiente" CssClass="btn btn-primary form-control" runat="server"><span class="glyphicon glyphicon-search" aria-hidden="true"></span></asp:LinkButton>
                                                </div>                                               

                                            </div>
                                        </div>
                                        <asp:GridView ID="GridView_Clientes" CssClass="table table-striped small" runat="server"></asp:GridView>
                                    </div>
                                </asp:View>

                                <%--Asignar tecnico a orden de trabajo--%>

                                <asp:View ID="View3_AsigarTecnico" runat="server">
                                    <asp:Label ID="Label5" CssClass="page-header" runat="server" Text="Asignar Tecnico a Orden de Trabajo"></asp:Label><br />
                                    <br />

                                    <div class="input-group">
                                        <asp:TextBox ID="TextBox1" CssClass="form-control" placeholder="Buscar orden de trabajo" runat="server"></asp:TextBox>
                                        <div class="input-group-btn">
                                            <div class="btn-group" role="group">
                                                <asp:LinkButton ID="LinkButton4" CssClass="btn btn-primary" runat="server"><span class="glyphicon glyphicon-search" aria-hidden="true"></span></asp:LinkButton>
                                            </div>
                                            <div class="btn-group" role="group">
                                                <asp:LinkButton ID="Lbtn_Asignartecnico" runat="server"
                                                    CssClass="btn btn-default" OnClick="Lbtn_Asignartecnico_Click">Asignar Tecnico</span></asp:LinkButton>
                                            </div>

                                        </div>
                                    </div>
                                    <asp:Button ID="Button1" runat="server" CssClass="hidden" Text="Button" />
                                    <asp:ModalPopupExtender ID="ModalPopupExtender1_add_eddit" runat="server" PopupControlID="Panel1_add_eddit"
                                        CancelControlID="LinkBut_cancelar" OkControlID="LinkBut_x" TargetControlID="Button1"></asp:ModalPopupExtender>
                                    <asp:Panel ID="Panel1_add_eddit" runat="server">
                                        <div class="modal-dialog modal-sm">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <asp:LinkButton ID="LinkBut_x" runat="server">X</asp:LinkButton>
                                                </div>
                                                <div class="modal-body">                                                   
                                                    <asp:DropDownList ID="cbTecnicos" runat="server" CssClass="form-control"></asp:DropDownList><br />
                                                    <asp:DropDownList ID="cbRecepcione" runat="server" CssClass="form-control"></asp:DropDownList><br />
                                                    <asp:Label ID="lbasignarTec" runat="server" Text="Label"></asp:Label>
                                                </div>
                                                <div class="modal-footer">
                                                   
                                                    <asp:LinkButton ID="LinkBut_AsignarTecnico" runat="server" CssClass="btn btn-primary" OnClick="LinkBut_AsignarTecnico_Click">Asignar Tecnico</asp:LinkButton>
                                                    <asp:LinkButton ID="LinkBut_cancelar" runat="server" CssClass="btn btn-danger">Cancelar</asp:LinkButton>
                                                </div>
                                            </div>
                                        </div>

                                    </asp:Panel>
                                    <asp:GridView ID="GridView_AsigarTec" class="table table-striped small" runat="server"></asp:GridView>
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
