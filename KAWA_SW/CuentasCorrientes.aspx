<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CuentasCorrientes.aspx.cs" Inherits="kawaSW.CuentasCorrientes" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <link href="cuentaCorriente.css" rel="stylesheet" type="text/css" />
    <h1 class="heading-listado-clientes">Cuentas Corrientes </h1>
    <asp:GridView ID="GridView1" runat="server" CssClass="grid-view" RowStyle-CssClass="row-style" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" EmptyDataText="No hay registros de datos para mostrar.">
        <Columns>
            <asp:BoundField DataField="Nombre" HeaderText="Nombre" SortExpression="Nombre" />
            <asp:BoundField DataField="Apellido" HeaderText="Apellido" SortExpression="Apellido" />
            <asp:BoundField DataField="Dni" HeaderText="Dni" SortExpression="Dni" />
            <asp:BoundField DataField="Telefono" HeaderText="Telefono" SortExpression="Telefono" />
            <asp:BoundField DataField="Saldo" HeaderText="Saldo" SortExpression="Saldo" />
        </Columns>

<RowStyle CssClass="row-style"></RowStyle>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Data Source=localhost;Initial Catalog=kawa;Integrated Security=True;Encrypt=True;TrustServerCertificate=True" SelectCommand="SELECT c.Nombre,c.Apellido,c.Dni,c.Telefono,cu.Saldo FROM Clientes c join CuentaCorriente cu on c.Id=cu.idCliente
">
    </asp:SqlDataSource>
    <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click" CssClass="nuevaCuenta">Abrir nueva cuenta</asp:LinkButton>
    <asp:LinkButton ID="LinkButton2" runat="server" OnClick="LinkButton2_Click" CssClass="nuevaCuenta">Dar de baja una cuenta</asp:LinkButton>

</asp:Content>
