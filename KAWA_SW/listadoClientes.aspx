<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="listadoClientes.aspx.cs" Inherits="kawaSW.listadoClientes" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <link href="listadoClientes.css" rel="stylesheet" type="text/css" />
    <h1 class="heading-listado-clientes">Listado de Clientes Registrados</h1>
    <asp:GridView ID="GridView1" runat="server" CssClass="grid-view" RowStyle-CssClass="row-style" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataSource1" EmptyDataText="No hay registros de datos para mostrar." BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4">
        <Columns>
            <asp:CommandField ShowEditButton="True" HeaderText="Actualizar" ShowDeleteButton="True" />
            <asp:BoundField DataField="Id" HeaderText="Id" ReadOnly="True" SortExpression="Id" Visible="False" />
            <asp:BoundField DataField="Nombre" HeaderText="Nombre" SortExpression="Nombre" />
            <asp:BoundField DataField="Apellido" HeaderText="Apellido" SortExpression="Apellido" />
            <asp:BoundField DataField="Dni" HeaderText="Dni" SortExpression="Dni" />
            <asp:BoundField DataField="Telefono" HeaderText="Telefono" SortExpression="Telefono" />
        </Columns>
        <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
        <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" />
        <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" />
        <RowStyle BackColor="White" ForeColor="#003399" />
        <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
        <SortedAscendingCellStyle BackColor="#EDF6F6" />
        <SortedAscendingHeaderStyle BackColor="#0D4AC4" />
        <SortedDescendingCellStyle BackColor="#D6DFDF" />
        <SortedDescendingHeaderStyle BackColor="#002876" />
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Data Source=localhost;Initial Catalog=kawa;Integrated Security=True;Encrypt=True;TrustServerCertificate=True" DeleteCommand="DELETE FROM [Clientes] WHERE [Id] = @Id" InsertCommand="INSERT INTO [Clientes] ([Nombre], [Apellido], [Dni], [Telefono]) VALUES (@Nombre, @Apellido, @Dni, @Telefono)" ProviderName="<%$ ConnectionStrings:kawaConnectionString1.ProviderName %>" SelectCommand="SELECT [Id], [Nombre], [Apellido], [Dni], [Telefono] FROM [Clientes]" UpdateCommand="UPDATE [Clientes] SET [Nombre] = @Nombre, [Apellido] = @Apellido, [Dni] = @Dni, [Telefono] = @Telefono WHERE [Id] = @Id">
        <DeleteParameters>
            <asp:Parameter Name="Id" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Nombre" Type="String" />
            <asp:Parameter Name="Apellido" Type="String" />
            <asp:Parameter Name="Dni" Type="String" />
            <asp:Parameter Name="Telefono" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Nombre" Type="String" />
            <asp:Parameter Name="Apellido" Type="String" />
            <asp:Parameter Name="Dni" Type="String" />
            <asp:Parameter Name="Telefono" Type="String" />
            <asp:Parameter Name="Id" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>

</asp:Content>
