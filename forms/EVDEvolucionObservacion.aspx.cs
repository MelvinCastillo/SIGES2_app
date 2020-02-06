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
    public partial class EVDEvolucionObservacion : System.Web.UI.Page
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


                /*INSERTO EN LA TABLA  EVD_EVALUACIONOBSERVACION_MAESTRO, EVD_EVALUACIONOBSERVACION_DETALLEPX 
                 y MUESTRO LA INFORMACION PARA SER MODIFICADA*/
                this.dtConsultaDatos = DB.ExecuteAdapter(string.Format("PR_EVD_EVALUACIONOBSERVACION_NUEVO  @PACIENTE = '{0}',  @USUARIO = '{1}', @CENTRO = '{2}', @COMENTARIOCOMUNICACION= '{3}', @COMENTARIOHABCOGNITIVAS= '{4}' , @COMENTARIOHABSOCIALES= '{5}', @COMENTARIOHABFISICAS= '{6}', @COMENTARIOSENSORIALESATIPICAS= '{7}', @COMENTARIOFUNCIONACONDUCTUAL= '{8}' ", (object)PACIENTE, (object)USUARIO, (object)CENTRO, txtComentariosComunicacion.Value, txtComentariosHabilidadescognitivas.Value, txtcomentariosHabilidadessociales.Value, txtcomentariosHabilidadesfisicas.Value, txtcomentariosRespuestassensorialesatipicas.Value, txtcomentariosFuncionamientoconductual.Value));
                this.Secuencia = dtConsultaDatos.Rows[0]["Secuencia"].ToString();
                Session.Add("StrSecuencia", Secuencia.ToString());
                this.rpevaluacion1.DataSource = (object)this.dtConsultaDatos;
                this.rpevaluacion1.DataBind(); 

                /* LLENO LOS CAMPOS DE LOS COMENTARIOS*/
                txtComentariosComunicacion.Value = dtConsultaDatos.Rows[0]["COMENTARIOCOMUNICACION"].ToString();
                txtcomentariosFuncionamientoconductual.Value = dtConsultaDatos.Rows[0]["COMENTARIOFUNCIONACONDUCTUAL"].ToString();
                txtComentariosHabilidadescognitivas.Value = dtConsultaDatos.Rows[0]["COMENTARIOHABCOGNITIVAS"].ToString();
                txtcomentariosHabilidadesfisicas.Value = dtConsultaDatos.Rows[0]["COMENTARIOHABFISICAS"].ToString();
                txtcomentariosHabilidadessociales.Value = dtConsultaDatos.Rows[0]["COMENTARIOHABSOCIALES"].ToString();
                txtcomentariosRespuestassensorialesatipicas.Value = dtConsultaDatos.Rows[0]["COMENTARIOSENSORIALESATIPICAS"].ToString();
 
                pnlData.Visible = true;
                pndetalleevaluacion.Visible = true; 
                pnlConsulta.Visible = false;
            }
        }

        protected void _Save(object sender, EventArgs e)
        {

            string PACIENTE = Request.QueryString["CurrentPAX_ROWGUID"].ToString();
            string CENTRO = Request.QueryString["XCURRENTUSR_SGXID"].ToString();
            string USUARIO = Request.QueryString["CurrentUSR_ROWGUID"].ToString();
            Secuencia = Session["StrSecuencia"].ToString();

            // Guardo el maestro de Actividades de aprendizaje de la vida diaria
            this.xQueryParameters.Add("@SECUENCIA");
            this.xQueryParameters.Add("@CODIGO");
            this.xQueryParameters.Add("@PACIENTE");
            this.xQueryParameters.Add("@DATO");
            this.xQueryParameters.Add("@USUARIO");
            this.xQueryParameters.Add("@CENTRO");
            this.xQueryParameters.Add("@OBSERVACION");
            this.xQueryParameters.Add("@COMENTARIOCOMUNICACION");
            this.xQueryParameters.Add("@COMENTARIOHABCOGNITIVAS");
            this.xQueryParameters.Add("@COMENTARIOHABSOCIALES");
            this.xQueryParameters.Add("@COMENTARIOHABFISICAS");
            this.xQueryParameters.Add("@COMENTARIOSENSORIALESATIPICAS");
            this.xQueryParameters.Add("@COMENTARIOFUNCIONACONDUCTUAL"); 


            foreach (RepeaterItem repeaterItem in this.rpevaluacion1.Items)
            {
                int num1 = 0;
                Label OBJCODIGO = (Label)repeaterItem.FindControl("lblCODIGO"); 
                DropDownList OBJDATO = (DropDownList)repeaterItem.FindControl("ddlDATO1");
                TextBox OBJObservacion = (TextBox)repeaterItem.FindControl("txtObservacion1");

                this.xQueryValues.Clear();
                this.xQueryValues.Add(Secuencia.ToString());
                this.xQueryValues.Add(OBJCODIGO.Text.ToString());
                this.xQueryValues.Add(PACIENTE.ToString());
                this.xQueryValues.Add(OBJDATO.SelectedValue);
                this.xQueryValues.Add(USUARIO.ToString());
                this.xQueryValues.Add(CENTRO.ToString());
                this.xQueryValues.Add(OBJObservacion.Text.ToString());
                this.xQueryValues.Add(txtComentariosComunicacion.Value);
                this.xQueryValues.Add(txtComentariosHabilidadescognitivas.Value);
                this.xQueryValues.Add(txtcomentariosHabilidadessociales.Value);
                this.xQueryValues.Add(txtcomentariosHabilidadesfisicas.Value);
                this.xQueryValues.Add(txtcomentariosRespuestassensorialesatipicas.Value);
                this.xQueryValues.Add(txtcomentariosFuncionamientoconductual.Value); 

                DataTable dataTable2 = DB.ExecuteAdapter("PR_EVD_EVALUACIONOBSERVACION_GUARDAR", this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure); if (dataTable2.Rows.Count != 0) ;

            }

            //busco nueva vez el historico
            _Buscar(sender, e);  
            pnlData.Visible = false; 
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
            this.xQuery = "PR_EVD_EVALUACIONOBSERVACIONBUSCA";
            DataTable dtEvaluacionCompleta = DB.ExecuteAdapter(this.xQuery, this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure);
            if (dtEvaluacionCompleta.Rows.Count > 0)
            {

                /* LLENO LOS CAMPOS DE LOS COMENTARIOS*/
                txtComentariosComunicacion.Value = dtEvaluacionCompleta.Rows[0]["COMENTARIOCOMUNICACION"].ToString();   
                txtcomentariosFuncionamientoconductual.Value = dtEvaluacionCompleta.Rows[0]["COMENTARIOFUNCIONACONDUCTUAL"].ToString();
                txtComentariosHabilidadescognitivas.Value = dtEvaluacionCompleta.Rows[0]["COMENTARIOHABCOGNITIVAS"].ToString();
                txtcomentariosHabilidadesfisicas.Value = dtEvaluacionCompleta.Rows[0]["COMENTARIOHABFISICAS"].ToString();
                txtcomentariosHabilidadessociales.Value = dtEvaluacionCompleta.Rows[0]["COMENTARIOHABSOCIALES"].ToString();
                txtcomentariosRespuestassensorialesatipicas.Value = dtEvaluacionCompleta.Rows[0]["COMENTARIOSENSORIALESATIPICAS"].ToString();

                rpevaluacion1.DataSource = dtEvaluacionCompleta;
                rpevaluacion1.DataBind(); 

                if (this.xCommand == "VerDetalle")
                {
                    pnlConsulta.Visible = false;
                    pnlData.Visible = true; 
                } 

            }
            else
            {
                txtComentariosComunicacion.Value = "";
                txtcomentariosFuncionamientoconductual.Value = "";
                txtComentariosHabilidadescognitivas.Value = "";
                txtcomentariosHabilidadesfisicas.Value = "";
                txtcomentariosHabilidadessociales.Value = "";
                txtcomentariosRespuestassensorialesatipicas.Value = "";

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

                DataTable dtconsulta = DB.ExecuteAdapter("PR_EVD_EVALUACIONOBSERVACION_HISTORICO", this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure);
                rpHistorico.DataSource = dtconsulta;
                rpHistorico.DataBind(); 
            }

        }
    }

}


