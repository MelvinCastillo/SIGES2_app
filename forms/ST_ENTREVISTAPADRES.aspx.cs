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
    public partial class ST_ENTREVISTAPADRES : System.Web.UI.Page
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

                //GENERALES DEL PACIENTE   
                this.xQueryParameters.Clear();
                this.xQueryValues.Clear();
                this.xQueryParameters.Add("@ROWGUID");
                this.xQueryValues.Add(PACIENTE.ToString());
                this.xQueryParameters.Add("@ROWSGXID");
                this.xQueryValues.Add(CENTRO.ToString());
                this.xQuery = "PR_PAXGENERALES";
                DataTable dtgeneralesPaciente = DB.ExecuteAdapter(this.xQuery, this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure);

                DataRow dataRowPaciente = dtgeneralesPaciente.Rows.Count != 0 ? dtgeneralesPaciente.Rows[0] : (DataRow)null;
                if (dataRowPaciente != null)
                {
                    this.txtCentroeducativo.Value = dataRowPaciente["CENTROEDUCATIVO"].ToString();
                    this.txtNivelAcademico.Value = dataRowPaciente["GRADO"].ToString();
                }

                /*BUSCO NUCLEO FAMILIAR */
                this.xQueryParameters.Clear();
                this.xQueryValues.Clear();
                this.xQueryParameters.Add((object)"@REFGUID");
                this.xQueryValues.Add((object)PACIENTE.ToString());
                this.xQueryParameters.Add((object)"@ROWSGXID");
                this.xQueryValues.Add((object)CENTRO.ToString());
                this.rpNucleoFamiliar.DataSource = (object)DB.ExecuteAdapter("PAX00001S3", this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure);
                this.rpNucleoFamiliar.DataBind();

                /*HEADER*/
                this.RPPAXHEADER.DataSource = (object)DB.ExecuteAdapter(string.Format("PAX00000S5 @REFGUID = '{0}', @ROWSGXID = '{1}'", PACIENTE.ToString(), CENTRO.ToString()));
                this.RPPAXHEADER.DataBind();


                /*INSERTO EN LA TABLA  [FuncionMotoraGruesa_M],[FuncionMotoraGruesa_D],[FuncionMotoraGruesaAsistenciaOrtesis_M]
                 y MUESTRO LA INFORMACION PARA SER MODIFICADA*/
                this.dtConsultaDatos = DB.ExecuteAdapter(string.Format("PR_ST_ENTREVISTAPADRES_NUEVO  @PACIENTE = '{0}',  @USUARIO = '{1}', @CENTRO = '{2}'", (object)PACIENTE, (object)USUARIO, (object)CENTRO));
                this.Secuencia = dtConsultaDatos.Rows[0]["Secuencia"].ToString();
                //this.txtnoevaluacion.Value = Secuencia;
                //this.txtfechaevaluacion.Value = dtConsultaDatos.Rows[0]["ROWCDTE"].ToString();
                Session.Add("StrSecuencia", Secuencia.ToString());
                this.rpevaluacion.DataSource = (object)this.dtConsultaDatos;
                this.rpevaluacion.DataBind();

                /*LIMPIAR CAMPOS*/
                _LimpiarCampos();

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

            // Guardo el maestro de Actividades de aprendizaje de la vida diaria
            this.xQueryParameters.Clear();
            this.xQueryParameters.Add("@SECUENCIA");
            this.xQueryParameters.Add("@CODIGO");
            this.xQueryParameters.Add("@PACIENTE");
            this.xQueryParameters.Add("@DATO");
            this.xQueryParameters.Add("@USUARIO");
            this.xQueryParameters.Add("@CENTRO");
            this.xQueryParameters.Add("@OBSERVACION");

            this.xQueryParameters.Add("@Dificultadesdelnino");
            this.xQueryParameters.Add("@Cursoactualmente");
            this.xQueryParameters.Add("@PorqueDifiereCurso");
            this.xQueryParameters.Add("@AnioEntroCentroEducativo");
            this.xQueryParameters.Add("@AtencionTerapiaprevia");
            this.xQueryParameters.Add("@Expectativasdelospadres");
            this.xQueryParameters.Add("@Habilidadessociales");
            this.xQueryParameters.Add("@Comosecomunicasuhijo");
            this.xQueryParameters.Add("@SuenoHorario");
            this.xQueryParameters.Add("@SuenoPesadillas");
            this.xQueryParameters.Add("@Alimentacion");
            this.xQueryParameters.Add("@Responsabilidades");
            this.xQueryParameters.Add("@Aceptacionacambios");
            this.xQueryParameters.Add("@Aceptacionatexturasnuevas");
            this.xQueryParameters.Add("@Aceptacionaensuciarse");
            this.xQueryParameters.Add("@AparatoElectronicoComputadora");
            this.xQueryParameters.Add("@AparatoElectronicoTableta");
            this.xQueryParameters.Add("@AparatoElectronicoNintendo");
            this.xQueryParameters.Add("@AparatoElectronicoCelular");
            this.xQueryParameters.Add("@AparatoElectronicoOtros");
            this.xQueryParameters.Add("@AparatoElectronicoOtrosEspecifique");
            this.xQueryParameters.Add("@ComoseentretieneAireLibre");
            this.xQueryParameters.Add("@Suelejugarsolooacompanado");
            this.xQueryParameters.Add("@Actividadesextracurriculares");
            this.xQueryParameters.Add("@Reacciondeladulto");
            this.xQueryParameters.Add("@Consecuenciasqueaplican");
            this.xQueryParameters.Add("@Comestibles");
            this.xQueryParameters.Add("@Afectivosociales");
            this.xQueryParameters.Add("@Materiales");
            this.xQueryParameters.Add("@OtrosReforzadores");
            this.xQueryParameters.Add("@Relacionpadresescuela");
            this.xQueryParameters.Add("@Relacionninomaestra");
            this.xQueryParameters.Add("@Relacionninocompaneros");
            this.xQueryParameters.Add("@Responsabilidadesdentroaula");
            this.xQueryParameters.Add("@Comportamientoescuela");
            this.xQueryParameters.Add("@PersonaSessionParentesco");
            this.xQueryParameters.Add("@PersonaSessionNombre");
            this.xQueryParameters.Add("@Alergias");
            this.xQueryParameters.Add("@ConQuienVive");
            this.xQueryParameters.Add("@ComentariosGenerales");
            this.xQueryParameters.Add("@InteraccionconAdultos");
            this.xQueryParameters.Add("@Reacciondelninoenojado"); 

            foreach (RepeaterItem repeaterItem in this.rpevaluacion.Items)
            {
                int num1 = 0;
                Label OBJCODIGO = (Label)repeaterItem.FindControl("lblCODIGO");
                DropDownList OBJDATO = (DropDownList)repeaterItem.FindControl("ddlDATO");
                TextBox OBJObservacion = (TextBox)repeaterItem.FindControl("txtObservacion");

                this.xQueryValues.Clear();
                this.xQueryValues.Add(Secuencia.ToString());
                this.xQueryValues.Add(OBJCODIGO.Text.ToString());
                this.xQueryValues.Add(PACIENTE.ToString());
                this.xQueryValues.Add(OBJDATO.SelectedValue);
                this.xQueryValues.Add(USUARIO.ToString());
                this.xQueryValues.Add(CENTRO.ToString());
                this.xQueryValues.Add(OBJObservacion.Text.ToString());

                this.xQueryValues.Add(txtDificultadesdelnino.Value.ToString());
                this.xQueryValues.Add(txtCursoactualmente.Value.ToString());
                this.xQueryValues.Add(txtPorqueDifiereCurso.Value.ToString());
                this.xQueryValues.Add(txtAnioEntroCentroEducativo.Value.ToString());
                this.xQueryValues.Add(txtAtencionTerapiaprevia.Value.ToString());
                this.xQueryValues.Add(txtExpectativasdelospadres.Value.ToString());
                this.xQueryValues.Add(txtHabilidadessociales.Value.ToString());
                this.xQueryValues.Add(txtComosecomunicasuhijo.Value.ToString());
                this.xQueryValues.Add(txtSuenoHorario.Value.ToString());
                this.xQueryValues.Add(txtSuenoPesadillas.Value.ToString());
                this.xQueryValues.Add(txtAlimentacion.Value.ToString());
                this.xQueryValues.Add(txtResponsabilidades.Value.ToString());
                this.xQueryValues.Add(txtAceptacionacambios.Value.ToString());
                this.xQueryValues.Add(txtAceptacionatexturasnuevas.Value.ToString());
                this.xQueryValues.Add(txtAceptacionaensuciarse.Value.ToString());

                this.xQueryValues.Add(ddlComoseentretieneTelevision.SelectedValue);
                this.xQueryValues.Add(ddlComoseentretienePelota.SelectedValue);
                this.xQueryValues.Add(ddlComoseentretieneJuguetes.SelectedValue);
                this.xQueryValues.Add(ddlComoseentretieneObservarobjetos.SelectedValue);
                this.xQueryValues.Add(ddlComoseentretieneOtros.SelectedValue);
                this.xQueryValues.Add(txtAparatoElectronicoOtrosEspecifique.Value);
                this.xQueryValues.Add(txtComoseentretieneAireLibre.Value.ToString());
                this.xQueryValues.Add(txtSuelejugarsolooacompanado.Value.ToString());
                this.xQueryValues.Add(txtActividadesextracurriculares.Value.ToString());
                this.xQueryValues.Add(txtReacciondeladulto.Value.ToString());
                this.xQueryValues.Add(txtConsecuenciasqueaplican.Value.ToString());
                this.xQueryValues.Add(txtComestibles.Value.ToString());
                this.xQueryValues.Add(txtAfectivosociales.Value.ToString());
                this.xQueryValues.Add(txtMateriales.Value.ToString());
                this.xQueryValues.Add(txtOtrosReforzadores.Value.ToString());
                this.xQueryValues.Add(txtRelacionpadresescuela.Value.ToString());
                this.xQueryValues.Add(txtRelacionninomaestra.Value.ToString());
                this.xQueryValues.Add(txtRelacionninocompaneros.Value.ToString());
                this.xQueryValues.Add(txtResponsabilidadesdentroaula.Value.ToString());
                this.xQueryValues.Add(txtComportamientoescuela.Value.ToString());
                this.xQueryValues.Add(""); //cmbPersonaSesion.Value
                this.xQueryValues.Add("");//txtPersonaSesionNombre.Value.ToString()
                this.xQueryValues.Add(txtAlergias.Value.ToString());
                this.xQueryValues.Add(txtConQuienVive.Value.ToString());
                this.xQueryValues.Add(txtComentariosGenerales.Value.ToString());
                this.xQueryValues.Add(txtInteraccionconAdultos.Value.ToString());
                this.xQueryValues.Add(txtReacciondelninoenojado.Value.ToString());

                DataTable dataTable2 = DB.ExecuteAdapter("PR_ST_ENTREVISTAPADRES_GUARDAR", this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure); if (dataTable2.Rows.Count != 0) ;

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
            //GENERALES DEL PACIENTE   
            this.xQueryParameters.Clear();
            this.xQueryValues.Clear();
            this.xQueryParameters.Add("@ROWGUID");
            this.xQueryValues.Add(PACIENTE.ToString());
            this.xQueryParameters.Add("@ROWSGXID");
            this.xQueryValues.Add(CENTRO.ToString());
            this.xQuery = "PR_PAXGENERALES";
            DataTable dtgeneralesPaciente = DB.ExecuteAdapter(this.xQuery, this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure);

            DataRow dataRowPaciente = dtgeneralesPaciente.Rows.Count != 0 ? dtgeneralesPaciente.Rows[0] : (DataRow)null;
            if (dataRowPaciente != null)
            {
                this.txtCentroeducativo.Value = dataRowPaciente["CENTROEDUCATIVO"].ToString();
                this.txtNivelAcademico.Value = dataRowPaciente["GRADO"].ToString();
            }

            //BUSCO DATOS DE LA ENTREVISTA   
            this.xQueryParameters.Clear();
            this.xQueryValues.Clear();
            this.xQueryParameters.Add((object)"@secuencia");
            this.xQueryValues.Add(secuencia);
            this.xQueryParameters.Add((object)"@centro");
            this.xQueryValues.Add(CENTRO);
            this.xQuery = "PR_ST_ENTREVISTAPADRESBUSCA";
            DataTable dtEvaluacionCompleta = DB.ExecuteAdapter(this.xQuery, this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure);
            if (dtEvaluacionCompleta.Rows.Count > 0)
            {
                /*BUSCO NUCLEO FAMILIAR */
                this.xQueryParameters.Clear();
                this.xQueryValues.Clear();
                this.xQueryParameters.Add((object)"@REFGUID");
                this.xQueryValues.Add((object)PACIENTE.ToString());
                this.xQueryParameters.Add((object)"@ROWSGXID");
                this.xQueryValues.Add((object)CENTRO.ToString());
                this.rpNucleoFamiliar.DataSource = (object)DB.ExecuteAdapter("PAX00001S3", this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure);
                this.rpNucleoFamiliar.DataBind();

                DataRow dtRowEvaluacionCompleta = dtEvaluacionCompleta.Rows[0];
                rpevaluacion.DataSource = dtEvaluacionCompleta;
                rpevaluacion.DataBind();

                /* asigno los datos a los campos del AP_ENTREVISTAPADRES_MAESTROPX */
                txtDificultadesdelnino.Value = dtRowEvaluacionCompleta["Dificultadesdelnino"].ToString();
                txtCursoactualmente.Value = dtRowEvaluacionCompleta["Cursoactualmente"].ToString();
                txtPorqueDifiereCurso.Value = dtRowEvaluacionCompleta["PorqueDifiereCurso"].ToString();
                txtAnioEntroCentroEducativo.Value = dtRowEvaluacionCompleta["AnioEntroCentroEducativo"].ToString();
                txtAtencionTerapiaprevia.Value = dtRowEvaluacionCompleta["AtencionTerapiaprevia"].ToString();
                txtExpectativasdelospadres.Value = dtRowEvaluacionCompleta["Expectativasdelospadres"].ToString();
                txtHabilidadessociales.Value = dtRowEvaluacionCompleta["Habilidadessociales"].ToString();
                txtComosecomunicasuhijo.Value = dtRowEvaluacionCompleta["Comosecomunicasuhijo"].ToString();
                txtSuenoHorario.Value = dtRowEvaluacionCompleta["SuenoHorario"].ToString();
                txtSuenoPesadillas.Value = dtRowEvaluacionCompleta["SuenoPesadillas"].ToString();
                txtAlimentacion.Value = dtRowEvaluacionCompleta["Alimentacion"].ToString();
                txtResponsabilidades.Value = dtRowEvaluacionCompleta["Responsabilidades"].ToString();
                txtAceptacionacambios.Value = dtRowEvaluacionCompleta["Aceptacionacambios"].ToString();
                txtAceptacionatexturasnuevas.Value = dtRowEvaluacionCompleta["Aceptacionatexturasnuevas"].ToString();
                txtAceptacionaensuciarse.Value = dtRowEvaluacionCompleta["Aceptacionaensuciarse"].ToString();
                ddlComoseentretieneTelevision.SelectedValue = dtRowEvaluacionCompleta["AparatoElectronicoComputadora"].ToString();
                ddlComoseentretienePelota.SelectedValue = dtRowEvaluacionCompleta["AparatoElectronicoTableta"].ToString();
                ddlComoseentretieneJuguetes.SelectedValue = dtRowEvaluacionCompleta["AparatoElectronicoNintendo"].ToString();
                ddlComoseentretieneObservarobjetos.SelectedValue = dtRowEvaluacionCompleta["AparatoElectronicoCelular"].ToString();
                ddlComoseentretieneOtros.SelectedValue = dtRowEvaluacionCompleta["AparatoElectronicoOtros"].ToString();
                txtAparatoElectronicoOtrosEspecifique.Value = dtRowEvaluacionCompleta["AparatoElectronicoOtrosEspecifique"].ToString();
                txtComoseentretieneAireLibre.Value = dtRowEvaluacionCompleta["ComoseentretieneAireLibre"].ToString();
                txtSuelejugarsolooacompanado.Value = dtRowEvaluacionCompleta["Suelejugarsolooacompanado"].ToString();
                txtActividadesextracurriculares.Value = dtRowEvaluacionCompleta["Actividadesextracurriculares"].ToString();
                txtReacciondeladulto.Value = dtRowEvaluacionCompleta["Reacciondeladulto"].ToString();
                txtConsecuenciasqueaplican.Value = dtRowEvaluacionCompleta["Consecuenciasqueaplican"].ToString();
                txtComestibles.Value = dtRowEvaluacionCompleta["Comestibles"].ToString();
                txtAfectivosociales.Value = dtRowEvaluacionCompleta["Afectivosociales"].ToString();
                txtMateriales.Value = dtRowEvaluacionCompleta["Materiales"].ToString();
                txtOtrosReforzadores.Value = dtRowEvaluacionCompleta["OtrosReforzadores"].ToString();
                txtRelacionpadresescuela.Value = dtRowEvaluacionCompleta["Relacionpadresescuela"].ToString();
                txtRelacionninomaestra.Value = dtRowEvaluacionCompleta["Relacionninomaestra"].ToString();
                txtRelacionninocompaneros.Value = dtRowEvaluacionCompleta["Relacionninocompaneros"].ToString();
                txtResponsabilidadesdentroaula.Value = dtRowEvaluacionCompleta["Responsabilidadesdentroaula"].ToString();
                txtComportamientoescuela.Value = dtRowEvaluacionCompleta["Comportamientoescuela"].ToString();
                //cmbPersonaSesion.Value =  dtRowEvaluacionCompleta["PersonaSessionParentesco"].ToString();
                //txtPersonaSesionNombre.Value =  dtRowEvaluacionCompleta["PersonaSessionNombre"].ToString(); 
                txtAlergias.Value = dtRowEvaluacionCompleta["Alergias"].ToString();
                txtConQuienVive.Value = dtRowEvaluacionCompleta["ConQuienVive"].ToString();
                txtComentariosGenerales.Value = dtRowEvaluacionCompleta["ComentariosGenerales"].ToString();
                txtInteraccionconAdultos.Value = dtRowEvaluacionCompleta["InteraccionconAdultos"].ToString();
                txtReacciondelninoenojado.Value = dtRowEvaluacionCompleta["Reacciondelninoenojado"].ToString();

                if (this.xCommand == "VerDetalle")
                {
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

                DataTable dtconsulta = DB.ExecuteAdapter("PR_ST_ENTREVISTAPADRES_HISTORICO", this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure);
                rpHistorico.DataSource = dtconsulta;
                rpHistorico.DataBind();
            }
        }

        protected void _LimpiarCampos()
        { 
            txtDificultadesdelnino.Value = "";
            txtCursoactualmente.Value = "";
            txtPorqueDifiereCurso.Value = "";
            txtAnioEntroCentroEducativo.Value = "";
            txtAtencionTerapiaprevia.Value = "";
            txtExpectativasdelospadres.Value = "";
            txtHabilidadessociales.Value = "";
            txtComosecomunicasuhijo.Value = "";
            txtSuenoHorario.Value = "";
            txtSuenoPesadillas.Value = "";
            txtAlimentacion.Value = "";
            txtResponsabilidades.Value = "";
            txtAceptacionacambios.Value = "";
            txtAceptacionatexturasnuevas.Value = "";
            txtAceptacionaensuciarse.Value = ""; 
            ddlComoseentretieneTelevision.SelectedValue = "";
            ddlComoseentretienePelota.SelectedValue = "";
            ddlComoseentretieneJuguetes.SelectedValue = "";
            ddlComoseentretieneObservarobjetos.SelectedValue = "";
            ddlComoseentretieneOtros.SelectedValue = "";
            txtAparatoElectronicoOtrosEspecifique.Value = "";
            txtComoseentretieneAireLibre.Value = "";
            txtSuelejugarsolooacompanado.Value = "";
            txtActividadesextracurriculares.Value = "";
            txtReacciondeladulto.Value = "";
            txtConsecuenciasqueaplican.Value = "";
            txtComestibles.Value = "";
            txtAfectivosociales.Value = "";
            txtMateriales.Value = "";
            txtOtrosReforzadores.Value = "";
            txtRelacionpadresescuela.Value = "";
            txtRelacionninomaestra.Value = "";
            txtRelacionninocompaneros.Value = "";
            txtResponsabilidadesdentroaula.Value = "";
            txtComportamientoescuela.Value = "";
            cmbPersonaSesion.Value = "";
            txtPersonaSesionNombre.Value = "";
            txtAlergias.Value = "";
            txtConQuienVive.Value = "";
            txtComentariosGenerales.Value = "";
            txtInteraccionconAdultos.Value = "";
            txtReacciondelninoenojado.Value = "";

        }

    }

}


