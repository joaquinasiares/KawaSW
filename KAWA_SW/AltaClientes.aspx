<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AltaClientes.aspx.cs" Inherits="kawaSW.AltaClientes" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <link href="altaClientes.css" rel="stylesheet" type="text/css" />
    <div class="form-container">
        <h2>Alta de Clientes</h2>
        <asp:Label ID="lblNombre" runat="server" Text="Nombre:" CssClass="form-label"></asp:Label>
        <asp:TextBox ID="txtNombre" runat="server" CssClass="form-input" placeholder="Ingrese su nombre" required="required"></asp:TextBox>

        <asp:Label ID="lblApellido" runat="server" Text="Apellido:" CssClass="form-label"></asp:Label>
        <asp:TextBox ID="txtApellido" runat="server" CssClass="form-input" placeholder="Ingrese su apellido" required="required"></asp:TextBox>

        <asp:Label ID="lblDni" runat="server" Text="DNI:" CssClass="form-label"></asp:Label>
        <asp:TextBox ID="txtDni" runat="server" CssClass="form-input" placeholder="Ingrese su DNI" required="required"></asp:TextBox>

        <asp:Label ID="lblTelefono" runat="server" Text="Teléfono:" CssClass="form-label"></asp:Label>
        <asp:TextBox ID="txtTelefono" runat="server" CssClass="form-input" placeholder="Ingrese su teléfono" required="required"></asp:TextBox>

        <asp:Button ID="btnAgregar" runat="server" Text="Agregar Cliente" CssClass="form-button" OnClick="btnAgregar_Click" />
    </div>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Data Source=localhost;Initial Catalog=kawa;Integrated Security=True;Encrypt=True;TrustServerCertificate=True" InsertCommand="INSERT INTO Clientes(Nombre,Apellido,Dni,Telefono)values(@Nombre,@Apellido,@Dni,@Telefono)" SelectCommand="SELECT * FROM [Clientes]">
        <InsertParameters>
            <asp:ControlParameter ControlID="txtNombre" Name="Nombre" PropertyName="Text" />
            <asp:ControlParameter ControlID="txtApellido" Name="Apellido" PropertyName="Text" />
            <asp:ControlParameter ControlID="txtDni" Name="Dni" PropertyName="Text" />
            <asp:ControlParameter ControlID="txtTelefono" Name="Telefono" PropertyName="Text" />
        </InsertParameters>
    </asp:SqlDataSource><br />
    <asp:Label ID="lblResultado" CssClass="lblCarga" runat="server" Text=""></asp:Label>
</asp:Content>
