<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ActualizarCliente.aspx.cs" Inherits="kawaSW.ActualizarCliente" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <link href="actualizarCliente.css" rel="stylesheet" type="text/css" />
    <h1>Movimientos de cuenta</h1>
     <div id="form-container">
    <div id="acciones">
        <asp:Label ID="Label1" runat="server" Text="Dni del cliente:  "></asp:Label><asp:TextBox ID="txtDni" runat="server"></asp:TextBox><br />
        <asp:Button ID="Button1" runat="server" Text="Buscar cliente" OnClick="Button1_Click" /><br />

        <asp:Label ID="Label3" runat="server" Text="Movimiento: "></asp:Label>
        <asp:DropDownList ID="dpAccion" runat="server">
            <asp:ListItem Value="0">Deposito</asp:ListItem>
            <asp:ListItem Value="1">Compra en cta cte</asp:ListItem>
        </asp:DropDownList><br />
        <asp:Label ID="Label2" runat="server" Text="Ingrese el monto: "></asp:Label><asp:TextBox ID="txtMonto" runat="server"></asp:TextBox><br />
        <asp:Button ID="Button2" runat="server" Text="Impactar en cuenta" OnClick="Button2_Click" /><br />

    </div>
         <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Data Source=localhost;Initial Catalog=kawa;Integrated Security=True;Encrypt=True;TrustServerCertificate=True" SelectCommand="SELECT c.Id,c.Nombre,c.Apellido,c.Dni,c.Telefono,cu.Saldo FROM Clientes c join CuentaCorriente cu on c.Id=cu.idCliente WHERE Dni=@Dni
">
             <SelectParameters>
                 <asp:ControlParameter ControlID="txtDni" Name="Dni" PropertyName="Text" />
             </SelectParameters>
         </asp:SqlDataSource>
         <asp:SqlDataSource ID="SqlDataSourceSumar" runat="server" ConnectionString="Data Source=localhost;Initial Catalog=kawa;Integrated Security=True;Encrypt=True;TrustServerCertificate=True" SelectCommand="SELECT * FROM [CuentaCorriente]" UpdateCommand="update CuentaCorriente set Saldo=@Saldo where idCliente=@idCliente">
             <UpdateParameters>
                 <asp:Parameter Name="Saldo" />
                 <asp:Parameter Name="idCliente" />
             </UpdateParameters>
         </asp:SqlDataSource>
    <div id="informacion">
        <h3>Informacion de la cuenta</h3>
        <asp:Label ID="lblEstadoCuenta" runat="server" Text="" CssClass="lblInfo"></asp:Label><br />
    </div>
         </div>
    <asp:Label ID="lblResultado" runat="server" Text=""></asp:Label>
</asp:Content>