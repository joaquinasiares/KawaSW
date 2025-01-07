<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Contactos.aspx.cs" Inherits="kawaSW.Contactos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <link href="baja.css" rel="stylesheet" type="text/css" />
        <div id="bajaCuenta">
              <h3>Dar de baja una cuenta corriente</h3>
    <asp:Label ID="Label1" runat="server" Text="seleccione el cliente: " CssClass="lbl"></asp:Label>
    <asp:DropDownList ID="dpCliente" runat="server" CssClass="dp" DataSourceID="SqlDataSource1" DataTextField="NombreCompleto" DataValueField="Id"></asp:DropDownList>
              <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Data Source=localhost;Initial Catalog=kawa;Integrated Security=True;Encrypt=True;TrustServerCertificate=True" SelectCommand="SELECT c.Id, CONCAT(c.Nombre, ' ', c.Apellido) AS NombreCompleto
FROM Clientes c
LEFT JOIN CuentaCorriente cc ON c.Id = cc.idCliente
WHERE cc.idCliente IS NOT NULL;
"></asp:SqlDataSource>
    <asp:Label ID="lblEstadoDeCuenta" runat="server" Text="" CssClass="lbl1"></asp:Label>
    <asp:Button ID="Button1" runat="server" CssClass="btn" Text="Dar de baja" OnClick="Button1_Click" />
    <asp:SqlDataSource ID="SqlDataSourceCuenta1" runat="server" ConnectionString="Data Source=localhost;Initial Catalog=kawa;Integrated Security=True;Encrypt=True;TrustServerCertificate=True" DeleteCommand="DELETE FROM CuentaCorriente WHERE idCliente=@idCliente" SelectCommand="SELECT * FROM [CuentaCorriente]">
        <DeleteParameters>
            <asp:Parameter Name="idCliente" />
        </DeleteParameters>
              </asp:SqlDataSource>
</div>

</asp:Content>
