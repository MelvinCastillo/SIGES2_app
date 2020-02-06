using System;
using System.Collections;
using System.Data;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using CAID.Data;


namespace CAID_V2.forms
{
    public partial class TFEntrevistaInicial : System.Web.UI.Page
    {

        private ArrayList xQueryParameters = new ArrayList();
        private ArrayList xQueryValues = new ArrayList();
        private string xCommand;
        private string xQuery;

        string IDPaciente;
        string usuario;
        string centro;
        string ckparticipantes1 = "";
        string ckpersonaCargo1 = "";
        string ckmanejadisciplina1 = "";
        string ckpersonavivenencasa1 = "";
        string cksituacionesespeciales1 = "";
        string ckproblemasidentificados1 = "";
        string ckobjetivosplanteados1 = "";
        string ckDiagnosticoTranstornoMental1 = "";
        string ckAntecedentesdrogodependientes1 = "";
        string ckDiagnosticoosospechatrastornopadre1 = "";
        string ckAntecedentesdrogodependientespadre1 = "";
        string accion = "";
        char[] chArray = new char[5]
        {
                ' ',
                ',',
                '.',
                ':',
                '\t'
        };
        DataTable dtusuarios = new DataTable();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            { 
                usuario = Request.QueryString["XCurrentUSR_ROWGUID"].ToString();
                 centro = Request.QueryString["XCURRENTUSR_SGXID"].ToString();
                // VALIDO DIV CONFIDENCIAL 


                // VALIDO DIV CONFIDENCIAL INTERVENCIÓN GRUPAL
                dtusuarios = DB.ExecuteAdapter(string.Format("select ROWGUID,ESPECIALIDADID from VUSUARIOS  where ROWGUID ='" + usuario.ToString() + "' and ROWSGXID ='" + centro.ToString() + "' and ESPECIALIDADID ='CAID-SD-HISCL-15'", this.xQueryValues, CommandType.Text));
                if (dtusuarios.Rows.Count > 0)
                {
                    tbnAdd.Visible = false;
                    btnAgregarHermano1.Visible = false;
                    divconfidencial.Visible = true;
                }
                dtusuarios = DB.ExecuteAdapter(string.Format("select ROWGUID,ESPECIALIDADID from VUSUARIOS  where ROWGUID ='" + usuario.ToString() + "' and ROWSGXID ='" + centro.ToString() + "' and ESPECIALIDADID ='CAID-SD-HISCL-11'", this.xQueryValues, CommandType.Text));
                if (dtusuarios.Rows.Count == 0)
                {
                    tbnAdd.Visible = false;
                    btnAgregarHermano1.Visible = false;
                    divconfidencial.Visible = false;
                }
                else
                {
                    tbnAdd.Visible = true;
                    btnAgregarHermano1.Visible = true;
                    divconfidencial.Visible = true;

                }

                //GENERALES DEL PACIENTE 
                if (Request.QueryString["rowguidpaciente"].ToString() != "")
                    IDPaciente = Request.QueryString["rowguidpaciente"].ToString();
                centro = Request.QueryString["XCURRENTUSR_SGXID"].ToString();

                this.xQueryParameters.Clear();
                this.xQueryValues.Clear();
                this.xQueryParameters.Add("@GUID");
                this.xQueryValues.Add(IDPaciente.ToString());
                this.xQueryParameters.Add("@ROWSGXID");
                this.xQueryValues.Add(centro.ToString()); 
                this.xQuery = "PAX00000S2";
                DataTable dtgeneralesPaciente = DB.ExecuteAdapter(this.xQuery, this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure);
                DataRow dataRowPaciente = dtgeneralesPaciente.Rows.Count != 0 ? dtgeneralesPaciente.Rows[0] : (DataRow)null;
                if (dataRowPaciente == null)
                    return;
                this.txtNombrePaciente.Value = dataRowPaciente["FULLNAME"].ToString();
                this.txtEdad.Value = dataRowPaciente["EDAD"].ToString();
                this.txtExpedienteNo.Value = dataRowPaciente["RECORDID"].ToString(); 
                this.txtDiagnosticoPaciente.Value = dataRowPaciente["PREDIAGNOSTICODESCRIPCION"].ToString();

                //GENERALES DE LA MADRE  

                this.xQueryParameters.Clear();
                this.xQueryValues.Clear();
                this.xQueryParameters.Add("@REFGUID");
                this.xQueryValues.Add(IDPaciente.ToString());
                this.xQueryParameters.Add("@ROWSGXID");
                this.xQueryValues.Add(centro.ToString());
                this.xQueryParameters.Add("FILIACION");
                this.xQueryValues.Add("MADRE");
                this.xQuery = "Paciente_FILIACION";
                DataTable dtgeneralesPadres = DB.ExecuteAdapter(this.xQuery, this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure);
                DataRow dataRow = dtgeneralesPadres.Rows.Count != 0 ? dtgeneralesPadres.Rows[0] : (DataRow)null;
                if (dataRow != null) 
                this.txtNombreMadre.Value = dataRow["FULLNAME"].ToString();

                //GENERALES DE LA PADRE   
                this.xQueryParameters.Clear();
                this.xQueryValues.Clear();
                this.xQueryParameters.Add("@REFGUID");
                this.xQueryValues.Add(IDPaciente.ToString());
                this.xQueryParameters.Add("@ROWSGXID");
                this.xQueryValues.Add(centro.ToString());
                this.xQueryParameters.Add("FILIACION");
                this.xQueryValues.Add("PADRE");
                this.xQuery = "Paciente_FILIACION";
                 dtgeneralesPadres = DB.ExecuteAdapter(this.xQuery, this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure);
                 dataRow = dtgeneralesPadres.Rows.Count != 0 ? dtgeneralesPadres.Rows[0] : (DataRow)null;
                if (dataRow != null) 
                this.txtNombrepadre.Value = dataRow["FULLNAME"].ToString();

                //GENERALES DEL TUTOR   
                this.xQueryParameters.Clear();
                this.xQueryValues.Clear();
                this.xQueryParameters.Add("@REFGUID");
                this.xQueryValues.Add(IDPaciente.ToString());
                this.xQueryParameters.Add("@ROWSGXID");
                this.xQueryValues.Add(centro.ToString());
                this.xQueryParameters.Add("FILIACION");
                this.xQueryValues.Add("TUTOR");
                this.xQuery = "Paciente_FILIACION";
                dtgeneralesPadres = DB.ExecuteAdapter(this.xQuery, this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure);
                dataRow = dtgeneralesPadres.Rows.Count != 0 ? dtgeneralesPadres.Rows[0] : (DataRow)null;
                if (dataRow != null) 
                this.txtNombreTutor.Value = dataRow["FULLNAME"].ToString(); 

                //Lista de participantes
                this.ckparticipantes.Items.Clear();
                this.xQueryParameters.Clear();
                this.xQueryValues.Clear(); //order by nombre
                DataTable dtparticipantes = DB.ExecuteAdapter(string.Format("select * from vparticipantes", this.xQueryValues, CommandType.Text));
                if (dtparticipantes.Rows.Count == 0)
                {
                    ckparticipantes.Visible = false;
                    ckpersonaCargo.Visible = false;
                    ckmanejadisciplina.Visible = false;
                    ckpersonavivenencasa.Visible = false;

                }
                else
                {
                    foreach (DataRow row in (InternalDataCollectionBase)dtparticipantes.Rows)
                    {
                        this.ckparticipantes.Items.Add(new ListItem(row["NOMBRE"].ToString(), row["codigo"].ToString()));
                        this.ckpersonaCargo.Items.Add(new ListItem(row["NOMBRE"].ToString(), row["codigo"].ToString()));
                        this.ckmanejadisciplina.Items.Add(new ListItem(row["NOMBRE"].ToString(), row["codigo"].ToString()));
                        this.ckpersonavivenencasa.Items.Add(new ListItem(row["NOMBRE"].ToString(), row["codigo"].ToString()));

                    }
                }
                //Lista de estilos de crianza
                this.ddestilocrianza.Items.Clear();
                this.xQueryParameters.Clear();
                this.xQueryValues.Clear();
                DataTable dtestilocrianza = DB.ExecuteAdapter(string.Format("select Codigo,Nombre from ESTILOCRIANZA order by nombre", this.xQueryValues, CommandType.Text));
                if (dtestilocrianza.Rows.Count > 0)
                {
                    this.ddestilocrianza.Items.Add(new ListItem("-- SELECCIONE --", "0"));
                    foreach (DataRow row in (InternalDataCollectionBase)dtestilocrianza.Rows)
                        this.ddestilocrianza.Items.Add(new ListItem(row["NOMBRE"].ToString(), row["codigo"].ToString()));
                }

                //Lista de estado civil
                this.ddEstadoCivil.Items.Clear();
                this.xQueryParameters.Clear();
                this.xQueryValues.Clear();
                DataTable dtestadocivil = DB.ExecuteAdapter(string.Format("select Codigo,Nombre from ESTADOCIVIL order by nombre", this.xQueryValues, CommandType.Text));
                if (dtestadocivil.Rows.Count > 0)
                {
                    this.ddEstadoCivil.Items.Add(new ListItem("-- SELECCIONE --", "0"));
                    foreach (DataRow row in (InternalDataCollectionBase)dtestadocivil.Rows)
                        this.ddEstadoCivil.Items.Add(new ListItem(row["NOMBRE"].ToString(), row["codigo"].ToString()));
                }

                //Lista de estructura Familiar
                this.ddEstructuraFamiliar.Items.Clear();
                this.xQueryParameters.Clear();
                this.xQueryValues.Clear();
                DataTable dtestructurafamiliar = DB.ExecuteAdapter(string.Format("select Codigo,Nombre from ESTRUCTURAFAMILIAR order by nombre", this.xQueryValues, CommandType.Text));
                if (dtestructurafamiliar.Rows.Count > 0)
                {
                    this.ddEstructuraFamiliar.Items.Add(new ListItem("-- SELECCIONE --", "0"));
                    foreach (DataRow row in (InternalDataCollectionBase)dtestructurafamiliar.Rows)
                        this.ddEstructuraFamiliar.Items.Add(new ListItem(row["NOMBRE"].ToString(), row["codigo"].ToString()));
                }
                //Lista de Relacion entre los padres
                this.ddlrelacionpadres.Items.Clear();
                this.xQueryParameters.Clear();
                this.xQueryValues.Clear();
                DataTable dtrelacionapadres = DB.ExecuteAdapter(string.Format("select Codigo,Nombre from RELACIONPADRES order by nombre", this.xQueryValues, CommandType.Text));
                if (dtrelacionapadres.Rows.Count > 0)
                {
                    this.ddlrelacionpadres.Items.Add(new ListItem("-- SELECCIONE --", "0"));
                    this.ddlrelacionpacientemadre.Items.Add(new ListItem("-- SELECCIONE --", "0"));
                    this.ddrelacinopacientepadre.Items.Add(new ListItem("-- SELECCIONE --", "0"));
                    this.ddlrelacionpacientecuidador.Items.Add(new ListItem("-- SELECCIONE --", "0"));
                    foreach (DataRow row in (InternalDataCollectionBase)dtrelacionapadres.Rows)
                    {
                        this.ddlrelacionpadres.Items.Add(new ListItem(row["NOMBRE"].ToString(), row["codigo"].ToString()));
                        this.ddlrelacionpacientemadre.Items.Add(new ListItem(row["NOMBRE"].ToString(), row["codigo"].ToString()));
                        this.ddrelacinopacientepadre.Items.Add(new ListItem(row["NOMBRE"].ToString(), row["codigo"].ToString()));
                        this.ddlrelacionpacientecuidador.Items.Add(new ListItem(row["NOMBRE"].ToString(), row["codigo"].ToString()));
                    }
                }

                //Lista de Situaciones Especiales dentro del ambito escolar
                this.cksituacionesespeciales.Items.Clear();
                this.xQueryParameters.Clear();
                this.xQueryValues.Clear();
                DataTable ddsituacionesespeciales = DB.ExecuteAdapter(string.Format("select Codigo,Nombre from SITUACIONESESPECIALESESCOLARES order by nombre", this.xQueryValues, CommandType.Text));
                if (ddsituacionesespeciales.Rows.Count > 0)
                {
                    foreach (DataRow row in (InternalDataCollectionBase)ddsituacionesespeciales.Rows)
                        this.cksituacionesespeciales.Items.Add(new ListItem(row["NOMBRE"].ToString(), row["codigo"].ToString()));
                }

                //Lista de Conducta e interaccion de ninos con su grupo de pares
                this.ddconductaeinteraccion.Items.Clear();
                this.xQueryParameters.Clear();
                this.xQueryValues.Clear();
                DataTable dtconductaeinteraccion = DB.ExecuteAdapter(string.Format("select Codigo,Nombre from CONDUCTANINOS order by nombre", this.xQueryValues, CommandType.Text));
                if (dtconductaeinteraccion.Rows.Count > 0)
                {
                    this.ddconductaeinteraccion.Items.Add(new ListItem("-- SELECCIONE --", "0"));
                    this.ddconductaeinteraccionadultos.Items.Add(new ListItem("-- SELECCIONE --", "0"));
                    foreach (DataRow row in (InternalDataCollectionBase)dtconductaeinteraccion.Rows)
                    {
                        this.ddconductaeinteraccion.Items.Add(new ListItem(row["NOMBRE"].ToString(), row["codigo"].ToString()));
                        this.ddconductaeinteraccionadultos.Items.Add(new ListItem(row["NOMBRE"].ToString(), row["codigo"].ToString()));
                    }
                }


                //Lista de problemas identificados por el terapeuta respectivas evidencias
                this.ckproblemasidentificados.Items.Clear();
                this.xQueryParameters.Clear();
                this.xQueryValues.Clear();
                DataTable dtproblemasidentificados = DB.ExecuteAdapter(string.Format("select Codigo,Nombre from PLANINTERVENCION order by nombre", this.xQueryValues, CommandType.Text));
                if (dtproblemasidentificados.Rows.Count > 0)
                {
                    foreach (DataRow row in (InternalDataCollectionBase)dtproblemasidentificados.Rows)
                    {
                        this.ckproblemasidentificados.Items.Add(new ListItem(row["NOMBRE"].ToString(), row["codigo"].ToString()));
                    }
                }

                //Objetivos terapeuticos planteados por el terapeuta 
                this.ckobjetivosplanteados.Items.Clear();
                this.xQueryParameters.Clear();
                this.xQueryValues.Clear();
                DataTable dtobjetivosplanteados = DB.ExecuteAdapter(string.Format("select Codigo,Nombre from OBJECTIVOSTERAPEUTICOS order by nombre", this.xQueryValues, CommandType.Text));
                if (dtobjetivosplanteados.Rows.Count > 0)
                {
                    foreach (DataRow row in (InternalDataCollectionBase)dtobjetivosplanteados.Rows)
                    {
                        this.ckobjetivosplanteados.Items.Add(new ListItem(row["NOMBRE"].ToString(), row["codigo"].ToString()));
                    }
                }

                //Lista de Conducta de participantes durante la session
                this.ddConductaparticipantesensession.Items.Clear();
                this.xQueryParameters.Clear();
                this.xQueryValues.Clear();
                DataTable dtConductaparticipantesensession = DB.ExecuteAdapter(string.Format("select Codigo,Nombre from CONDUCTAPARTICIPANTES order by nombre", this.xQueryValues, CommandType.Text));
                if (dtConductaparticipantesensession.Rows.Count > 0)
                {
                    this.ddConductaparticipantesensession.Items.Add(new ListItem("-- SELECCIONE --", "0"));
                    foreach (DataRow row in (InternalDataCollectionBase)dtConductaparticipantesensession.Rows)
                    {
                        this.ddConductaparticipantesensession.Items.Add(new ListItem(row["NOMBRE"].ToString(), row["codigo"].ToString()));
                    }
                }

                //Lista de Situaciones que generan malestar en la pareja-familia
                this.ddsituacionesquegeneran.Items.Clear();
                this.xQueryParameters.Clear();
                this.xQueryValues.Clear();
                DataTable dtsituacionesquegeneran = DB.ExecuteAdapter(string.Format("select Codigo,Nombre from CONDUCTAPARTICIPANTES order by nombre", this.xQueryValues, CommandType.Text));
                if (dtsituacionesquegeneran.Rows.Count > 0)
                {
                    this.ddsituacionesquegeneran.Items.Add(new ListItem("-- SELECCIONE --", "0"));
                    foreach (DataRow row in (InternalDataCollectionBase)dtsituacionesquegeneran.Rows)
                    {
                        this.ddsituacionesquegeneran.Items.Add(new ListItem(row["NOMBRE"].ToString(), row["codigo"].ToString()));
                    }
                }

                //Lista de Diagnostico o sospecha de trastorno Mental
                this.ckDiagnosticoTranstornoMental.Items.Clear();
                this.xQueryParameters.Clear();
                this.xQueryValues.Clear();
                DataTable dtDiagnosticoTrastornoMental = DB.ExecuteAdapter(string.Format("select Codigo,Nombre from DiagnosticoTranstornoMental order by nombre", this.xQueryValues, CommandType.Text));
                if (dtDiagnosticoTrastornoMental.Rows.Count > 0)
                {

                    foreach (DataRow row in (InternalDataCollectionBase)dtDiagnosticoTrastornoMental.Rows)
                    {
                        this.ckDiagnosticoTranstornoMental.Items.Add(new ListItem(row["NOMBRE"].ToString(), row["codigo"].ToString()));
                        this.ckDiagnosticoosospechatrastornopadre.Items.Add(new ListItem(row["NOMBRE"].ToString(), row["codigo"].ToString()));
                    }
                }


                //Lista de Antecedentesdrogodependientes
                this.ckAntecedentesdrogodependientes.Items.Clear();
                this.xQueryParameters.Clear();
                this.xQueryValues.Clear();
                DataTable dtAntecedentesdrogodependientes = DB.ExecuteAdapter(string.Format("select Codigo,Nombre from AntecedentesDrogoDependientes order by LEN(Nombre) DESC", this.xQueryValues, CommandType.Text));
                if (dtAntecedentesdrogodependientes.Rows.Count > 0)
                {

                    foreach (DataRow row in (InternalDataCollectionBase)dtAntecedentesdrogodependientes.Rows)
                    {
                        this.ckAntecedentesdrogodependientes.Items.Add(new ListItem(row["NOMBRE"].ToString(), row["codigo"].ToString()));
                        this.ckAntecedentesdrogodependientespadre.Items.Add(new ListItem(row["NOMBRE"].ToString(), row["codigo"].ToString()));

                    }
                }

                LlenoPantalla();

            } 
        }

        public void Notify(string msg, string tipo)
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "notify('" + msg + "','" + tipo + "');", true);
        }

        protected void _Save(object sender, EventArgs e)
        {
            IDPaciente = Request.QueryString["rowguidpaciente"].ToString();
            usuario = Request.QueryString["XCurrentUSR_ROWGUID"].ToString();
            centro = Request.QueryString["XCURRENTUSR_SGXID"].ToString();

            this.xQueryParameters.Clear();
            this.xQueryValues.Clear();
            this.xQueryParameters.Add("@IDPACIENTE");
            this.xQueryParameters.Add("@MadreCelular");
            this.xQueryParameters.Add("@MadreTelefonoResidencial");
            this.xQueryParameters.Add("@MadreTelefonoTrabajo");
            this.xQueryParameters.Add("@MadreCorreoElectronico");
            this.xQueryParameters.Add("@PadreCelular");
            this.xQueryParameters.Add("@PadreTelefonoResidencial");
            this.xQueryParameters.Add("@PadreTelefonoTrabajo");
            this.xQueryParameters.Add("@PadreCorreoElectronico");
            this.xQueryParameters.Add("@TutorCelular");
            this.xQueryParameters.Add("@TutorTelefonoResidencial");
            this.xQueryParameters.Add("@TutorTelefonoTrabajo");
            this.xQueryParameters.Add("@TutorCorreoElectronico");
            this.xQueryParameters.Add("@ParticipanteEntrevista");
            this.xQueryParameters.Add("@ParticipanteEntrevistaOtros");
            this.xQueryParameters.Add("@PersonasCargoCuidadoPx");
            this.xQueryParameters.Add("@PersonasCargoCuidadoPxOtros");
            this.xQueryParameters.Add("@PersonasCargoCuidadoPxComentario");
            this.xQueryParameters.Add("@ManejoDisciplinaPx");
            this.xQueryParameters.Add("@ManejoDisciplinaPxOtros");
            this.xQueryParameters.Add("@ManejoDisciplinaPxComentario");
            this.xQueryParameters.Add("@EstiloCrianza");
            this.xQueryParameters.Add("@EstiloCrianzaComentario");
            this.xQueryParameters.Add("@EstadoCivil");
            this.xQueryParameters.Add("@EstadoCivilComentario");
            this.xQueryParameters.Add("@EstructuraFamiliar");
            this.xQueryParameters.Add("@PersonasVivenCasa");
            this.xQueryParameters.Add("@PersonasVivenCasaComentario");
            this.xQueryParameters.Add("@RelacionEntrePadres");
            this.xQueryParameters.Add("@RelacionEntrePadresComentario");
            this.xQueryParameters.Add("@RelacionPXconMadre");
            this.xQueryParameters.Add("@RelacionPXconMadreOtros");
            this.xQueryParameters.Add("@RelacionPXconMadreComentario");
            this.xQueryParameters.Add("@RelacionPXconlaPadre");
            this.xQueryParameters.Add("@RelacionPXconPadreOtros");
            this.xQueryParameters.Add("@RelacionPXconPadreComentario");
            this.xQueryParameters.Add("@RelacionPXconOtroCuidador");
            this.xQueryParameters.Add("@RelacionPXconOtroCuidadorOtros");
            this.xQueryParameters.Add("@RelacionPXconOtroCuidadorComentario");
            this.xQueryParameters.Add("@HermanosFallecidos");
            this.xQueryParameters.Add("@HermanosCuantos");
            this.xQueryParameters.Add("@HermanosCausa");
            this.xQueryParameters.Add("@HacequeTiempoDiagnostico");
            this.xQueryParameters.Add("@ImpactoManejoCondicionFamiliar");
            this.xQueryParameters.Add("@SituacionesEspecialesAmbitoEscolar");
            this.xQueryParameters.Add("@ConductaInteraccionConGruposPares");
            this.xQueryParameters.Add("@ConductaInteraccionConGruposOtros");
            this.xQueryParameters.Add("@ConductaInteraccionConGruposAdultos");
            this.xQueryParameters.Add("@ConductaInteraccionConGruposAdultosOtros");
            this.xQueryParameters.Add("@ExpectativasActualesFamiliares");
            this.xQueryParameters.Add("@ObjectivosTerapeuticosPlanteados");
            this.xQueryParameters.Add("@QueesCalidadVida");
            this.xQueryParameters.Add("@ProblemasIdentificadosporTerapeuta");
            this.xQueryParameters.Add("@ObjetivosPlanteadosTerapeuta");
            this.xQueryParameters.Add("@Tareas");
            this.xQueryParameters.Add("@ConductaParticipantesSesion");
            this.xQueryParameters.Add("@ComentariosGeneralesTerapeuta");
            this.xQueryParameters.Add("@PacienteSospechaMaltrato");
            this.xQueryParameters.Add("@PacienteSospechaMaltratoOtros");
            this.xQueryParameters.Add("@FamiliaProcesoLegal");
            this.xQueryParameters.Add("@FamiliaProcesoLegalMotivo");
            this.xQueryParameters.Add("@PosiblesProblematicaGeneradoDiagnostico");
            this.xQueryParameters.Add("@SituacionesMalestarParejaFamilia");
            this.xQueryParameters.Add("@SituacionesMalestarParejaFamiliaOtros");
            this.xQueryParameters.Add("@SituacionesMalestarParejaFamiliaComentario");
            this.xQueryParameters.Add("@MadreAntecedentesMedicos");
            this.xQueryParameters.Add("@MadreAntecedentesMedicosEspecifique");
            this.xQueryParameters.Add("@MadreDiagnosticoSopechaTrastornoMental");
            this.xQueryParameters.Add("@MadreDiagnosticoSopechaTrastornoMentalOtros");
            this.xQueryParameters.Add("@MadreRecibeTratamientoPsicologico");
            this.xQueryParameters.Add("@MadreRecibeTratamientoPsicologicoMotivo");
            this.xQueryParameters.Add("@MadreRecibeTratamientoPsicologicoProfesional");
            this.xQueryParameters.Add("@MadreRecibeTratamientoPsiquiatrico");
            this.xQueryParameters.Add("@MadreRecibeTratamientoPsiquiatricoMotivo");
            this.xQueryParameters.Add("@MadreRecibeTratamientoPsiquiatricoProfesional");
            this.xQueryParameters.Add("@MadreAntecedentesDrogodependientes");
            this.xQueryParameters.Add("@MadreAntecedentesDrogodependientesOtros");
            this.xQueryParameters.Add("@MadreOtrasInformacionesInteres");
            this.xQueryParameters.Add("@PadreAntecedentesMedicos");
            this.xQueryParameters.Add("@PadreAntecedentesMedicosEspecifique");
            this.xQueryParameters.Add("@PadreDiagnosticoSopechaTrastornoMental");
            this.xQueryParameters.Add("@PadreDiagnosticoSopechaTrastornoMentalOtros");
            this.xQueryParameters.Add("@PadreRecibeTratamientoPsicologico");
            this.xQueryParameters.Add("@PadreRecibeTratamientoPsicologicoMotivo");
            this.xQueryParameters.Add("@PadreRecibeTratamientoPsicologicoProfesional");
            this.xQueryParameters.Add("@PadreRecibeTratamientoPsiquiatrico");
            this.xQueryParameters.Add("@PadreRecibeTratamientoPsiquiatricoMotivo");
            this.xQueryParameters.Add("@PadreRecibeTratamientoPsiquiatricoProfesional");
            this.xQueryParameters.Add("@PadreAntecedentesDrogodependientes");
            this.xQueryParameters.Add("@PadreAntecedentesDrogodependientesOtros");
            this.xQueryParameters.Add("@PadreOtrasInformacionesInteres");
            //this.xQueryParameters.Add("@ROWCDTE ");
            //this.xQueryParameters.Add("@ROWMDTE ");
            this.xQueryParameters.Add("@ROWUSERID");
            this.xQueryParameters.Add("@ROWSGXID");

            //SELECCIONO LOS VALORES DE LOS CHECKLIST 
            //Checklist PARTICIPANTES 
            for (int index = 0; index < this.ckparticipantes.Items.Count; ++index)
            {
                if (this.ckparticipantes.Items[index].Selected)
                    ckparticipantes1 = ckparticipantes1 + "," + this.ckparticipantes.Items[index].Value.Trim();
            }
            if (ckparticipantes1 != "")
                ckparticipantes1 = ckparticipantes1.Remove(0, 1);

            //Checklist PERSONAS A CARGO 
            for (int index = 0; index < this.ckpersonaCargo.Items.Count; ++index)
            {
                if (this.ckpersonaCargo.Items[index].Selected)
                    ckpersonaCargo1 = ckpersonaCargo1 + "," + this.ckpersonaCargo.Items[index].Value.Trim();
            }
            if (ckpersonaCargo1 != "")
                ckpersonaCargo1 = ckpersonaCargo1.Remove(0, 1);

            //Checklist MANEJA DISCIPLINA 
            for (int index = 0; index < this.ckmanejadisciplina.Items.Count; ++index)
            {
                if (this.ckmanejadisciplina.Items[index].Selected)
                    ckmanejadisciplina1 = ckmanejadisciplina1 + "," + this.ckmanejadisciplina.Items[index].Value.Trim();
            }
            if (ckmanejadisciplina1 != "")
                ckmanejadisciplina1 = ckmanejadisciplina1.Remove(0, 1);

            //Checklist persona viven en casa
            for (int index = 0; index < this.ckpersonavivenencasa.Items.Count; ++index)
            {
                if (this.ckpersonavivenencasa.Items[index].Selected)
                    ckpersonavivenencasa1 = ckpersonavivenencasa1 + "," + this.ckpersonavivenencasa.Items[index].Value.Trim();
            }
            if (ckpersonavivenencasa1 != "")
                ckpersonavivenencasa1 = ckpersonavivenencasa1.Remove(0, 1);

            //Checklist situacion ES especiales 
            for (int index = 0; index < this.cksituacionesespeciales.Items.Count; ++index)
            {
                if (this.cksituacionesespeciales.Items[index].Selected)
                    cksituacionesespeciales1 = cksituacionesespeciales1 + "," + this.cksituacionesespeciales.Items[index].Value.Trim();
            }
            if (cksituacionesespeciales1 != "")
                cksituacionesespeciales1 = cksituacionesespeciales1.Remove(0, 1);

            //Checklist Problemas identificados 
            for (int index = 0; index < this.ckproblemasidentificados.Items.Count; ++index)
            {
                if (this.ckproblemasidentificados.Items[index].Selected)
                    ckproblemasidentificados1 = ckproblemasidentificados1 + "," + this.ckproblemasidentificados.Items[index].Value.Trim();
            }
            if (ckproblemasidentificados1 != "")
                ckproblemasidentificados1 = ckproblemasidentificados1.Remove(0, 1);

            //Checklist Objetivos planteados
            for (int index = 0; index < this.ckobjetivosplanteados.Items.Count; ++index)
            {
                if (this.ckobjetivosplanteados.Items[index].Selected)
                    ckobjetivosplanteados1 = ckobjetivosplanteados1 + "," + this.ckobjetivosplanteados.Items[index].Value.Trim();
            }
            if (ckobjetivosplanteados1 != "")
                ckobjetivosplanteados1 = ckobjetivosplanteados1.Remove(0, 1);

            //Checklist Diagnostico Transtorno Mental
            for (int index = 0; index < this.ckDiagnosticoTranstornoMental.Items.Count; ++index)
            {
                if (this.ckDiagnosticoTranstornoMental.Items[index].Selected)
                    ckDiagnosticoTranstornoMental1 = ckDiagnosticoTranstornoMental1 + "," + this.ckDiagnosticoTranstornoMental.Items[index].Value.Trim();
            }
            if (ckDiagnosticoTranstornoMental1 != "")
                ckDiagnosticoTranstornoMental1 = ckDiagnosticoTranstornoMental1.Remove(0, 1);

            //Checklist Antecedentes drogo dependientes
            for (int index = 0; index < this.ckAntecedentesdrogodependientes.Items.Count; ++index)
            {
                if (this.ckAntecedentesdrogodependientes.Items[index].Selected)
                    ckAntecedentesdrogodependientes1 = ckAntecedentesdrogodependientes1 + "," + this.ckAntecedentesdrogodependientes.Items[index].Value.Trim();
            }
            if (ckAntecedentesdrogodependientes1 != "")
                ckAntecedentesdrogodependientes1 = ckAntecedentesdrogodependientes1.Remove(0, 1);


            //Checklist Diagnostico sospecha trastorno padre
            for (int index = 0; index < this.ckDiagnosticoosospechatrastornopadre.Items.Count; ++index)
            {
                if (this.ckDiagnosticoosospechatrastornopadre.Items[index].Selected)
                    ckDiagnosticoosospechatrastornopadre1 = ckDiagnosticoosospechatrastornopadre1 + "," + this.ckDiagnosticoosospechatrastornopadre.Items[index].Value.Trim();
            }
            if (ckDiagnosticoosospechatrastornopadre1 != "")
                ckDiagnosticoosospechatrastornopadre1 = ckDiagnosticoosospechatrastornopadre1.Remove(0, 1);

            //Checklist Antecedentes drogo dependientes padre
            for (int index = 0; index < this.ckAntecedentesdrogodependientespadre.Items.Count; ++index)
            {
                if (this.ckAntecedentesdrogodependientespadre.Items[index].Selected)
                    ckAntecedentesdrogodependientespadre1 = ckAntecedentesdrogodependientespadre1 + "," + this.ckAntecedentesdrogodependientespadre.Items[index].Value.Trim();
            }
            if (ckAntecedentesdrogodependientespadre1 != "")
                ckAntecedentesdrogodependientespadre1 = ckAntecedentesdrogodependientespadre1.Remove(0, 1);

            this.xQueryValues.Add(IDPaciente.ToString());
            this.xQueryValues.Add(txtCelulareMadre.Value.ToString());
            this.xQueryValues.Add(txtTelefonoResidenciamadre.Value.ToString());
            this.xQueryValues.Add(txtTelefonoTrabajomadre.Value.ToString());
            this.xQueryValues.Add(txtCorreoMadre.Value.ToString());

            this.xQueryValues.Add(txtCelularepadre.Value.ToString());
            this.xQueryValues.Add(txtTelefonoResidenciapadre.Value.ToString());
            this.xQueryValues.Add(txtTelefonoTrabajopadre.Value.ToString());
            this.xQueryValues.Add(txtcorreopadre.Value.ToString());

            this.xQueryValues.Add(txtCelulareTutor.Value.ToString());
            this.xQueryValues.Add(txtTelefonoResidenciaTutor.Value.ToString());
            this.xQueryValues.Add(txtTelefonoTrabajoTutor.Value.ToString());
            this.xQueryValues.Add(txtcorreoTutor.Value.ToString());

            this.xQueryValues.Add(ckparticipantes1.ToString());
            this.xQueryValues.Add(txtparticipantesotros.Value.ToString());
            this.xQueryValues.Add(ckpersonaCargo1.ToString());
            this.xQueryValues.Add(txtpersoncargootros.Value.ToString());
            this.xQueryValues.Add(txtComentariopersoncargootros.Value.ToString());
            this.xQueryValues.Add(ckmanejadisciplina1.ToString());
            this.xQueryValues.Add(txtmanejadisciplinaOtros.Value.ToString());
            this.xQueryValues.Add(txtComentariomanejadisciplinaotros.Value.ToString());
            this.xQueryValues.Add(ddestilocrianza.SelectedValue.ToString());
            this.xQueryValues.Add(txtestilocrianzaComentario.Value.ToString());
            this.xQueryValues.Add(ddEstadoCivil.SelectedValue.ToString());
            this.xQueryValues.Add(txtEstadoCivilotros.Value.ToString());
            this.xQueryValues.Add(ddEstructuraFamiliar.SelectedValue.ToString());
            this.xQueryValues.Add(ckpersonavivenencasa1.ToString());
            this.xQueryValues.Add(txtpersonavivenencasaComentario.Value.ToString());
            this.xQueryValues.Add(ddlrelacionpadres.SelectedValue.ToString());
            this.xQueryValues.Add(txtddlrelacionpadresotros.Value.ToString());
            this.xQueryValues.Add(ddlrelacionpacientemadre.SelectedValue.ToString());
            this.xQueryValues.Add(txtrelacionpacientemadreOtros.Value.ToString());
            this.xQueryValues.Add(txtrelacionpacientemadreComentario.Value.ToString());
            this.xQueryValues.Add(ddrelacinopacientepadre.SelectedValue.ToString());
            this.xQueryValues.Add(txtrelacionpacientepadreOtros.Value.ToString());
            this.xQueryValues.Add(txtrelacionpacientepadreComentario.Value.ToString());
            this.xQueryValues.Add(ddlrelacionpacientecuidador.SelectedValue.ToString());
            this.xQueryValues.Add(txtrelacionpacientecuidadorOtros.Value.ToString());
            this.xQueryValues.Add(txtrelacionpacientecuidadorComentario.Value.ToString());
            this.xQueryValues.Add(ddHermanosFallecidos.SelectedValue.ToString());
            if (txthermanosCuantos.Value.ToString() == "")
            {
                txthermanosCuantos.Value = "0";
            }
            this.xQueryValues.Add(txthermanosCuantos.Value.ToString());
            this.xQueryValues.Add(txthermanosCausa.Value.ToString());
            this.xQueryValues.Add(txthacequetiempoleinformacion.Value.ToString());
            this.xQueryValues.Add(txtimpactoymanejo.Value.ToString());
            this.xQueryValues.Add(cksituacionesespeciales1.ToString());
            this.xQueryValues.Add(ddconductaeinteraccion.SelectedValue.ToString());
            this.xQueryValues.Add(txtconductaeinteraccionotros.Value.ToString());
            this.xQueryValues.Add(ddconductaeinteraccionadultos.SelectedValue.ToString());
            this.xQueryValues.Add(txtconductaeinteraccionadultosotros.Value.ToString());
            this.xQueryValues.Add(expectativasactuales.Value.ToString());
            this.xQueryValues.Add(txtobjectivosterapeuticos.Value.ToString());
            this.xQueryValues.Add(txtqueescalidadvida.Value.ToString());
            this.xQueryValues.Add(ckproblemasidentificados1.ToString());
            this.xQueryValues.Add(ckobjetivosplanteados1.ToString());
            this.xQueryValues.Add(txttareas.Value.ToString());
            this.xQueryValues.Add(ddConductaparticipantesensession.SelectedValue.ToString());
            this.xQueryValues.Add(txtComentarios.Value.ToString());
            this.xQueryValues.Add(ddpacientesospechamaltrato.SelectedValue.ToString());
            this.xQueryValues.Add(txtpacientesospechamaltratoComentarios.Value.ToString());
            this.xQueryValues.Add(ddfamiliaenproceso.SelectedValue.ToString());
            this.xQueryValues.Add(txtfamiliaenprocesoComentarios.Value.ToString());
            this.xQueryValues.Add(txtposiblesproblematicas.Value.ToString());
            this.xQueryValues.Add(ddsituacionesquegeneran.SelectedValue.ToString());
            this.xQueryValues.Add(txtsituacionesquegeneranotros.Value.ToString());
            this.xQueryValues.Add(txtsituacionesquegeneranComentarios.Value.ToString());
            this.xQueryValues.Add(ddAntecedentesMedicosMadre.SelectedValue.ToString());
            this.xQueryValues.Add(txtAntecedentesMedicosMadreEspecifique.Value.ToString());
            this.xQueryValues.Add(ckDiagnosticoTranstornoMental1.ToString());
            this.xQueryValues.Add(txtDiagnosticoosospechatrastornootros.Value.ToString());
            this.xQueryValues.Add(ddlRecibeTratamientopsicologico.SelectedValue.ToString());
            this.xQueryValues.Add(txtRecibeTratamientopsicologicomotivo.Value.ToString());
            this.xQueryValues.Add(txtRecibeTratamientopsicologicoProfesional.Value.ToString());
            this.xQueryValues.Add(ddTratamientopsiquiatrico.SelectedValue.ToString());
            this.xQueryValues.Add(txtRecibeTratamientopsiquiatricomotivo.Value.ToString());
            this.xQueryValues.Add(txtRecibeTratamientopsiquiatricoProfesional.Value.ToString());
            this.xQueryValues.Add(ckAntecedentesdrogodependientes1.ToString());
            this.xQueryValues.Add(txtAntecedentesdrogodependientes.Value.ToString());
            this.xQueryValues.Add(txthacequetiempoleinformacion.Value.ToString());
            this.xQueryValues.Add(ddAntecedentesMedicospadre.SelectedValue.ToString());
            this.xQueryValues.Add(txtAntecedentesMedicospadreEspecifique.Value.ToString());
            this.xQueryValues.Add(ckDiagnosticoosospechatrastornopadre1.ToString());
            this.xQueryValues.Add(txtDiagnosticoosospechatrastornopadreotros.Value.ToString());
            this.xQueryValues.Add(ddRecibeTratamientopsicologicopadre.SelectedValue.ToString());
            this.xQueryValues.Add(txtRecibeTratamientopsicologicopadremotivo.Value.ToString());
            this.xQueryValues.Add(txtRecibeTratamientopsicologicopadreProfesional.Value.ToString());
            this.xQueryValues.Add(ddRecibeTratamientopsiquiatricopadre.SelectedValue.ToString());
            this.xQueryValues.Add(txtRecibeTratamientopsiquiatricopadremotivo.Value.ToString());
            this.xQueryValues.Add(txtRecibeTratamientopsiquiatricopadreProfesional.Value.ToString());
            this.xQueryValues.Add(ckAntecedentesdrogodependientespadre1.ToString());
            this.xQueryValues.Add(txtAntecedentesdrogodependientespadre.Value.ToString());
            this.xQueryValues.Add(txthacequetiempoleinformacionPadre.Value.ToString());
            this.xQueryValues.Add(usuario.ToString());
            this.xQueryValues.Add(centro.ToString());
            DataTable dataTable2 = DB.ExecuteAdapter("PR_TFEntrevistaInicial", this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure); if (dataTable2.Rows.Count != 0)
            {
                DataRow row2 = dataTable2.Rows[0];
                if (row2["Conteo"].ToString() != "0")
                {
                    Notify("Registro Guardado", "success");
                }
                else
                    Notify("No se pudo almacenar la informacion", "error");
            }
            else
                Notify("No se pudo almacenar la informacion", "error");
        }

        protected void LlenoPantalla()
        {
            if (Request.QueryString["rowguidpaciente"].ToString() != "")
                IDPaciente = Request.QueryString["rowguidpaciente"].ToString();
            centro = Request.QueryString["XCURRENTUSR_SGXID"].ToString();


            this.xQueryParameters.Clear();
            this.xQueryValues.Clear();
            this.xQueryParameters.Add("@IDPACIENTE");
            this.xQueryValues.Add(IDPaciente.ToString());
            this.xQueryParameters.Add("@ROWSGXID");
            this.xQueryValues.Add(centro.ToString());
            this.xQuery = "PR_TFEntrevistaInicial_BUSCA";
            DataTable dtTFEntrevistaInicial = DB.ExecuteAdapter(this.xQuery, this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure);
            DataRow dataRow = dtTFEntrevistaInicial.Rows.Count != 0 ? dtTFEntrevistaInicial.Rows[0] : (DataRow)null;
            if (dataRow == null)
                return;

            string[] strchecklist;

            this.txtCelulareMadre.Value = dataRow["MadreCelular"].ToString();
            this.txtTelefonoResidenciamadre.Value = dataRow["MadreTelefonoResidencial"].ToString();
            this.txtTelefonoTrabajomadre.Value = dataRow["MadreTelefonoTrabajo"].ToString();
            this.txtCorreoMadre.Value = dataRow["MadreCorreoElectronico"].ToString();
            this.txtCelularepadre.Value = dataRow["PadreCelular"].ToString();
            this.txtTelefonoResidenciapadre.Value = dataRow["PadreTelefonoResidencial"].ToString();
            this.txtTelefonoTrabajopadre.Value = dataRow["PadreTelefonoTrabajo"].ToString();
            this.txtcorreopadre.Value = dataRow["PadreCorreoElectronico"].ToString();
            this.txtCelulareTutor.Value = dataRow["TutorCelular"].ToString();
            this.txtTelefonoResidenciaTutor.Value = dataRow["TutorTelefonoResidencial"].ToString();
            this.txtTelefonoTrabajoTutor.Value = dataRow["TutorTelefonoTrabajo"].ToString();
            this.txtcorreoTutor.Value = dataRow["TutorCorreoElectronico"].ToString();
            strchecklist = dtTFEntrevistaInicial.Rows[0]["ParticipanteEntrevista"].ToString().Split(chArray);
            if (strchecklist[0] != "")
            {
                foreach (string str in strchecklist)
                    this.ckparticipantes.Items.FindByValue(str).Selected = true;
            }
            this.txtparticipantesotros.Value = dataRow["ParticipanteEntrevistaOtros"].ToString();
            strchecklist = dtTFEntrevistaInicial.Rows[0]["PersonasCargoCuidadoPx"].ToString().Split(chArray);
            if (strchecklist[0] != "")
            {
                foreach (string str in strchecklist)
                    this.ckpersonaCargo.Items.FindByValue(str).Selected = true;
            }
            this.txtpersoncargootros.Value = dataRow["PersonasCargoCuidadoPxOtros"].ToString();
            this.txtComentariopersoncargootros.Value = dataRow["PersonasCargoCuidadoPxComentario"].ToString();
            strchecklist = dtTFEntrevistaInicial.Rows[0]["ManejoDisciplinaPx"].ToString().Split(chArray);
            if (strchecklist[0] != "")
            {
                foreach (string str in strchecklist)
                    this.ckmanejadisciplina.Items.FindByValue(str).Selected = true;
            }
            this.txtmanejadisciplinaOtros.Value = dataRow["ManejoDisciplinaPxOtros"].ToString();
            this.txtComentariomanejadisciplinaotros.Value = dataRow["ManejoDisciplinaPxComentario"].ToString();
            this.ddestilocrianza.SelectedValue = dataRow["EstiloCrianza"].ToString();
            this.txtestilocrianzaComentario.Value = dataRow["EstiloCrianzaComentario"].ToString();
            this.ddEstadoCivil.SelectedValue = dataRow["EstadoCivil"].ToString();
            this.txtEstadoCivilotros.Value = dataRow["EstadoCivilComentario"].ToString();
            this.ddEstructuraFamiliar.SelectedValue = dataRow["EstructuraFamiliar"].ToString();
            strchecklist = dtTFEntrevistaInicial.Rows[0]["PersonasVivenCasa"].ToString().Split(chArray);
            if (strchecklist[0] != "")
            {
                foreach (string str in strchecklist)
                    this.ckpersonavivenencasa.Items.FindByValue(str).Selected = true;
            }
            this.txtpersonavivenencasaComentario.Value = dataRow["PersonasVivenCasaComentario"].ToString();
            this.ddlrelacionpadres.SelectedValue = dataRow["RelacionEntrePadres"].ToString();
            this.txtddlrelacionpadresotros.Value = dataRow["RelacionEntrePadresComentario"].ToString();
            this.ddlrelacionpacientemadre.SelectedValue = dataRow["RelacionPXconMadre"].ToString();
            this.txtrelacionpacientemadreOtros.Value = dataRow["RelacionPXconMadreOtros"].ToString();
            this.txtrelacionpacientemadreComentario.Value = dataRow["RelacionPXconMadreComentario"].ToString();
            this.ddrelacinopacientepadre.SelectedValue = dataRow["RelacionPXconlaPadre"].ToString();
            this.txtrelacionpacientepadreOtros.Value = dataRow["RelacionPXconPadreOtros"].ToString();
            this.txtrelacionpacientepadreComentario.Value = dataRow["RelacionPXconPadreComentario"].ToString();
            this.ddlrelacionpacientecuidador.SelectedValue = dataRow["RelacionPXconOtroCuidador"].ToString();
            this.txtrelacionpacientecuidadorOtros.Value = dataRow["RelacionPXconOtroCuidadorOtros"].ToString();
            this.txtrelacionpacientecuidadorComentario.Value = dataRow["RelacionPXconOtroCuidadorComentario"].ToString();
            this.ddHermanosFallecidos.SelectedValue = dataRow["HermanosFallecidos"].ToString();
            this.txthermanosCuantos.Value = dataRow["HermanosCuantos"].ToString();
            this.txthermanosCausa.Value = dataRow["HermanosCausa"].ToString();
            this.txthacequetiempoleinformacion.Value = dataRow["HacequeTiempoDiagnostico"].ToString();
            this.txtimpactoymanejo.Value = dataRow["ImpactoManejoCondicionFamiliar"].ToString();
            strchecklist = dtTFEntrevistaInicial.Rows[0]["SituacionesEspecialesAmbitoEscolar"].ToString().Split(chArray);
            if (strchecklist[0] != "")
            {
                foreach (string str in strchecklist)
                    this.cksituacionesespeciales.Items.FindByValue(str).Selected = true;
            }
            this.ddconductaeinteraccion.SelectedValue = dataRow["ConductaInteraccionConGruposPares"].ToString();
            this.txtconductaeinteraccionotros.Value = dataRow["ConductaInteraccionConGruposOtros"].ToString();
            this.ddconductaeinteraccionadultos.SelectedValue = dataRow["ConductaInteraccionConGruposAdultos"].ToString();
            this.txtconductaeinteraccionadultosotros.Value = dataRow["ConductaInteraccionConGruposAdultosOtros"].ToString();
            this.expectativasactuales.Value = dataRow["ExpectativasActualesFamiliares"].ToString();
            this.txtobjectivosterapeuticos.Value = dataRow["ObjectivosTerapeuticosPlanteados"].ToString();
            this.txtqueescalidadvida.Value = dataRow["QueesCalidadVida"].ToString();
            strchecklist = dtTFEntrevistaInicial.Rows[0]["ProblemasIdentificadosporTerapeuta"].ToString().Split(chArray);
            if (strchecklist[0] != "")
            {
                foreach (string str in strchecklist)
                    this.ckproblemasidentificados.Items.FindByValue(str).Selected = true;
            }
            strchecklist = dtTFEntrevistaInicial.Rows[0]["ObjetivosPlanteadosTerapeuta"].ToString().Split(chArray);
            if (strchecklist[0] != "")
            {
                foreach (string str in strchecklist)
                    this.ckobjetivosplanteados.Items.FindByValue(str).Selected = true;
            }
            this.txttareas.Value = dataRow["Tareas"].ToString();
            this.ddConductaparticipantesensession.SelectedValue = dataRow["ConductaParticipantesSesion"].ToString();
            this.txtComentarios.Value = dataRow["ComentariosGeneralesTerapeuta"].ToString();
            this.ddpacientesospechamaltrato.SelectedValue = dataRow["PacienteSospechaMaltrato"].ToString();
            this.txtpacientesospechamaltratoComentarios.Value = dataRow["PacienteSospechaMaltratoOtros"].ToString();
            this.ddfamiliaenproceso.SelectedValue = dataRow["FamiliaProcesoLegal"].ToString();
            this.txtfamiliaenprocesoComentarios.Value = dataRow["FamiliaProcesoLegalMotivo"].ToString();
            this.txtposiblesproblematicas.Value = dataRow["PosiblesProblematicaGeneradoDiagnostico"].ToString();
            this.ddsituacionesquegeneran.SelectedValue = dataRow["SituacionesMalestarParejaFamilia"].ToString();
            this.txtsituacionesquegeneranotros.Value = dataRow["SituacionesMalestarParejaFamiliaOtros"].ToString();
            this.txtsituacionesquegeneranComentarios.Value = dataRow["SituacionesMalestarParejaFamiliaComentario"].ToString();
            this.ddAntecedentesMedicosMadre.SelectedValue = dataRow["MadreAntecedentesMedicos"].ToString();
            this.txtAntecedentesMedicosMadreEspecifique.Value = dataRow["MadreAntecedentesMedicosEspecifique"].ToString();
            strchecklist = dtTFEntrevistaInicial.Rows[0]["MadreDiagnosticoSopechaTrastornoMental"].ToString().Split(chArray);
            if (strchecklist[0] != "")
            {
                foreach (string str in strchecklist)
                    this.ckDiagnosticoTranstornoMental.Items.FindByValue(str).Selected = true;
            }
            this.txtDiagnosticoosospechatrastornootros.Value = dataRow["MadreDiagnosticoSopechaTrastornoMentalOtros"].ToString();
            this.ddlRecibeTratamientopsicologico.SelectedValue = dataRow["MadreRecibeTratamientoPsicologico"].ToString();
            this.txtRecibeTratamientopsicologicomotivo.Value = dataRow["MadreRecibeTratamientoPsicologicoMotivo"].ToString();
            this.txtRecibeTratamientopsicologicoProfesional.Value = dataRow["MadreRecibeTratamientoPsicologicoProfesional"].ToString();
            this.ddTratamientopsiquiatrico.SelectedValue = dataRow["MadreRecibeTratamientoPsiquiatrico"].ToString();
            this.txtRecibeTratamientopsiquiatricomotivo.Value = dataRow["MadreRecibeTratamientoPsiquiatricoMotivo"].ToString();
            this.txtRecibeTratamientopsiquiatricoProfesional.Value = dataRow["MadreRecibeTratamientoPsiquiatricoProfesional"].ToString();
            strchecklist = dtTFEntrevistaInicial.Rows[0]["MadreAntecedentesDrogodependientes"].ToString().Split(chArray);
            if (strchecklist[0] != "")
            {
                foreach (string str in strchecklist)
                    this.ckAntecedentesdrogodependientes.Items.FindByValue(str).Selected = true;
            }
            this.txtAntecedentesdrogodependientes.Value = dataRow["MadreAntecedentesDrogodependientesOtros"].ToString();
            this.txthacequetiempoleinformacion.Value = dataRow["MadreOtrasInformacionesInteres"].ToString();
            this.ddAntecedentesMedicospadre.SelectedValue = dataRow["PadreAntecedentesMedicos"].ToString();
            this.txtAntecedentesMedicospadreEspecifique.Value = dataRow["PadreAntecedentesMedicosEspecifique"].ToString();
            strchecklist = dtTFEntrevistaInicial.Rows[0]["PadreDiagnosticoSopechaTrastornoMental"].ToString().Split(chArray);
            if (strchecklist[0] != "")
            {
                foreach (string str in strchecklist)
                    this.ckDiagnosticoosospechatrastornopadre.Items.FindByValue(str).Selected = true;
            }
            this.txtDiagnosticoosospechatrastornopadreotros.Value = dataRow["PadreDiagnosticoSopechaTrastornoMentalOtros"].ToString();
            this.ddRecibeTratamientopsicologicopadre.SelectedValue = dataRow["PadreRecibeTratamientoPsicologico"].ToString();
            this.txtRecibeTratamientopsicologicopadremotivo.Value = dataRow["PadreRecibeTratamientoPsicologicoMotivo"].ToString();
            this.txtRecibeTratamientopsicologicopadreProfesional.Value = dataRow["PadreRecibeTratamientoPsicologicoProfesional"].ToString();
            this.ddRecibeTratamientopsiquiatricopadre.SelectedValue = dataRow["PadreRecibeTratamientoPsiquiatrico"].ToString();
            this.txtRecibeTratamientopsiquiatricopadremotivo.Value = dataRow["PadreRecibeTratamientoPsiquiatricoMotivo"].ToString();
            this.txtRecibeTratamientopsiquiatricopadreProfesional.Value = dataRow["PadreRecibeTratamientoPsiquiatricoProfesional"].ToString();
            strchecklist = dtTFEntrevistaInicial.Rows[0]["PadreAntecedentesDrogodependientes"].ToString().Split(chArray);
            if (strchecklist[0] != "")
            {
                foreach (string str in strchecklist)
                    this.ckAntecedentesdrogodependientespadre.Items.FindByValue(str).Selected = true;
            }
            this.txtAntecedentesdrogodependientespadre.Value = dataRow["PadreAntecedentesDrogodependientesOtros"].ToString();
            this.txthacequetiempoleinformacionPadre.Value = dataRow["PadreOtrasInformacionesInteres"].ToString();
            _CagarDetallesHermanos();
        }

        protected void _SaveDetallesHermanos(object sender, EventArgs e)
        {
            if (txtnombreHermano.Value.ToString() == "")
            {
                Notify("Debe especificar el Nombre", "error");
                Mover(txthacequetiempoleinformacion.ClientID);
                return;
            }

            IDPaciente = Request.QueryString["rowguidpaciente"].ToString();
            usuario = Request.QueryString["XCurrentUSR_ROWGUID"].ToString();
            centro = Request.QueryString["XCURRENTUSR_SGXID"].ToString();
            this.xQueryParameters.Clear();
            this.xQueryValues.Clear();
            this.xQueryParameters.Add("@IDPACIENTE");
            this.xQueryValues.Add(IDPaciente.ToString());
            this.xQueryParameters.Add("@Nombre");
            this.xQueryValues.Add(txtnombreHermano.Value.ToString());
            this.xQueryParameters.Add("@Edad");
            
            if (TxtEdadHermano.Value.ToString() == "")
            {
                TxtEdadHermano.Value = "0";
            } 
            this.xQueryValues.Add(TxtEdadHermano.Value.ToString());
            this.xQueryParameters.Add("@Diagnostico");
            this.xQueryValues.Add(TxtDiagnosticoHermano.Value.ToString());
            this.xQueryParameters.Add("@TipoRelacion");
            this.xQueryValues.Add(TxtTipoRelacionHermano.Value.ToString());
            this.xQueryParameters.Add("@ROWUSERID");
            this.xQueryValues.Add(usuario.ToString());
            this.xQueryParameters.Add("@ROWSGXID");
            this.xQueryValues.Add(centro.ToString());


            this.xQuery = "PR_TFEntrevistaInicialHermanos";
            if (!DB.ExecuteNonQuery(this.xQuery, this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure))
                return;
            this._CagarDetallesHermanos();
            txtnombreHermano.Value = "";
            TxtEdadHermano.Value = "";
            TxtDiagnosticoHermano.Value = "";
            TxtTipoRelacionHermano.Value = "";
            Mover(txthacequetiempoleinformacion.ClientID);
        }

        private void _CagarDetallesHermanos()
        {
            
            IDPaciente = Request.QueryString["rowguidpaciente"].ToString();
            centro = Request.QueryString["XCURRENTUSR_SGXID"].ToString();
             
            this.xQueryParameters.Clear();
            this.xQueryValues.Clear();
            this.xQueryParameters.Add("@IDPACIENTE");
            this.xQueryValues.Add(IDPaciente.ToString());
            this.xQueryParameters.Add("@ROWSGXID");
            this.xQueryValues.Add(centro.ToString());
            this.xQuery = "PR_TFEntrevistaInicialHermanos_BUSCA";
            this.rpDataHermanos.DataSource = DB.ExecuteAdapter(this.xQuery, this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure);
            this.rpDataHermanos.DataBind();
            this.xQuery = "PR_TFEntrevistaInicialHermanos_BUSCA";
        
        }

        protected void _DELETE(object sender, EventArgs e)
        {
           

            this.xCommand = ((LinkButton)sender).CommandName.ToString();
            if (this.xCommand == "DeleteDetHermanos")
            {
                if (dtusuarios.Rows.Count == 0)
                {
                    Notify("Usted no tiene acceso a eliminar hermanos", "error");
                    Mover(txthacequetiempoleinformacion.ClientID);
                    return;

                }
                    string secuencia = ((LinkButton)sender).CommandArgument.ToString();
                this.xQueryParameters.Clear();
                this.xQueryValues.Clear();
                this.xQueryParameters.Add((object)"@secuencia");
                this.xQueryValues.Add(secuencia); 
                this.xQuery = "PR_TFEntrevistaInicialHermanos_DELETE";
                DB.ExecuteNonQuery(this.xQuery, this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure); 
            }
            _CagarDetallesHermanos();
            Mover(txthacequetiempoleinformacion.ClientID);

        }
        public void Mover(string control)
        { 
            if (control.ToString() !="")
            { Page.SetFocus(control.ToString()); } 
        }
        protected void _Back(object sender, EventArgs e)
        {
            if (Request.QueryString["rowguidpaciente"].ToString() != "")
                IDPaciente = Request.QueryString["rowguidpaciente"].ToString();
            this.Response.Redirect("http://caidsiges01:8000/HCL00000.aspx?X=" + IDPaciente);
            
        }


        protected void rptStudentQuestion_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            //if (e.Item.ItemType == ListItemType.Item)
            //{
                if (dtusuarios.Rows.Count == 0)
                {
                    LinkButton btnDelete1 = new LinkButton();
                    btnDelete1 = (LinkButton) rpDataHermanos.FindControl("btnDelete");
                    btnDelete1.Visible = false;
                //}

}
        }


    }
}