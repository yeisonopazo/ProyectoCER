<%@ Page Title="" Language="C#" MasterPageFile="~/plantilla2.Master" AutoEventWireup="true" CodeBehind="Tecnico.aspx.cs" Inherits="ProyectoCER.Tecnico" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head_login" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="CPH_login" runat="server">

    <h2>Tecnico</h2> 

    <div class="row">
        <div class="col-md-2">
            <asp:Button ID="btn_inicio" CssClass="btn btn-primary  btn-block" runat="server" Text="Menu" />
            <asp:Button ID="btn_Actualizar_OT" CssClass="btn btn-default  btn-block" runat="server" Text="Orden de Trabajo" OnClick="btn_Actualizar_OT_Click" />
            <asp:Button ID="btn_CominicarCLiente" CssClass="btn btn-default btn-block" runat="server" Text="Comunicar Cliente" OnClick="btn_CominicarCLiente_Click" />           
            <asp:Button ID="btn_Recepcion" CssClass="btn btn-success btn-block" runat="server" Text="Crear una Recepcion" OnClick="btn_Recepcion_Click" />
            <asp:Button ID="btn_cerrar" CssClass="btn btn-default btn-block" runat="server" Text="Cerrar sesion" OnClick="btn_cerrar_Click" />           

        </div>
        <div class="col-md-10">
            <div class="row">
                <div class="col-md-10">
                    <asp:UpdatePanel ID="UpdatePanel1_contenido" runat="server">
                        <ContentTemplate>
                            <asp:MultiView ID="MultiView1_Contenido" runat="server">
                                <asp:View ID="View0_Inicio" runat="server"></asp:View>
                                <asp:View ID="View_UpdateOT" runat="server">                                 
                                    <asp:Label ID="Label3" CssClass="page-header" runat="server" Text="Actualizar Orden de trabajo"></asp:Label><br />
                                    <br />
                                    <asp:GridView ID="GridView1"  CssClass="table table-striped" runat="server"></asp:GridView>
                                </asp:View>
                                <asp:View ID="View2_ComunicarCliente" runat="server">
                                    <asp:Label ID="Label1" CssClass="page-header" runat="server" Text="Comunicar con el cliente"></asp:Label><br /><br />

                                    <asp:TextBox ID="TextBox1" CssClass="form-control" placeholder="Ingrese Correo" runat="server"></asp:TextBox><br />
                                    <asp:TextBox id="txtB_Mensaje" placeholder="Ingrese mensaje" CssClass="form-control" TextMode="multiline" Columns="50" Rows="5" runat="server" /><br />
                                    <asp:LinkButton ID="lbtn_enviarCorreo" CssClass="btn btn-primary" runat="server">Enviar</asp:LinkButton>
                                </asp:View>

                               

                            </asp:MultiView>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>
                </div>
            </div>
        </div>
    


</asp:Content>
