using System;
using System.Collections;
using System.Data;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using CAID.Data;

namespace CAID_V2.forms
{
    public partial class EvaluacionOdontoPediatria : System.Web.UI.Page
    {
        private ArrayList xQueryParameters = new ArrayList();
        private ArrayList xQueryValues = new ArrayList();
        private string xCommand;
        private string xQuery;
        public string CurrentPAX_ROWGUID, usuario, CURRENTUSR_SGXID, CurrentUSR_TERID,
                      ckImpresionDiagnostica, ckfrecuenciacepillado1, ckHabitosbucales1, CKOrtodonciadientesprimarios1,
                      ckOrtodonciadientesdenticionmixtapermanente1, ddlPrescripciones1, ckObjectivosMiofuncionalMyobrace1;
        DataTable dtusuarios = new DataTable();
        char[] chArray = new char[5]
        {
                ' ',
                ',',
                '.',
                ':',
                '\t'
        };
        string[] strchecklist;

        protected void Page_Load(object sender, EventArgs e)
        {
            /*Generales*/
            #region 
            CurrentPAX_ROWGUID = Request.QueryString["CurrentPAX_ROWGUID"].ToString();
            CurrentUSR_TERID = Request.QueryString["CurrentUSR_TERID"].ToString();
            CURRENTUSR_SGXID = Request.QueryString["CURRENTUSR_SGXID"].ToString();
            #endregion

            //if (this.IsPostBack)
            //   return;
            //((Site_Master)this.Master).Mostrar_Opciones_ActoMedico();
            /* PLAN DE TRATAMIENTO*/
            #region 

            //this.Session["CurrentUSR_ROWGUID"].ToString();
            if (!this.IsPostBack)
            {
                LlenarLista();
                CargarMaestro();
                CargarDetallesTodos();
                _CargarMultimedias();
                //ddlImpresiondiagnostica.EnableViewState = true;
            }
            #endregion
        }

        protected void _SaveMaestro(object sender, EventArgs e)
        { 
            CurrentPAX_ROWGUID = Request.QueryString["CurrentPAX_ROWGUID"].ToString();
            CurrentUSR_TERID = Request.QueryString["CurrentUSR_TERID"].ToString();
            CURRENTUSR_SGXID = Request.QueryString["CURRENTUSR_SGXID"].ToString();

            ckImpresionDiagnostica = "";
            ckfrecuenciacepillado1 = "";
            ckHabitosbucales1 = "";
            CKOrtodonciadientesprimarios1 = "";
            ckOrtodonciadientesdenticionmixtapermanente1 = "";
            ddlPrescripciones1 = "";
            ckObjectivosMiofuncionalMyobrace1 = "";

            this.xQueryParameters.Clear();
            this.xQueryValues.Clear();
            this.xQueryParameters.Add("@Paciente");
            this.xQueryParameters.Add("@Especialistaid");
            this.xQueryParameters.Add("@Centro");
            this.xQueryParameters.Add("@ImpresionDiagnotisca");
            this.xQueryParameters.Add("@ModalidadAtencion");
            this.xQueryParameters.Add("@GrupoFamiliar");
            this.xQueryParameters.Add("@GrupoFamiliarComentario");
            this.xQueryParameters.Add("@AtencedentesMedicosGenerales");
            this.xQueryParameters.Add("@Embarazo");
            this.xQueryParameters.Add("@EmbarazoOtros");
            this.xQueryParameters.Add("@Nacimiento");
            this.xQueryParameters.Add("@Lactancia");
            this.xQueryParameters.Add("@LactanciaOtros");
            this.xQueryParameters.Add("@SalidaPrimerDiente");
            this.xQueryParameters.Add("@Chupete");
            this.xQueryParameters.Add("@ChupeteOtros");
            this.xQueryParameters.Add("@Biberon");
            this.xQueryParameters.Add("@Lenguaje");
            this.xQueryParameters.Add("@LenguajeComentario");
            this.xQueryParameters.Add("@MarchaIndependiente");
            this.xQueryParameters.Add("@AlteracionesSueno");
            this.xQueryParameters.Add("@ExperienciaPrevia");
            this.xQueryParameters.Add("@ExperienciaPreviaComentario");
            this.xQueryParameters.Add("@UltimafechaRealizo");
            this.xQueryParameters.Add("@Comportamiento");
            this.xQueryParameters.Add("@ComportamientoOtros");
            this.xQueryParameters.Add("@TraumaDentalComoCuandoyDonde");
            this.xQueryParameters.Add("@TraumaDental");
            this.xQueryParameters.Add("@TraumaTejidosBlandos");
            this.xQueryParameters.Add("@EvaluacionClinica");
            this.xQueryParameters.Add("@EvaluacionClinicaOtros");
            this.xQueryParameters.Add("@IndiceOleary");
            this.xQueryParameters.Add("@RiesgoCariogenico");
            this.xQueryParameters.Add("@CronologiaErupcion");
            this.xQueryParameters.Add("@AlimentacionActual");
            this.xQueryParameters.Add("@Azucar");
            this.xQueryParameters.Add("@AzucarOtros ");
            this.xQueryParameters.Add("@Observaciones");
            this.xQueryParameters.Add("@DificultadDeglutirLiquidos");
            this.xQueryParameters.Add("@DificultadDeglutirSolidos");
            this.xQueryParameters.Add("@InmunizacionesCompletas");
            this.xQueryParameters.Add("@InmunizacionesCompletasOtros");
            this.xQueryParameters.Add("@FrecuenciaCepillado");
            this.xQueryParameters.Add("@QuienHaceCepillado");
            this.xQueryParameters.Add("@PastaDentalNombre");
            this.xQueryParameters.Add("@Colutorio");
            this.xQueryParameters.Add("@ColutorioCual");
            this.xQueryParameters.Add("@SuplementoFluorado");
            this.xQueryParameters.Add("@SuplementoFluoradoCual");
            this.xQueryParameters.Add("@SedaDental");
            this.xQueryParameters.Add("@SedaDentalOtros");
            this.xQueryParameters.Add("@Momentosazúcardía");
            this.xQueryParameters.Add("@HabitosBucales");
            this.xQueryParameters.Add("@HabitosBucalesOtros");
            this.xQueryParameters.Add("@OdontogramaURL");
            this.xQueryParameters.Add("@OrtodonciaDientesPrimarios");
            this.xQueryParameters.Add("@OrtodonciaDientesPrimariosOtros");
            this.xQueryParameters.Add("@OrtodonciaDientesDenticiónMixta");
            this.xQueryParameters.Add("@OrtodonciaDientesDenticiónMixtaOtros");
            this.xQueryParameters.Add("@TerapiasMiofuncionales");
            this.xQueryParameters.Add("@TerapiasMiofuncionalesOtros");
            this.xQueryParameters.Add("@NinoTieneLabiosCerrados");
            this.xQueryParameters.Add("@RespiraNariz");
            this.xQueryParameters.Add("@MovimientoMientrasRespira");
            this.xQueryParameters.Add("@LenguaenPosicion");
            this.xQueryParameters.Add("@PosturaAdecuada");
            this.xQueryParameters.Add("@InterpretaciónRadiograficaOtros");
            this.xQueryParameters.Add("@Prescripciones");
            this.xQueryParameters.Add("@PrescripcionesOtros");
            this.xQueryParameters.Add("@PacientedeAlta");
            this.xQueryParameters.Add("@ControlProfilaxis");
            this.xQueryParameters.Add("@ControlDestartrajesSupragingival");
            this.xQueryParameters.Add("@ControlTraumaDental");
            this.xQueryParameters.Add("@ControlterapiaMiofuncional");
            this.xQueryParameters.Add("@ObjectivosTerapiaMiofuncionalMyobrace");
            this.xQueryParameters.Add("@ControlBarnizFluor");
            this.xQueryParameters.Add("@ControlAparatosOrtodonciaInterceptivaConvencionales");
            this.xQueryParameters.Add("@Referimiento");
            this.xQueryParameters.Add("@ReferimientoOtros");
            this.xQueryParameters.Add("@InterconsultaMultidisciplinaria");
            this.xQueryParameters.Add("@PacientedeAltaDate");
            this.xQueryParameters.Add("@ControlProfilaxisDate");
            this.xQueryParameters.Add("@ControlDestartrajesSupragingivalDate");
            this.xQueryParameters.Add("@ControlTraumaDentalDate");
            this.xQueryParameters.Add("@ControlterapiaMiofuncionalDate");
            this.xQueryParameters.Add("@ControlBarnizFluorDate");
            this.xQueryParameters.Add("@ControlAparatosOrtodonciaInterceptivaConvencionalesDate");

            ////SELECCIONO LOS VALORES DE LOS CHECKLIST 
            //Checklist Impresion Diagnostica
            //var selectedText = ddlImpresiondiagnostica.Items[ddlImpresiondiagnostica.SelectedIndex].Text.Trim();
            // string selection = Request["ddlImpresiondiagnostica"];
            // lblImpresiondiagnostica.InnerText = selection;

            //foreach (ListItem listItem in cmbTipo12.Items)
            //{
            //    if (listItem.Selected)
            //    {
            //        var val = listItem.Value;
            //        var txt = listItem.Text;
            //        lblTipo12.InnerText = lblTipo12.InnerText + "," + val;
            //    }
            //}


            for (int index = 0; index < this.ddlImpresiondiagnostica.Items.Count; ++index)
            {
                if (this.ddlImpresiondiagnostica.Items[index].Selected)
                    ckImpresionDiagnostica = ckImpresionDiagnostica + "," + this.ddlImpresiondiagnostica.Items[index].Value.Trim();
            }
            if (ckImpresionDiagnostica != "")
                ckImpresionDiagnostica = ckImpresionDiagnostica.Remove(0, 1);

            //Checklist Frecuencia del Cepillado
            for (int index = 0; index < this.ckfrecuenciacepillado.Items.Count; ++index)
            {
                if (this.ckfrecuenciacepillado.Items[index].Selected)
                    ckfrecuenciacepillado1 = ckfrecuenciacepillado1 + "," + this.ckfrecuenciacepillado.Items[index].Value.Trim();
            }
            if (ckfrecuenciacepillado1 != "")
                ckfrecuenciacepillado1 = ckfrecuenciacepillado1.Remove(0, 1);

            //Checklist Hábitos bucales
            for (int index = 0; index < this.ckHabitosbucales.Items.Count; ++index)
            {
                if (this.ckHabitosbucales.Items[index].Selected)
                    ckHabitosbucales1 = ckHabitosbucales1 + "," + this.ckHabitosbucales.Items[index].Value.Trim();
            }
            if (ckHabitosbucales1 != "")
                ckHabitosbucales1 = ckHabitosbucales1.Remove(0, 1);

            //Checklist Hábitos bucales
            for (int index = 0; index < this.CKOrtodonciadientesprimarios.Items.Count; ++index)
            {
                if (this.CKOrtodonciadientesprimarios.Items[index].Selected)
                    CKOrtodonciadientesprimarios1 = CKOrtodonciadientesprimarios1 + "," + this.CKOrtodonciadientesprimarios.Items[index].Value.Trim();
            }
            if (CKOrtodonciadientesprimarios1 != "")
                CKOrtodonciadientesprimarios1 = CKOrtodonciadientesprimarios1.Remove(0, 1);

            //Checklist Hábitos bucales
            for (int index = 0; index < this.ckOrtodonciadientesdenticionmixtapermanente.Items.Count; ++index)
            {
                if (this.ckOrtodonciadientesdenticionmixtapermanente.Items[index].Selected)
                    ckOrtodonciadientesdenticionmixtapermanente1 = ckOrtodonciadientesdenticionmixtapermanente1 + "," + this.ckOrtodonciadientesdenticionmixtapermanente.Items[index].Value.Trim();
            }
            if (ckOrtodonciadientesdenticionmixtapermanente1 != "")
                ckOrtodonciadientesdenticionmixtapermanente1 = ckOrtodonciadientesdenticionmixtapermanente1.Remove(0, 1);

            //Checklist Prescripciones 
            for (int index = 0; index < this.ddlPrescripciones.Items.Count; ++index)
            {
                if (this.ddlPrescripciones.Items[index].Selected)
                    ddlPrescripciones1 = ddlPrescripciones1 + "," + this.ddlPrescripciones.Items[index].Value.Trim();
            }
            if (ddlPrescripciones1 != "")
                ddlPrescripciones1 = ddlPrescripciones1.Remove(0, 1);

            //Checklist Objectivos Terapia Miofuncional Myobrace 
            for (int index = 0; index < this.ckObjectivosMiofuncionalMyobrace.Items.Count; ++index)
            {
                if (this.ckObjectivosMiofuncionalMyobrace.Items[index].Selected)
                    ckObjectivosMiofuncionalMyobrace1 = ckObjectivosMiofuncionalMyobrace1 + "," + this.ckObjectivosMiofuncionalMyobrace.Items[index].Value.Trim();
            }
            if (ckObjectivosMiofuncionalMyobrace1 != "")
                ckObjectivosMiofuncionalMyobrace1 = ckObjectivosMiofuncionalMyobrace1.Remove(0, 1);

            this.xQueryValues.Add(CurrentPAX_ROWGUID.ToString());
            this.xQueryValues.Add(CurrentUSR_TERID.ToString());
            this.xQueryValues.Add(CURRENTUSR_SGXID.ToString());
            this.xQueryValues.Add(ckImpresionDiagnostica.ToString());
            this.xQueryValues.Add(ddlModalidadAtencion.SelectedValue.ToString());
            this.xQueryValues.Add(ddlGrupoFamiliar.SelectedValue.ToString());
            this.xQueryValues.Add(txtComentariosGrupoFamiliar.Value.ToString());
            this.xQueryValues.Add(txtantecedentesmedicosgenerales.Value.ToString());
            this.xQueryValues.Add(ddlembarazo.SelectedValue.ToString());
            this.xQueryValues.Add(txtEmbarazoOtros.Value.ToString());
            this.xQueryValues.Add(ddlNacimiento.SelectedValue.ToString());
            this.xQueryValues.Add(ddlLactancia.SelectedValue.ToString());
            this.xQueryValues.Add(txtLactanciaOtros.Value.ToString());
            this.xQueryValues.Add(ddlPrimerDiente.SelectedValue.ToString());
            this.xQueryValues.Add(ddlChupete.SelectedValue.ToString());
            this.xQueryValues.Add(txtChupeteOtros.Value.ToString());
            this.xQueryValues.Add(txtbiberon.Value.ToString());
            this.xQueryValues.Add(ddlLenguaje.SelectedValue.ToString());
            this.xQueryValues.Add(txtLenguajeOtros.Value.ToString());
            this.xQueryValues.Add(txtMarchaindependiente.Value.ToString());
            this.xQueryValues.Add(ddlAlteracionesSueno.SelectedValue.ToString());
            this.xQueryValues.Add(ddlExperienciaPrevia.SelectedValue.ToString());
            this.xQueryValues.Add(txtExperienciaPreviaOtros.Value.ToString());

            if (txtultimafecharealizo.Value.ToString().Trim() != "")

                this.xQueryValues.Add(txtultimafecharealizo.Value.ToString());
            else
                this.xQueryValues.Add("");

            this.xQueryValues.Add(ddlComportamiento.SelectedValue.ToString());
            this.xQueryValues.Add(txtComportamientoOtros.Value.ToString());
            this.xQueryValues.Add(txtTraumadentalComoCuandoyDonde.Value.ToString());
            this.xQueryValues.Add(ddlTraumadental.SelectedValue.ToString());
            this.xQueryValues.Add(ddlTraumaTejidosBlandos.SelectedValue.ToString());
            this.xQueryValues.Add(ddlevaluacionclinica.SelectedValue.ToString());
            this.xQueryValues.Add(txtEvaluacionClinicaOtros.Value.ToString());
            this.xQueryValues.Add(txtIndiceOleary.Value.ToString());
            this.xQueryValues.Add(ddlRiesgocariogenico.SelectedValue.ToString());
            this.xQueryValues.Add(ddlCronologiaerupcion.SelectedValue.ToString());
            this.xQueryValues.Add(ddlAlimentacionactual.SelectedValue.ToString());
            this.xQueryValues.Add(ddlazucar.SelectedValue.ToString());
            this.xQueryValues.Add(txtazucarOtros.Value.ToString());
            this.xQueryValues.Add(txtObservacionesHistoriaDieta.Value.ToString());
            this.xQueryValues.Add(ddlDificultaddeglutirliquidos.SelectedValue.ToString());
            this.xQueryValues.Add(ddlDificultaddeglutirsolidos.SelectedValue.ToString());
            this.xQueryValues.Add(ddlInmunizacionesCompletas.SelectedValue.ToString());
            this.xQueryValues.Add(txtInmunizacionesCompletasOtros.Value.ToString());
            this.xQueryValues.Add(ckfrecuenciacepillado1.ToString());
            this.xQueryValues.Add(ddlcomohacecepillado.SelectedValue.ToString());
            this.xQueryValues.Add(txtPastadental.Value.ToString());
            this.xQueryValues.Add(ddlColutorio.SelectedValue.ToString());
            this.xQueryValues.Add(txtColutorioCual.Value.ToString());
            this.xQueryValues.Add(ddlSuplementoFluorado.SelectedValue.ToString());
            this.xQueryValues.Add(txtSuplementoFluoradoCual.Value.ToString());
            this.xQueryValues.Add(ddlSedadental.SelectedValue.ToString());
            this.xQueryValues.Add(txtSedadentalotros.Value.ToString());
            this.xQueryValues.Add(txtMomentosazucaraldía.Value.ToString());
            this.xQueryValues.Add(ckHabitosbucales1.ToString());
            this.xQueryValues.Add(txtHabitosbucalesOtros.Value.ToString());
            this.xQueryValues.Add("");//odontogramaURL 
            this.xQueryValues.Add(CKOrtodonciadientesprimarios1.ToString());
            this.xQueryValues.Add(txtOrtodonciadientesprimariosOtros.Value.ToString());
            this.xQueryValues.Add(ckOrtodonciadientesdenticionmixtapermanente1.ToString());
            this.xQueryValues.Add(txtOrtodonciadientesdenticionmixtapermanenteOtros.Value.ToString());
            this.xQueryValues.Add(ddlTerapiaMioFuncionales.SelectedValue.ToString());
            this.xQueryValues.Add(txtTerapiaMioFuncionalesOtros.Value.ToString());
            this.xQueryValues.Add(ddlTieneLabiosCerrados.SelectedValue.ToString());
            this.xQueryValues.Add(ddlRespiraporlanariz.SelectedValue.ToString());
            this.xQueryValues.Add(ddlHaymovimientosmientrasrespira.SelectedValue.ToString());
            this.xQueryValues.Add(ddlLenguaestaensuposicion.SelectedValue.ToString());
            this.xQueryValues.Add(ddlPosturaadecuada.SelectedValue.ToString());
            this.xQueryValues.Add(txtInterpretacionradiográficaOtros.Text.ToString());
            this.xQueryValues.Add(ddlPrescripciones1.ToString());
            this.xQueryValues.Add(txtPrescripcionesotros.Text.ToString());

            this.xQueryValues.Add(ddlalertaPacientesdadodealta.SelectedValue.ToString());
            this.xQueryValues.Add(ddlalertaprofilaxis.SelectedValue.ToString());
            this.xQueryValues.Add(ddlalertaDestartrajesSupragingival.SelectedValue.ToString());
            this.xQueryValues.Add(ddlalertatraumadental.SelectedValue.ToString());
            this.xQueryValues.Add(ddlalertaTerapiaMiofuncional.SelectedValue.ToString());
            this.xQueryValues.Add(ckObjectivosMiofuncionalMyobrace1.ToString());
            this.xQueryValues.Add(ddlalertaBarnizFluor.SelectedValue.ToString());
            this.xQueryValues.Add(ddlAparatosOrtondonciaInterceptivaConvencionales.SelectedValue.ToString());
            this.xQueryValues.Add(ddlreferimiento.SelectedValue.ToString());
            this.xQueryValues.Add(txtreferimientootros.Text.ToString());
            this.xQueryValues.Add(txtInterconsultaMultidisciplinaria.Value.ToString());

            if (txtPacientesdadodealtaDate.Value.ToString().Trim() != "")
                this.xQueryValues.Add(txtPacientesdadodealtaDate.Value.ToString());
            else
                this.xQueryValues.Add("");

            if (txtDestartrajesSupragingivalDate.Value.ToString().Trim() != "")
                this.xQueryValues.Add(txtDestartrajesSupragingivalDate.Value.ToString());
            else
                this.xQueryValues.Add("");

            if (txtTerapiaMiofuncionalDate.Value.ToString().Trim() != "")
                this.xQueryValues.Add(txtTerapiaMiofuncionalDate.Value.ToString());
            else
                this.xQueryValues.Add("");

            if (txtBarnizFluorDate.Value.ToString().Trim() != "")
                this.xQueryValues.Add(txtBarnizFluorDate.Value.ToString());
            else
                this.xQueryValues.Add("");

            if (txtprofilaxisDate.Value.ToString().Trim() != "")
                this.xQueryValues.Add(txtprofilaxisDate.Value.ToString());
            else
                this.xQueryValues.Add("");

            if (txttraumadentalDate.Value.ToString().Trim() != "")
                this.xQueryValues.Add(txttraumadentalDate.Value.ToString());
            else
                this.xQueryValues.Add("");

            if (txtAparatosOrtondonciaInterceptivaConvencionalesDate.Value.ToString().Trim() != "")
                this.xQueryValues.Add(txtAparatosOrtondonciaInterceptivaConvencionalesDate.Value.ToString());
            else
                this.xQueryValues.Add("");


            DataTable dtOdontopediatria = DB.ExecuteAdapter("PR_ODPMaestroGuardar", this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure);
            if (dtOdontopediatria.Rows.Count != 0)
            {
                DataRow row2 = dtOdontopediatria.Rows[0];
                if (row2["Conteo"].ToString() != "0")
                {
                    GuardarOdontogramaasHTML(CurrentPAX_ROWGUID.ToString());
                    Notify("Registro Guardado", "success");
                }
                else
                    Notify("No se pudo almacenar la informacion", "error");
            }
            else
                Notify("No se pudo almacenar la informacion", "error");
        }
        private void CargarMaestro()
        { 
            CurrentPAX_ROWGUID = Request.QueryString["CurrentPAX_ROWGUID"].ToString();
            CURRENTUSR_SGXID = Request.QueryString["CURRENTUSR_SGXID"].ToString();

            this.xQueryParameters.Clear();
            this.xQueryValues.Clear();
            this.xQueryParameters.Add("@PACIENTE");
            this.xQueryValues.Add(CurrentPAX_ROWGUID.ToString());
            this.xQueryParameters.Add("@Centro");
            this.xQueryValues.Add(CURRENTUSR_SGXID.ToString());
            this.xQuery = "PR_ODPMaestro_BUSCA";
            DataTable dtMaestro = DB.ExecuteAdapter(this.xQuery, this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure);
            if (dtMaestro.Rows.Count != 0)
            {
                RPODONTOGRAMA.DataSource = dtMaestro;
                RPODONTOGRAMA.DataBind();
                DataRow rowMaestro = dtMaestro.Rows[0];
                //ddlImpresiondiagnostica.SelectedValue = rowMaestro["ImpresionDiagnotisca"].ToString(); 
                strchecklist = rowMaestro["ImpresionDiagnotisca"].ToString().Split(chArray);
                if (strchecklist[0] != "")
                {
                    foreach (string str in strchecklist)
                        this.ddlImpresiondiagnostica.Items.FindByValue(str).Selected = true;
                }
                ddlModalidadAtencion.SelectedValue = rowMaestro["ModalidadAtencion"].ToString();
                ddlGrupoFamiliar.SelectedValue = rowMaestro["GrupoFamiliar"].ToString();
                txtComentariosGrupoFamiliar.Value = rowMaestro["GrupoFamiliarComentario"].ToString();
                txtantecedentesmedicosgenerales.Value = rowMaestro["AtencedentesMedicosGenerales"].ToString();
                ddlembarazo.SelectedValue = rowMaestro["Embarazo"].ToString();
                txtEmbarazoOtros.Value = rowMaestro["EmbarazoOtros"].ToString();
                ddlNacimiento.SelectedValue = rowMaestro["Nacimiento"].ToString();
                ddlLactancia.SelectedValue = rowMaestro["Lactancia"].ToString();
                txtLactanciaOtros.Value = rowMaestro["LactanciaOtros"].ToString();
                ddlPrimerDiente.SelectedValue = rowMaestro["SalidaPrimerDiente"].ToString();
                ddlChupete.SelectedValue = rowMaestro["Chupete"].ToString();
                txtChupeteOtros.Value = rowMaestro["ChupeteOtros"].ToString();
                txtbiberon.Value = rowMaestro["Biberon"].ToString();
                ddlLenguaje.SelectedValue = rowMaestro["Lenguaje"].ToString();
                txtLenguajeOtros.Value = rowMaestro["LenguajeComentario"].ToString();
                txtMarchaindependiente.Value = rowMaestro["MarchaIndependiente"].ToString();
                ddlAlteracionesSueno.SelectedValue = rowMaestro["AlteracionesSueno"].ToString();
                ddlExperienciaPrevia.SelectedValue = rowMaestro["ExperienciaPrevia"].ToString();
                txtExperienciaPreviaOtros.Value = rowMaestro["ExperienciaPreviaComentario"].ToString();
                if ((rowMaestro["UltimafechaRealizo"].ToString().Trim() != "") && (rowMaestro["UltimafechaRealizo"].ToString().Trim() != ""))
                    txtultimafecharealizo.Value = Convert.ToDateTime(rowMaestro["UltimafechaRealizo"].ToString()).ToShortDateString();
                ddlComportamiento.SelectedValue = rowMaestro["Comportamiento"].ToString();
                txtComportamientoOtros.Value = rowMaestro["ComportamientoOtros"].ToString();
                ddlevaluacionclinica.SelectedValue = rowMaestro["EvaluacionClinica"].ToString();
                txtEvaluacionClinicaOtros.Value = rowMaestro["EvaluacionClinicaOtros"].ToString();
                ddlRiesgocariogenico.SelectedValue = rowMaestro["RiesgoCariogenico"].ToString();
                ddlTraumadental.SelectedValue = rowMaestro["TraumaDental"].ToString();
                txtTraumadentalComoCuandoyDonde.Value = rowMaestro["TraumaDentalComoCuandoyDonde"].ToString();
                ddlTraumaTejidosBlandos.SelectedValue = rowMaestro["TraumaTejidosBlandos"].ToString();
                txtIndiceOleary.Value = rowMaestro["IndiceOleary"].ToString();
                ddlCronologiaerupcion.SelectedValue = rowMaestro["CronologiaErupcion"].ToString();
                ddlAlimentacionactual.SelectedValue = rowMaestro["AlimentacionActual"].ToString();
                txtObservacionesHistoriaDieta.Value = rowMaestro["Observaciones"].ToString();
                ddlDificultaddeglutirliquidos.SelectedValue = rowMaestro["DificultadDeglutirLiquidos"].ToString();
                ddlazucar.SelectedValue = rowMaestro["Azucar"].ToString();
                txtazucarOtros.Value = rowMaestro["AzucarOtros"].ToString();
                ddlDificultaddeglutirsolidos.SelectedValue = rowMaestro["DificultadDeglutirSolidos"].ToString();
                ddlInmunizacionesCompletas.SelectedValue = rowMaestro["InmunizacionesCompletas"].ToString();
                txtInmunizacionesCompletasOtros.Value = rowMaestro["InmunizacionesCompletasOtros"].ToString();
                //ckfrecuenciacepillado.SelectedValue = rowMaestro["FrecuenciaCepillado"].ToString();
                strchecklist = rowMaestro["FrecuenciaCepillado"].ToString().Split(chArray);
                if (strchecklist[0] != "")
                {
                    foreach (string str in strchecklist)
                        this.ckfrecuenciacepillado.Items.FindByValue(str).Selected = true;
                }

                ddlcomohacecepillado.SelectedValue = rowMaestro["QuienHaceCepillado"].ToString();
                txtPastadental.Value = rowMaestro["PastaDentalNombre"].ToString();
                ddlColutorio.SelectedValue = rowMaestro["Colutorio"].ToString();
                txtColutorioCual.Value = rowMaestro["ColutorioCual"].ToString();
                //ckHabitosbucales  	
                ddlSuplementoFluorado.SelectedValue = rowMaestro["SuplementoFluorado"].ToString();
                txtSuplementoFluoradoCual.Value = rowMaestro["SuplementoFluoradoCual"].ToString();
                ddlSedadental.SelectedValue = rowMaestro["SedaDental"].ToString();
                txtSedadentalotros.Value = rowMaestro["SedaDentalOtros"].ToString();
                txtMomentosazucaraldía.Value = rowMaestro["Momentosazúcardía"].ToString();
                //ckHabitosbucales	rowMaestro["HabitosBucales"].ToString();
                strchecklist = rowMaestro["HabitosBucales"].ToString().Split(chArray);
                if (strchecklist[0] != "")
                {
                    foreach (string str in strchecklist)
                        this.ckHabitosbucales.Items.FindByValue(str).Selected = true;
                }
                txtHabitosbucalesOtros.Value = rowMaestro["HabitosBucalesOtros"].ToString();
                //null	rowMaestro["OdontogramaURL"].ToString();
                // CKOrtodonciadientesprimarios	rowMaestro["OrtodonciaDientesPrimarios"].ToString();
                strchecklist = rowMaestro["OrtodonciaDientesPrimarios"].ToString().Split(chArray);
                if (strchecklist[0] != "")
                {
                    foreach (string str in strchecklist)
                        this.CKOrtodonciadientesprimarios.Items.FindByValue(str).Selected = true;
                }
                txtOrtodonciadientesprimariosOtros.Value = rowMaestro["OrtodonciaDientesPrimariosOtros"].ToString();
                ddlTerapiaMioFuncionales.SelectedValue = rowMaestro["TerapiasMiofuncionales"].ToString();
                txtTerapiaMioFuncionalesOtros.Value = rowMaestro["TerapiasMiofuncionalesOtros"].ToString();
                //ckOrtodonciadientesdenticionmixtapermanente	rowMaestro["OrtodonciaDientesDenticiónMixta"].ToString();
                strchecklist = rowMaestro["OrtodonciaDientesDenticiónMixta"].ToString().Split(chArray);
                if (strchecklist[0] != "")
                {
                    foreach (string str in strchecklist)
                        this.ckOrtodonciadientesdenticionmixtapermanente.Items.FindByValue(str).Selected = true;
                }
                txtOrtodonciadientesdenticionmixtapermanenteOtros.Value = rowMaestro["OrtodonciaDientesDenticiónMixtaOtros"].ToString();
                ddlTieneLabiosCerrados.SelectedValue = rowMaestro["NinoTieneLabiosCerrados"].ToString();
                ddlHaymovimientosmientrasrespira.SelectedValue = rowMaestro["MovimientoMientrasRespira"].ToString();
                ddlPosturaadecuada.SelectedValue = rowMaestro["PosturaAdecuada"].ToString();
                ddlRespiraporlanariz.SelectedValue = rowMaestro["RespiraNariz"].ToString();
                ddlLenguaestaensuposicion.SelectedValue = rowMaestro["LenguaenPosicion"].ToString();
                //ddlPrescripciones.SelectedValue = rowMaestro["Prescripciones"].ToString();
                    strchecklist = rowMaestro["Prescripciones"].ToString().Split(chArray);
                if (strchecklist[0] != "")
                {
                    foreach (string str in strchecklist)
                        this.ddlPrescripciones.Items.FindByValue(str).Selected = true;
                }
                txtPrescripcionesotros.Text = rowMaestro["PrescripcionesOtros"].ToString();
                ddlalertaPacientesdadodealta.SelectedValue = rowMaestro["PacientedeAlta"].ToString();
                txtInterpretacionradiográficaOtros.Text = rowMaestro["InterpretaciónRadiograficaOtros"].ToString();
                ddlalertaDestartrajesSupragingival.SelectedValue = rowMaestro["ControlDestartrajesSupragingival"].ToString();
                ddlalertaTerapiaMiofuncional.SelectedValue = rowMaestro["ControlterapiaMiofuncional"].ToString();
                ddlalertaBarnizFluor.SelectedValue = rowMaestro["ControlBarnizFluor"].ToString();
                ddlalertaprofilaxis.SelectedValue = rowMaestro["ControlProfilaxis"].ToString();
                ddlalertatraumadental.SelectedValue = rowMaestro["ControlTraumaDental"].ToString();
                //ckObjectivosMiofuncionalMyobrace	rowMaestro["ObjectivosTerapiaMiofuncionalMyobrace"].ToString(); 
                strchecklist = rowMaestro["ObjectivosTerapiaMiofuncionalMyobrace"].ToString().Split(chArray);
                if (strchecklist[0] != "")
                {
                    foreach (string str in strchecklist)
                        this.ckObjectivosMiofuncionalMyobrace.Items.FindByValue(str).Selected = true;
                }
                ddlAparatosOrtondonciaInterceptivaConvencionales.SelectedValue = rowMaestro["ControlAparatosOrtodonciaInterceptivaConvencionales"].ToString();
                ddlreferimiento.SelectedValue = rowMaestro["Referimiento"].ToString();
                txtreferimientootros.Text = rowMaestro["ReferimientoOtros"].ToString();
                txtInterconsultaMultidisciplinaria.Value = rowMaestro["InterconsultaMultidisciplinaria"].ToString();

                if ((rowMaestro["PacientedeAltaDate"].ToString().Trim() != "1/1/1900 12:00:00 AM") && (rowMaestro["PacientedeAltaDate"].ToString().Trim() != ""))
                    txtPacientesdadodealtaDate.Value = Convert.ToDateTime(rowMaestro["PacientedeAltaDate"].ToString()).ToShortDateString();

                if ((rowMaestro["ControlProfilaxisDate"].ToString().Trim() != "1/1/1900 12:00:00 AM") && (rowMaestro["ControlProfilaxisDate"].ToString().Trim() != ""))
                    txtprofilaxisDate.Value = Convert.ToDateTime(rowMaestro["ControlProfilaxisDate"].ToString()).ToShortDateString();

                if ((rowMaestro["ControlDestartrajesSupragingivalDate"].ToString().Trim() != "1/1/1900 12:00:00 AM") && (rowMaestro["ControlDestartrajesSupragingivalDate"].ToString().Trim() != ""))
                    txtDestartrajesSupragingivalDate.Value = Convert.ToDateTime(rowMaestro["ControlDestartrajesSupragingivalDate"].ToString()).ToShortDateString();

                if ((rowMaestro["ControlTraumaDentalDate"].ToString().Trim() != "1/1/1900 12:00:00 AM") && (rowMaestro["ControlTraumaDentalDate"].ToString().Trim() != ""))
                    txttraumadentalDate.Value = Convert.ToDateTime(rowMaestro["ControlTraumaDentalDate"].ToString()).ToShortDateString();

                if ((rowMaestro["ControlterapiaMiofuncionalDate"].ToString().Trim() != "1/1/1900 12:00:00 AM") && (rowMaestro["ControlterapiaMiofuncionalDate"].ToString().Trim() != ""))
                    txtTerapiaMiofuncionalDate.Value = Convert.ToDateTime(rowMaestro["ControlterapiaMiofuncionalDate"].ToString()).ToShortDateString();

                if ((rowMaestro["ControlBarnizFluorDate"].ToString().Trim() != "1/1/1900 12:00:00 AM") && (rowMaestro["ControlBarnizFluorDate"].ToString().Trim() != ""))
                    txtBarnizFluorDate.Value = Convert.ToDateTime(rowMaestro["ControlBarnizFluorDate"].ToString()).ToShortDateString();

                if ((rowMaestro["ControlAparatosOrtodonciaInterceptivaConvencionalesDate"].ToString().Trim() != "") && (rowMaestro["ControlAparatosOrtodonciaInterceptivaConvencionalesDate"].ToString().Trim() != ""))
                    txtAparatosOrtondonciaInterceptivaConvencionalesDate.Value = Convert.ToDateTime(rowMaestro["ControlAparatosOrtodonciaInterceptivaConvencionalesDate"].ToString()).ToShortDateString();
            }
            else
            {
                ddlImpresiondiagnostica.Value = string.Empty;
                ddlModalidadAtencion.SelectedValue = "0";
                ddlGrupoFamiliar.SelectedValue = "0";
                txtComentariosGrupoFamiliar.Value = "";
                txtantecedentesmedicosgenerales.Value = "";
                ddlembarazo.SelectedValue = "";
                ddlNacimiento.SelectedValue = "";
                txtEmbarazoOtros.Value = "";
                ddlLactancia.SelectedValue = "";
                txtLactanciaOtros.Value = "";
                ddlPrimerDiente.SelectedValue = "";
                ddlChupete.SelectedValue = "";
                txtChupeteOtros.Value = "";
                ddlNacimiento.SelectedValue = "";
                ddlPrimerDiente.SelectedValue = "";
                txtbiberon.Value = "";
                ddlLenguaje.SelectedValue = "";
                txtLenguajeOtros.Value = "";
                txtMarchaindependiente.Value = "";
                ddlAlteracionesSueno.SelectedValue = "";
                ddlExperienciaPrevia.SelectedValue = "";
                txtExperienciaPreviaOtros.Value = "";
                ddlComportamiento.SelectedValue = "";
                ddlevaluacionclinica.SelectedValue = "0";
                txtEvaluacionClinicaOtros.Value = "";
                ddlRiesgocariogenico.SelectedValue = "";
                txtultimafecharealizo.Value = "";
                ddlTraumadental.SelectedValue = "0";
                txtTraumadentalComoCuandoyDonde.Value = "";
                ddlTraumaTejidosBlandos.SelectedValue = "0";
                txtIndiceOleary.Value = "";
                ddlCronologiaerupcion.SelectedValue = "";
                ddlAlimentacionactual.SelectedValue = "";
                txtObservacionesHistoriaDieta.Value = "";
                ddlDificultaddeglutirliquidos.SelectedValue = "";
                ddlazucar.SelectedValue = "";
                txtazucarOtros.Value = "";
                ddlDificultaddeglutirsolidos.SelectedValue = "";
                ddlInmunizacionesCompletas.SelectedValue = "";
                txtInmunizacionesCompletasOtros.Value = "";
                ckfrecuenciacepillado.SelectedValue = "";
                ddlcomohacecepillado.SelectedValue = "";
                txtPastadental.Value = "";
                ddlColutorio.SelectedValue = "";
                txtColutorioCual.Value = "";
                //ckHabitosbucales  
                ddlSuplementoFluorado.SelectedValue = "";
                txtSuplementoFluoradoCual.Value = "";
                ddlSedadental.SelectedValue = "";
                txtSedadentalotros.Value = "";
                txtMomentosazucaraldía.Value = "";
                txtHabitosbucalesOtros.Value = "";
                // CKOrtodonciadientesprimarios
                txtOrtodonciadientesprimariosOtros.Value = "";
                ddlTerapiaMioFuncionales.SelectedValue = "0";
                txtTerapiaMioFuncionalesOtros.Value = "";
                //ckOrtodonciadientesdenticionmixtapermanente
                txtOrtodonciadientesdenticionmixtapermanenteOtros.Value = "";
                ddlprocedimientosaRealizar.SelectedValue = "";
                ddlpiezaprocedimientoarealizar.SelectedValue = "";
                txtcomentarioprocedimientosaRealizar.Text = "";
                ddlTieneLabiosCerrados.SelectedValue = "";
                ddlHaymovimientosmientrasrespira.SelectedValue = "";
                ddlPosturaadecuada.SelectedValue = "";
                ddlRespiraporlanariz.SelectedValue = "";
                ddlLenguaestaensuposicion.SelectedValue = "";
                ddlPrescripciones.Value = ""; 
                txtPrescripcionesotros.Text = "";
                ddlalertaPacientesdadodealta.SelectedValue = "0";
                ddlalertaDestartrajesSupragingival.SelectedValue = "0";
                ddlalertaTerapiaMiofuncional.SelectedValue = "0";
                ddlalertaBarnizFluor.SelectedValue = "0";
                ddlalertaprofilaxis.SelectedValue = "0";
                ddlalertatraumadental.SelectedValue = "0";
                //ckObjectivosMiofuncionalMyobrace
                ddlAparatosOrtondonciaInterceptivaConvencionales.SelectedValue = "0";
                ddlreferimiento.SelectedValue = "0";
                txtreferimientootros.Text = "";
                txtInterconsultaMultidisciplinaria.Value = "";
                txtInterpretacionradiográficaOtros.Text = "";
                txtPacientesdadodealtaDate.Value = "";
                txtprofilaxisDate.Value = "";
                txtDestartrajesSupragingivalDate.Value = "";
                txttraumadentalDate.Value = "";
                txtTerapiaMiofuncionalDate.Value = "";
                txtBarnizFluorDate.Value = "";
                txtAparatosOrtondonciaInterceptivaConvencionalesDate.Value = "";

            }
        }
        public void GuardarOdontogramaasHTML(string NombreArchivo)
        {
            // triggerDownload(document.getElementById("MainContent_pnodontograma").innerHTML
            
            ScriptManager.RegisterStartupScript(this, this.GetType(), "GuardaOdontograma", "triggerDownload('" + NombreArchivo + "');", true);
        }



        protected void _SaveDetallesHermanos(object sender, EventArgs e)
        {

            if (txtnombreHermano.Value.ToString() == "")
            {
                Notify("Debe especificar el Nombre", "error");
                return;
            }

            CurrentPAX_ROWGUID = Request.QueryString["CurrentPAX_ROWGUID"].ToString();
            CURRENTUSR_SGXID = Request.QueryString["CURRENTUSR_SGXID"].ToString();
            this.xQueryParameters.Clear();
            this.xQueryValues.Clear();
            this.xQueryParameters.Add("@IDPACIENTE");
            this.xQueryValues.Add(CurrentPAX_ROWGUID.ToString());
            this.xQueryParameters.Add("@Nombre");
            this.xQueryValues.Add(txtnombreHermano.Value.ToString());
            this.xQueryParameters.Add("@Edad");

            if (TxtEdadHermano.Value.ToString() == "")
            {
                TxtEdadHermano.Value = "0";
            }
            this.xQueryValues.Add(TxtEdadHermano.Value.ToString());
            this.xQueryParameters.Add("@ROWUSERID");
            this.xQueryValues.Add(CURRENTUSR_SGXID.ToString());
            this.xQueryParameters.Add("@ROWSGXID");
            this.xQueryValues.Add(CURRENTUSR_SGXID.ToString());


            this.xQuery = "PR_ODP_HermanosHermanos";
            if (!DB.ExecuteNonQuery(this.xQuery, this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure))
                return;
            this._CargarDetallesHermanos();
            txtnombreHermano.Value = "";
            TxtEdadHermano.Value = "";

        } 
        private void _CargarDetallesHermanos()
        {

            CurrentPAX_ROWGUID = Request.QueryString["CurrentPAX_ROWGUID"].ToString();
            CURRENTUSR_SGXID = Request.QueryString["CURRENTUSR_SGXID"].ToString();

            this.xQueryParameters.Clear();
            this.xQueryValues.Clear();
            this.xQueryParameters.Add("@IDPACIENTE");
            this.xQueryValues.Add(CurrentPAX_ROWGUID.ToString());
            this.xQueryParameters.Add("@ROWSGXID");
            this.xQueryValues.Add(CURRENTUSR_SGXID.ToString());
            this.xQuery = "PR_ODP_Hermanos_BUSCA";
            this.RPDATAHERMANOS.DataSource = DB.ExecuteAdapter(this.xQuery, this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure);
            this.RPDATAHERMANOS.DataBind();
            this.xQuery = "PR_TFEntrevistaInicialHermanos_BUSCA";

        }
        protected void _DELETEHERMANOS(object sender, EventArgs e)
        {

            string secuencia = ((LinkButton)sender).CommandArgument.ToString();
            this.xQueryParameters.Clear();
            this.xQueryValues.Clear();
            this.xQueryParameters.Add((object)"@secuencia");
            this.xQueryValues.Add(secuencia);
            this.xQuery = "PR_ODP_Hermanos_DELETE";
            DB.ExecuteNonQuery(this.xQuery, this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure);
            txtantecedentesmedicosgenerales.Focus();
            _CargarDetallesHermanos();
        }

        private void _CargarMultimedias()
        {

            CurrentPAX_ROWGUID = Request.QueryString["CurrentPAX_ROWGUID"].ToString();
            CURRENTUSR_SGXID = Request.QueryString["CURRENTUSR_SGXID"].ToString();

            this.xQueryParameters.Clear();
            this.xQueryValues.Clear();
            this.xQueryParameters.Add("@REFGUID");
            this.xQueryValues.Add(CurrentPAX_ROWGUID.ToString());
            this.xQueryParameters.Add("@ESPGUID");
            this.xQueryValues.Add("");
            this.xQueryParameters.Add("@FECHA1");
            this.xQueryValues.Add("11/10/2000");
            this.xQueryParameters.Add("@FECHA2");
            this.xQueryValues.Add("11/10/30000");
            this.xQueryParameters.Add("@NODO");
            this.xQueryValues.Add("CE_DIG");
            this.xQuery = "HCL00000R2";
            this.RPMULTIMEDIA.DataSource = DB.ExecuteAdapter(this.xQuery, this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure);
            this.RPMULTIMEDIA.DataBind();

        }
        protected void _VerMultimedias(object sender, EventArgs e)
        {
            string str1 = ((LinkButton)sender).CommandName.ToString();
            string str2 = ((LinkButton)sender).CommandArgument.ToString();
            try
            {
                if (str1 == "View")
                    this.Response.Write("<script>window.open('http://caidsiges01:8000/" + str2 + "','_blank');</script>");

            }
            catch
            {
            }
            txtcomentariosInterpretacionRadiografica.Focus();
        }
        protected void _AddMultimedia(object sender, EventArgs e)
        {
            _SaveMaestro(sender,e);
            CurrentPAX_ROWGUID = Request.QueryString["CurrentPAX_ROWGUID"].ToString();

            if (Request.QueryString["CurrentPAX_ROWGUID"].ToString() != "")
                CurrentPAX_ROWGUID = Request.QueryString["CurrentPAX_ROWGUID"].ToString();
            this.Response.Redirect("http://caidsiges01:8000/HCL00025.aspx?X=" + CurrentPAX_ROWGUID);

        }

        protected void _Back(object sender, EventArgs e)
        {
            CurrentPAX_ROWGUID = Request.QueryString["CurrentPAX_ROWGUID"].ToString();

            if (Request.QueryString["CurrentPAX_ROWGUID"].ToString() != "")
                CurrentPAX_ROWGUID = Request.QueryString["CurrentPAX_ROWGUID"].ToString();
            this.Response.Redirect("http://caidsiges01:8000/HCL00000.aspx?X=" + CurrentPAX_ROWGUID);

        }
        public void Notify(string msg, string tipo)
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "notify('" + msg + "','" + tipo + "');", true);
        }

        protected void _AddPlanTratamiento(object sender, EventArgs e)
        {
            // this.TBPLANTRATAMIENTO.Visible = false;
            this.MNTPLANTRATAMIENTO.Visible = true;
        }
        protected void _SavePlanTratamiento(object sender, EventArgs e)
        {
            string str1 = this.cmbObjetivo.Value.ToString();
            string str2 = this.cmbDetalles.Value.ToString();
            string str3 = this.cmbDetalles.Value.ToString();
            string text = this.cmbDetalles.Items[this.cmbDetalles.SelectedIndex].Text;
            string str4 = this.txtEVALUACION.Text.Trim();
            string str5 = this.cmbPiezas.Value.ToString();
            string xREFGUID = CurrentPAX_ROWGUID.ToString();
            string xTERGUID = CurrentUSR_TERID.ToString();
            string xESPGUID = this.cmbTipo.Value.ToString();
            string str6 = CurrentUSR_TERID.ToString();
            string str7 = CURRENTUSR_SGXID.ToString();
            //if (!((Site_Master)this.Master).Crear_ActoMédico(xREFGUID, xTERGUID, xESPGUID))
            //  return;

            if (DB.ExecuteNonQuery(string.Format("[HCL00010OSI] '{0}','{1}','{2}','{3}','{4}','{5}','{6}','{7}','{8}','{9}'", (object)str1, (object)str2, (object)str3, (object)text, (object)str4, (object)str5, (object)xREFGUID, (object)xTERGUID, (object)str6, (object)str7)))
            {
                this._CargarPlanTratamiento();
                Notify("Registro Guardado", "success");
            }
            else
            {
                Notify("No se pudo almacenar la informacion", "error");
            }
        }
        protected void _CargarPlanTratamiento()
        {
            this.cmbDetalles.Value = string.Empty;
            this.txtEVALUACION.Text = string.Empty;
            this.RPPLANTRATAMIENTO.DataSource = (object)DB.ExecuteAdapter(string.Format("HCL00010H @REFGUID = '{0}', @ROWSGXID = '{1}', @TIPO = '{2}'", CurrentPAX_ROWGUID.ToString(), CURRENTUSR_SGXID.ToString(), (object)"ODO"));
            this.RPPLANTRATAMIENTO.DataBind();
            DataTable dataTable = DB.ExecuteAdapter(string.Format("PAX00000X1 @REFGUID = '{0}', @ROWSGXID = '{1}', @USERID = '{2}'", CurrentPAX_ROWGUID.ToString(), CURRENTUSR_SGXID.ToString(), CurrentUSR_TERID.ToString()));
            if (dataTable.Rows.Count == 0)
                return;
            //this.Session.Add("xHTML_Options", (object)dataTable.Rows[0]["HTML_Options"].ToString());
            // ((Site_Master)this.Master).Mostrar_Opciones_ActoMedico();
        }
        protected void _DELETEPlanTratamiento(object sender, EventArgs e)
        {

            string secuencia = ((LinkButton)sender).CommandArgument.ToString();
            this.xQueryParameters.Clear();
            this.xQueryValues.Clear();
            this.xQueryParameters.Add((object)"@secuencia");
            this.xQueryValues.Add(secuencia);
            this.xQuery = "PR_ODP_DetallePlanTratamiento_DELETE";
            DB.ExecuteNonQuery(this.xQuery, this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure);
            _CargarPlanTratamiento();
            RPPLANTRATAMIENTO.Focus();
        }

        protected void _AddProcedimientosarealizar(object sender, EventArgs e)
        {
            this.MNTPROCEDIMIENTOSAREALIZAR.Visible = true;
        }
        protected void _SaveProcedimientosarealizar(object sender, EventArgs e)
        {
            // this.TBPLANTRATAMIENTO.Visible = false;
            this.MNTPROCEDIMIENTOSAREALIZAR.Visible = true;

            if (ddlprocedimientosaRealizar.SelectedValue.ToString().ToUpper() == "SELECCIONE")
            {
                Notify("Debe especificar el procedimiento", "error");
                return;
            }

            CurrentPAX_ROWGUID = Request.QueryString["CurrentPAX_ROWGUID"].ToString();
            CurrentUSR_TERID = Request.QueryString["CurrentUSR_TERID"].ToString();
            CURRENTUSR_SGXID = Request.QueryString["CURRENTUSR_SGXID"].ToString();
            this.xQueryParameters.Clear();
            this.xQueryValues.Clear(); 
            this.xQueryParameters.Add("@Codigo");
            this.xQueryValues.Add(ddlprocedimientosaRealizar.SelectedValue.ToString());
            this.xQueryParameters.Add("@Paciente");
            this.xQueryValues.Add(CurrentPAX_ROWGUID.ToString());
            this.xQueryParameters.Add("@Pieza");
            this.xQueryValues.Add(ddlpiezaprocedimientoarealizar.SelectedValue.ToString());
            this.xQueryParameters.Add("@Comentario");
            this.xQueryValues.Add(txtcomentarioprocedimientosaRealizar.Text.ToString());
            this.xQueryParameters.Add("@Especialistaid");
            this.xQueryValues.Add(CurrentUSR_TERID.ToString());
            this.xQueryParameters.Add("@Centro");
            this.xQueryValues.Add(CURRENTUSR_SGXID.ToString());

            DataTable dtProcedimientoaRealizar = DB.ExecuteAdapter("PR_ODP_DetalleProcedimientosGuardar", this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure); if (dtProcedimientoaRealizar.Rows.Count != 0)
            {
                DataRow row2 = dtProcedimientoaRealizar.Rows[0];
                if (row2["Conteo"].ToString() != "0")
                {
                    Notify("Registro Guardado", "success");
                }
                else
                {
                    Notify("No se pudo almacenar la informacion", "error");

                }
            }
            else
            {
                Notify("No se pudo almacenar la informacion", "error");
                return;
            }

            this._CargarProcedimientosarealizar(); 
            ddlprocedimientosaRealizar.SelectedValue = "";
            ddlpiezaprocedimientoarealizar.SelectedValue = "";
            txtcomentarioprocedimientosaRealizar.Text = "";

        }
        protected void _CargarProcedimientosarealizar()
        {

            CurrentPAX_ROWGUID = Request.QueryString["CurrentPAX_ROWGUID"].ToString();
            CURRENTUSR_SGXID = Request.QueryString["CURRENTUSR_SGXID"].ToString();

            this.xQueryParameters.Clear();
            this.xQueryValues.Clear();
            this.xQueryParameters.Add("@IDPACIENTE");
            this.xQueryValues.Add(CurrentPAX_ROWGUID.ToString());
            this.xQueryParameters.Add("@ROWSGXID");
            this.xQueryValues.Add(CURRENTUSR_SGXID.ToString());
            this.xQuery = "PR_ODP_DetalleProcedimientos_BUSCA";
            this.RPPROCEDIMIENTOSAREALIZAR.DataSource = DB.ExecuteAdapter(this.xQuery, this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure);
            this.RPPROCEDIMIENTOSAREALIZAR.DataBind();

        }
        protected void _DELETEProcedimientosarealizar(object sender, EventArgs e)
        {

            string secuencia = ((LinkButton)sender).CommandArgument.ToString();
            this.xQueryParameters.Clear();
            this.xQueryValues.Clear();
            this.xQueryParameters.Add((object)"@secuencia");
            this.xQueryValues.Add(secuencia);
            this.xQuery = "PR_ODP_DetalleProcedimientos_DELETE";
            DB.ExecuteNonQuery(this.xQuery, this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure);
            _CargarProcedimientosarealizar();
            txtcomentarioprocedimientosaRealizar.Focus();
        }

        protected void _SaveMedicinaQueToma(object sender, EventArgs e)
        {
            if (txtnombreMedicina.Value.ToString().ToUpper() == "")
            {
                Notify("Debe especificar el Nombre", "error");
                return;
            }

            CurrentPAX_ROWGUID = Request.QueryString["CurrentPAX_ROWGUID"].ToString();
            CurrentUSR_TERID = Request.QueryString["CurrentUSR_TERID"].ToString();
            CURRENTUSR_SGXID = Request.QueryString["CURRENTUSR_SGXID"].ToString();
            this.xQueryParameters.Clear();
            this.xQueryValues.Clear();
            this.xQueryParameters.Add("@Paciente");
            this.xQueryValues.Add(CurrentPAX_ROWGUID.ToString());
            this.xQueryParameters.Add("@Nombre");
            this.xQueryValues.Add(txtnombreMedicina.Value.ToString());
            this.xQueryParameters.Add("@Posologia");
            this.xQueryValues.Add(txtposologia.Value.ToString());
            this.xQueryParameters.Add("@Dosis");
            this.xQueryValues.Add(txtdosis.Value.ToString());
            this.xQueryParameters.Add("@Centro");
            this.xQueryValues.Add(CURRENTUSR_SGXID.ToString());

            DataTable DtMedicinaQueToma = DB.ExecuteAdapter("PR_ODPDetalleMedicinasGuardar", this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure); if (DtMedicinaQueToma.Rows.Count != 0)
            {
                DataRow row2 = DtMedicinaQueToma.Rows[0];
                if (row2["Conteo"].ToString() != "0")
                {
                    Notify("Registro Guardado", "success");
                }
                else
                {
                    Notify("No se pudo almacenar la informacion", "error");

                }
            }
            else
            {
                Notify("No se pudo almacenar la informacion", "error");
                return;
            }

            _CargarMedicinaQueToma();
            txtnombreMedicina.Value = "";
            txtposologia.Value = "";
            txtdosis.Value = "";

        }
        protected void _CargarMedicinaQueToma()
        {
            CurrentPAX_ROWGUID = Request.QueryString["CurrentPAX_ROWGUID"].ToString();
            CURRENTUSR_SGXID = Request.QueryString["CURRENTUSR_SGXID"].ToString();

            this.xQueryParameters.Clear();
            this.xQueryValues.Clear();
            this.xQueryParameters.Add("@PACIENTE");
            this.xQueryValues.Add(CurrentPAX_ROWGUID.ToString());
            this.xQueryParameters.Add("@Centro");
            this.xQueryValues.Add(CURRENTUSR_SGXID.ToString());
            this.xQuery = "PR_ODPDetalleMedicinas_BUSCA";
            this.RPMEDICINATOMA.DataSource = DB.ExecuteAdapter(this.xQuery, this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure);
            this.RPMEDICINATOMA.DataBind();
        }
        protected void _DELETEMedicinaQueToma(object sender, EventArgs e)
        {
            string secuencia = ((LinkButton)sender).CommandArgument.ToString();
            this.xQueryParameters.Clear();
            this.xQueryValues.Clear();
            this.xQueryParameters.Add((object)"@secuencia");
            this.xQueryValues.Add(secuencia);
            this.xQuery = "PR_ODPDetalleMedicinas_DELETE";
            DB.ExecuteNonQuery(this.xQuery, this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure);
            _CargarMedicinaQueToma();
            ddlembarazo.Focus();
        }

        protected void _AddTratamientoRealizado(object sender, EventArgs e)
        {
            //   this.TBTRATAMIENTOREALIZADO.Visible = false;
            this.MNTTRATAMIENTOREALIZADO.Visible = true;
        }
        protected void _SaveTratamientoRealizado(object sender, EventArgs e)
        {
            this.TBTRATAMIENTOREALIZADO.Visible = true;
            if (ddlTratamientoRealizado.SelectedValue.ToString().ToUpper() == "SELECCIONE")
            {
                Notify("Debe especificar el tratamiento", "error");
                return;
            }

            CurrentPAX_ROWGUID = Request.QueryString["CurrentPAX_ROWGUID"].ToString();
            CurrentUSR_TERID = Request.QueryString["CurrentUSR_TERID"].ToString();
            CURRENTUSR_SGXID = Request.QueryString["CURRENTUSR_SGXID"].ToString();
            this.xQueryParameters.Clear();
            this.xQueryValues.Clear(); 
            this.xQueryParameters.Add("@Codigo");
            this.xQueryValues.Add(ddlTratamientoRealizado.SelectedValue.ToString());
            this.xQueryParameters.Add("@Paciente");
            this.xQueryValues.Add(CurrentPAX_ROWGUID.ToString());
            this.xQueryParameters.Add("@Centro");
            this.xQueryValues.Add(CURRENTUSR_SGXID.ToString());
            this.xQueryParameters.Add("@Pieza");
            this.xQueryValues.Add(ddlPiezaTratamientoRealizado.SelectedValue.ToString()); 
            this.xQueryParameters.Add("@Especialistaid");
            this.xQueryValues.Add(CurrentUSR_TERID.ToString());
            this.xQueryParameters.Add("@Comentario");
            this.xQueryValues.Add(txtcomentariotratamientorealizado.Text.ToString()); 
            DataTable dtTratamientoRealizado = DB.ExecuteAdapter("PR_ODP_DetalleTratamientoRealizadoGuardar", this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure);
            if (dtTratamientoRealizado.Rows.Count != 0)
            {
                DataRow row2 = dtTratamientoRealizado.Rows[0];
                if (row2["Conteo"].ToString() != "0")
                {
                    Notify("Registro Guardado", "success");
                }
                else
                {
                    Notify("No se pudo almacenar la informacion", "error");

                }
            }
            else
            {
                Notify("No se pudo almacenar la informacion", "error");
                return;
            }

            this._CargarTratamientoRealizado(); 
            ddlTratamientoRealizado.SelectedValue = "";
            ddlPiezaTratamientoRealizado.SelectedValue = "";
            txtcomentariotratamientorealizado.Text = "";

        }
        protected void _CargarTratamientoRealizado()
        {

            CurrentPAX_ROWGUID = Request.QueryString["CurrentPAX_ROWGUID"].ToString();
            CURRENTUSR_SGXID = Request.QueryString["CURRENTUSR_SGXID"].ToString(); 
            this.xQueryParameters.Clear();
            this.xQueryValues.Clear();
            this.xQueryParameters.Add("@IDPACIENTE");
            this.xQueryValues.Add(CurrentPAX_ROWGUID.ToString());
            this.xQueryParameters.Add("@ROWSGXID");
            this.xQueryValues.Add(CURRENTUSR_SGXID.ToString());
            this.xQuery = "PR_ODP_DetalleTratamientoRealizado_BUSCA";
            this.RPTRATAMIENTOREALIZADO.DataSource = DB.ExecuteAdapter(this.xQuery, this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure);
            this.RPTRATAMIENTOREALIZADO.DataBind(); 
        }
        protected void _DELETETratamientoRealizado(object sender, EventArgs e)
        {

            string secuencia = ((LinkButton)sender).CommandArgument.ToString();
            this.xQueryParameters.Clear();
            this.xQueryValues.Clear();
            this.xQueryParameters.Add((object)"@secuencia");
            this.xQueryValues.Add(secuencia);
            this.xQuery = "PR_ODP_DetalleTratamientoRealizado_DELETE";
            DB.ExecuteNonQuery(this.xQuery, this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure);
            _CargarTratamientoRealizado(); 
        }

        protected void _Addprocedimientoproximacita(object sender, EventArgs e)
        {
            // this.tbprocedimientoproximacita.Visible = false;
            this.MNTPROCEDIMIENTOPROXIMACITA.Visible = true;

        }
        protected void _Saveprocedimientoproximacita(object sender, EventArgs e)
        {
            if (ddlProcedimientoProximaCita.SelectedValue.ToString().ToUpper() == "SELECCIONE")
            {
                Notify("Debe especificar el procedimiento", "error");
                return;
            }

            CurrentPAX_ROWGUID = Request.QueryString["CurrentPAX_ROWGUID"].ToString();
            CurrentUSR_TERID = Request.QueryString["CurrentUSR_TERID"].ToString();
            CURRENTUSR_SGXID = Request.QueryString["CURRENTUSR_SGXID"].ToString();
            this.xQueryParameters.Clear();
            this.xQueryValues.Clear(); 
            this.xQueryParameters.Add("@Codigo");
            this.xQueryValues.Add(ddlProcedimientoProximaCita.SelectedValue.ToString());
            this.xQueryParameters.Add("@Paciente");
            this.xQueryValues.Add(CurrentPAX_ROWGUID.ToString());
            this.xQueryParameters.Add("@Pieza");
            this.xQueryValues.Add(ddlpiezaprocedimientoproximacita.SelectedValue.ToString());
            this.xQueryParameters.Add("@Comentario");
            this.xQueryValues.Add(txtcomentarioprocedimientoproximacita.Text.ToString());
            this.xQueryParameters.Add("@Especialistaid");
            this.xQueryValues.Add(CurrentUSR_TERID.ToString());
            this.xQueryParameters.Add("@Centro");
            this.xQueryValues.Add(CURRENTUSR_SGXID.ToString());

            DataTable dtProcedimientosProximaCita = DB.ExecuteAdapter("PR_ODP_DetalleProcedimientosProximaCitaGuardar", this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure);
            if (dtProcedimientosProximaCita.Rows.Count != 0)
            {
                DataRow row2 = dtProcedimientosProximaCita.Rows[0];
                if (row2["Conteo"].ToString() != "0")
                {
                    Notify("Registro Guardado", "success");
                }
                else
                {
                    Notify("No se pudo almacenar la informacion", "error");

                }
            }
            else
            {
                Notify("No se pudo almacenar la informacion", "error");
                return;
            }

            this._CargarProcedimientosProximaCita();
            //txtFechaprocedimientosaRealizar.Value = "";
            ddlProcedimientoProximaCita.SelectedValue = string.Empty;
            ddlpiezaprocedimientoproximacita.SelectedValue = "";
            txtcomentarioprocedimientoproximacita.Text = "";
        }
        protected void _CargarProcedimientosProximaCita()
        {

            CurrentPAX_ROWGUID = Request.QueryString["CurrentPAX_ROWGUID"].ToString();
            CURRENTUSR_SGXID = Request.QueryString["CURRENTUSR_SGXID"].ToString();

            this.xQueryParameters.Clear();
            this.xQueryValues.Clear();
            this.xQueryParameters.Add("@IDPACIENTE");
            this.xQueryValues.Add(CurrentPAX_ROWGUID.ToString());
            this.xQueryParameters.Add("@ROWSGXID");
            this.xQueryValues.Add(CURRENTUSR_SGXID.ToString());
            this.xQuery = "PR_ODP_DetalleProcedimientosProximaCita_BUSCA";
            this.RPPROCEDIMIENTOPROXIMACITA.DataSource = DB.ExecuteAdapter(this.xQuery, this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure);
            this.RPPROCEDIMIENTOPROXIMACITA.DataBind();

        }
        protected void _DELETEProcedimientosProximaCita(object sender, EventArgs e)
        {

            string secuencia = ((LinkButton)sender).CommandArgument.ToString();
            this.xQueryParameters.Clear();
            this.xQueryValues.Clear();
            this.xQueryParameters.Add((object)"@secuencia");
            this.xQueryValues.Add(secuencia);
            this.xQuery = "PR_ODP_DetalleProcedimientosProximaCita_DELETE";
            DB.ExecuteNonQuery(this.xQuery, this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure);
            _CargarProcedimientosProximaCita();
            //txtcomentarioprocedimientoproximacita.Focus();
            //RPPROCEDIMIENTOPROXIMACITA.Focus();
            txtcomentarioprocedimientoproximacita.Focus();
        }

        protected void _AddInterpretacionRadiografica(object sender, EventArgs e)
        { 
            this.MNTInterpretacionRadiografica.Visible = true;

        }
        protected void _SaveInterpretacionRadiografica(object sender, EventArgs e)
        {
            if (ddlInterpretacionRadiografica.SelectedValue.ToString().ToUpper() == "SELECCIONE")
            {
                Notify("Debe especificar el procedimiento", "error");
                return;
            }

            CurrentPAX_ROWGUID = Request.QueryString["CurrentPAX_ROWGUID"].ToString();
            CurrentUSR_TERID = Request.QueryString["CurrentUSR_TERID"].ToString();
            CURRENTUSR_SGXID = Request.QueryString["CURRENTUSR_SGXID"].ToString();
            this.xQueryParameters.Clear();
            this.xQueryValues.Clear();
            this.xQueryParameters.Add("@Codigo");
            this.xQueryValues.Add(ddlInterpretacionRadiografica.SelectedValue.ToString());
            this.xQueryParameters.Add("@Paciente");
            this.xQueryValues.Add(CurrentPAX_ROWGUID.ToString());
            this.xQueryParameters.Add("@Pieza");
            this.xQueryValues.Add(ddlpiezaInterpretacionRadiografica.SelectedValue.ToString());
            this.xQueryParameters.Add("@Comentario");
            this.xQueryValues.Add(txtcomentariosInterpretacionRadiografica.Text.ToString());
            this.xQueryParameters.Add("@Especialistaid");
            this.xQueryValues.Add(CurrentUSR_TERID.ToString());
            this.xQueryParameters.Add("@Centro");
            this.xQueryValues.Add(CURRENTUSR_SGXID.ToString());

            DataTable dtInterpretacionRadiografica = DB.ExecuteAdapter("PR_ODP_DetalleInterpretacionRadiograficaGuardar", this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure);
            if (dtInterpretacionRadiografica.Rows.Count != 0)
            {
                DataRow row2 = dtInterpretacionRadiografica.Rows[0];
                if (row2["Conteo"].ToString() != "0")
                {
                    Notify("Registro Guardado", "success");
                }
                else
                {
                    Notify("No se pudo almacenar la informacion", "error");

                }
            }
            else
            {
                Notify("No se pudo almacenar la informacion", "error");
                return;
            }

            this._CargarInterpretacionRadiografica();
            //txtFechaprocedimientosaRealizar.Value = "";
            ddlInterpretacionRadiografica.SelectedValue = "";
            ddlpiezaInterpretacionRadiografica.SelectedValue = "";
            txtcomentariosInterpretacionRadiografica.Text = "";
        }
        protected void _CargarInterpretacionRadiografica()
        {

            CurrentPAX_ROWGUID = Request.QueryString["CurrentPAX_ROWGUID"].ToString();
            CURRENTUSR_SGXID = Request.QueryString["CURRENTUSR_SGXID"].ToString();

            this.xQueryParameters.Clear();
            this.xQueryValues.Clear();
            this.xQueryParameters.Add("@IDPACIENTE");
            this.xQueryValues.Add(CurrentPAX_ROWGUID.ToString());
            this.xQueryParameters.Add("@ROWSGXID");
            this.xQueryValues.Add(CURRENTUSR_SGXID.ToString());
            this.xQuery = "PR_ODP_DetalleInterpretacionRadiografica_BUSCA";
            this.RPInterpretacionRadiografica.DataSource = DB.ExecuteAdapter(this.xQuery, this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure);
            this.RPInterpretacionRadiografica.DataBind();

        }
        protected void _DELETEInterpretacionRadiografica(object sender, EventArgs e)
        {

            string secuencia = ((LinkButton)sender).CommandArgument.ToString();
            this.xQueryParameters.Clear();
            this.xQueryValues.Clear();
            this.xQueryParameters.Add((object)"@secuencia");
            this.xQueryValues.Add(secuencia);
            this.xQuery = "PR_ODP_DetalleInterpretacionRadiografica_DELETE";
            DB.ExecuteNonQuery(this.xQuery, this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure);
            _CargarInterpretacionRadiografica(); 
           // RPInterpretacionRadiografica.Focus();
            txtcomentariosInterpretacionRadiografica.Focus();
        }

        protected void LlenarLista()
        {
            /*HEADER*/
            this.RPPAXHEADER.DataSource = (object)DB.ExecuteAdapter(string.Format("PAX00000S5 @REFGUID = '{0}', @ROWSGXID = '{1}'", CurrentPAX_ROWGUID.ToString(), CURRENTUSR_SGXID.ToString()));
            this.RPPAXHEADER.DataBind();

            /*Impresion Diagnostica*/
            this.ddlImpresiondiagnostica.Items.Clear();
            DataTable dtImpresiondiagnostica = DB.ExecuteAdapter(string.Format("SELECT ROWGUID as codigo,NOMBRE as Descripcion FROM vANTE_MED_ODO", this.xQueryValues, CommandType.Text));
            foreach (DataRow row in (InternalDataCollectionBase)dtImpresiondiagnostica.Rows)
            {
                this.ddlImpresiondiagnostica.Items.Add(new ListItem(row["Descripcion"].ToString(), row["codigo"].ToString()));

            }

            /*Especialidad*/
            this.cmbTipo.Items.Clear();
            this.cmbTipo.Items.Add(new ListItem("-- SELECCIONE --", string.Empty));
            foreach (DataRow row in (InternalDataCollectionBase)DB.ExecuteAdapter(string.Format("SGX00100S4 @ROWSGXID = '{0}', @TERID = '{1}'", CURRENTUSR_SGXID.ToString(), CurrentUSR_TERID.ToString())).Rows)
                this.cmbTipo.Items.Add(new ListItem(row["ESPECIALIDADNOMBRE"].ToString(), row["ESPECIALIDADID"].ToString()));
            /*Piezas*/
            this.cmbPiezas.Items.Clear();
            this.cmbPiezas.Items.Add(new ListItem("-- NO APLICA --", string.Empty));

            this.ddlPiezaTratamientoRealizado.Items.Clear();
            this.ddlPiezaTratamientoRealizado.Items.Add(new ListItem("-- NO APLICA --", string.Empty));

            this.ddlpiezaprocedimientoarealizar.Items.Clear();
            this.ddlpiezaprocedimientoarealizar.Items.Add(new ListItem("-- NO APLICA --", string.Empty));

            this.ddlpiezaInterpretacionRadiografica.Items.Clear();
            this.ddlpiezaInterpretacionRadiografica.Items.Add(new ListItem("-- NO APLICA --", string.Empty));

            this.ddlpiezaprocedimientoproximacita.Items.Clear();
            this.ddlpiezaprocedimientoproximacita.Items.Add(new ListItem("-- NO APLICA --", string.Empty));
            foreach (DataRow row in (InternalDataCollectionBase)DB.ExecuteAdapter(string.Format("SELECT * FROM vPIEZAS_DETNTALES ORDER BY ORDEN")).Rows)
            {
                this.cmbPiezas.Items.Add(new ListItem(row["NOMBRE"].ToString(), row["ROWGUID"].ToString()));
                this.ddlPiezaTratamientoRealizado.Items.Add(new ListItem(row["NOMBRE"].ToString(), row["ROWGUID"].ToString()));
                this.ddlpiezaprocedimientoarealizar.Items.Add(new ListItem(row["NOMBRE"].ToString(), row["ROWGUID"].ToString()));
                this.ddlpiezaInterpretacionRadiografica.Items.Add(new ListItem(row["NOMBRE"].ToString(), row["ROWGUID"].ToString()));
                this.ddlpiezaprocedimientoproximacita.Items.Add(new ListItem(row["NOMBRE"].ToString(), row["ROWGUID"].ToString()));

            }
            if (this.cmbTipo.Items.Count == 2)
                this.cmbTipo.SelectedIndex = 1;
            /*Objetivo*/
            this.cmbObjetivo.Items.Clear();
            this.cmbObjetivo.Items.Add(new ListItem("-- SELECCIONE --", string.Empty));
            foreach (DataRow row in (InternalDataCollectionBase)DB.ExecuteAdapter(string.Format("HCX00300_DS4 @REFGUID = '{0}', @ROWSGXID = '{1}', @ESPGUID = '{2}'", CurrentPAX_ROWGUID.ToString(), CURRENTUSR_SGXID.ToString(), (object)this.cmbTipo.Value.ToString())).Rows)
                this.cmbObjetivo.Items.Add(new ListItem(row["NOMBRE"].ToString(), row["ROWGUID"].ToString()));
            if (this.cmbObjetivo.Items.Count == 2)
                this.cmbObjetivo.SelectedIndex = 1;
            /*Tratamiento*/
            this.cmbDetalles.Items.Clear();
            this.cmbDetalles.Items.Add(new ListItem("-- SELECCIONE --", string.Empty));
            foreach (DataRow row in (InternalDataCollectionBase)DB.ExecuteAdapter(string.Format("SMX30026S3 @NOMBRE = '{0}', @ROWSGXID = '{1}'", (object)"%%", CURRENTUSR_SGXID.ToString())).Rows)
            {
                this.cmbDetalles.Items.Add(new ListItem(row["NOMBRE"].ToString(), row["ROWGUID"].ToString()));
                this.ddlTratamientoRealizado.Items.Add(new ListItem(row["NOMBRE"].ToString(), row["ROWGUID"].ToString()));
            }

            /*Trauma Dental*/
            this.ddlTraumadental.Items.Clear();
            this.ddlTraumadental.Items.Add(new ListItem("-- SELECCIONE --", "0"));
            DataTable dtTraumadental = DB.ExecuteAdapter(string.Format("SELECT  Codigo, Descripcion FROM ODP_TipoTraumaDental Order by Descripcion", this.xQueryValues, CommandType.Text));
            foreach (DataRow row in (InternalDataCollectionBase)dtTraumadental.Rows)
            {
                this.ddlTraumadental.Items.Add(new ListItem(row["Descripcion"].ToString(), row["codigo"].ToString()));

            }

            /*Evaluación Clinica*/
            this.ddlevaluacionclinica.Items.Clear();
            this.ddlevaluacionclinica.Items.Add(new ListItem("-- SELECCIONE --", "0"));
            DataTable dtevaluacionclinica = DB.ExecuteAdapter(string.Format("SELECT  Codigo, Descripcion FROM ODP_EvaluacionClinica Order by Descripcion", this.xQueryValues, CommandType.Text));
            foreach (DataRow row in (InternalDataCollectionBase)dtevaluacionclinica.Rows)
            {
                this.ddlevaluacionclinica.Items.Add(new ListItem(row["Descripcion"].ToString(), row["codigo"].ToString()));

            }

            /*Trauma Tejidos Blandos*/
            this.ddlTraumaTejidosBlandos.Items.Clear();
            this.ddlTraumaTejidosBlandos.Items.Add(new ListItem("-- SELECCIONE --", "0"));
            DataTable dtTraumaTejidosBlandos = DB.ExecuteAdapter(string.Format("SELECT  Codigo, Descripcion FROM ODP_TipoTraumaTejidosBlandos Order by Descripcion", this.xQueryValues, CommandType.Text));
            foreach (DataRow row in (InternalDataCollectionBase)dtevaluacionclinica.Rows)
            {
                this.ddlTraumaTejidosBlandos.Items.Add(new ListItem(row["Descripcion"].ToString(), row["codigo"].ToString()));

            }

            /*Habitos Bucales*/
            this.ckHabitosbucales.Items.Clear();
            DataTable dtHabitosbucales = DB.ExecuteAdapter(string.Format("SELECT  Codigo, Descripcion FROM ODP_TipoHabitosBucales Order by Descripcion", this.xQueryValues, CommandType.Text));
            foreach (DataRow row in (InternalDataCollectionBase)dtHabitosbucales.Rows)
            {
                this.ckHabitosbucales.Items.Add(new ListItem(row["Descripcion"].ToString(), row["codigo"].ToString()));

            }
            /*Procedimientos a Realizar*/
            this.ddlprocedimientosaRealizar.Items.Clear();
            this.ddlprocedimientosaRealizar.Items.Add(new ListItem("-- SELECCIONE --", string.Empty));
            this.ddlProcedimientoProximaCita.Items.Clear();
            this.ddlProcedimientoProximaCita.Items.Add(new ListItem("-- SELECCIONE --", string.Empty));
            
            DataTable dtProcedimientosarealizar = DB.ExecuteAdapter(string.Format("SELECT  Codigo, Descripcion FROM ODP_TipoDiagnosticos Order by Descripcion", this.xQueryValues, CommandType.Text));
            foreach (DataRow row in (InternalDataCollectionBase)dtProcedimientosarealizar.Rows)
            {
                this.ddlprocedimientosaRealizar.Items.Add(new ListItem(row["Descripcion"].ToString(), row["codigo"].ToString()));
                this.ddlProcedimientoProximaCita.Items.Add(new ListItem(row["Descripcion"].ToString(), row["codigo"].ToString()));

            }

            /*Terapia MioFuncionales*/
            this.ddlTerapiaMioFuncionales.Items.Clear();
            this.ddlTerapiaMioFuncionales.Items.Add(new ListItem("-- SELECCIONE --", "0"));
            DataTable dtTerapiaMioFuncionales = DB.ExecuteAdapter(string.Format("SELECT  Codigo, Descripcion FROM ODP_TipoTerapiaMioFuncional ", this.xQueryValues, CommandType.Text));
            foreach (DataRow row in (InternalDataCollectionBase)dtTerapiaMioFuncionales.Rows)
            {
                this.ddlTerapiaMioFuncionales.Items.Add(new ListItem(row["Descripcion"].ToString(), row["codigo"].ToString()));

            }

            /*Objetivos para lograr en terapia Miofuncional Myobrace*/
            this.ckObjectivosMiofuncionalMyobrace.Items.Clear();
            //this.ckObjectivosMiofuncionalMyobrace.Items.Add(new ListItem("-- SELECCIONE --", string.Empty));
            DataTable dtObjectivosMiofuncionalMyobrace = DB.ExecuteAdapter(string.Format("SELECT  Codigo, Descripcion FROM ODP_TipoObjetivoMiofuncionalMyobrace ", this.xQueryValues, CommandType.Text));
            foreach (DataRow row in (InternalDataCollectionBase)dtObjectivosMiofuncionalMyobrace.Rows)
            {
                this.ckObjectivosMiofuncionalMyobrace.Items.Add(new ListItem(row["Descripcion"].ToString(), row["codigo"].ToString()));

            }

            /*Prescripciones*/
            this.ddlPrescripciones.Items.Clear();
            //this.ckObjectivosMiofuncionalMyobrace.Items.Add(new ListItem("-- SELECCIONE --", string.Empty));
            DataTable dtlPrescripciones = DB.ExecuteAdapter(string.Format("SELECT  Codigo, Descripcion FROM ODP_Prescripciones ", this.xQueryValues, CommandType.Text));
            foreach (DataRow row in (InternalDataCollectionBase)dtlPrescripciones.Rows)
            {
                this.ddlPrescripciones.Items.Add(new ListItem(row["Descripcion"].ToString(), row["codigo"].ToString()));

            }

            /*Ortodoncia Dientes Primarios*/
            this.CKOrtodonciadientesprimarios.Items.Clear();
            //this.ckObjectivosMiofuncionalMyobrace.Items.Add(new ListItem("-- SELECCIONE --", string.Empty));
            DataTable dtOrtodonciadientesprimarios = DB.ExecuteAdapter(string.Format("SELECT  Codigo, Descripcion FROM ODP_TipoOrtoDientesPrimarios ", this.xQueryValues, CommandType.Text));
            foreach (DataRow row in (InternalDataCollectionBase)dtOrtodonciadientesprimarios.Rows)
            {
                this.CKOrtodonciadientesprimarios.Items.Add(new ListItem(row["Descripcion"].ToString(), row["codigo"].ToString()));

            }

            /*Ortodoncia Dientesdenticion Mixta Permanente*/
            this.ckOrtodonciadientesdenticionmixtapermanente.Items.Clear();
            //this.ckObjectivosMiofuncionalMyobrace.Items.Add(new ListItem("-- SELECCIONE --", string.Empty));
            DataTable dtOrtodonciadientesdenticionmixtapermanente = DB.ExecuteAdapter(string.Format("SELECT  Codigo, Descripcion FROM ODP_TipoOrtoDientesDenticionMixta ", this.xQueryValues, CommandType.Text));
            foreach (DataRow row in (InternalDataCollectionBase)dtOrtodonciadientesdenticionmixtapermanente.Rows)
            {
                this.ckOrtodonciadientesdenticionmixtapermanente.Items.Add(new ListItem(row["Descripcion"].ToString(), row["codigo"].ToString()));

            }

            /*Interpretacion Radiografica*/
            this.ddlInterpretacionRadiografica.Items.Clear();
            this.ddlInterpretacionRadiografica.Items.Add(new ListItem("-- SELECCIONE --", string.Empty));
            DataTable dtInterpretacionRadiografica = DB.ExecuteAdapter(string.Format("SELECT  Codigo, Descripcion FROM ODP_TipoInterpretacionRadiografica ", this.xQueryValues, CommandType.Text));
            foreach (DataRow row in (InternalDataCollectionBase)dtInterpretacionRadiografica.Rows)
            {
                this.ddlInterpretacionRadiografica.Items.Add(new ListItem(row["Descripcion"].ToString(), row["codigo"].ToString()));

            }
        }
        protected void CargarDetallesTodos()
        {
            _CargarDetallesHermanos();
            _CargarMedicinaQueToma();
            _CargarProcedimientosarealizar();
            _CargarPlanTratamiento();
            _CargarTratamientoRealizado();
            _CargarProcedimientosProximaCita();
            _CargarInterpretacionRadiografica();
        }
    }
}