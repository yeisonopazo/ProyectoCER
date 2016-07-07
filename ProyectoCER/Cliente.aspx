<%@ Page Title="" Language="C#" MasterPageFile="~/plantilla2.Master" AutoEventWireup="true" CodeBehind="Cliente.aspx.cs" Inherits="ProyectoCER.Cliente" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head_login" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="CPH_login" runat="server">
    <h2>Cliente</h2>

        <div class="row">
        <div class="col-md-2">
            <asp:Button ID="btn_inicio" CssClass="btn btn-primary  btn-block" runat="server" Text="Menu" />
            <asp:Button ID="btn_VerER" CssClass="btn btn-default  btn-block" runat="server" Text="Ver Equipos en Reparacion" OnClick="btn_VerER_Click" />
            <asp:Button ID="btn_ActualizarInfo" CssClass="btn btn-default  btn-block" runat="server" Text="Actualizar Informacion Personal" OnClick="btn_ActualizarInfo_Click" />
           <asp:Button ID="btn_Cominicartecnico" CssClass="btn btn-default btn-block" runat="server" Text="Comunicar Tecnico" OnClick="btn_Cominicartecnico_Click" />
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
                               <%-- Ver equipos en reparacion--%>
                                <asp:View ID="View1_VerEquipos" runat="server">
                                    <div class="col-md-10">
                                    <asp:Label ID="Label3" CssClass="page-header" runat="server" Text="Equipos en Reparacion"></asp:Label><br /> <br />
                                      <asp:GridView ID="GridView1_EquiposEnRepa" CssClass="table table-striped small"  runat="server" OnRowCancelingEdit="GridView1_EquiposEnRepa_RowCancelingEdit" OnRowDeleting="GridView1_EquiposEnRepa_RowDeleting" OnRowEditing="GridView1_EquiposEnRepa_RowEditing" OnSelectedIndexChanging="GridView1_EquiposEnRepa_SelectedIndexChanging"></asp:GridView>
                                    <asp:Button ID="btn_pagar" runat="server" OnClick="btn_pagar_Click" Text="Pagar" /> <br />
                                    <asp:Label ID="Label4" Visible="false" runat="server" Text="Tipo de cuenta: Cuenta Corriente"></asp:Label><br />
                                    <asp:Label ID="Label5" Visible="false" runat="server" Text="Banco: banco de Chile"></asp:Label><br />                                    
                                    <asp:Label ID="Label6" Visible="false" runat="server" Text="Numero de Cuenta: 10-23445-12345"></asp:Label><br />
                                    <asp:Label ID="Label7" Visible="false" runat="server" Text="A y F Computadores"></asp:Label><br />
                                    <asp:Label ID="Label8" Visible="false" runat="server" Text="Correo: ventas@ayfcomputadores.com"></asp:Label><br />
                                    <asp:Label ID="Label9" Visible="false" runat="server" Text="--colocar numero de orden q paga--"></asp:Label>
                                     <br />
                                    <a target="_blank" href="https://www.bancoestado.cl/">Bancoestado</a>
                                    <a target="_blank" href="http://www.bancochile.cl/ ">Banco de Chile</a>
                                     <a target="_blank" href="https://www.santander.cl/">Banco Santander</a>
                                        </div>
                                     </asp:View>
                               

                                  <asp:View ID="View2_UpdateInfo" runat="server">
                                    <asp:Label ID="Label1" CssClass="page-header" runat="server" Text="Actualizar Informacion Personal"></asp:Label><br /><br />
                                      <asp:GridView ID="GridView2_UpdateInf" CssClass="table table-striped small" runat="server" allowpaging="true"></asp:GridView>
                                  </asp:View>
                                 <asp:View ID="View2_ComunicarCliente" runat="server">
                                    <asp:Label ID="Label2" CssClass="page-header" runat="server" Text="Comunicar con Tecnico"></asp:Label><br /><br />                                    
                                    <asp:TextBox id="txtB_Mensaje" placeholder="Ingrese mensaje" CssClass="form-control" TextMode="multiline" Columns="50" Rows="5" runat="server" /><br />
                                    <asp:LinkButton ID="lbtn_enviarCorreo" CssClass="btn btn-primary" runat="server">Enviar</asp:LinkButton>
                                </asp:View>

                                </asp:MultiView>
                            </ContentTemplate>
                        <Triggers>
                           
                        </Triggers>
                        </asp:UpdatePanel>
                    </div>
                </div>
            </div>
            </div>
    
    

</asp:Content>
