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
using CAID_V2;

namespace CAID_V2.forms
{
    public partial class FacturacionSubsidiados : System.Web.UI.Page
    {
        private ArrayList xQueryParameters = new ArrayList();
        private ArrayList xQueryValues = new ArrayList(); 
        private string xCommand; 
        private string xQuery; 
        string ROWSGXID = "CAID-SD";
        string USERNAME;
        DataTable dtconsulta = new DataTable();

        protected void Page_Load(object sender, EventArgs e)
        {

           

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
        protected void _busca(object sender, EventArgs e)
        {

            //USERNAME = Request.QueryString["USUARIO"].ToString();
            ROWSGXID = Request.QueryString["LOCALIDAD"].ToString();
 
                this.xQueryParameters.Clear();
                this.xQueryValues.Clear(); 
                this.xQueryParameters.Add((object)"@ROWSGXID");
                this.xQueryValues.Add((object)this.ROWSGXID); 
                this.xQueryParameters.Add((object)"@FECHA1");
                this.xQueryValues.Add(Convert.ToDateTime(txtDesde.Value));
                this.xQueryParameters.Add((object)"@FECHA2");
                this.xQueryValues.Add(Convert.ToDateTime(txtHasta.Value));

                this.xQuery = "PR_FACTURACIONPORSUBSIDIO";
            dtconsulta = DB.ExecuteAdapter(this.xQuery, this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure);

            this.rpData.DataSource = dtconsulta;
                this.rpData.DataBind();
                if (this.rpData.Items.Count == 0)
                    return; 
            //Comunes.ExportToExcel(this, dtconsulta, @"DiagnosticoxRangodeEdades.xls"); //C:\Users\user\Downloads\
        }
        protected void _exportar(object sender, EventArgs e)
        {

            //USERNAME = Request.QueryString["USUARIO"].ToString();
            ROWSGXID = Request.QueryString["LOCALIDAD"].ToString();

            this.xQueryParameters.Clear();
            this.xQueryValues.Clear();
            this.xQueryParameters.Add((object)"@ROWSGXID");
            this.xQueryValues.Add((object)this.ROWSGXID);
            this.xQueryParameters.Add((object)"@FECHA1");
            this.xQueryValues.Add(Convert.ToDateTime(txtDesde.Value));
            this.xQueryParameters.Add((object)"@FECHA2");
            this.xQueryValues.Add(Convert.ToDateTime(txtHasta.Value));

            this.xQuery = "PR_FACTURACIONPORSUBSIDIO";
            dtconsulta = DB.ExecuteAdapter(this.xQuery, this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure);

            if (dtconsulta.Rows.Count !=0)
            {
             this.rpData.DataSource = dtconsulta;
             this.rpData.DataBind(); 
             Comunes.ExportToExcel(this, dtconsulta, @"FacturacionPxSubsidiados.xls"); //C:\Users\user\Downloads\
            }
        }


        protected void rpData_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
           /*
            if (e.Item.ItemType == ListItemType.Header)
            {
                Repeater headerRepeater = e.Item.FindControl("Header1") as Repeater;
                headerRepeater.DataSource = dtconsulta.Columns;
                headerRepeater.DataBind();
            }

            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                Repeater columnRepeater = e.Item.FindControl("Item1") as Repeater;
                var row = e.Item.DataItem as System.Data.DataRowView;
                columnRepeater.DataSource = row.Row.ItemArray;
                columnRepeater.DataBind();
            }
            */
        }

        protected void _BackMain(object sender, EventArgs e)
        { 
            this.Response.Redirect("http://localhost:8000/index.aspx" );

        }
    }

 
}