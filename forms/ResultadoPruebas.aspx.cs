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
using System.Data.SqlClient;

namespace CAID_V2.forms
{
    public partial class ResultadoPruebas : System.Web.UI.Page
    {
        private ArrayList xQueryParameters = new ArrayList();
        private ArrayList xQueryValues = new ArrayList();
#pragma warning disable CS0169 // The field 'ConsultaPaciente.xCommand' is never used
#pragma warning disable CS0169 // The field 'ConsultaPaciente.xCommand' is never used
        private string xCommand;
#pragma warning restore CS0169 // The field 'ConsultaPaciente.xCommand' is never used
#pragma warning restore CS0169 // The field 'ConsultaPaciente.xCommand' is never used
        private string xQuery;
        string usuario;
        string centro;
        string IDPaciente;
        string TerapistaID;

        protected void Page_Load(object sender, EventArgs e)
        {
            //if (!IsPostBack)
            //{ 
            if (Request.QueryString["rowguidpaciente"] != null)
            {
                IDPaciente = Request.QueryString["rowguidpaciente"].ToString();
            }
            if (Request.QueryString["XTerapistaID"] != null)
            {
                TerapistaID = Request.QueryString["XTerapistaID"].ToString();
            }
            if (Request.QueryString["XTerapistaID"] != null)
            {
                usuario = Request.QueryString["XTerapistaID"].ToString();
            }
            if (Request.QueryString["XCURRENTUSR_SGXID"] != null)
            {
                centro = Request.QueryString["XCURRENTUSR_SGXID"].ToString();
            } 
        }

        protected void _Save(object sender, EventArgs e)
        {
            string strpaciente = this.IDPaciente.ToString();
            string strterapistaid = TerapistaID.ToString();
            string strcentro = this.centro.ToString();
            string strusuario = usuario.ToString();
            string strresultadoprueba = txtpruebaResultado.Text.ToString();

            DataTable dataTable2 = DB.ExecuteAdapter(string.Format("HCL00022SI_RESULTADOPRUEBAS '{0}','{1}','{2}','{3}','{4}'", (object)strpaciente, (object)strterapistaid, (object)strusuario, (object)strcentro, (object)strresultadoprueba));
            if (dataTable2.Rows.Count != 0)
            {
                DataRow row2 = dataTable2.Rows[0];
                if (row2["Conteo"].ToString() != "0")
                {
                    //Label1.Text = "Registro Guardado";
                    Notify("Registro Guardado", "success");
                    txtpruebaResultado.Text = "";
                }
                else
                    // Label1.Text = "NO GUARDO";
                    Notify("No se pudo almacenar la informacion, PRIMERO GUARDE POR LO MENOS UNA PESTAÑA DE LAS ANTERIORES", "error");
            }
            else
                // Label1.Text = "NO GUARDO";
                Notify("No se pudo almacenar la informacion,  PRIMERO GUARDE POR LO MENOS UNA PESTAÑA DE LAS ANTERIORES", "error");
        }

        public void Notify(string msg, string tipo)
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "notify('" + msg + "','" + tipo + "');", true);
        }
    }
}