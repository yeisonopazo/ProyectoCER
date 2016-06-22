<%@ Page Title="" Language="C#" MasterPageFile="~/plantilla2.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="ProyectoCER.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head_login" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="CPH_login" runat="server">

<div class="container">
                    <br />
                    <div class="row">
                        <div class="col-md-4">

                        </div>
                        <div class="col-md-4">
                            <div class="modal-sm modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header text-center">
                                        <h4>Ingreso del usuario</h4>
                                    </div>
                                    <div class="modal-body">
                                        <br />                                        
                                        <asp:TextBox ID="txtUser" CssClass="form-control" placeholder="Usuario"  runat="server"></asp:TextBox><br />
                                        <asp:TextBox ID="txtPass" TextMode="Password" placeholder="Password" CssClass="form-control" runat="server"></asp:TextBox>
                                       
                                    </div>
                                    <div class="modal-footer">
                                        <asp:LinkButton ID="btnIngresar" CssClass="btn btn-primary" OnClick="btnIngresar_Click" runat="server">Ingresar</asp:LinkButton>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4">

                        </div>

                    </div>
                </div>
           



</asp:Content>
