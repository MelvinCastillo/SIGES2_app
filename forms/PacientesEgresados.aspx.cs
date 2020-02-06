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
    public partial class PacientesEgresados : System.Web.UI.Page
    {
        private ArrayList xQueryParameters = new ArrayList();
        private ArrayList xQueryValues = new ArrayList(); 
        private string xCommand; 
        private string xQuery;
        string ROWSGXID = "CAID-SD";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                _Show(sender, e);
            }
        }
        protected void _Show(object sender, EventArgs e)
        { 
            if (Request.QueryString.ToString().Length > 0)
            {
                if (Request.QueryString["ROWSGXID"].ToString() != null)
                {
                    ROWSGXID = Request.QueryString["ROWSGXID"].ToString();
                    if (ROWSGXID != "")
                    {
                        this.xQueryParameters.Clear();
                        this.xQueryValues.Clear();
                        this.xQueryParameters.Add((object)"@ROWSGXID");
                        this.xQueryValues.Add((object)this.ROWSGXID);
                        this.xQuery = "PR_PXEGRESADOS";
                        this.rpdetallado.DataSource = (object)DB.ExecuteAdapter(this.xQuery, this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure);
                        this.rpdetallado.DataBind();
                    }
                }
            }


        }
        protected void _BackMain(object sender, EventArgs e)
        { 
            this.Response.Redirect("http://caidsiges01:8000/INDEX.aspx");

        }
    }
}