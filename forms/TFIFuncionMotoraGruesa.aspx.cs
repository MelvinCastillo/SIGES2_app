using System;
using System.Collections;
using System.Data;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using CAID.Data;


namespace CAID_V2.forms
{
    public partial class TFIFuncionMotoraGruesa : System.Web.UI.Page
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


        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                _Buscar(sender, e);
                //_Nuevo();
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
                dtusuarios = DB.ExecuteAdapter(string.Format("select NOMBRE,ROWGUID,ESPECIALIDADID from VUSUARIOS  where ROWGUID ='" + USUARIO.ToString() + "' and ROWSGXID ='" + CENTRO.ToString() + "'", this.xQueryValues, CommandType.Text));
                if (dtusuarios.Rows.Count != 0)
                {
                    txtNombreEvaluador.Value = dtusuarios.Rows[0]["NOMBRE"].ToString();
                }
                //GENERALES DEL PACIENTE  

                this.xQueryParameters.Clear();
                this.xQueryValues.Clear();
                this.xQueryParameters.Add("@GUID");
                this.xQueryValues.Add(PACIENTE.ToString());
                this.xQueryParameters.Add("@ROWSGXID");
                this.xQueryValues.Add(CENTRO.ToString());
                this.xQuery = "PAX00000S2";
                DataTable dtgeneralesPaciente = DB.ExecuteAdapter(this.xQuery, this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure);
                DataRow dataRowPaciente = dtgeneralesPaciente.Rows.Count != 0 ? dtgeneralesPaciente.Rows[0] : (DataRow)null;
                if (dataRowPaciente == null)
                    return;
                this.txtNombrePaciente.Value = dataRowPaciente["FULLNAME"].ToString();
                this.txtEdadCronologica.Value = dataRowPaciente["EDAD"].ToString();
                this.txtExpedienteNo.Value = dataRowPaciente["RECORDID"].ToString();
                this.txtFechanacimiento.Value = dataRowPaciente["FNACE"].ToString();

                //this.txtDiagnosticoPaciente.Value = dataRowPaciente["PREDIAGNOSTICODESCRIPCION"].ToString();

                /*INSERTO EN LA TABLA  [FuncionMotoraGruesa_M],[FuncionMotoraGruesa_D],[FuncionMotoraGruesaAsistenciaOrtesis_M]
                 y MUESTRO LA INFORMACION PARA SER MODIFICADA*/
                this.dtConsultaDatos = DB.ExecuteAdapter(string.Format("PR_FUNCTIONMOTORAGRUESANUEVO  @PACIENTE = '{0}', @ESPECIALISTAID = '{1}', @USUARIO = '{2}', @CENTRO = '{3}'", (object)PACIENTE, (object)ESPECIALISTAID, (object)USUARIO, (object)CENTRO));
                this.Secuencia = dtConsultaDatos.Rows[0]["Secuencia"].ToString();
                this.txtnoevaluacion.Value = Secuencia;
                this.txtfechaevaluacion.Value = dtConsultaDatos.Rows[0]["FECHA_DIGITACION"].ToString();
                Session.Add("StrSecuencia", Secuencia.ToString());
                this.rpevaluacion.DataSource = (object)this.dtConsultaDatos;
                this.rpevaluacion.DataBind();

                /* BUSCO LOS REGISTROS DE LA FuncionMotoraGruesaAsistenciaOrtesis_M PARA MOSTRAR */
                this.dtFMGAsistenciaOrtesis = DB.ExecuteAdapter(string.Format("PR_FUNCIONMOTORAGRUESAASISTENCIAORTESISBUSCA @SECUENCIA ={0},  @PACIENTE = '{1}', @ESPECIALISTAID = '{2}',  @CENTRO = '{3}'", (object)Secuencia, (object)PACIENTE, (object)ESPECIALISTAID, (object)CENTRO));
                this.rpevaluacionAsistenciaOrtesis.DataSource = (object)this.dtFMGAsistenciaOrtesis;
                this.rpevaluacionAsistenciaOrtesis.DataBind();

                pnlData.Visible = true;
                pndataasistenciaortesis.Visible = true;
                pndetalleevaluacion.Visible = true;
                PNGMFMRESUMENES.Visible = false;
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

            // Guardo el maestro y detalle de la evaluacion
            Int32 INTckpunto0 = 0;
            Int32 INTckpunto1 = 0;
            Int32 INTckpunto2 = 0;
            Int32 INTckpunto3 = 0;
            Int32 INTckpuntoNT = 0;

            Label OBJNT = new Label();
            CheckBox OBJckpunto0 = new CheckBox();
            CheckBox OBJckpunto1 = new CheckBox();
            CheckBox OBJckpunto2 = new CheckBox();
            CheckBox OBJckpunto3 = new CheckBox();
            CheckBox OBJckpuntoNT = new CheckBox();

            this.xQueryParameters.Add("@SECUENCIA");
            this.xQueryParameters.Add("@NT");
            this.xQueryParameters.Add("@PACIENTE");
            this.xQueryParameters.Add("@CENTRO");
            this.xQueryParameters.Add("@USUARIO");
            this.xQueryParameters.Add("@PUNTUACION0");
            this.xQueryParameters.Add("@PUNTUACION1");
            this.xQueryParameters.Add("@PUNTUACION2");
            this.xQueryParameters.Add("@PUNTUACION3");
            this.xQueryParameters.Add("@PUNTUACIONNT");
            this.xQueryParameters.Add("@NIVELGMFCS");
            this.xQueryParameters.Add("@CONDICIONESEVALUACION");
            this.xQueryParameters.Add("@EVALUACIONINDICATIVA");
            this.xQueryParameters.Add("@EVALUACIONINDICATIVACOMENTARIOS");
            this.xQueryParameters.Add("@INTERPRETACIONESFINALES");


            foreach (RepeaterItem repeaterItem in this.rpevaluacion.Items)
            {
                int num1 = 0;
                //TextBox OBJNT = (TextBox)repeaterItem.FindControl("txtPorcentaje");
                OBJNT = (Label)repeaterItem.FindControl("lblNT");
                OBJckpunto0 = (CheckBox)repeaterItem.FindControl("ckpunto0");
                if (OBJckpunto0.Checked == true)
                    INTckpunto0 = 1;
                else
                    INTckpunto0 = 0;

                OBJckpunto1 = (CheckBox)repeaterItem.FindControl("ckpunto1");
                if (OBJckpunto1.Checked == true)
                    INTckpunto1 = 1;
                else
                    INTckpunto1 = 0;

                OBJckpunto2 = (CheckBox)repeaterItem.FindControl("ckpunto2");
                if (OBJckpunto2.Checked == true)
                    INTckpunto2 = 1;
                else
                    INTckpunto2 = 0;

                OBJckpunto3 = (CheckBox)repeaterItem.FindControl("ckpunto3");
                if (OBJckpunto3.Checked == true)
                    INTckpunto3 = 1;
                else
                    INTckpunto3 = 0;

                OBJckpuntoNT = (CheckBox)repeaterItem.FindControl("ckpuntoNT");
                if (OBJckpuntoNT.Checked == true)
                    INTckpuntoNT = 1;
                else
                    INTckpuntoNT = 0;


                this.xQueryValues.Clear();
                this.xQueryValues.Add(Secuencia.ToString());
                this.xQueryValues.Add(OBJNT.Text.ToString());
                this.xQueryValues.Add(PACIENTE.ToString());
                this.xQueryValues.Add(CENTRO.ToString());
                this.xQueryValues.Add(USUARIO.ToString());
                this.xQueryValues.Add(INTckpunto0);
                this.xQueryValues.Add(INTckpunto1);
                this.xQueryValues.Add(INTckpunto2);
                this.xQueryValues.Add(INTckpunto3);
                this.xQueryValues.Add(INTckpuntoNT);
                this.xQueryValues.Add(ddlGMFCSNivel.SelectedValue);
                this.xQueryValues.Add(txtCondicionEvaluacion.Value);
                this.xQueryValues.Add(ddlEvaluacionIndicativaEjecucion.SelectedValue);
                this.xQueryValues.Add(txtcomentarioIndicativaEjecucion.Value);
                this.xQueryValues.Add(txtInterpretacionesFinales.Value);

                DataTable dataTable2 = DB.ExecuteAdapter("PR_FUNCTIONMOTORAGRUESAGUARDAR", this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure); if (dataTable2.Rows.Count != 0) ;

            }

            //guardo la evaluacion de ortesis
            // Guardo el maestro y detalle de la evaluacion de Asistencia Ortesis
            DataTable dtAsistenciaOrtesis;
            Int32 INTckpuntuacion = 0;

            Label OBJCodigo = new Label();
            TextBox OBJDimension = new TextBox();
            CheckBox OBJckpuntuacion = new CheckBox();

            this.xQueryParameters.Clear();
            this.xQueryParameters.Add("@SECUENCIA");
            this.xQueryParameters.Add("@ESPECIALISTAID");
            this.xQueryParameters.Add("@PACIENTE");
            this.xQueryParameters.Add("@CENTRO");
            this.xQueryParameters.Add("@evaluacioncodigo");
            this.xQueryParameters.Add("@dimension");
            this.xQueryParameters.Add("@puntuacion");
            

            foreach (RepeaterItem repeaterItemAsistenciaOrtesis in this.rpevaluacionAsistenciaOrtesis.Items)
            {
                OBJCodigo = (Label)repeaterItemAsistenciaOrtesis.FindControl("lblcodigo");
                OBJDimension = (TextBox)repeaterItemAsistenciaOrtesis.FindControl("txtdimensionOrtesis");
                if (OBJDimension.Text.ToString() == "")
                    OBJDimension.Text = "0";

                OBJckpuntuacion = (CheckBox)repeaterItemAsistenciaOrtesis.FindControl("ckpuntuacion");
                if (OBJckpuntuacion.Checked == true)
                    INTckpuntuacion = 1;
                else
                    INTckpuntuacion = 0;

                this.xQueryValues.Clear();
                this.xQueryValues.Add(Secuencia.ToString());
                this.xQueryValues.Add(USUARIO.ToString());
                this.xQueryValues.Add(PACIENTE.ToString());
                this.xQueryValues.Add(CENTRO.ToString());
                this.xQueryValues.Add(OBJCodigo.Text.ToString());
                this.xQueryValues.Add(OBJDimension.Text.ToString());
                this.xQueryValues.Add(INTckpuntuacion);
              

                dtAsistenciaOrtesis = DB.ExecuteAdapter("PR_FUNCIONMOTORAGRUESAASISTENCIAORTESISGUARDAR", this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure);
            }

            //busco nueva vez el historico
            _Buscar(sender, e);

            pnlConsulta.Visible = true;
            pnlData.Visible = false;
            pndataasistenciaortesis.Visible = false;
            PNGMFMRESUMENES.Visible = false;
           // PNGMFMAYUDASORTESIS.Visible = false;
        }

        protected void _Back(object sender, EventArgs e)
        {
            pnlConsulta.Visible = true;
            pnlData.Visible = false;
            pndataasistenciaortesis.Visible = false;
            PNGMFMRESUMENES.Visible = false;
            //PNGMFMAYUDASORTESIS.Visible = false;
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

                DataTable dtconsulta = DB.ExecuteAdapter("PR_FUNCTIONMOTORAGRUESAHISTORICO", this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure);
                rpHistorico.DataSource = dtconsulta;
                rpHistorico.DataBind();

            }

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
            this.xQuery = "PR_FUNCTIONMOTORAGRUESABUSCA";
            DataTable dtEvaluacionCompleta = DB.ExecuteAdapter(this.xQuery, this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure);
            if (dtEvaluacionCompleta.Rows.Count > 0)
            {
                txtNombrePaciente.Value = dtEvaluacionCompleta.Rows[0]["NOMBREPX"].ToString();
                txtFechanacimiento.Value = dtEvaluacionCompleta.Rows[0]["FNACE"].ToString();
                txtEdadCronologica.Value = dtEvaluacionCompleta.Rows[0]["EDAD"].ToString();
                txtCondicionEvaluacion.Value = dtEvaluacionCompleta.Rows[0]["CONDICIONESEVALUACION"].ToString();
                this.txtnoevaluacion.Value = dtEvaluacionCompleta.Rows[0]["SECUENCIA"].ToString();
                this.txtfechaevaluacion.Value = dtEvaluacionCompleta.Rows[0]["ROWCDTE"].ToString();

                txtExpedienteNo.Value = dtEvaluacionCompleta.Rows[0]["RECORDID"].ToString();
                ddlGMFCSNivel.SelectedValue = dtEvaluacionCompleta.Rows[0]["NIVELGMFCS"].ToString();
                txtNombreEvaluador.Value = dtEvaluacionCompleta.Rows[0]["NOMBRE_ESPECIALISTA"].ToString();
                ddlEvaluacionIndicativaEjecucion.SelectedValue = dtEvaluacionCompleta.Rows[0]["EVALUACIONINDICATIVA"].ToString();
                txtcomentarioIndicativaEjecucion.Value = dtEvaluacionCompleta.Rows[0]["EVALUACIONINDICATIVACOMENTARIOS"].ToString();
                txtInterpretacionesFinales.Value = dtEvaluacionCompleta.Rows[0]["INTERPRETACIONESFINALES"].ToString();
                rpevaluacion.DataSource = dtEvaluacionCompleta;
                rpevaluacion.DataBind();


                /* BUSCO LOS REGISTROS DE LA FuncionMotoraGruesaAsistenciaOrtesis_M PARA MOSTRAR */
                this.dtFMGAsistenciaOrtesis = DB.ExecuteAdapter(string.Format("PR_FUNCIONMOTORAGRUESAASISTENCIAORTESISBUSCA @SECUENCIA ={0},  @PACIENTE = '{1}', @ESPECIALISTAID = '{2}',  @CENTRO = '{3}'", (object)secuencia, (object)PACIENTE, (object)ESPECIALISTAID, (object)CENTRO));
                this.rpevaluacionAsistenciaOrtesis.DataSource = (object)this.dtFMGAsistenciaOrtesis;
                this.rpevaluacionAsistenciaOrtesis.DataBind();

                /* Busco los resumenes*/
                this.xQueryParameters.Clear();
                this.xQueryParameters.Add("SECUENCIA");
                this.xQueryParameters.Add("@CENTRO");

                this.xQueryValues.Clear();
                this.xQueryValues.Add(secuencia.ToString());
                this.xQueryValues.Add(CENTRO.ToString());

                DataTable dtconsultaFMGResumen88 = DB.ExecuteAdapter("PR_FUNCTIONMOTORAGRUESA_RESUMENES88BUSCA", this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure);
                rpGMFM88RESUMENES.DataSource = dtconsultaFMGResumen88;
                rpGMFM88RESUMENES.DataBind();


                if (this.xCommand == "VerDetalle")
                {
                    pnlConsulta.Visible = false;
                    pnlData.Visible = true;
                    pndetalleevaluacion.Visible = true;
                    PNGMFMRESUMENES.Visible = true;
                    pndataasistenciaortesis.Visible = true;
                    //PNGMFMAYUDASORTESIS.Visible = true; 
                }

                if (this.xCommand == "VerResumenes")
                {
                    pnlConsulta.Visible = false;
                    pnlData.Visible = true;
                    pndetalleevaluacion.Visible = false;
                    PNGMFMRESUMENES.Visible = true;
                    pndataasistenciaortesis.Visible = true;
                    //PNGMFMAYUDASORTESIS.Visible = true;
                }

            }

        }
        protected void _VerResumenes(object sender, EventArgs e)
        {
            PNGMFMRESUMENES.Visible = true;
            //PNGMFMAYUDASORTESIS.Visible = true;
            pndataasistenciaortesis.Visible = true;
            pnlConsulta.Visible = false;
            pndetalleevaluacion.Visible = false;
            //pnlData.Visible = false;

        }
    }


}
