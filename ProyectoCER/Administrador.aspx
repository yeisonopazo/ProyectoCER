<%@ Page Title="" Language="C#" MasterPageFile="~/plantilla2.Master" AutoEventWireup="true" CodeBehind="Administrador.aspx.cs" Inherits="ProyectoCER.Administrador" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head_login" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="CPH_login" runat="server">
    <h1>Administrador</h1>

  <div class="row">
      <div class="col-md-2">
          <asp:Button ID="btn_inicio" CssClass="btn btn-primary  btn-block" runat="server" Text="Menu" />
          <asp:Button ID="btn_CrearUsuario" CssClass="btn btn-default  btn-block" runat="server" Text="Crear Usuario" OnClick="btn_CrearUsuario_Click" />
            <asp:Button ID="btn_GestionUser" CssClass="btn btn-default  btn-block" runat="server" Text="Gestion Usuarios" OnClick="btn_GestionUser_Click" />
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
                               <asp:View ID="View1_Usuarios" runat="server">
                                   <div class="col-md-4">
                                       <asp:Label ID="Label3" CssClass="page-header" runat="server" Text="Datos del Usuario"></asp:Label><br />
                                       <br />
                                       <asp:TextBox ID="txtRut" runat="server"  placeholder="RUT" CssClass="form-control"></asp:TextBox><br />
                                       <asp:TextBox ID="txtNombre" runat="server"  placeholder="Nombre y Apellido" CssClass="form-control"></asp:TextBox><br />
                                       <asp:TextBox ID="txtDireccion" runat="server"  placeholder="Direccion" CssClass="form-control"></asp:TextBox><br />
                                       <asp:TextBox ID="txtCorreo" runat="server"  placeholder="Correo" CssClass="form-control"></asp:TextBox><br />
                                       <asp:TextBox ID="txtTelefono" runat="server"  placeholder="Telefono" CssClass="form-control"></asp:TextBox><br />
                                       <asp:TextBox ID="txtContraseña" runat="server"  placeholder="Contraseña" CssClass="form-control"></asp:TextBox><br />
                                       <asp:DropDownList ID="dbTipoUser" CssClass="form-control" runat="server"></asp:DropDownList>
                                    <asp:LinkButton CssClass="btn btn-success form-control" ID="lbtnAgregarUser" OnClick="lbtnAgregarUser_Click" runat="server">Agregar Usuario</asp:LinkButton>

                                   </div>
                                
                               </asp:View>
                                 <asp:View ID="View1_" runat="server">
                                        <div class="col-md-10">
                                        <asp:Label ID="Label4" CssClass="page-header" runat="server" Text="Usuarios del Sistema"></asp:Label><br />
                                        <br />
                                           


                                       <asp:GridView ID="GridView_Usuarios" CssClass="table table-bordered small" runat="server" AutoGenerateColumns="False" 
                                           OnRowDeleting="GridView_Usuarios_RowDeleting"
                                            OnRowCancelingEdit="GridView_Usuarios_RowCancelingEdit"
                                            OnRowEditing="GridView_Usuarios_RowEditing"
                                            OnRowUpdating="GridView_Usuarios_RowUpdating"
                                           DataKeyNames="RUT">
                                           
                                           <Columns>
                                               <asp:TemplateField HeaderText="Rut " SortExpression="RUT">
                                                   <EditItemTemplate>
                                                       <asp:Label ID="Label1" runat="server" Text='<%# Eval("RUT") %>'></asp:Label>
                                                   </EditItemTemplate>
                                                   <ItemTemplate>
                                                       <asp:Label ID="Label1" runat="server" Text='<%# Bind("RUT") %>'></asp:Label>
                                                   </ItemTemplate>
                                               </asp:TemplateField>
                                               <asp:TemplateField HeaderText="Nombre" SortExpression="Nombre">
                                                   <EditItemTemplate>
                                                       <asp:TextBox ID="txtNombreG" runat="server" Text='<%# Bind("Nombre") %>'></asp:TextBox>
                                                   </EditItemTemplate>
                                                   <ItemTemplate>
                                                       <asp:Label ID="Label2" runat="server" Text='<%# Bind("Nombre") %>'></asp:Label>
                                                   </ItemTemplate>
                                               </asp:TemplateField>
                                               <asp:TemplateField HeaderText="Direccion" SortExpression="Direccion">
                                                   <EditItemTemplate>
                                                       <asp:TextBox ID="txtDireccionG" runat="server" Text='<%# Bind("Direccion") %>'></asp:TextBox>
                                                   </EditItemTemplate>
                                                   <ItemTemplate>
                                                       <asp:Label ID="Label3" runat="server" Text='<%# Bind("Direccion") %>'></asp:Label>
                                                   </ItemTemplate>
                                               </asp:TemplateField>
                                               <asp:TemplateField HeaderText="Correo" SortExpression="Correo">
                                                   <EditItemTemplate>
                                                       <asp:TextBox ID="txtCorreoG" runat="server" Text='<%# Bind("Correo") %>'></asp:TextBox>
                                                   </EditItemTemplate>
                                                   <ItemTemplate>
                                                       <asp:Label ID="Label4" runat="server" Text='<%# Bind("Correo") %>'></asp:Label>
                                                   </ItemTemplate>
                                               </asp:TemplateField>
                                               <asp:TemplateField HeaderText="Telefono" SortExpression="Telefono">
                                                   <EditItemTemplate>
                                                       <asp:TextBox ID="txtTelefonoG" runat="server" Text='<%# Bind("Telefono") %>'></asp:TextBox>
                                                   </EditItemTemplate>
                                                   <ItemTemplate>
                                                       <asp:Label ID="Label5" runat="server" Text='<%# Bind("Telefono") %>'></asp:Label>
                                                   </ItemTemplate>
                                               </asp:TemplateField>
                                               <asp:TemplateField HeaderText="Contraseña" SortExpression="Contraseña">
                                                   <EditItemTemplate>
                                                       <asp:TextBox ID="txtContraseñaG" runat="server" Text='<%# Bind("Contraseña") %>'></asp:TextBox>
                                                   </EditItemTemplate>
                                                   <ItemTemplate>
                                                       <asp:Label ID="Label6" runat="server" Text='<%# Bind("Contraseña") %>'></asp:Label>
                                                   </ItemTemplate>
                                               </asp:TemplateField>
                                               <asp:TemplateField HeaderText="Tipo" SortExpression="Tipo">
                                                   <EditItemTemplate>
                                                 
                                                       <asp:TextBox ID="txtTipoG" runat="server" Text='<%# Bind("Tipo") %>'></asp:TextBox>
                                                   </EditItemTemplate>
                                                   <ItemTemplate>
                                                       <asp:Label ID="Label7" runat="server" Text='<%# Bind("Tipo") %>'></asp:Label>
                                                   </ItemTemplate>
                                               </asp:TemplateField>
                                             <asp:CommandField ButtonType="Link" HeaderText="Editar" ShowEditButton="True" ShowHeader="True" />
                                               <asp:CommandField ButtonType="Link" HeaderText="Eliminar" ShowDeleteButton="True" ShowHeader="True" />
                                           </Columns>
                                           <HeaderStyle CssClass="btn-danger" />
                                            </asp:GridView>
                                   </div>
                                 </asp:View>

                          </asp:MultiView>
                      </ContentTemplate>
                  </asp:UpdatePanel>
              </div>
          </div>
      </div>
  </div>
    


</asp:Content>
