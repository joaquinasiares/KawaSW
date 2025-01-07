using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace kawaSW
{
    public partial class Contactos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            int idCliente = Convert.ToInt32(dpCliente.SelectedValue);
            SqlDataSourceCuenta1.DeleteParameters["idCliente"].DefaultValue = idCliente.ToString();
            int cant = SqlDataSourceCuenta1.Delete();
            if (cant == 1)
            {
                lblEstadoDeCuenta.Text = "Se dio de baja la cuenta coriente del cliente ";
            }
            else
            {
                lblEstadoDeCuenta.Text = "no pudo darse de baja a esta cuenta corriente";
            }
        }
    }
}