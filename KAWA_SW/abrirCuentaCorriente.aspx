<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="abrirCuentaCorriente.aspx.cs" Inherits="kawaSW.abrirCuentaCorriente" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <link href="nuevaCuenta.css" rel="stylesheet" type="text/css" />
    <h3>Abrir una cuenta corriente en KAWA</h3>
    <asp:Label ID="Label1" runat="server" Text="Seleccione el cliente" CssClass="lbl"></asp:Label>
    <asp:DropDownList ID="dpClientes" runat="server" DataSourceID="SqlDataSource1" DataTextField="NombreCompleto" DataValueField="Id" CssClass="dp"></asp:DropDownList>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Data Source=localhost;Initial Catalog=kawa;Integrated Security=True;Encrypt=True;TrustServerCertificate=True" SelectCommand="SELECT c.Id, CONCAT(c.Nombre, ' ', c.Apellido) AS NombreCompleto
FROM Clientes c
LEFT JOIN CuentaCorriente cc ON c.Id = cc.idCliente
WHERE cc.idCliente IS NULL;"></asp:SqlDataSource>
    <br />
    <asp:Label ID="Label2" runat="server" Text="Ingrese un monto: " CssClass="lbl"></asp:Label>
    <asp:TextBox ID="txtMonto" runat="server" CssClass="txt"></asp:TextBox><br />
    <asp:Button ID="Button1" runat="server" Text="Registrar nueva cuenta" OnClick="Button1_Click" CssClass="btn" />
    <asp:SqlDataSource ID="SqlDataSourceCuenta" runat="server" ConnectionString="Data Source=localhost;Initial Catalog=kawa;Integrated Security=True;Encrypt=True;TrustServerCertificate=True" InsertCommand="insert into CuentaCorriente (Saldo,idCliente)values(@saldo,@idCliente)" SelectCommand="SELECT * FROM [CuentaCorriente]">
        <InsertParameters>
            <asp:ControlParameter ControlID="txtMonto" Name="saldo" PropertyName="Text" />
            <asp:Parameter Name="idCliente" />
        </InsertParameters>
    </asp:SqlDataSource>
    <asp:Label ID="lblResultado" runat="server" Text="" CssClass="lblResutlado"></asp:Label>
</asp:Content>
