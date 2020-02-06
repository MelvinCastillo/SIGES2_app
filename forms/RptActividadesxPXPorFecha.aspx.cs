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
    public partial class RptActividadesxPXPorFecha : System.Web.UI.Page
    {
        private ArrayList xQueryParameters = new ArrayList();
        private ArrayList xQueryValues = new ArrayList(); 
        private string xCommand; 
        private string xQuery; 
        string ROWSGXID = "CAID-SD";
        string USERNAME;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                USERNAME = Request.QueryString["USUARIO"].ToString();
                ROWSGXID = Request.QueryString["LOCALIDAD"].ToString();
            }
        }
        protected void _Show(object sender, EventArgs e)
        { 
            USERNAME = Request.QueryString["USUARIO"].ToString();
            ROWSGXID = Request.QueryString["LOCALIDAD"].ToString();

                this.Session.Add("REPORT_URL", (object)"~/reports/RPTACTIVIDAESXPXPORFECHAS.rpt");
                //this.Session.Add("REPORT_DATASOURCE", (object)string.Format("[FTX00000R2] @FECHA1 = '{0}', @FECHA2 = '{1}',@ROWSGXID = '{2}',@RECORD = '{3}',@USRID = '{4}'", (object)this.FECHA1, (object)this.FECHA2, (object)this.ROWSGXID, (object)this.RECORD, (object)this.ROWSGXID));
                this.Session.Add("REPORT_DATASOURCE", (object)string.Format("PR_PACIENTESxACTIVIDADESPORFECHAS   @ROWSGXID = '{0}',@USRNAME = '{1}',@FECHA1 = '{2}',@FECHA2 = '{3}'",   (object)ROWSGXID.ToString(), (object)USERNAME.ToString(), (object)this.txtDesde.Value.ToString(), (object)this.txtHasta.Value.ToString()));
             
                this.Response.Write("<script>");
                this.Response.Write("window.open('PREVIEW.aspx','_blank', 'toolbar=yes,scrollbars=yes,resizable=yes,top=100,left=500,width=800,height=600')");
                this.Response.Write("</script>");
          
             
    }

    }
}