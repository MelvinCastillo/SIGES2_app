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
    public partial class RPTSEGUIMIENTOCASOS : System.Web.UI.Page
    {
        private ArrayList xQueryParameters = new ArrayList();
        private ArrayList xQueryValues = new ArrayList();
#pragma warning disable CS0169 // The field 'RPTSEGUIMIENTOCASOS.xCommand' is never used
#pragma warning disable CS0169 // The field 'RPTSEGUIMIENTOCASOS.xCommand' is never used
#pragma warning disable CS0169 // The field 'RPTSEGUIMIENTOCASOS.xQuery' is never used
        private string xCommand;
#pragma warning restore CS0169 // The field 'RPTSEGUIMIENTOCASOS.xCommand' is never used
#pragma warning restore CS0169 // The field 'RPTSEGUIMIENTOCASOS.xQuery' is never used
#pragma warning restore CS0169 // The field 'RPTSEGUIMIENTOCASOS.xCommand' is never used
#pragma warning disable CS0169 // The field 'RPTSEGUIMIENTOCASOS.xQuery' is never used
        private string xQuery;
#pragma warning restore CS0169 // The field 'RPTSEGUIMIENTOCASOS.xQuery' is never used
        string ROWSGXID = "CAID-SD";
        string USERNAME;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                USERNAME = Request.QueryString["USUARIO"].ToString();
                ROWSGXID = Request.QueryString["LOCALIDAD"].ToString();
                /*Busca el listado de los paciente*/
                this.xQueryParameters.Clear();
                this.xQueryValues.Clear();
                this.xQueryParameters.Add((object)"@NOMBRE");
                this.xQueryValues.Add((object)"%");
                this.xQueryParameters.Add((object)"@ROWSGXID");
                this.xQueryValues.Add(ROWSGXID);
                this.DPPaciente.Items.Add(new ListItem("-- SELECCIONE --", string.Empty));
                foreach (DataRow row in (InternalDataCollectionBase)DB.ExecuteAdapter("PAX00000S1", this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure).Rows)
                    this.DPPaciente.Items.Add(new ListItem(row["FULLNAME"].ToString(), row["ROWGUID"].ToString()));
                /*Busca el listado de los agentes sociales*/
                this.xQueryParameters.Clear();
                this.xQueryValues.Clear();
                this.xQueryParameters.Add((object)"@NOMBRE");
                this.xQueryValues.Add((object)"%");
                this.xQueryParameters.Add((object)"@ROWSGXID");
                this.xQueryValues.Add(ROWSGXID);
                this.dpagentesocial.Items.Add(new ListItem("-- SELECCIONE --", string.Empty));
                foreach (DataRow row in (InternalDataCollectionBase)DB.ExecuteAdapter("SGX00100S1", this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure).Rows)
                    this.dpagentesocial.Items.Add(new ListItem(row["NOMBRE"].ToString(), row["ROWGUID"].ToString()));
            }
        }
        protected void _Show(object sender, EventArgs e)
        {
            //this.xQueryParameters.Add((object)"@FECHA1");
            //this.xQueryValues.Add((object)this.txtDesde.Value.ToString());
            //this.xQueryParameters.Add((object)"@FECHA2");
            //this.xQueryValues.Add((object)this.txtHasta.Value.ToString());
            //this.xQueryParameters.Add((object)"@ROWSGXID");
            //this.xQueryValues.Add((object)ROWSGXID.ToString());
            //this.xQueryParameters.Add((object)"@RECORDID");
            //this.xQueryValues.Add((object)this.DPPaciente.SelectedValue.ToString());
            //this.xQueryParameters.Add((object)"@USRNAME");
            //this.xQueryValues.Add((object)"ADMINISTRADOR");
            USERNAME = dpagentesocial.SelectedValue.ToString();
            ROWSGXID = Request.QueryString["LOCALIDAD"].ToString();

            this.Session.Add("REPORT_URL", (object)"~/reports/RPTSEGUIMIENTOCASOS.rpt");
                //this.Session.Add("REPORT_DATASOURCE", (object)string.Format("[FTX00000R2] @FECHA1 = '{0}', @FECHA2 = '{1}',@ROWSGXID = '{2}',@RECORD = '{3}',@USRID = '{4}'", (object)this.FECHA1, (object)this.FECHA2, (object)this.ROWSGXID, (object)this.RECORD, (object)this.ROWSGXID));
            this.Session.Add("REPORT_DATASOURCE", (object)string.Format("PR_SEGUIMIENTOCASOSxPX @RECORDID = '{0}', @ROWSGXID = '{1}',@USRNAME = '{2}',@FECHA1 = '{3}',@FECHA2 = '{4}'", (object)this.DPPaciente.SelectedValue.ToString(), (object)ROWSGXID.ToString(), (object)USERNAME.ToString(), (object)this.txtDesde.Value.ToString(), (object)this.txtHasta.Value.ToString()));
             
                this.Response.Write("<script>");
                this.Response.Write("window.open('PREVIEW.aspx','_blank', 'toolbar=yes,scrollbars=yes,resizable=yes,top=100,left=500,width=800,height=600')");
                this.Response.Write("</script>");
          
             
    }

    }
}