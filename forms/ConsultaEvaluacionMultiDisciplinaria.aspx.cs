using CAID.Data;
using System;
using System.Collections;
using System.Data;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;


namespace CAID_V2.forms
{
    public partial class ConsultaEvaluacionMultiDisciplinaria : System.Web.UI.Page
    {
        private ArrayList xQueryParameters = new ArrayList();
        private ArrayList xQueryValues = new ArrayList();
        private string xCommand;
        private string xQuery;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.Page.IsPostBack)
            {
                string str1 = "";
                string str2 = "";
                string str3 = "";
                string str4 = "";

                if (Request != null && Request.QueryString["PACIENTE"] != null)
                {
                    str1 = Request.QueryString["PACIENTE"].ToString();
                }

                if (Request != null && Request.QueryString["ESPECIALIDAD"] != null)
                {
                    str2 = Request.QueryString["ESPECIALIDAD"].ToString();
                }

                if (Request != null && Request.QueryString["FECHA1"] != null)
                {
                    str3 = Request.QueryString["FECHA1"].ToString();
                }

                if (Request != null && Request.QueryString["FECHA2"] != null)
                {
                    str4 = Request.QueryString["FECHA2"].ToString();
                }

                // string str4 = Request.QueryString["FECHA2"].ToString();  //this.txtFecha2.Value.ToString();
                this.RPMultidisciplinaria.DataSource = (object)DB.ExecuteAdapter(string.Format("HCL00000R2 @REFGUID = '{0}', @ESPGUID\t='{1}', @FECHA1 = '{2}', @FECHA2 = '{3}', @NODO = 'MULTIDISCIPLINARIA'", (object)str1, (object)str2, (object)str3, (object)str4));
                this.RPMultidisciplinaria.DataBind();

            }

        }
    }
}