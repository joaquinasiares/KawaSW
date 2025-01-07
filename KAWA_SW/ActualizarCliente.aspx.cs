using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace kawaSW
{
    public partial class ActualizarCliente : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            if (!String.IsNullOrEmpty(txtDni.Text))
            {
                this.SqlDataSource1.SelectParameters["Dni"].DefaultValue = txtDni.Text;
                this.SqlDataSource1.DataSourceMode = SqlDataSourceMode.DataReader;
                SqlDataReader datos = (SqlDataReader)this.SqlDataSource1.Select(DataSourceSelectArguments.Empty);
                if (datos.Read())
                {
                    lblEstadoCuenta.Text = "Nombre: " + datos["Nombre"] + "</br>Apellido: " + datos["Apellido"] + "<br>" + "Telefono: " + datos["Telefono"] + "<br>" + "Saldo: " + datos["Saldo"] + "<br>" + "<br>";
                    Session["idCliente"] = datos["Id"].ToString();
                    Session["Saldo"] = datos["Saldo"].ToString();
                }
                else
                {
                    lblEstadoCuenta.Text = "Su cliente no tiene una cuenta corriente en esta empresa";
                }
            }
            else
            {
                lblEstadoCuenta.Text = "Debe ingresar un Dni";
            }

        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            if (Session["idCliente"] != null && Session["Saldo"] != null)
            {
                String idCliente = Session["idCliente"].ToString();
                String SaldoCta = Session["Saldo"].ToString();
                int SaldoActual = Convert.ToInt32(SaldoCta);
                int NuevoSaldo = 100;
                if (!String.IsNullOrEmpty(txtMonto.Text) && decimal.TryParse(txtMonto.Text, out decimal monto1))
                {
                    if (dpAccion.SelectedIndex == 1)
                    {
                        //suma a la cuenta
                        
                        int monto = Convert.ToInt32(txtMonto.Text);
                        NuevoSaldo = SaldoActual + monto;
                        //lblEstadoCuenta.Text = "id del cliente: " + idCliente + "<br>" + "saldo de la cuenta: " + NuevoSaldo;
                        
                        this.SqlDataSourceSumar.UpdateParameters["idCliente"].DefaultValue = Session["idCliente"].ToString();
                        this.SqlDataSourceSumar.UpdateParameters["Saldo"].DefaultValue = NuevoSaldo.ToString();
                        int cant = this.SqlDataSourceSumar.Update();
                        if (cant == 1)
                        {
                            lblEstadoCuenta.Text = "Se impacto el monto en la cuenta corriente";
                        }
                        
                    }
                    else if (dpAccion.SelectedIndex == 0)
                    {
                        //resta a la cuenta
                        int monto = Convert.ToInt32(txtMonto.Text);
                        NuevoSaldo = SaldoActual - monto;
                        this.SqlDataSourceSumar.UpdateParameters["Saldo"].DefaultValue = NuevoSaldo.ToString();
                        this.SqlDataSourceSumar.UpdateParameters["idCliente"].DefaultValue = idCliente;
                        int cant = this.SqlDataSourceSumar.Update();
                        if (cant == 1)
                        {
                            lblEstadoCuenta.Text = "Se impacto el monto en la cuenta corriente";
                        }
                    }
                }
                else
                {
                    lblResultado.Text = "debes ingresar un monto valido";
                }
                 
            }
            else
            {
                lblResultado.Text = "no se selecciono nignun cliente";
            }

            }
           
            }
        }