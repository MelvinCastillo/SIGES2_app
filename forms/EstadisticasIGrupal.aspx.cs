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
    public partial class EstadisticasIGrupal : System.Web.UI.Page
    {
        private ArrayList xQueryParameters = new ArrayList();
        private ArrayList xQueryValues = new ArrayList();
        private string xCommand;
        private string xQuery;
        //string ROWSGXID = "";
        string USERNAME;

        private string ROWSGXID
        {
            get
            {
                if (Request.QueryString["ROWSGXID"] != null)
                {
                    Session.Add("ROWSGXID", Request.QueryString["ROWSGXID"].ToString());
                }

                return this.Session["ROWSGXID"].ToString();
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void _Show(object sender, EventArgs e)
        {
            this.xQueryParameters.Clear();
            this.xQueryValues.Clear();
            this.xQueryParameters.Add((object)"@FechaInicio");
            this.xQueryValues.Add((object)txtDesde.Value.ToString());
            this.xQueryParameters.Add((object)"@FechaHasta");
            this.xQueryValues.Add((object)txtHasta.Value.ToString());
            this.xQueryParameters.Add((object)"@ROWSGXID");
            this.xQueryValues.Add((object)this.ROWSGXID);
            this.xQuery = "PR_IG_EstadisticasActividadesPorFecha";
            pnresumen.Visible = false;

            //REPORTE 
            this.rpresumido.DataSource = (object)DB.ExecuteAdapter(this.xQuery, this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure);
            this.rpresumido.DataBind();
            if (this.rpresumido.Items.Count == 0)
            {
                pnresumen.Visible = false;
                return;
            }
            else
                pnresumen.Visible = true;
        }
        protected void _Back(object sender, EventArgs e)
        {
            this.Response.Redirect("http://caidsiges01:8000/INDEX.aspx");
        }
    }
} 