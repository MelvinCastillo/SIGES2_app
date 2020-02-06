using System;
using System.Collections;
using System.Data;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using CAID.Data;


namespace CAID_V2.forms
{
    public partial class TOEvaluacionInicial : System.Web.UI.Page
    {

        private ArrayList xQueryParameters = new ArrayList();
        private ArrayList xQueryValues = new ArrayList();
        private string xCommand;
        private string xQuery;

        string IDPaciente;
        Int64 Secuencia;
        string usuario;
        string centro;
        public string CkDominanciaNeuroMuscular;
        char[] chArray = new char[5]
        {
                ' ',
                ',',
                '.',
                ':',
                '\t'
        };
        string[] strchecklist;

        DataTable dtusuarios = new DataTable();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                //Notify("Tiempo "+Convert.ToString(this.Session.Timeout), "success");

                _Buscar(sender, e);
                _BuscarGeneralesPx(sender, e);
                //LlenoPantalla();

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

            if (Secuencia.ToString() == "0")
            {
                if (Session["StrSecuencia"].ToString() != "")

                    Secuencia = Convert.ToInt64(Session["StrSecuencia"].ToString());
                Session.Add("StrSecuencia", "");
            }
            this.xQueryParameters.Add("@Secuencia");
            this.xQueryParameters.Add("@IDPACIENTE");
            this.xQueryParameters.Add("@HistoriaFamiliarRelevante");
            this.xQueryParameters.Add("@HistoriaMedica");
            this.xQueryParameters.Add("@Alineacionsegmentoscorporales");
            this.xQueryParameters.Add("@Relajacionsegmentoscorporales");
            this.xQueryParameters.Add("@Tonicidad");
            this.xQueryParameters.Add("@RangoMovimientoArticular");
            this.xQueryParameters.Add("@DominanciaNeuroMuscular");
            this.xQueryParameters.Add("@ComentarioNeuroMuscular");
            this.xQueryParameters.Add("@Supinaflexora");
            this.xQueryParameters.Add("@Rolado");
            this.xQueryParameters.Add("@Pronaextensora");
            this.xQueryParameters.Add("@Arrastre");
            this.xQueryParameters.Add("@Cuatro4puntos");
            this.xQueryParameters.Add("@Gateo");
            this.xQueryParameters.Add("@Caminar");
            this.xQueryParameters.Add("@Subirbajarescaleras");
            this.xQueryParameters.Add("@Saltar");
            this.xQueryParameters.Add("@Integracionmotora");
            this.xQueryParameters.Add("@Reaccionenderezamientoequilibrio");
            this.xQueryParameters.Add("@Posiciondecaballero");
            this.xQueryParameters.Add("@ComentarioPatronesPosturales");
            this.xQueryParameters.Add("@Crucelineamedia");
            this.xQueryParameters.Add("@SeguimientoocularDerecho");
            this.xQueryParameters.Add("@SeguimientoocularIzquierdo");
            this.xQueryParameters.Add("@SeguimientoocularArriba");
            this.xQueryParameters.Add("@SeguimientoocularAbajo");
            this.xQueryParameters.Add("@Circular");
            this.xQueryParameters.Add("@MovimientosOcularesObservacion");
            this.xQueryParameters.Add("@Comeconlosdedos");
            this.xQueryParameters.Add("@Puedeusartenedor");
            this.xQueryParameters.Add("@Puedeusarcuchara");
            this.xQueryParameters.Add("@Puedeusarcuchillo");
            this.xQueryParameters.Add("@Bebedeunvaso");
            this.xQueryParameters.Add("@Sequitacamiseta");
            this.xQueryParameters.Add("@Seponesueter");
            this.xQueryParameters.Add("@Sequitasueter");
            this.xQueryParameters.Add("@Seponepantalones");
            this.xQueryParameters.Add("@Sequitapantalones");
            this.xQueryParameters.Add("@Gorra");
            this.xQueryParameters.Add("@PantaloncillosPanti");
            this.xQueryParameters.Add("@Medias");
            this.xQueryParameters.Add("@Botoneszipper");
            this.xQueryParameters.Add("@Seataloscordones");
            this.xQueryParameters.Add("@Seponeyquitaelcinturón");
            this.xQueryParameters.Add("@Seponeloszapatos");
            this.xQueryParameters.Add("@Secolocasobreelinodoro");
            this.xQueryParameters.Add("@Utilizaelpapelhigiénico");
            this.xQueryParameters.Add("@Descargaelinodoro");
            this.xQueryParameters.Add("@Utilizaayudastecnicas");
            //this.xQueryParameters.Add("@Subeybajaescaleras");
            this.xQueryParameters.Add("@Selavalasmanos");
            this.xQueryParameters.Add("@Sesecalasmanos");
            this.xQueryParameters.Add("@Secepillaelpelo");
            this.xQueryParameters.Add("@Selavalosdientes");
            this.xQueryParameters.Add("@Selavalacara");
            this.xQueryParameters.Add("@otroActividadesDiarias");
            this.xQueryParameters.Add("@ComentarioActividadesdiarias");
            this.xQueryParameters.Add("@Reconocimientodefigura");
            this.xQueryParameters.Add("@Copiadefigura");
            this.xQueryParameters.Add("@Trazadodelineas");
            this.xQueryParameters.Add("@Recorta");
            //this.xQueryParameters.Add("@Matematicas");
            this.xQueryParameters.Add("@Escribirleer");
            this.xQueryParameters.Add("@Manipulaciondeobjetivos");
            this.xQueryParameters.Add("@Crucedelineamedia");
            this.xQueryParameters.Add("@Dominancia");
            this.xQueryParameters.Add("@Utilizacióndecomputadora");
            this.xQueryParameters.Add("@Escolarizado");
            this.xQueryParameters.Add("@NombredelColegio");
            this.xQueryParameters.Add("@NivelEscolar");
            this.xQueryParameters.Add("@ObservacionEstudiosAprendizaje");
            this.xQueryParameters.Add("@Independenciaeneljuego");
            this.xQueryParameters.Add("@Preferenciadelosjuegos");
            this.xQueryParameters.Add("@Juegosdidacticos");
            this.xQueryParameters.Add("@Aquejuegaconlospadres");
            this.xQueryParameters.Add("@Adondesalenajugar");
            this.xQueryParameters.Add("@Interaccionconloshermanos");
            this.xQueryParameters.Add("@Participacioneneventosfamiliares");
            this.xQueryParameters.Add("@Actividadesfueradelhogar");
            this.xQueryParameters.Add("@Juegoconamigos");
            this.xQueryParameters.Add("@OtrosJuegos");
            this.xQueryParameters.Add("@Dispraxia");
            this.xQueryParameters.Add("@PosturalOcular");
            this.xQueryParameters.Add("@Modulacion");
            //this.xQueryParameters.Add("@ModulacionHipo");
            //this.xQueryParameters.Add("@ModulacionBuscador");
            this.xQueryParameters.Add("@Discriminacion");
            this.xQueryParameters.Add("ComentarioDispraxia");
            this.xQueryParameters.Add("ComentarioPosturalOcular");
            this.xQueryParameters.Add("ComentarioModulacion");
            this.xQueryParameters.Add("ComentarioDiscriminacion");
            this.xQueryParameters.Add("@Cualessonlashabilidadesydificultades");
            this.xQueryParameters.Add("@Quepreocupaalospadres");
            this.xQueryParameters.Add("@Expectativasymetas");
            this.xQueryParameters.Add("@Definicionsociosdelprocesodetratamiento");
            this.xQueryParameters.Add("@Impresiones");
            this.xQueryParameters.Add("@Habilidades");
            this.xQueryParameters.Add("@Dificultades");
            this.xQueryParameters.Add("@Objetivos");
            this.xQueryParameters.Add("@Otrasevaluacionesrequeridas");
            this.xQueryParameters.Add("@Referimientonecesario");
            this.xQueryParameters.Add("@SesionesIndividualizadas");
            this.xQueryParameters.Add("@ProgramadetalleresenAVD");
            this.xQueryParameters.Add("@Grupodeninosconhabilidadesydestrezas");
            this.xQueryParameters.Add("@CharlasGenerales");
            this.xQueryParameters.Add("@ProgramadevisitasdomiciliariaOEscolar");
            this.xQueryParameters.Add("@ROWUSERID");
            this.xQueryParameters.Add("@ROWSGXID");
            this.xQueryParameters.Add("@PlanCuatrimestralTerapiaActiva");
            this.xQueryParameters.Add("@PlanCuatrimestralEntrenaPadres");
            this.xQueryParameters.Add("@PlanCuatrimestralTerapiaAcuatica");
            this.xQueryParameters.Add("@PlanCuatrimestralVisitaDomiciliaria");
            this.xQueryParameters.Add("@PlanMixtoTerapiaActiva");
            this.xQueryParameters.Add("@PlanMixtoEntrenaPadres");
            this.xQueryParameters.Add("@PlanMixtoTerapiaAcuatica");
            this.xQueryParameters.Add("@PlanMixtoVisitaDomiciliaria");
            this.xQueryParameters.Add("@pef");

            /*Checklist Alimentacion Actual */
            CkDominanciaNeuroMuscular = "";
            for (int index = 0; index < this.ddlDominanciaNeuroMuscular.Items.Count; ++index)
            {
                if (this.ddlDominanciaNeuroMuscular.Items[index].Selected)
                    CkDominanciaNeuroMuscular = CkDominanciaNeuroMuscular + "," + this.ddlDominanciaNeuroMuscular.Items[index].Value.Trim();
            }
            if (CkDominanciaNeuroMuscular != "")
                CkDominanciaNeuroMuscular = CkDominanciaNeuroMuscular.Remove(0, 1);

            this.xQueryValues.Add(Secuencia);
            this.xQueryValues.Add(IDPaciente.ToString());
            this.xQueryValues.Add(txtHistoriafamiliarrelevante.Value.ToString());
            this.xQueryValues.Add(txtHistoriamedica.Value.ToString());
            this.xQueryValues.Add(ddlAlineaciondelossegmentoscorporales.SelectedValue.ToString());
            this.xQueryValues.Add(ddlRelajaciondelossegmentoscorporales.SelectedValue.ToString());
            this.xQueryValues.Add(ddlTonicidad.SelectedValue.ToString());
            this.xQueryValues.Add(txtRangoMovimientoArticular.Value.ToString());
            this.xQueryValues.Add(CkDominanciaNeuroMuscular.ToString());
            this.xQueryValues.Add(txtComentarioNeuroMuscular.Value.ToString());
            this.xQueryValues.Add(ddlSupinaflexora.SelectedValue.ToString());
            this.xQueryValues.Add(ddlRolado.SelectedValue.ToString());
            this.xQueryValues.Add(ddlPronaextensora.SelectedValue.ToString());
            this.xQueryValues.Add(ddlArrastre.SelectedValue.ToString());
            this.xQueryValues.Add(ddlCuatro4puntos.SelectedValue.ToString());
            this.xQueryValues.Add(ddlGateo.SelectedValue.ToString());
            this.xQueryValues.Add(ddlCaminar.SelectedValue.ToString());
            this.xQueryValues.Add(ddlSubirbajarescaleras.SelectedValue.ToString());
            this.xQueryValues.Add(ddlSaltar.SelectedValue.ToString());
            this.xQueryValues.Add(ddlIntegracionmotora.SelectedValue.ToString());
            this.xQueryValues.Add(ddlReaccionenderezamientoequilibrio.SelectedValue.ToString());
            this.xQueryValues.Add(ddlPosiciondecaballero.SelectedValue.ToString());
            this.xQueryValues.Add(txtComentariopatronesposturales.Value.ToString());
            this.xQueryValues.Add(ddlCrucelineamedia.SelectedValue.ToString());
            this.xQueryValues.Add(ddlSeguimientoocularDerecho.SelectedValue.ToString());
            this.xQueryValues.Add(ddlSeguimientoocularIzquierdo.SelectedValue.ToString());
            this.xQueryValues.Add(ddlSeguimientoocularArriba.SelectedValue.ToString());
            this.xQueryValues.Add(ddlSeguimientoocularAbajo.SelectedValue.ToString());
            this.xQueryValues.Add(ddlCircular.SelectedValue.ToString());
            this.xQueryValues.Add(txtMovimientosOcularesObservacion.Value.ToString());
            this.xQueryValues.Add(ddlComeconlosdedos.SelectedValue.ToString());
            this.xQueryValues.Add(ddlPuedeusartenedor.SelectedValue.ToString());
            this.xQueryValues.Add(ddlPuedeusarcuchara.SelectedValue.ToString());
            this.xQueryValues.Add(ddlPuedeusarcuchillo.SelectedValue.ToString());
            this.xQueryValues.Add(ddlBebedeunvaso.SelectedValue.ToString());
            this.xQueryValues.Add(ddlSequitacamiseta.SelectedValue.ToString());
            this.xQueryValues.Add(ddlSeponesueter.SelectedValue.ToString());
            this.xQueryValues.Add(ddlSequitasueter.SelectedValue.ToString());
            this.xQueryValues.Add(ddlSeponepantalones.SelectedValue.ToString());
            this.xQueryValues.Add(ddlSequitapantalones.SelectedValue.ToString());
            this.xQueryValues.Add(ddlGorra.SelectedValue.ToString());
            this.xQueryValues.Add(ddlPantaloncillosPanti.SelectedValue.ToString());
            this.xQueryValues.Add(ddlMedias.SelectedValue.ToString());
            this.xQueryValues.Add(ddlBotoneszipper.SelectedValue.ToString());
            this.xQueryValues.Add(ddlSeataloscordones.SelectedValue.ToString());
            this.xQueryValues.Add(ddlSeponeyquitaelcinturon.SelectedValue.ToString());
            this.xQueryValues.Add(ddlSeponeloszapatos.SelectedValue.ToString());
            this.xQueryValues.Add(ddlSecolocasobreelinodoro.SelectedValue.ToString());
            this.xQueryValues.Add(ddlUtilizaelpapelhigienico.SelectedValue.ToString());
            this.xQueryValues.Add(ddlDescargaelinodoro.SelectedValue.ToString());
            this.xQueryValues.Add(ddlUtilizaayudastecnicas.SelectedValue.ToString());
            //this.xQueryValues.Add(ddlSubeybajaescaleras.SelectedValue.ToString());
            this.xQueryValues.Add(ddlSelavalasmanos.SelectedValue.ToString());
            this.xQueryValues.Add(ddlSesecalasmanos.SelectedValue.ToString());
            this.xQueryValues.Add(ddlSecepillaelpelo.SelectedValue.ToString());
            this.xQueryValues.Add(ddlSelavalosdientes.SelectedValue.ToString());
            this.xQueryValues.Add(ddlSelavalacara.SelectedValue.ToString());
            this.xQueryValues.Add(ddlotroActividadesDiarias.SelectedValue.ToString());
            this.xQueryValues.Add(txtComentarioActividadesdiarias.Value.ToString());
            this.xQueryValues.Add(ddlReconocimientodefigura.SelectedValue.ToString());
            this.xQueryValues.Add(ddlCopiadefigura.SelectedValue.ToString());
            this.xQueryValues.Add(ddlTrazadodelineas.SelectedValue.ToString());
            this.xQueryValues.Add(ddlRecorta.SelectedValue.ToString());
            //this.xQueryValues.Add(ddlMatematicas.SelectedValue.ToString());
            this.xQueryValues.Add(ddlEscribirleer.SelectedValue.ToString());
            this.xQueryValues.Add(ddlManipulaciondeobjetivos.SelectedValue.ToString());
            this.xQueryValues.Add(ddlCrucedelineamedia.SelectedValue.ToString());
            this.xQueryValues.Add(ddlDominancia.SelectedValue.ToString());
            this.xQueryValues.Add(ddlUtilizacióndecomputadora.SelectedValue.ToString());
            this.xQueryValues.Add(ddlEscolarizado.SelectedValue.ToString());
            this.xQueryValues.Add(txtNombredelColegio.Value.ToString());
            this.xQueryValues.Add(txtNivelEscolar.Value.ToString());
            this.xQueryValues.Add(txtComentarioEstudiosyaprendizaje.Value.ToString());
            this.xQueryValues.Add(txtIndependenciaeneljuego.Value.ToString());
            this.xQueryValues.Add(txtPreferenciadelosjuegos.Value.ToString());
            this.xQueryValues.Add(txtJuegosdidacticos.Value.ToString());
            this.xQueryValues.Add(txtAquejuegaconlospadres.Value.ToString());
            this.xQueryValues.Add(txtAdondesalenajugar.Value.ToString());
            this.xQueryValues.Add(txtInteraccionconloshermanos.Value.ToString());
            this.xQueryValues.Add(txtParticipacioneneventosfamiliares.Value.ToString());
            this.xQueryValues.Add(txtActividadesfueradelhogar.Value.ToString());
            this.xQueryValues.Add(txtJuegoconamigos.Value.ToString());
            this.xQueryValues.Add(txtOtrosjuegos.Value.ToString());
            this.xQueryValues.Add(ddlDispraxia.SelectedValue.ToString());
            this.xQueryValues.Add(ddlPosturalOcular.SelectedValue.ToString());
            this.xQueryValues.Add(ddlModulacion.SelectedValue.ToString());
            //this.xQueryValues.Add(ddlModulacionHipo.SelectedValue.ToString());
            //this.xQueryValues.Add(ddlModulacionBuscador.SelectedValue.ToString());
            this.xQueryValues.Add(ddlDiscriminacion.SelectedValue.ToString());
            this.xQueryValues.Add(txtComentarioDispraxia.Value.ToString());
            this.xQueryValues.Add(txtComentarioPosturalOcular.Value.ToString());
            this.xQueryValues.Add(txtComentarioModulacion.Value.ToString());
            this.xQueryValues.Add(txtComentarioDiscriminacion.Value.ToString());
            this.xQueryValues.Add(txtCualessonlashabilidadesydificultades.Value.ToString());
            this.xQueryValues.Add(txtQuepreocupaalospadres.Value.ToString());
            this.xQueryValues.Add(txtExpectativasymetas.Value.ToString());
            this.xQueryValues.Add(txtDefinicionsociosproceso.Value.ToString());
            this.xQueryValues.Add(txtImpresiones.Value.ToString());
            this.xQueryValues.Add(txtHabilidades.Value.ToString());
            this.xQueryValues.Add(txtDificultades.Value.ToString());
            this.xQueryValues.Add(txtObjetivos.Value.ToString());
            this.xQueryValues.Add(txtOtrasevaluacionesrequeridas.Value.ToString());
            this.xQueryValues.Add(txtReferimientonecesario.Value.ToString());
            this.xQueryValues.Add(ddlSesionesIndividualizadas.SelectedValue.ToString());
            this.xQueryValues.Add(ddlProgramadetalleresenAVDPadres.SelectedValue.ToString());
            this.xQueryValues.Add(ddlGrupodeninosconhabilidadesydestrezas.SelectedValue.ToString());
            this.xQueryValues.Add(ddlCharlasGenerales.SelectedValue.ToString());
            this.xQueryValues.Add(ddlProgramadevisitasdomiciliaria.SelectedValue.ToString());
            // this.xQueryValues.Add(ddlProgramadevisitasdomiciliaria.SelectedValue.ToString());
            this.xQueryValues.Add(usuario.ToString());
            this.xQueryValues.Add(centro.ToString());

            Int16 ckPlanCuatrimestralTerapiaActiva1 = 0;
            Int16 ckPlanCuatrimestralEntrenaPadres1 = 0;
            Int16 ckPlanCuatrimestralTerapiaAcuatica1 = 0;
            Int16 ckPlanCuatrimestralVisitaDomiciliaria1 = 0;
            Int16 ckPlanMixtoTerapiaActiva1 = 0;
            Int16 ckPlanMixtoEntrenaPadres1 = 0;
            Int16 ckPlanMixtoTerapiaAcuatica1 = 0;
            Int16 ckPlanMixtoVisitaDomiciliaria1 = 0;
            Int16 ckpef1 = 0;

            if (ckPlanCuatrimestralTerapiaActiva.Items[0].Selected == true)
                ckPlanCuatrimestralTerapiaActiva1 = 1;

            if (ckPlanCuatrimestralEntrenaPadres.Items[0].Selected == true)
                ckPlanCuatrimestralEntrenaPadres1 = 1;

            if (ckPlanCuatrimestralTerapiaAcuatica.Items[0].Selected == true)
                ckPlanCuatrimestralTerapiaAcuatica1 = 1;

            if (ckPlanCuatrimestralVisitaDomiciliaria.Items[0].Selected == true)
                ckPlanCuatrimestralVisitaDomiciliaria1 = 1;

            if (ckPlanMixtoTerapiaActiva.Items[0].Selected == true)
                ckPlanMixtoTerapiaActiva1 = 1;

            if (ckPlanMixtoEntrenaPadres.Items[0].Selected == true)
                ckPlanMixtoEntrenaPadres1 = 1;

            if (ckPlanMixtoTerapiaAcuatica.Items[0].Selected == true)
                ckPlanMixtoTerapiaAcuatica1 = 1;

            if (ckPlanMixtoVisitaDomiciliaria.Items[0].Selected == true)
                ckPlanMixtoVisitaDomiciliaria1 = 1;


            if (ckpef.Items[0].Selected == true)
                ckpef1 = 1;

            this.xQueryValues.Add(ckPlanCuatrimestralTerapiaActiva1);
            this.xQueryValues.Add(ckPlanCuatrimestralEntrenaPadres1);
            this.xQueryValues.Add(ckPlanCuatrimestralTerapiaAcuatica1);
            this.xQueryValues.Add(ckPlanCuatrimestralVisitaDomiciliaria1);
            this.xQueryValues.Add(ckPlanMixtoTerapiaActiva1);
            this.xQueryValues.Add(ckPlanMixtoEntrenaPadres1);
            this.xQueryValues.Add(ckPlanMixtoTerapiaAcuatica1);
            this.xQueryValues.Add(ckPlanMixtoVisitaDomiciliaria1);
            this.xQueryValues.Add(ckpef1);

            DataTable dataTable2 = DB.ExecuteAdapter("PR_TOEvaluacionInicial_GUARDAR", this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure); if (dataTable2.Rows.Count != 0)
            {
                DataRow row2 = dataTable2.Rows[0];
                if (row2["Conteo"].ToString() != "0")
                {
                    //_CagarDetallesHermanos();
                    //_CagarNucleoFamiliar();

                    Notify("Registro Guardado", "success");
                    _Back(sender, e);
                    _Buscar(sender, e);
                }
                else
                    Notify("No se pudo almacenar la informacion", "error");
            }
            else
                Notify("No se pudo almacenar la informacion", "error");
        }


        //protected void LlenoPantalla()
        //{
        //    if (Request.QueryString["rowguidpaciente"].ToString() != "")
        //        IDPaciente = Request.QueryString["rowguidpaciente"].ToString();
        //        centro = Request.QueryString["XCURRENTUSR_SGXID"].ToString();


        //    this.xQueryParameters.Clear();
        //    this.xQueryValues.Clear();
        //    this.xQueryParameters.Add("@IDPACIENTE");
        //    this.xQueryValues.Add(IDPaciente.ToString());
        //    this.xQueryParameters.Add("@ROWSGXID");
        //    this.xQueryValues.Add(centro.ToString());
        //    this.xQuery = "PR_TOEvaluacionInicial_BUSCA";
        //    DataTable dtTOEvaluacionInicialInicial = DB.ExecuteAdapter(this.xQuery, this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure);

        //}

        //protected void _SaveDetallesHermanos(object sender, EventArgs e)
        //{
        //    /*if (txtnombreHermano.Value.ToString() == "")
        //    {
        //        Notify("Debe especificar el Nombre", "error");
        //        Mover(txthacequetiempoleinformacion.ClientID);
        //        return;
        //    } */

        //    IDPaciente = Request.QueryString["rowguidpaciente"].ToString();
        //    usuario = Request.QueryString["XCurrentUSR_ROWGUID"].ToString();
        //    centro = Request.QueryString["XCURRENTUSR_SGXID"].ToString();
        //    this.xQueryParameters.Clear();
        //    this.xQueryValues.Clear();
        //    this.xQueryParameters.Add("@IDPACIENTE");
        //    this.xQueryValues.Add(IDPaciente.ToString());
        //    this.xQueryParameters.Add("@Nombre");
        //    //this.xQueryValues.Add(txtnombreHermano.Value.ToString());
        //    this.xQueryParameters.Add("@Edad");

        //    /* if (TxtEdadHermano.Value.ToString() == "")
        //     {
        //         TxtEdadHermano.Value = "0";
        //     }*/
        //    // this.xQueryValues.Add(TxtEdadHermano.Value.ToString());
        //    this.xQueryParameters.Add("@Diagnostico");
        //    // this.xQueryValues.Add(TxtDiagnosticoHermano.Value.ToString());
        //    this.xQueryParameters.Add("@TipoRelacion");
        //    //this.xQueryValues.Add(TxtTipoRelacionHermano.Value.ToString());

        //    this.xQueryParameters.Add("@ROWUSERID");
        //    this.xQueryValues.Add(usuario.ToString());
        //    this.xQueryParameters.Add("@ROWSGXID");
        //    this.xQueryValues.Add(centro.ToString());


        //    this.xQuery = "PR_TFEntrevistaInicialHermanos";
        //    if (!DB.ExecuteNonQuery(this.xQuery, this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure))
        //        return;
        //    this._CagarDetallesHermanos();
        //    // txtnombreHermano.Value = "";
        //    //TxtEdadHermano.Value = "";
        //    //TxtDiagnosticoHermano.Value = "";
        //    //TxtTipoRelacionHermano.Value = "";
        //    //Mover(txthacequetiempoleinformacion.ClientID);
        //}

        //private void _CagarDetallesHermanos()
        //{

        //    IDPaciente = Request.QueryString["rowguidpaciente"].ToString();
        //    centro = Request.QueryString["XCURRENTUSR_SGXID"].ToString();

        //    this.xQueryParameters.Clear();
        //    this.xQueryValues.Clear();
        //    this.xQueryParameters.Add("@IDPACIENTE");
        //    this.xQueryValues.Add(IDPaciente.ToString());
        //    this.xQueryParameters.Add("@ROWSGXID");
        //    this.xQueryValues.Add(centro.ToString());
        //    this.xQuery = "PR_TFEntrevistaInicialHermanos_BUSCA";
        //    this.rpDataHermanos.DataSource = DB.ExecuteAdapter(this.xQuery, this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure);
        //    this.rpDataHermanos.DataBind();
        //    this.xQuery = "PR_TFEntrevistaInicialHermanos_BUSCA";

        //}
        private void _CagarNucleoFamiliar()
        {
            IDPaciente = Request.QueryString["rowguidpaciente"].ToString();
            centro = Request.QueryString["XCURRENTUSR_SGXID"].ToString();

            /*BUSCO NUCLEO FAMILIAR */
            this.xQueryParameters.Clear();
            this.xQueryValues.Clear();
            this.xQueryParameters.Add((object)"@REFGUID");
            this.xQueryValues.Add((object)IDPaciente.ToString());
            this.xQueryParameters.Add((object)"@ROWSGXID");
            this.xQueryValues.Add((object)this.centro);
            this.rpNucleoFamiliar.DataSource = (object)DB.ExecuteAdapter("PAX00001S3", this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure);
            this.rpNucleoFamiliar.DataBind();
        }
        public void Mover(string control)
        {
            if (control.ToString() != "")
            { Page.SetFocus(control.ToString()); }
        }
        protected void _Back(object sender, EventArgs e)
        {
            /*
            if (Request.QueryString["rowguidpaciente"].ToString() != "")
                IDPaciente = Request.QueryString["rowguidpaciente"].ToString();
            this.Response.Redirect("http://caidsiges01:8000/HCL00000.aspx?X=" + IDPaciente);
            */
            pnlConsulta.Visible = true;
            pnlData.Visible = false;
        }

        protected void rptStudentQuestion_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            //if (e.Item.ItemType == ListItemType.Item)
            //{
            /*
            if (dtusuarios.Rows.Count == 0)
            {
                LinkButton btnDelete1 = new LinkButton();
               // btnDelete1 = (LinkButton)rpDataHermanos.FindControl("btnDelete");
                btnDelete1.Visible = false;
                //}

            }*/
        }
        protected void _VerDetalle(object sender, EventArgs e)
        {
            this.xCommand = ((LinkButton)sender).CommandName.ToString();

            string CENTRO = Request.QueryString["XCURRENTUSR_SGXID"].ToString();
            Secuencia = Convert.ToInt64(((LinkButton)sender).CommandArgument.ToString());
            string PACIENTE = Request.QueryString["rowguidpaciente"].ToString();
            //string ESPECIALISTAID = Request.QueryString["CurrentUSR_TERID"].ToString();

            Session.Add("StrSecuencia", Secuencia.ToString());
            this.xQueryParameters.Clear();
            this.xQueryValues.Clear();

            this.xQueryParameters.Add((object)"@secuencia");
            this.xQueryValues.Add(Secuencia);
            this.xQueryParameters.Add((object)"@ROWSGXID");
            this.xQueryValues.Add(CENTRO);
            this.xQuery = "PR_TOEvaluacionInicial_BUSCA";
            DataTable dtEvaluacionCompleta = DB.ExecuteAdapter(this.xQuery, this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure);
            if (dtEvaluacionCompleta.Rows.Count > 0)
            {
                if (this.xCommand == "VerDetalle")
                {
                    DataRow dataRow = dtEvaluacionCompleta.Rows.Count != 0 ? dtEvaluacionCompleta.Rows[0] : (DataRow)null;
                    if (dataRow == null)
                        return;

                    this.txtHistoriafamiliarrelevante.Value = dataRow["HistoriaFamiliarRelevante"].ToString();
                    this.txtHistoriamedica.Value = dataRow["HistoriaMedica"].ToString();
                    this.ddlAlineaciondelossegmentoscorporales.SelectedValue = dataRow["Alineacionsegmentoscorporales"].ToString();
                    this.ddlRelajaciondelossegmentoscorporales.SelectedValue = dataRow["Relajacionsegmentoscorporales"].ToString();
                    this.ddlTonicidad.SelectedValue = dataRow["Tonicidad"].ToString();
                    this.txtRangoMovimientoArticular.Value = dataRow["RangoMovimientoArticular"].ToString();
                    strchecklist = dataRow["DominanciaNeuroMuscular"].ToString().Split(chArray);
                    if (strchecklist[0] != "")
                    {
                        foreach (string str in strchecklist)
                            this.ddlDominanciaNeuroMuscular.Items.FindByValue(str).Selected = true;
                    }
                    this.txtComentarioNeuroMuscular.Value = dataRow["ComentarioNeuroMuscular"].ToString();
                    this.ddlSupinaflexora.SelectedValue = dataRow["Supinaflexora"].ToString();
                    this.ddlRolado.SelectedValue = dataRow["Rolado"].ToString();
                    this.ddlPronaextensora.SelectedValue = dataRow["Pronaextensora"].ToString();
                    this.ddlArrastre.SelectedValue = dataRow["Arrastre"].ToString();
                    this.ddlCuatro4puntos.SelectedValue = dataRow["Cuatro4puntos"].ToString();
                    this.ddlGateo.SelectedValue = dataRow["Gateo"].ToString();
                    this.ddlCaminar.SelectedValue = dataRow["Caminar"].ToString();
                    this.ddlSubirbajarescaleras.SelectedValue = dataRow["Subirbajarescaleras"].ToString();
                    this.ddlSaltar.SelectedValue = dataRow["Saltar"].ToString();
                    this.ddlIntegracionmotora.SelectedValue = dataRow["Integracionmotora"].ToString();
                    this.ddlReaccionenderezamientoequilibrio.SelectedValue = dataRow["Reaccionenderezamientoequilibrio"].ToString();
                    this.ddlPosiciondecaballero.SelectedValue = dataRow["Posiciondecaballero"].ToString();
                    this.txtComentariopatronesposturales.Value = dataRow["ComentarioPatronesPosturales"].ToString();
                    this.ddlCrucelineamedia.SelectedValue = dataRow["Crucelineamedia"].ToString();
                    this.ddlSeguimientoocularDerecho.SelectedValue = dataRow["SeguimientoocularDerecho"].ToString();
                    this.ddlSeguimientoocularIzquierdo.SelectedValue = dataRow["SeguimientoocularIzquierdo"].ToString();
                    this.ddlSeguimientoocularArriba.SelectedValue = dataRow["SeguimientoocularArriba"].ToString();
                    this.ddlSeguimientoocularAbajo.SelectedValue = dataRow["SeguimientoocularAbajo"].ToString();
                    this.ddlCircular.SelectedValue = dataRow["Circular"].ToString();
                    this.txtMovimientosOcularesObservacion.Value = dataRow["MovimientosOcularesObservacion"].ToString();
                    this.ddlComeconlosdedos.SelectedValue = dataRow["Comeconlosdedos"].ToString();
                    this.ddlPuedeusartenedor.SelectedValue = dataRow["Puedeusartenedor"].ToString();
                    this.ddlPuedeusarcuchara.SelectedValue = dataRow["Puedeusarcuchara"].ToString();
                    this.ddlPuedeusarcuchillo.SelectedValue = dataRow["Puedeusarcuchillo"].ToString();
                    this.ddlBebedeunvaso.SelectedValue = dataRow["Bebedeunvaso"].ToString();
                    this.ddlSequitacamiseta.SelectedValue = dataRow["Sequitacamiseta"].ToString();
                    this.ddlSeponesueter.SelectedValue = dataRow["Seponesueter"].ToString();
                    this.ddlSequitasueter.SelectedValue = dataRow["Sequitasueter"].ToString();
                    this.ddlSeponepantalones.SelectedValue = dataRow["Seponepantalones"].ToString();
                    this.ddlSequitapantalones.SelectedValue = dataRow["Sequitapantalones"].ToString();
                    this.ddlGorra.SelectedValue = dataRow["Gorra"].ToString();
                    this.ddlPantaloncillosPanti.SelectedValue = dataRow["PantaloncillosPanti"].ToString();
                    this.ddlMedias.SelectedValue = dataRow["Medias"].ToString();
                    this.ddlBotoneszipper.SelectedValue = dataRow["Botoneszipper"].ToString();
                    this.ddlSeataloscordones.SelectedValue = dataRow["Seataloscordones"].ToString();
                    this.ddlSeponeyquitaelcinturon.SelectedValue = dataRow["Seponeyquitaelcinturon"].ToString();
                    this.ddlSeponeloszapatos.SelectedValue = dataRow["Seponeloszapatos"].ToString();
                    this.ddlSecolocasobreelinodoro.SelectedValue = dataRow["Secolocasobreelinodoro"].ToString();
                    this.ddlUtilizaelpapelhigienico.SelectedValue = dataRow["Utilizaelpapelhigienico"].ToString();
                    this.ddlDescargaelinodoro.SelectedValue = dataRow["Descargaelinodoro"].ToString();
                    this.ddlUtilizaayudastecnicas.SelectedValue = dataRow["Utilizaayudastecnicas"].ToString();
                    //this.ddlSubeybajaescaleras.SelectedValue = dataRow["Subeybajaescaleras"].ToString();
                    this.ddlSelavalasmanos.SelectedValue = dataRow["Selavalasmanos"].ToString();
                    this.ddlSesecalasmanos.SelectedValue = dataRow["Sesecalasmanos"].ToString();
                    this.ddlSecepillaelpelo.SelectedValue = dataRow["Secepillaelpelo"].ToString();
                    this.ddlSelavalosdientes.SelectedValue = dataRow["Selavalosdientes"].ToString();
                    this.ddlSelavalacara.SelectedValue = dataRow["Selavalacara"].ToString();
                    this.ddlotroActividadesDiarias.SelectedValue = dataRow["otroActividadesDiarias"].ToString();
                    this.txtComentarioActividadesdiarias.Value = dataRow["ComentarioActividadesdiarias"].ToString();
                    this.ddlReconocimientodefigura.SelectedValue = dataRow["Reconocimientodefigura"].ToString();
                    this.ddlCopiadefigura.SelectedValue = dataRow["Copiadefigura"].ToString();
                    this.ddlTrazadodelineas.SelectedValue = dataRow["Trazadodelineas"].ToString();
                    this.ddlRecorta.SelectedValue = dataRow["Recorta"].ToString();
                    //this.ddlMatematicas.SelectedValue = dataRow["Matematicas"].ToString();
                    this.ddlEscribirleer.SelectedValue = dataRow["Escribirleer"].ToString();
                    this.ddlManipulaciondeobjetivos.SelectedValue = dataRow["Manipulaciondeobjetivos"].ToString();
                    this.ddlCrucedelineamedia.SelectedValue = dataRow["Crucedelineamedia"].ToString();
                    this.ddlDominancia.SelectedValue = dataRow["Dominancia"].ToString();
                    this.ddlUtilizacióndecomputadora.SelectedValue = dataRow["Utilizacióndecomputadora"].ToString();
                    this.ddlEscolarizado.SelectedValue = dataRow["Escolarizado"].ToString();
                    this.txtNombredelColegio.Value = dataRow["NombredelColegio"].ToString();
                    this.txtNivelEscolar.Value = dataRow["NivelEscolar"].ToString();
                    this.txtComentarioEstudiosyaprendizaje.Value = dataRow["ObservacionEstudiosAprendizaje"].ToString();
                    this.txtIndependenciaeneljuego.Value = dataRow["Independenciaeneljuego"].ToString();
                    this.txtPreferenciadelosjuegos.Value = dataRow["Preferenciadelosjuegos"].ToString();
                    this.txtJuegosdidacticos.Value = dataRow["Juegosdidacticos"].ToString();
                    this.txtAquejuegaconlospadres.Value = dataRow["Aquejuegaconlospadres"].ToString();
                    this.txtAdondesalenajugar.Value = dataRow["Adondesalenajugar"].ToString();
                    this.txtInteraccionconloshermanos.Value = dataRow["Interaccionconloshermanos"].ToString();
                    this.txtParticipacioneneventosfamiliares.Value = dataRow["Participacioneneventosfamiliares"].ToString();
                    this.txtActividadesfueradelhogar.Value = dataRow["Actividadesfueradelhogar"].ToString();
                    this.txtJuegoconamigos.Value = dataRow["Juegoconamigos"].ToString();
                    this.txtOtrosjuegos.Value = dataRow["OtrosJuegos"].ToString();
                    this.ddlDispraxia.SelectedValue = dataRow["Dispraxia"].ToString();
                    this.ddlPosturalOcular.SelectedValue = dataRow["PosturalOcular"].ToString();
                    this.ddlModulacion.SelectedValue = dataRow["Modulacion"].ToString();
                    //this.ddlModulacionHipo.SelectedValue = dataRow["ModulacionHipo"].ToString();
                    //this.ddlModulacionBuscador.SelectedValue = dataRow["ModulacionBuscador"].ToString();
                    this.ddlDiscriminacion.SelectedValue = dataRow["Discriminacion"].ToString();
                    this.txtComentarioDispraxia.Value = dataRow["ComentarioDispraxia"].ToString();
                    this.txtComentarioPosturalOcular.Value = dataRow["ComentarioPosturalOcular"].ToString();
                    this.txtComentarioModulacion.Value = dataRow["ComentarioModulacion"].ToString();
                    this.txtComentarioDiscriminacion.Value = dataRow["ComentarioDiscriminacion"].ToString();
                    this.txtCualessonlashabilidadesydificultades.Value = dataRow["Cualessonlashabilidadesydificultades"].ToString();
                    this.txtQuepreocupaalospadres.Value = dataRow["Quepreocupaalospadres"].ToString();
                    this.txtExpectativasymetas.Value = dataRow["Expectativasymetas"].ToString();
                    this.txtDefinicionsociosproceso.Value = dataRow["Definicionsociosdelprocesodetratamiento"].ToString();
                    this.txtImpresiones.Value = dataRow["Impresiones"].ToString();
                    this.txtHabilidades.Value = dataRow["Habilidades"].ToString();
                    this.txtDificultades.Value = dataRow["Dificultades"].ToString();
                    this.txtObjetivos.Value = dataRow["Objetivos"].ToString();
                    this.txtOtrasevaluacionesrequeridas.Value = dataRow["Otrasevaluacionesrequeridas"].ToString();
                    this.txtReferimientonecesario.Value = dataRow["Referimientonecesario"].ToString();
                    this.ddlSesionesIndividualizadas.SelectedValue = dataRow["SesionesIndividualizadas"].ToString();
                    this.ddlProgramadetalleresenAVDPadres.SelectedValue = dataRow["ProgramadetalleresenAVD"].ToString();
                    this.ddlGrupodeninosconhabilidadesydestrezas.SelectedValue = dataRow["Grupodeninosconhabilidadesydestrezas"].ToString();
                    this.ddlCharlasGenerales.SelectedValue = dataRow["CharlasGenerales"].ToString();
                    this.ddlProgramadevisitasdomiciliaria.SelectedValue = dataRow["ProgramadevisitasdomiciliariaOEscolar"].ToString();

                    if (dataRow["PlanCuatrimestralTerapiaActiva"].ToString() == "True")
                        this.ckPlanCuatrimestralTerapiaActiva.Items[0].Selected = true;
                    else
                        this.ckPlanCuatrimestralTerapiaActiva.Items[0].Selected = false;

                    if (dataRow["PlanCuatrimestralTerapiaActiva"].ToString() == "True")
                        this.ckPlanCuatrimestralTerapiaActiva.Items[0].Selected = true;
                    else
                        this.ckPlanCuatrimestralEntrenaPadres.Items[0].Selected = false;
                    if (dataRow["PlanCuatrimestralEntrenaPadres"].ToString() == "True")
                        this.ckPlanCuatrimestralEntrenaPadres.Items[0].Selected = true;
                    else
                        this.ckPlanCuatrimestralEntrenaPadres.Items[0].Selected = false;

                    if (dataRow["PlanCuatrimestralTerapiaAcuatica"].ToString() == "True")
                        this.ckPlanCuatrimestralTerapiaAcuatica.Items[0].Selected = true;
                    else
                        this.ckPlanCuatrimestralTerapiaAcuatica.Items[0].Selected = false;

                    if (dataRow["PlanCuatrimestralVisitaDomiciliaria"].ToString() == "True")
                        this.ckPlanCuatrimestralVisitaDomiciliaria.Items[0].Selected = true;
                    else
                        this.ckPlanCuatrimestralVisitaDomiciliaria.Items[0].Selected = false;

                    if (dataRow["PlanMixtoTerapiaActiva"].ToString() == "True")
                        this.ckPlanMixtoTerapiaActiva.Items[0].Selected = true;
                    else
                        this.ckPlanMixtoTerapiaActiva.Items[0].Selected = false;

                    if (dataRow["PlanMixtoEntrenaPadres"].ToString() == "True")
                        this.ckPlanMixtoEntrenaPadres.Items[0].Selected = true;
                    else
                        this.ckPlanMixtoEntrenaPadres.Items[0].Selected = false;

                    if (dataRow["PlanMixtoTerapiaAcuatica"].ToString() == "True")
                        this.ckPlanMixtoTerapiaAcuatica.Items[0].Selected = true;
                    else
                        this.ckPlanMixtoTerapiaAcuatica.Items[0].Selected = false;

                    if (dataRow["PlanMixtoVisitaDomiciliaria"].ToString() == "True")
                        this.ckPlanMixtoVisitaDomiciliaria.Items[0].Selected = true;
                    else
                        this.ckPlanMixtoVisitaDomiciliaria.Items[0].Selected = false;

                    if (dataRow["pef"].ToString() == "True")
                        this.ckpef.Items[0].Selected = true;
                    else
                        this.ckpef.Items[0].Selected = false;

                    //_CagarDetallesHermanos();
                    _CagarNucleoFamiliar();

                    pnlConsulta.Visible = false;
                    pnlData.Visible = true;
                }

            }

        }
        public void _Buscar(object sender, EventArgs e)
        {
            if (Request.QueryString["rowguidpaciente"] != null)
            {
                // Int64 OBJNT = 0;
                string PACIENTE = Request.QueryString["rowguidpaciente"].ToString();
                string CENTRO = Request.QueryString["XCURRENTUSR_SGXID"].ToString();

                this.xQueryParameters.Clear();
                this.xQueryParameters.Add("@IDPACIENTE");
                this.xQueryParameters.Add("@ROWSGXID");

                this.xQueryValues.Clear();
                this.xQueryValues.Add(PACIENTE.ToString());
                this.xQueryValues.Add(CENTRO.ToString());

                DataTable dtconsulta = DB.ExecuteAdapter("PR_TOEvaluacionInicial_HISTORICO", this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure);
                rpHistorico.DataSource = dtconsulta;
                rpHistorico.DataBind();
            }

        }

        protected void _Nuevo(object sender, EventArgs e)
        {
            if (Request.QueryString["rowguidpaciente"] != null)
            {

                //string PACIENTE = Request.QueryString["rowguidpaciente"].ToString();
                //string ESPECIALISTAID = Request.QueryString["CurrentUSR_TERID"].ToString();
                //string USUARIO = Request.QueryString["CurrentUSR_ROWGUID"].ToString();
                //string CENTRO = Request.QueryString["XCURRENTUSR_SGXID"].ToString();

                ///*INSERTO EN LA TABLA  [FuncionMotoraGruesa_M],[FuncionMotoraGruesa_D],[FuncionMotoraGruesaAsistenciaOrtesis_M]
                // y MUESTRO LA INFORMACION PARA SER MODIFICADA*/
                //this.dtConsultaDatos = DB.ExecuteAdapter(string.Format("PR_ACTIVIDADESDIARIA_NUEVO  @PACIENTE = '{0}',  @USUARIO = '{1}', @CENTRO = '{2}'", (object)PACIENTE, (object)USUARIO, (object)CENTRO));
                //this.Secuencia = dtConsultaDatos.Rows[0]["Secuencia"].ToString();
                ////this.txtnoevaluacion.Value = Secuencia;
                ////this.txtfechaevaluacion.Value = dtConsultaDatos.Rows[0]["ROWCDTE"].ToString();
                //Session.Add("StrSecuencia", Secuencia.ToString());
                //this.rpevaluacion.DataSource = (object)this.dtConsultaDatos;
                //this.rpevaluacion.DataBind();
                //_Buscar(sender, e);
                LimpiarPantalla();
                _BuscarGeneralesPx(sender, e);
                //_CagarDetallesHermanos();
                _CagarNucleoFamiliar();
                pnlData.Visible = true;
                //pndetalleevaluacion.Visible = true; 
                pnlConsulta.Visible = false;

            }
        }

        private void LimpiarPantalla()
        {
            Session.Add("StrSecuencia", "");
            Secuencia = 0;
            this.txtHistoriafamiliarrelevante.Value = "";
            this.txtHistoriamedica.Value = "";
            this.ddlAlineaciondelossegmentoscorporales.SelectedValue = "";
            this.ddlRelajaciondelossegmentoscorporales.SelectedValue = "";
            this.ddlTonicidad.SelectedValue = "";
            this.ddlSupinaflexora.SelectedValue = "";
            this.ddlRolado.SelectedValue = "";
            this.ddlPronaextensora.SelectedValue = "";
            this.ddlArrastre.SelectedValue = "";
            this.ddlCuatro4puntos.SelectedValue = "";
            this.ddlGateo.SelectedValue = "";
            this.ddlCaminar.SelectedValue = "";
            this.ddlSubirbajarescaleras.SelectedValue = "";
            this.ddlSaltar.SelectedValue = "";
            this.ddlIntegracionmotora.SelectedValue = "";
            this.ddlReaccionenderezamientoequilibrio.SelectedValue = "";
            this.ddlPosiciondecaballero.SelectedValue = "";
            this.ddlCrucelineamedia.SelectedValue = "";
            this.ddlSeguimientoocularDerecho.SelectedValue = "";
            this.ddlSeguimientoocularIzquierdo.SelectedValue = "";
            this.ddlSeguimientoocularArriba.SelectedValue = "";
            this.ddlSeguimientoocularAbajo.SelectedValue = "";
            this.ddlCircular.SelectedValue = "";
            this.txtMovimientosOcularesObservacion.Value = "";
            this.ddlComeconlosdedos.SelectedValue = "";
            this.ddlPuedeusartenedor.SelectedValue = "";
            this.ddlPuedeusarcuchara.SelectedValue = ""; ;
            this.ddlPuedeusarcuchillo.SelectedValue = "";
            this.ddlBebedeunvaso.SelectedValue = "";
            this.ddlSequitacamiseta.SelectedValue = "";
            this.ddlSeponesueter.SelectedValue = "";
            this.ddlSequitasueter.SelectedValue = "";
            this.ddlSeponepantalones.SelectedValue = "";
            this.ddlSequitapantalones.SelectedValue = "";
            this.ddlGorra.SelectedValue = "";
            this.ddlPantaloncillosPanti.SelectedValue = "";
            this.ddlMedias.SelectedValue = "";
            this.ddlBotoneszipper.SelectedValue = "";
            this.ddlSeataloscordones.SelectedValue = "";
            this.ddlSeponeyquitaelcinturon.SelectedValue = "";
            this.ddlSeponeloszapatos.SelectedValue = "";
            this.ddlSecolocasobreelinodoro.SelectedValue = "";
            this.ddlUtilizaelpapelhigienico.SelectedValue = "";
            this.ddlDescargaelinodoro.SelectedValue = "";
            this.ddlUtilizaayudastecnicas.SelectedValue = "";
            //this.ddlSubeybajaescaleras.SelectedValue = "";
            this.ddlSelavalasmanos.SelectedValue = "";
            this.ddlSesecalasmanos.SelectedValue = "";
            this.ddlSecepillaelpelo.SelectedValue = "";
            this.ddlSelavalosdientes.SelectedValue = "";
            this.ddlSelavalacara.SelectedValue = "";
            this.ddlotroActividadesDiarias.SelectedValue = "";
            this.txtComentarioActividadesdiarias.Value = "";
            this.ddlReconocimientodefigura.SelectedValue = "";
            this.ddlCopiadefigura.SelectedValue = "";
            this.ddlTrazadodelineas.SelectedValue = "";
            this.ddlRecorta.SelectedValue = "";
            //this.ddlMatematicas.SelectedValue = "";
            this.ddlEscribirleer.SelectedValue = "";
            this.ddlManipulaciondeobjetivos.SelectedValue = "";
            this.ddlCrucedelineamedia.SelectedValue = "";
            this.ddlDominancia.SelectedValue = "";
            this.ddlUtilizacióndecomputadora.SelectedValue = "";
            this.ddlEscolarizado.SelectedValue = "";
            this.txtNombredelColegio.Value = "";
            this.txtNivelEscolar.Value = "";
            this.txtComentarioEstudiosyaprendizaje.Value = "";
            this.txtIndependenciaeneljuego.Value = "";
            this.txtPreferenciadelosjuegos.Value = "";
            this.txtJuegosdidacticos.Value = "";
            this.txtAquejuegaconlospadres.Value = "";
            this.txtAdondesalenajugar.Value = "";
            this.txtInteraccionconloshermanos.Value = "";
            this.txtParticipacioneneventosfamiliares.Value = "";
            this.txtActividadesfueradelhogar.Value = "";
            this.txtJuegoconamigos.Value = "";
            this.txtOtrosjuegos.Value = "";
            this.ddlDispraxia.SelectedValue = "";
            this.ddlPosturalOcular.SelectedValue = "";
            this.ddlModulacion.SelectedValue = "";
            //this.ddlModulacionHipo.SelectedValue = "";
            //this.ddlModulacionBuscador.SelectedValue = "";
            this.ddlDiscriminacion.SelectedValue = "";
            this.txtComentarioDispraxia.Value = "";
            this.txtComentarioPosturalOcular.Value = "";
            this.txtComentarioModulacion.Value = "";
            this.txtComentarioDiscriminacion.Value = "";
            this.txtCualessonlashabilidadesydificultades.Value = "";
            this.txtQuepreocupaalospadres.Value = "";
            this.txtExpectativasymetas.Value = "";
            this.txtDefinicionsociosproceso.Value = "";
            this.txtImpresiones.Value = "";
            this.txtHabilidades.Value = "";
            this.txtDificultades.Value = "";
            this.txtObjetivos.Value = "";
            this.txtOtrasevaluacionesrequeridas.Value = "";
            this.txtReferimientonecesario.Value = "";
            this.ddlSesionesIndividualizadas.SelectedValue = "";
            this.ddlProgramadetalleresenAVDPadres.SelectedValue = "";
            this.ddlGrupodeninosconhabilidadesydestrezas.SelectedValue = "";
            this.ddlCharlasGenerales.SelectedValue = "";
            this.ddlProgramadevisitasdomiciliaria.SelectedValue = "";
            this.ckPlanCuatrimestralTerapiaActiva.Items[0].Selected = false;
            this.ckPlanCuatrimestralEntrenaPadres.Items[0].Selected = false; 
            this.ckPlanCuatrimestralTerapiaAcuatica.Items[0].Selected = false;
            this.ckPlanCuatrimestralVisitaDomiciliaria.Items[0].Selected = false;
            this.ckPlanMixtoTerapiaActiva.Items[0].Selected = false;
            this.ckPlanMixtoEntrenaPadres.Items[0].Selected = false;
            this.ckPlanMixtoTerapiaAcuatica.Items[0].Selected = false;
            this.ckPlanMixtoVisitaDomiciliaria.Items[0].Selected = false;
            this.ckpef.Items[0].Selected = false; 

        }


        protected void _BackMain(object sender, EventArgs e)
        {
            if (Request.QueryString["rowguidpaciente"].ToString() != null)
                IDPaciente = Request.QueryString["rowguidpaciente"].ToString();
            this.Response.Redirect("http://caidsiges01:8000/HCL00000.aspx?X=" + IDPaciente);

        }

        protected void _BuscarGeneralesPx(object sender, EventArgs e)
        {
            usuario = Request.QueryString["XCurrentUSR_ROWGUID"].ToString();
            centro = Request.QueryString["XCURRENTUSR_SGXID"].ToString();

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

        }
    }
}