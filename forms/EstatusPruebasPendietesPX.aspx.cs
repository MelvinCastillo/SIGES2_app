using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.ComponentModel;
using CrystalDecisions.Shared;
using CrystalDecisions.ReportSource;
using CrystalDecisions.CrystalReports.Engine;
using CAID.Data;
using System.Data;
using System.Collections;


namespace CAID_V2.forms
{
    public partial class EstatusPruebasPendietesPX : System.Web.UI.Page
    {

        private ArrayList xQueryParameters = new ArrayList();
        private ArrayList xQueryValues = new ArrayList();
        private string xCommand;
        private string xQuery;
        string ROWSGXID = "CAID-SD";
        string USERNAME;
        string PACIENTE;


        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                USERNAME = Request.QueryString["USUARIO"].ToString();
                ROWSGXID = Request.QueryString["LOCALIDAD"].ToString();
                PACIENTE = Request.QueryString["PACIENTE"].ToString();
                this.xQueryParameters.Clear();
                this.xQueryValues.Clear(); //order by nombre
                this.xQuery = "select *  FROM vpaciente where ROWGUID='" + PACIENTE + "' and rowsgxid='" + ROWSGXID + "'";
                DataTable dtpacientes = DB.ExecuteAdapter(string.Format(this.xQuery, this.xQueryValues, CommandType.Text));
                if (dtpacientes.Rows.Count > 0)
                {
                    txtNombrePaciente.Value = dtpacientes.Rows[0]["fullname"].ToString();
                    CmbEstatus.SelectedValue = dtpacientes.Rows[0]["EstatusPruebasPendientes"].ToString();
                    txtCualesPruebas.Value = dtpacientes.Rows[0]["DetalledePruebas"].ToString();



                }
                else
                {
                    txtNombrePaciente.Value = "";
                    CmbEstatus.SelectedValue = "";
                    txtCualesPruebas.Value = "";
                }



            }
        }
        protected void _Save(object sender, EventArgs e)
        {
            USERNAME = Request.QueryString["USUARIO"].ToString();
            ROWSGXID = Request.QueryString["LOCALIDAD"].ToString();
            PACIENTE = Request.QueryString["PACIENTE"].ToString();

            if (DB.ExecuteNonQuery(string.Format("[PR_EstatusPendientesPruebasGUARDAR] '{0}','{1}','{2}','{3}','{4}'", (object)PACIENTE.ToString(), CmbEstatus.SelectedValue, (object)ROWSGXID.ToString(), (object)USERNAME.ToString(), (object)this.txtCualesPruebas.Value.ToString())))
            {
                Notify("Registro Guardado", "success");
                this.Response.Redirect("http://caidsiges01:8000/HCL00000.aspx?X=" + PACIENTE);
            }
            else

                Notify("No se pudo almacenar la informacion", "error");

        }
        public void Notify(string msg, string tipo)
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "notify('" + msg + "','" + tipo + "');", true);
        }
        protected void _back(object sender, EventArgs e)
        {

            ClientScript.RegisterStartupScript(typeof(Page), "closePage", "javascript:history.back(-2)", true);
        }
    }
}