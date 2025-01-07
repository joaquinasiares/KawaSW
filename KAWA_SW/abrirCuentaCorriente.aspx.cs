using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace kawaSW
{
    public partial class abrirCuentaCorriente : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            int idCliente = Convert.ToInt32(dpClientes.SelectedValue);
            if (!String.IsNullOrEmpty(txtMonto.Text) && decimal.TryParse(txtMonto.Text, out decimal monto1))
            {
                try
                {
                    SqlDataSourceCuenta.InsertParameters["Saldo"].DefaultValue = txtMonto.Text;
                    SqlDataSourceCuenta.InsertParameters["idCliente"].DefaultValue = idCliente.ToString();
                    SqlDataSourceCuenta.Insert();
                    lblResultado.Text = "se registro la nueva cuenta corriente";
                    txtMonto.Text = "";
                }
                catch (Exception ex)
                {
                    lblResultado.Text += "Ocurrio un error con el dato introducido: " + ex.Message;
                }
            }
            else {
                lblResultado.Text += "debes ingresar un monto valido";
            }
            
        }
    }
}