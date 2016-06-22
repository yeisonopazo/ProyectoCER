<%@ Page Title="" Language="C#" MasterPageFile="~/plantilla2.Master" AutoEventWireup="true" CodeBehind="Cliente.aspx.cs" Inherits="ProyectoCER.Cliente" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head_login" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="CPH_login" runat="server">
    <h1>Cliente</h1>
    <br />
    <h4>equipos en reparacion</h4>

    <asp:GridView CssClass="table" ID="GridView1" runat="server"></asp:GridView>
</asp:Content>
