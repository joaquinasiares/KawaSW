using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace kawaSW
{
    public partial class AltaClientes : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnAgregar_Click(object sender, EventArgs e)
        {
            if (!String.IsNullOrEmpty(txtApellido.Text) && !String.IsNullOrEmpty(txtNombre.Text) && !String.IsNullOrEmpty(txtDni.Text) && !String.IsNullOrEmpty(txtTelefono.Text))
            {
                this.SqlDataSource1.InsertParameters["Nombre"].DefaultValue = txtNombre.Text;
                this.SqlDataSource1.InsertParameters["Apellido"].DefaultValue = txtApellido.Text;
                this.SqlDataSource1.InsertParameters["Dni"].DefaultValue = txtDni.Text;
                this.SqlDataSource1.InsertParameters["Telefono"].DefaultValue = txtTelefono.Text;
                this.SqlDataSource1.Insert();
                txtNombre.Text = "";
                txtApellido.Text = "";
                txtDni.Text = "";
                txtTelefono.Text = "";
                lblResultado.Text = "Se registro el cliente";
            }
            else {
                lblResultado.Text = "Faltan Campos por completar";
            }
            
        }
    }
}