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
    public partial class DiagnosticoDefinitivo : System.Web.UI.Page
    {
        private ArrayList xQueryParameters = new ArrayList();
        private ArrayList xQueryValues = new ArrayList();
        private string xCommand;
        private string xQuery;
        string ROWSGXID = "CAID-SD";
        string USERNAME;
        string PACIENTE;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                if (Request != null && Request.QueryString["USUARIO"] != null)
                {
                    USERNAME = Request.QueryString["USUARIO"].ToString();
                }
                if (Request != null && Request.QueryString["LOCALIDAD"] != null)
                {
                    ROWSGXID = Request.QueryString["LOCALIDAD"].ToString();
                }
                if (Request != null && Request.QueryString["PACIENTE"] != null)
                {
                    PACIENTE = Request.QueryString["PACIENTE"].ToString();

                }

                //USERNAME = Request.QueryString["USUARIO"].ToString();
                //ROWSGXID = Request.QueryString["LOCALIDAD"].ToString();
                //PACIENTE = Request.QueryString["PACIENTE"].ToString();
                _FillDiagnosticos();

                this.xQueryParameters.Clear();
                this.xQueryValues.Clear(); //order by nombre 
                if (PACIENTE.ToString() != "")
                { 
                this.xQuery = "select *  FROM vpaciente where ROWGUID='" + PACIENTE + "' and rowsgxid='" + ROWSGXID + "'";
                DataTable dtpacientes = DB.ExecuteAdapter(string.Format(this.xQuery, this.xQueryValues, CommandType.Text));
                if (dtpacientes.Rows.Count > 0)
                {
                    txtNombrePaciente.Value = dtpacientes.Rows[0]["fullname"].ToString();
                    CmbDiagnostico1.SelectedValue = dtpacientes.Rows[0]["DIAGNOSTICO1"].ToString();
                    CmbDiagnostico2.SelectedValue = dtpacientes.Rows[0]["DIAGNOSTICO2"].ToString();
                    txtDiagnosticoOtros.Text = dtpacientes.Rows[0]["DiagnosticoOtros"].ToString();

                }
                else
                {
                    txtNombrePaciente.Value = "";
                    txtDiagnosticoOtros.Text = "";
                }

                }

            }
        }
        protected void _Save(object sender, EventArgs e)
        {
            USERNAME = Request.QueryString["USUARIO"].ToString();
            ROWSGXID = Request.QueryString["LOCALIDAD"].ToString();
            PACIENTE = Request.QueryString["PACIENTE"].ToString();

            if (DB.ExecuteNonQuery(string.Format("[PR_DiagnosticoInstitucionalGUARDAR] '{0}','{1}','{2}','{3}','{4}','{5}'", (object)PACIENTE.ToString(), CmbDiagnostico1.SelectedValue, CmbDiagnostico2.SelectedValue, (object)ROWSGXID.ToString(), (object)USERNAME.ToString(), txtDiagnosticoOtros.Text.ToString())))
                {
                    Notify("Registro Guardado", "success");
                //this.Response.Redirect("http://caidsiges01:8000/HCL00000.aspx?X=" + PACIENTE);
            }
            else
                
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
        //protected void Update_Click(object sender, EventArgs e)
        //{
        //    txtNombrePaciente.Value= "";
        //}

        //protected void timer1_Tick(object sender, EventArgs e)
        //{ 
        //    timer1.Enabled = false;  
        //    System.Threading.Thread.Sleep(3000); 
        //    //contentLabel.Text = "";
        //    //TextBox1.Text = DateTime.Now.ToString();
        //}

        protected void _buscaseguimientos(object sender, EventArgs e)
        {
            /*
            if (DPPaciente.SelectedValue.ToString() != "")
            {
                this.xQueryParameters.Clear();
                this.xQueryValues.Clear();
                this.xQueryParameters.Add((object)"@RECORDID");
                this.xQueryValues.Add((object)DPPaciente.SelectedValue.ToString());
                this.xQueryParameters.Add((object)"@ROWSGXID");
                this.xQueryValues.Add((object)this.ROWSGXID);
                this.xQueryParameters.Add((object)"@USRNAME");
                this.xQueryValues.Add((object)"%%");
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
            */
        }
        private void _FillDiagnosticos()
        {
            try
            {
                this.xQueryParameters.Clear();
                this.xQueryValues.Clear();
                this.CmbDiagnostico1.Items.Add(new ListItem("-- SELECCIONE --", string.Empty));
                foreach (DataRow row in (InternalDataCollectionBase)DB.ExecuteAdapter("SELECT * FROM vDiagnosticosInstitucionales", this.xQueryParameters, this.xQueryValues, CommandType.Text).Rows)
                {
                    this.CmbDiagnostico1.Items.Add(new ListItem(row["Nombre"].ToString(), row["Codigo"].ToString()));
                }
            }
            catch
            { }

            try
            {
                this.xQueryParameters.Clear();
                this.xQueryValues.Clear();
                this.xQueryParameters.Add((object)"@NOMBRE");
                this.xQueryValues.Add((object)"%%");
                this.xQueryParameters.Add((object)"@ROWSGXID");
                this.xQueryValues.Add((object)this.ROWSGXID);
                this.xQuery = "PAX00700S1";
                this.CmbDiagnostico2.Items.Add(new ListItem("-- SELECCIONE --", string.Empty));
                foreach (DataRow row in (InternalDataCollectionBase)DB.ExecuteAdapter(this.xQuery, this.xQueryParameters, this.xQueryValues, CommandType.Text).Rows)
                {
                    this.CmbDiagnostico2.Items.Add(new ListItem(row["Nombre"].ToString(), row["ROWGUID"].ToString()));
                }
            }
            catch
            { }


        }
    }
}