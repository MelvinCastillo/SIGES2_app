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
    public partial class EstadisticasCitasConfirmadasyAusentes : System.Web.UI.Page
    {
        private ArrayList xQueryParameters = new ArrayList();
        private ArrayList xQueryValues = new ArrayList(); 
        private string xCommand; 
        private string xQuery; 
        //string ROWSGXID = Request.QueryString["XCURRENTUSR_SGXID"].ToString();
        string USERNAME;

        public  string ROWSGXID
        {
            get
            {
                return Request.QueryString["XCURRENTUSR_SGXID"].ToString();
            }
            //get => Request.QueryString["XCURRENTUSR_SGXID"].ToString();
            set
            { }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                pndetallado1.Visible = false;
                pnresumen.Visible = false;
                USERNAME = Request.QueryString["x"].ToString();
                ROWSGXID = Request.QueryString["XCURRENTUSR_SGXID"].ToString();
                string strNombreespecialidad = "";
                string strIDespecialidad;


                /*Busca el usuario para filtrar su especialidad*/

                this.xQueryParameters.Clear();
                this.xQueryValues.Clear();
                this.xQuery = "select ESPECIALIDADID,nombreespecialidad  FROM VUSUARIOS where ROWGUID='" + (this.USERNAME.ToString()).ToUpper() + "' and rowsgxid='" + ROWSGXID + "'";
                DataTable dataTable = DB.ExecuteAdapter(this.xQuery, this.xQueryParameters, this.xQueryValues, CommandType.Text);
                DataRow dataRow = dataTable.Rows.Count != 0 ? dataTable.Rows[0] : (DataRow)null;
                if (dataRow == null)
                {
                    strNombreespecialidad = "%";
                    strIDespecialidad = "";
                    //return;
                }
                else
                { 
                        strNombreespecialidad = dataRow["nombreespecialidad"].ToString();
                        strIDespecialidad = dataRow["ESPECIALIDADID"].ToString();
                        ddespecialidad.SelectedValue = strIDespecialidad.ToString();

                    if (strNombreespecialidad == "")
                    {
                        strNombreespecialidad = "%";
                        strIDespecialidad = "%";
                    }

                }

                /*Busca el listado de las especialidades*/
                this.xQueryParameters.Clear();
                this.xQueryValues.Clear();
                this.xQueryParameters.Add((object)"@NOMBRE");
                this.xQueryValues.Add((object)strNombreespecialidad.ToString());
                this.xQueryParameters.Add((object)"@ROWSGXID");
                this.xQueryValues.Add(ROWSGXID);
                this.ddespecialidad.Items.Add(new ListItem("-- SELECCIONE --", string.Empty));
                foreach (DataRow row in (InternalDataCollectionBase)DB.ExecuteAdapter("SMX30014S1", this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure).Rows)
                    this.ddespecialidad.Items.Add(new ListItem(row["NOMBRE"].ToString(), row["ROWGUID"].ToString()));
                if (strNombreespecialidad.ToString() != "%")
                {
                    if (ddespecialidad.Items.Count > 0)
                        ddespecialidad.SelectedValue = strIDespecialidad.ToString();
                }


            }
        }
        protected void _Show(object sender, EventArgs e)
        {
            if (ddespecialidad.SelectedValue.ToString() != "")
            {

                this.xQueryParameters.Clear();
                this.xQueryValues.Clear();
                this.xQueryParameters.Add((object)"@TIPO");
                this.xQueryValues.Add((object)ddtiporeporte.SelectedValue.ToString());
                this.xQueryParameters.Add((object)"@ROWSGXID");
                this.xQueryValues.Add((object)this.ROWSGXID); 
                this.xQueryParameters.Add((object)"@FECHA1");
                this.xQueryValues.Add((object)txtDesde.Value.ToString());
                this.xQueryParameters.Add((object)"@FECHA2");
                this.xQueryValues.Add((object)txtHasta.Value.ToString());
                this.xQueryParameters.Add((object)"@ESPGUID");
                this.xQueryValues.Add((object)ddespecialidad.SelectedValue.ToString());

                this.xQuery = "PR_CITAS_CONFIRMADAS_Y_AUSENTE";
                pnresumen.Visible = false;
                pndetallado1.Visible = false;
                //REPORTE RESUMIDO
                if (ddtiporeporte.SelectedValue.ToString() == "R")
                {
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
                //REPORTE RESUMIDO
                if (ddtiporeporte.SelectedValue.ToString() == "D")
                {
                    this.rpdetallado.DataSource = (object)DB.ExecuteAdapter(this.xQuery, this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure);
                    this.rpdetallado.DataBind();
                    if (this.rpdetallado.Items.Count == 0)
                    {
                        pndetallado1.Visible = false;
                        return;
                    }
                    else
                        pndetallado1.Visible = true;
                }
                 
            }


        }
        protected void _BackMain(object sender, EventArgs e)
        {
            //if (ddespecialidad.Items.Count == 2)
            //{
            //    if (Request.QueryString["x"].ToString() != null)
            //        PACIENTE = Request.QueryString["x"].ToString();
            //    this.Response.Redirect("http://caidsiges01:8000/HCL00000.aspx?X=" + PACIENTE);
            //}
            //else
            this.Response.Redirect("http://caidsiges01:8000/INDEX.aspx");

        }
    }
}