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
    public partial class SeguimientodeCasos : System.Web.UI.Page
    {
        private ArrayList xQueryParameters = new ArrayList();
        private ArrayList xQueryValues = new ArrayList();
#pragma warning disable CS0169 // The field 'SeguimientodeCasos.xCommand' is never used
#pragma warning disable CS0169 // The field 'SeguimientodeCasos.xCommand' is never used
#pragma warning disable CS0169 // The field 'SeguimientodeCasos.xQuery' is never used
        private string xCommand;
#pragma warning restore CS0169 // The field 'SeguimientodeCasos.xCommand' is never used
#pragma warning restore CS0169 // The field 'SeguimientodeCasos.xQuery' is never used
#pragma warning restore CS0169 // The field 'SeguimientodeCasos.xCommand' is never used
#pragma warning disable CS0169 // The field 'SeguimientodeCasos.xQuery' is never used
        private string xQuery;
#pragma warning restore CS0169 // The field 'SeguimientodeCasos.xQuery' is never used
        string ROWSGXID = "CAID-SD";
        string USERNAME;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                USERNAME = Request.QueryString["USUARIO"].ToString();
                ROWSGXID = Request.QueryString["LOCALIDAD"].ToString();

                this.xQueryParameters.Add((object)"@NOMBRE");
                this.xQueryValues.Add((object)"%");
                this.xQueryParameters.Add((object)"@ROWSGXID");
                this.xQueryValues.Add(ROWSGXID);
                this.DPPaciente.Items.Add(new ListItem("-- SELECCIONE --", string.Empty));
                foreach (DataRow row in (InternalDataCollectionBase)DB.ExecuteAdapter("PAX00000S1", this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure).Rows)
                    this.DPPaciente.Items.Add(new ListItem(row["FULLNAME"].ToString(), row["ROWGUID"].ToString()));
            }
        }
        protected void _Save(object sender, EventArgs e)
        {
            USERNAME = Request.QueryString["USUARIO"].ToString();
            ROWSGXID = Request.QueryString["LOCALIDAD"].ToString();
            
            if (DB.ExecuteNonQuery(string.Format("[PR_SeguimientoCasos] '{0}','{1}','{2}','{3}','{4}','{5}'", (object)DPPaciente.SelectedValue.ToString(), (object)txtcomentario.Text.ToString().Trim(), (object)USERNAME.ToString(), (object)ROWSGXID.ToString(), (object)Cmbviacontacto.Value.ToString(), (object)Cmbmotivo.Value.ToString())))
            {
                //VarValida = "Registro Guardado";
                //((Site_Master) this.Master)._Notify("Registro Guardado");
                //  this.Validar();
                if (DPPaciente.SelectedValue.ToString() != "")
                {
                    _buscaseguimientos(sender,e);
                    
                }
                limpiar();
                Notify("Registro Guardado", "success");
            }
            else
                //sm.Notify("No se pudo almacenar la informacion", "error");
                Notify("No se pudo almacenar la informacion", "error");
        }
        public void Notify(string msg, string tipo)
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "notify('" + msg + "','" + tipo + "');", true);
        }
        protected void _back(object sender, EventArgs e)
        {

            //ClientScript.RegisterStartupScript(typeof(Page), "closePage", "window.onunload = CloseWindow();", true);
            ClientScript.RegisterStartupScript(typeof(Page), "closePage", "javascript:history.back(-2)", true);
        }
        
            
        protected void _buscaseguimientos(object sender, EventArgs e)
        {
            if (DPPaciente.SelectedValue.ToString() != "")
            {
                ROWSGXID = Request.QueryString["LOCALIDAD"].ToString();

                this.xQueryParameters.Clear();
                this.xQueryValues.Clear();
                this.xQueryParameters.Add((object)"@RECORDID");
                this.xQueryValues.Add((object)DPPaciente.SelectedValue.ToString());
                this.xQueryParameters.Add((object)"@ROWSGXID");
                this.xQueryValues.Add((object)this.ROWSGXID);
                this.xQueryParameters.Add((object)"@USRNAME");
                this.xQueryValues.Add((object)"");
                this.xQueryParameters.Add((object)"@FECHA1");
                this.xQueryValues.Add((object)"07/27/1900");
                this.xQueryParameters.Add((object)"@FECHA2");
                this.xQueryValues.Add((object)"07/27/5000");

                this.xQuery = "PR_SEGUIMIENTOCASOSxPX";
                this.rpData.DataSource = (object)DB.ExecuteAdapter(this.xQuery, this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure);
                this.rpData.DataBind();
                if (this.rpData.Items.Count == 0)
                    return;
            }
            else
            {
                Notify("Debe especificar un paciente, verifique", "error");
            }
        }
        protected void limpiar()
        {
            DPPaciente.SelectedValue = string.Empty;
            Cmbviacontacto.Value = "";
            Cmbmotivo.Value = "";
            txtcomentario.Text = "";

        }
    }

 
}