using System;
using System.Collections;
using System.Data;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using CAID.Data;
using System.Collections.Generic;
using System.Web.Script.Services;
using System.Web.Services;



namespace CAID_V2.forms
{
    public partial class EvaluacionInicialABLLSST: System.Web.UI.Page
    {

        private ArrayList xQueryParameters = new ArrayList();
        private ArrayList xQueryValues = new ArrayList();
        private string xCommand;
        private string xQuery;
        string PACIENTE;
        string ESPECIALISTAID;
        string CENTRO;
        string USUARIO;
        string Secuencia;
        DataTable dtConsultaDatos = new DataTable();
        DataTable dtusuarios = new DataTable();
        DataTable dtFMGAsistenciaOrtesis = new DataTable();
        DataTable dtconsultaFMGResumen88 = new DataTable();
        //protected HiddenField xSecuencia;
        //protected HiddenField xCentro;
        //DataTable dtgraficosFINAL = new DataTable();
        private static DataTable dtgraficosFINAL;

        public static string StrSecuenciaGrafico
        {
            get
            {
                return StrCentroGrafico;
            }

            set
            { }
        }
        public static string StrCentroGrafico
        {
            get
            {
                return StrCentroGrafico;
            }

            set
            { }

        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                _Buscar(sender, e);
                // _Nuevo(sender, e);
            }
        }

        protected void _Nuevo(object sender, EventArgs e)
        {
            if (Request.QueryString["CurrentPAX_ROWGUID"] != null)
            {
                
                string PACIENTE = Request.QueryString["CurrentPAX_ROWGUID"].ToString();
                string ESPECIALISTAID = Request.QueryString["CurrentUSR_TERID"].ToString();
                string USUARIO = Request.QueryString["CurrentUSR_ROWGUID"].ToString();
                string CENTRO = Request.QueryString["XCURRENTUSR_SGXID"].ToString();
                
                /*HEADER*/
                this.RPPAXHEADER.DataSource = (object)DB.ExecuteAdapter(string.Format("PAX00000S5 @REFGUID = '{0}', @ROWSGXID = '{1}'", PACIENTE.ToString(), CENTRO.ToString()));
                this.RPPAXHEADER.DataBind();


                /*INSERTO EN LA TABLA  [FuncionMotoraGruesa_M],[FuncionMotoraGruesa_D],[FuncionMotoraGruesaAsistenciaOrtesis_M]
                 y MUESTRO LA INFORMACION PARA SER MODIFICADA*/
                this.dtConsultaDatos = DB.ExecuteAdapter(string.Format("PR_ST_EVALUACIONABLLS_NUEVO  @PACIENTE = '{0}',  @USUARIO = '{1}', @CENTRO = '{2}'", (object)PACIENTE, (object)USUARIO, (object)CENTRO));
                this.Secuencia = dtConsultaDatos.Rows[0]["Secuencia"].ToString();
                //this.txtnoevaluacion.Value = Secuencia;
                //this.txtfechaevaluacion.Value = dtConsultaDatos.Rows[0]["ROWCDTE"].ToString();
                Session.Add("StrSecuencia", Secuencia.ToString());
                this.rpevaluacion.DataSource = (object)this.dtConsultaDatos;
                this.rpevaluacion.DataBind();

                pnlData.Visible = true;
                pndetalleevaluacion.Visible = true;
                //PNGMFMAYUDASORTESIS.Visible = false;
                pnlConsulta.Visible = false;
            }
        }

        protected void _Save(object sender, EventArgs e)
        {

            string PACIENTE = Request.QueryString["CurrentPAX_ROWGUID"].ToString();
            string CENTRO = Request.QueryString["XCURRENTUSR_SGXID"].ToString();
            string USUARIO = Request.QueryString["CurrentUSR_ROWGUID"].ToString();
            Secuencia = Session["StrSecuencia"].ToString();

            // Guardo el maestro de Evalucion Inicial ABLLS Salon Tecnologico
            this.xQueryParameters.Clear();
            this.xQueryParameters.Add("@SECUENCIA");
            this.xQueryParameters.Add("@CODIGO");
            this.xQueryParameters.Add("@PACIENTE");
            this.xQueryParameters.Add("@DATO");
            this.xQueryParameters.Add("@USUARIO");
            this.xQueryParameters.Add("@CENTRO");
            this.xQueryParameters.Add("@OBSERVACION");
            this.xQueryParameters.Add("@CRITERIODATO");
            this.xQueryParameters.Add("@OTRASPRUEBASESTANDARIZADAS");
            this.xQueryParameters.Add("@OTRASCONDICIONESMEDICAS");
            this.xQueryParameters.Add("@CONDUCTASOBSERVADASDURANTEPRUEBA");



            foreach (RepeaterItem repeaterItem in this.rpevaluacion.Items)
            {
                int num1 = 0;
                Label OBJCODIGO = (Label)repeaterItem.FindControl("lblCODIGO");
                DropDownList OBJDATO = (DropDownList)repeaterItem.FindControl("ddlDATO");
                TextBox OBJObservacion = (TextBox)repeaterItem.FindControl("txtObservacion");

               // DropDownList OBJCRITERIODATO = (DropDownList)repeaterItem.FindControl("ddlCRITERIODATO");

                this.xQueryValues.Clear();
                this.xQueryValues.Add(Secuencia.ToString());
                this.xQueryValues.Add(OBJCODIGO.Text.ToString());
                this.xQueryValues.Add(PACIENTE.ToString());
                this.xQueryValues.Add(OBJDATO.SelectedValue);
                this.xQueryValues.Add(USUARIO.ToString());
                this.xQueryValues.Add(CENTRO.ToString());
                this.xQueryValues.Add(OBJObservacion.Text.ToString()); 
                this.xQueryValues.Add("");
                this.xQueryValues.Add(txtOTRASPRUEBASESTANDARIZADAS.Value.ToString());
                this.xQueryValues.Add(txtOTRASCONDICIONESMEDICAS.Value.ToString());
                this.xQueryValues.Add(txtCONDUCTASOBSERVADASDURANTEPRUEBA.Value.ToString());


                DataTable dataTable2 = DB.ExecuteAdapter("PR_ST_EVALUACIONABLLS_GUARDAR", this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure); if (dataTable2.Rows.Count != 0) ;

            }

            //busco nueva vez el historico
            _Buscar(sender, e); 
            //pnlData.Visible = false;
            pnlData.Visible = false;
           // pndetalleevaluacion.Visible = false;
            //PNGMFMAYUDASORTESIS.Visible = false;
            pnlConsulta.Visible = true;

        }

        protected void _Back(object sender, EventArgs e)
        {
            pnlData.Visible = false;
            pnlConsulta.Visible = true;
        }

        protected void _BackMain(object sender, EventArgs e)
        {
            if (Request.QueryString["CurrentPAX_ROWGUID"].ToString() != null)
                PACIENTE = Request.QueryString["CurrentPAX_ROWGUID"].ToString();
            this.Response.Redirect("http://caidsiges01:8000/HCL00000.aspx?X=" + PACIENTE);

        }

        public void Notify(string msg, string tipo)
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "notify('" + msg + "','" + tipo + "');", true);

        }
   
         protected void _VerDetalle(object sender, EventArgs e)
        {
            this.xCommand = ((LinkButton)sender).CommandName.ToString();

            string CENTRO = Request.QueryString["XCURRENTUSR_SGXID"].ToString();
            string secuencia = ((LinkButton)sender).CommandArgument.ToString();
            string PACIENTE = Request.QueryString["CurrentPAX_ROWGUID"].ToString();
            string ESPECIALISTAID = Request.QueryString["CurrentUSR_TERID"].ToString();

            Session.Add("StrSecuencia", secuencia.ToString());
            this.xQueryParameters.Clear();
            this.xQueryValues.Clear();

            this.xQueryParameters.Add((object)"@secuencia");
            this.xQueryValues.Add(secuencia);
            this.xQueryParameters.Add((object)"@centro");
            this.xQueryValues.Add(CENTRO);
            this.xQuery = "PR_ST_EVALUACIONABLLSBUSCA";
            DataTable dtEvaluacionCompleta = DB.ExecuteAdapter(this.xQuery, this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure);
            if (dtEvaluacionCompleta.Rows.Count > 0)
            {
                DataRow dtRowEvaluacionCompleta = dtEvaluacionCompleta.Rows[0];
                txtOTRASPRUEBASESTANDARIZADAS.Value = dtRowEvaluacionCompleta["OTRASPRUEBASESTANDARIZADAS"].ToString();
                txtOTRASCONDICIONESMEDICAS.Value = dtRowEvaluacionCompleta["OTRASCONDICIONESMEDICAS"].ToString();
                txtCONDUCTASOBSERVADASDURANTEPRUEBA.Value = dtRowEvaluacionCompleta["CONDUCTASOBSERVADASDURANTEPRUEBA"].ToString();
                PACIENTE = dtRowEvaluacionCompleta["PACIENTE"].ToString();
                CENTRO = dtRowEvaluacionCompleta["CENTRO"].ToString();

                rpevaluacion.DataSource = dtEvaluacionCompleta;
                rpevaluacion.DataBind();

                if (this.xCommand == "VerDetalle")
                {
                    /*HEADER*/
                    this.RPPAXHEADER.DataSource = (object)DB.ExecuteAdapter(string.Format("PAX00000S5 @REFGUID = '{0}', @ROWSGXID = '{1}'", PACIENTE.ToString(), CENTRO.ToString()));
                    this.RPPAXHEADER.DataBind();

                    pnlConsulta.Visible = false;
                    pnlData.Visible = true; 
                }
                 

            }

        } 
 

        public void _Buscar(object sender, EventArgs e)
        {
            if (Request.QueryString["CurrentPAX_ROWGUID"] != null)
            {
                // Int64 OBJNT = 0;
                string PACIENTE = Request.QueryString["CurrentPAX_ROWGUID"].ToString();
                string CENTRO = Request.QueryString["XCURRENTUSR_SGXID"].ToString();

                this.xQueryParameters.Clear();
                this.xQueryParameters.Add("@PACIENTE");
                this.xQueryParameters.Add("@CENTRO");

                this.xQueryValues.Clear();
                this.xQueryValues.Add(PACIENTE.ToString());
                this.xQueryValues.Add(CENTRO.ToString());

                DataTable dtconsulta = DB.ExecuteAdapter("PR_ST_EVALUACIONABLLS_HISTORICO", this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure);
                rpHistorico.DataSource = dtconsulta;
                rpHistorico.DataBind(); 
            }

        }
    }

}


