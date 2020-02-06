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
    public partial class ODP_ConsultaAlertas : System.Web.UI.Page
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
                ROWSGXID = Request.QueryString["CURRENTUSR_SGXID"].ToString();
                this.xQueryParameters.Add((object)"@ROWSGXID");
                this.xQueryValues.Add(ROWSGXID); 
                DataTable data = DB.ExecuteAdapter("PR_ODPMaestro_AlertasTODAS", this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure);
                if (data.Rows.Count != 0)
                {
                    rpData.DataSource = data;
                    rpData.DataBind();
                }
            }
        }  
        protected void _Back(object sender, EventArgs e)
        {
            this.Response.Redirect("http://caidsiges01:8000/index.aspx");
        }
 
    }

 
}