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
    public partial class AdmisionesInstitucionRelacionadaPX : System.Web.UI.Page
    {
        private ArrayList xQueryParameters = new ArrayList();
        private ArrayList xQueryValues = new ArrayList(); 
        private string xCommand; 
        private string xQuery;
        string usuario;
        string centro;
        string IDPaciente;
        string TerapistaID;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
               
                if (Request.QueryString["rowguidpaciente"] != null)
                {
                    IDPaciente = Request.QueryString["rowguidpaciente"].ToString();
                    if (IDPaciente.ToString().Trim() == string.Empty)
                    {
                        IDPaciente = "-1";
                    }
                }
                else
                    IDPaciente = "-1";
                

                if (Request.QueryString["XCURRENTUSR_SGXID"] != null)
                {
                    centro = Request.QueryString["XCURRENTUSR_SGXID"].ToString();
                }
                else
                    centro = "-1";

                 
                /*Busca el listado de las Instituciones*/
                this.xQueryParameters.Clear();
                this.xQueryValues.Clear(); 
                this.ddInstituciones.Items.Add(new ListItem("-- SELECCIONE --", "0"));
 
                foreach (DataRow row in (InternalDataCollectionBase)DB.ExecuteAdapter("PR_INSTITUCIONESRELACIONADAS", this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure).Rows)
                    this.ddInstituciones.Items.Add(new ListItem(row["DESCRIPCION"].ToString(), row["CODIGO"].ToString()));

                /*asigno el valor al dropdown */
                this.xQueryParameters.Clear();
                this.xQueryValues.Clear();
                DataTable dtInstitucionesrelacionadasPX = DB.ExecuteAdapter(string.Format("select InstitucionesRelacionadas from PAX00000  where ROWGUID ='" + IDPaciente.ToString() + "' and ROWSGXID ='" + centro.ToString()+"'", this.xQueryValues, CommandType.Text));
                //DataTable dtgeneralesPaciente = DB.ExecuteAdapter(this.xQuery, this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure);
                DataRow dataRowInstitucionesRelacionadas = dtInstitucionesrelacionadasPX.Rows.Count != 0 ? dtInstitucionesrelacionadasPX.Rows[0] : (DataRow)null;

                if (dataRowInstitucionesRelacionadas == null)
                    ddInstituciones.SelectedValue = "0";
                if (dtInstitucionesrelacionadasPX.Rows.Count > 1)
                this.ddInstituciones.SelectedValue = dataRowInstitucionesRelacionadas["InstitucionesRelacionadas"].ToString();
            }
        }

        protected void _Save(object sender, EventArgs e)
        {
             
            string strpaciente = Request.QueryString["rowguidpaciente"].ToString();
            //string strterapistaid = TerapistaID.ToString();
            string strcentro = Request.QueryString["XCURRENTUSR_SGXID"].ToString();
            // string strusuario = usuario.ToString();
            string strinstitucionRelacionada = ddInstituciones.SelectedValue.ToString();

            DataTable dataTable2 = DB.ExecuteAdapter(string.Format("PAX00000SI_INSTITUCIONESRELACIONADAS '{0}','{1}','{2}'", (object)strpaciente, (object)strcentro,    (object)strinstitucionRelacionada));
            if (dataTable2.Rows.Count != 0)
            {
                DataRow row2 = dataTable2.Rows[0];
                if (row2["Conteo"].ToString() != "0")
                { 
                    Notify("Registro Guardado", "success"); 
                }
                else 
                    Notify("No se pudo almacenar la informacion, PRIMERO GUARDE LA ADMISION", "error");
            }
            else 
                Notify("No se pudo almacenar la informacion,  PRIMERO GUARDE LA ADMISION", "error");
              
        }

        public void Notify(string msg, string tipo)
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "notify('" + msg + "','" + tipo + "');", true);
        }

        protected void ddInstituciones_SelectedIndexChanged(object sender, EventArgs e)
        {  
            _Save(sender, e);
        }
    }
}
 
 