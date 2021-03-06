﻿using System;
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
    public partial class FWeeFIM : System.Web.UI.Page
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
                if (Convert.ToUInt64(dataRowPaciente["EdadMeses"]) > 96)
                {
                    Notify("ESTE PACIENTE NO APLICA PARA LA PRUEBA PORQUE TIENE MAS DE 8 AÑOS", "error");
                    return;
                }
                this.txtNombrePaciente.Value = dataRowPaciente["FULLNAME"].ToString();
                this.txtEdadCronologica.Value = dataRowPaciente["EDAD"].ToString();
                this.txtExpedienteNo.Value = dataRowPaciente["RECORDID"].ToString();
                this.txtFechanacimiento.Value = dataRowPaciente["FNACE"].ToString();

                //this.txtDiagnosticoPaciente.Value = dataRowPaciente["PREDIAGNOSTICODESCRIPCION"].ToString();

                /*INSERTO EN LA TABLA  [FuncionMotoraGruesa_M],[FuncionMotoraGruesa_D],[FuncionMotoraGruesaAsistenciaOrtesis_M]
                 y MUESTRO LA INFORMACION PARA SER MODIFICADA*/
                this.dtConsultaDatos = DB.ExecuteAdapter(string.Format("PR_WEEFIMNUEVO  @PACIENTE = '{0}', @ESPECIALISTAID = '{1}', @USUARIO = '{2}', @CENTRO = '{3}'", (object)PACIENTE, (object)ESPECIALISTAID, (object)USUARIO, (object)CENTRO));
                this.Secuencia = dtConsultaDatos.Rows[0]["Secuencia"].ToString();
                this.txtnoevaluacion.Value = Secuencia;
                this.txtfechaevaluacion.Value = dtConsultaDatos.Rows[0]["FECHA_DIGITACION"].ToString();
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

            // Guardo el maestro y detalle de la evaluacion WEEFIM 
            this.xQueryParameters.Add("@SECUENCIA");
            this.xQueryParameters.Add("@AREA");
            this.xQueryParameters.Add("@PACIENTE");
            this.xQueryParameters.Add("@CENTRO");
            this.xQueryParameters.Add("@USUARIO");
            this.xQueryParameters.Add("@METODOADMINISTRACION");
            this.xQueryParameters.Add("@ENTREVISTACONOTROS");
            this.xQueryParameters.Add("@LESION");
            this.xQueryParameters.Add("@PUNTUACION");
            this.xQueryParameters.Add("@VALORESNORMALES");
            this.xQueryParameters.Add("@RAZONPUNTUACION");
            this.xQueryParameters.Add("@DEBIDOALESION");
            this.xQueryParameters.Add("@INTERPRETACIONESFINALES");


            foreach (RepeaterItem repeaterItem in this.rpevaluacion.Items)
            {
                int num1 = 0;
                Label OBJArea = (Label)repeaterItem.FindControl("lblAREA");
                TextBox OBJPuntuacion = (TextBox)repeaterItem.FindControl("txtpuntuacion");
                TextBox OBJValoresNormales = (TextBox)repeaterItem.FindControl("txtvaloresnormales");
                TextBox OBJRazonPuntuacion = (TextBox)repeaterItem.FindControl("txtRazonPuntuacion");
                DropDownList OBJDebidoLesion = (DropDownList)repeaterItem.FindControl("ddlDebidoLesion");

                this.xQueryValues.Clear();
                this.xQueryValues.Add(Secuencia.ToString());
                this.xQueryValues.Add(OBJArea.Text.ToString());
                this.xQueryValues.Add(PACIENTE.ToString());
                this.xQueryValues.Add(CENTRO.ToString());
                this.xQueryValues.Add(USUARIO.ToString());
                this.xQueryValues.Add(ddlMetodoAdministracion.SelectedValue);
                this.xQueryValues.Add(txtEntrevistaConOtros.Text.ToString());
                this.xQueryValues.Add(ddlLesion.SelectedValue);
                this.xQueryValues.Add(OBJPuntuacion.Text.ToString());
                this.xQueryValues.Add(OBJValoresNormales.Text.ToString());
                this.xQueryValues.Add(OBJRazonPuntuacion.Text.ToString());
                this.xQueryValues.Add(OBJDebidoLesion.SelectedValue);
                this.xQueryValues.Add(txtInterpretacionesFinales.Value);

                DataTable dataTable2 = DB.ExecuteAdapter("PR_WEEFIMGUARDAR", this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure); if (dataTable2.Rows.Count != 0) ;

            }

            //busco nueva vez el historico
            _Buscar(sender, e);

            pnlConsulta.Visible = true;
            pnlData.Visible = false;
            if (PNWEEFIMGRAFICOS.Visible == false)
            {
                dtgraficosFINAL = DtGrafico(Secuencia.ToString(), CENTRO.ToString());
                ResultadoGrafico();
                PNWEEFIMGRAFICOS.Visible = true;
            }
        }

        protected void _Back(object sender, EventArgs e)
        {
            pnlConsulta.Visible = true;
            pnlData.Visible = false;
            PNWEEFIMGRAFICOS.Visible = false;
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
            if (tipo == "error")
            {
                return;
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

                DataTable dtconsulta = DB.ExecuteAdapter("PR_WEEFIMHISTORICO", this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure);
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
            this.xQuery = "PR_WEEFIMBUSCA";
            DataTable dtEvaluacionCompleta = DB.ExecuteAdapter(this.xQuery, this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure);
            if (dtEvaluacionCompleta.Rows.Count > 0)
            {
                txtNombrePaciente.Value = dtEvaluacionCompleta.Rows[0]["NOMBREPX"].ToString();
                txtFechanacimiento.Value = dtEvaluacionCompleta.Rows[0]["FNACE"].ToString();
                txtEdadCronologica.Value = dtEvaluacionCompleta.Rows[0]["EDAD"].ToString();
                //txtCondicionEvaluacion.Value = dtEvaluacionCompleta.Rows[0]["CONDICIONESEVALUACION"].ToString();
                this.txtnoevaluacion.Value = dtEvaluacionCompleta.Rows[0]["SECUENCIA"].ToString();
                this.txtfechaevaluacion.Value = dtEvaluacionCompleta.Rows[0]["ROWCDTE"].ToString();

                txtExpedienteNo.Value = dtEvaluacionCompleta.Rows[0]["RECORDID"].ToString();
                //ddlGMFCSNivel.SelectedValue = dtEvaluacionCompleta.Rows[0]["NIVELGMFCS"].ToString();
                txtNombreEvaluador.Value = dtEvaluacionCompleta.Rows[0]["NOMBRE_ESPECIALISTA"].ToString();
                //ddlEvaluacionIndicativaEjecucion.SelectedValue = dtEvaluacionCompleta.Rows[0]["EVALUACIONINDICATIVA"].ToString();
                //txtcomentarioIndicativaEjecucion.Value = dtEvaluacionCompleta.Rows[0]["EVALUACIONINDICATIVACOMENTARIOS"].ToString();
                txtInterpretacionesFinales.Value = dtEvaluacionCompleta.Rows[0]["INTERPRETACIONESFINALES"].ToString();
                rpevaluacion.DataSource = dtEvaluacionCompleta;
                rpevaluacion.DataBind();

                /* Busco los resumenes*/
                this.xQueryParameters.Clear();
                this.xQueryParameters.Add("SECUENCIA");
                this.xQueryParameters.Add("@CENTRO");

                this.xQueryValues.Clear();
                this.xQueryValues.Add(secuencia.ToString());
                this.xQueryValues.Add(CENTRO.ToString());


                if (this.xCommand == "VerDetalle")
                {
                    pnlConsulta.Visible = false;
                    pnlData.Visible = true;
                    pndetalleevaluacion.Visible = true;
                    dtgraficosFINAL = DtGrafico(secuencia.ToString(), CENTRO.ToString());
                    //StrSecuenciaGrafico = secuencia.ToString();
                    //StrCentroGrafico = CENTRO.ToString();
                    //ResultadoGrafico(); 
                    PNWEEFIMGRAFICOS.Visible = true;
                    //PNGMFMAYUDASORTESIS.Visible = true; 
                }

                if (this.xCommand == "VerResumenes")
                {
                    pnlConsulta.Visible = false;
                    pnlData.Visible = true;
                    pndetalleevaluacion.Visible = false;
                    //PNGMFMAYUDASORTESIS.Visible = true;
                }

            }

        }
        protected void _VerResumenes(object sender, EventArgs e)
        {
            pnlConsulta.Visible = false;
            pndetalleevaluacion.Visible = false;
            //pnlData.Visible = false;

        }

        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        [WebMethod]
        public static List<FWeeFIM.Graficos> ResultadoGrafico()
        {
            return FWeeFIM.Graficos.GetAll();
        }
        public class Graficos
        {
            public string ValorX { get; set; }
            public string Texto { get; set; }
            public int Valor1 { get; set; }
            public int Valor2 { get; set; }

            public static List<FWeeFIM.Graficos> GetAll()
            {

                /*ArrayList xQueryParameters = new ArrayList();
                ArrayList xQueryValues = new ArrayList(); 
                xQueryParameters.Clear();
                xQueryParameters.Add("@SECUENCIA");
                xQueryParameters.Add("@CENTRO");

                xQueryValues.Clear();
                xQueryValues.Add(StrSecuenciaGrafico.ToString());
                xQueryValues.Add(StrCentroGrafico.ToString());
                */
                //xQueryValues.Add("1");
                //xQueryValues.Add("CAID-SD");


                // DataTable dtgraficos = DB.ExecuteAdapter(string.Format("PR_WEEFIMBUSCA @SECUENCIA ='{0}', @CENTRO = '{1}'", (object)Sec, CENTRO2));
                DataTable dtgraficos = dtgraficosFINAL; //DB.ExecuteAdapter("PR_WEEFIMBUSCA", xQueryParameters, xQueryValues, CommandType.StoredProcedure);
                List<FWeeFIM.Graficos> OBJResultadoGrafico = new List<FWeeFIM.Graficos>();
                foreach (DataRow row in (InternalDataCollectionBase)dtgraficos.Rows)
                    OBJResultadoGrafico.Add(new FWeeFIM.Graficos()
                    {
                        ValorX = row["NO"].ToString(),
                        Texto = row["ACTIVIDAD"].ToString(),
                        Valor1 = Convert.ToInt32(row["PUNTUACION"].ToString()),
                        Valor2 = Convert.ToInt32(row["VALORESNORMALES"].ToString())
                    });
                return OBJResultadoGrafico;
            }
        }

        public DataTable DtGrafico(string secuencia, string centro)
        {
            xQueryParameters.Clear();
            xQueryParameters.Add("@SECUENCIA");
            xQueryParameters.Add("@CENTRO");
            xQueryValues.Clear();
            xQueryValues.Add(secuencia.ToString());
            xQueryValues.Add(centro.ToString());
            DataTable dtgraficos = DB.ExecuteAdapter("PR_WEEFIMBUSCA", xQueryParameters, xQueryValues, CommandType.StoredProcedure);
            return dtgraficos;
        }
    }

}


