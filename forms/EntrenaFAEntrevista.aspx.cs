using System;
using System.Collections;
using System.Data;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using CAID.Data;


namespace CAID_V2.forms
{
    public partial class EntrenaFAEntrevista : System.Web.UI.Page
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
         
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                _Buscar(sender, e);
                //_Nuevo(sender, e);
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
                txtSexo.Value = "";
                if (dataRowPaciente["sexoid"].ToString() == "M")
                {
                    txtSexo.Value = "MASCULINO";
                }

                if (dataRowPaciente["sexoid"].ToString() == "F")
                {
                    txtSexo.Value = "FEMENINO";
                }
                txtcuidadoprincipal.Value = dataRowPaciente["CUIDADOPOR1"].ToString();
                txtConQuienReside.Value = dataRowPaciente["RESIDECON1"].ToString();

                /*INSERTO EN LA TABLA EntrenaFA_Maestro y MUESTRO LA INFORMACION PARA SER MODIFICADA*/
                this.dtConsultaDatos = DB.ExecuteAdapter(string.Format("PR_EntrenaFA_MaestroNUEVO  @IdPaciente = '{0}',  @USUARIO = '{1}', @CENTRO = '{2}'", (object)PACIENTE, (object)USUARIO, (object)CENTRO));
                this.Secuencia = dtConsultaDatos.Rows[0]["Secuencia"].ToString();
                //this.txtnoevaluacion.Value = Secuencia;
                this.txtfechaevaluacion.Value = dtConsultaDatos.Rows[0]["ROWCDTE"].ToString();
                txtNivelEconomico.Value = dtConsultaDatos.Rows[0]["CATEGORIA"].ToString();
                ddlEscolarizado.SelectedValue = dtConsultaDatos.Rows[0]["Escolarizado"].ToString();
                ddlTipoEscuela.SelectedValue = dtConsultaDatos.Rows[0]["TipoEscuela"].ToString();

                txtCualHabilidadespudieradestacar.Value = dtConsultaDatos.Rows[0]["P1HabilidadesaDestacar"].ToString();
                txtCualesmayoresdificultadespresenta.Value = dtConsultaDatos.Rows[0]["P2MayoresDificultades"].ToString();
                txtQuecosasvidacotidiana.Value = dtConsultaDatos.Rows[0]["P3CosasCotidianaloAlteran"].ToString();
                txtQueinstruccionessigue.Value = dtConsultaDatos.Rows[0]["P4InstruccionesSigue"].ToString();
                txtCualeselmomentomasdificil.Value = dtConsultaDatos.Rows[0]["P5MomentomasDificildelDia"].ToString();
                txtQuecosaspuedehacerindependiente.Value = dtConsultaDatos.Rows[0]["P6CosasHaceIndependiente"].ToString();
                txtAyudatareasdomesticas.Value = dtConsultaDatos.Rows[0]["P7AyudaTareasDomesticas"].ToString();
                txtpuedecomersolo.Value = dtConsultaDatos.Rows[0]["P8PuedeComerSolo"].ToString();
                txtPuedetomarsolo.Value = dtConsultaDatos.Rows[0]["P9PuedeTomarSoloVasoSinTapa"].ToString();
                txtpuedevestirsesolo.Value = dtConsultaDatos.Rows[0]["P10PuedeVestirseyDesvestirseSolo"].ToString();
                txtvaalbanosolo.Value = dtConsultaDatos.Rows[0]["P11VaAlBanoSolo"].ToString();
                txtCualesmayorespreocupaciones.Value = dtConsultaDatos.Rows[0]["P12CualesMayoresPreocupaciones"].ToString();
                txtComosecomunica.Value = dtConsultaDatos.Rows[0]["P13ComoseComunica"].ToString();
                txtQueactividadesrealiza.Value = dtConsultaDatos.Rows[0]["P14QueActividadesRealizaConFamilia"].ToString();
                txtQuehaceparaestimularlo.Value = dtConsultaDatos.Rows[0]["P15QueHaceparaEstimularlo"].ToString();
                ddlEscala.SelectedValue = dtConsultaDatos.Rows[0]["P16QueTantoConoceCondicion"].ToString();
                txtconquienescompartido.Value = dtConsultaDatos.Rows[0]["P17ConQuienCompartidoDx"].ToString();
                txtconquiensientecuenta.Value = dtConsultaDatos.Rows[0]["P18ConQuienSienteCuentaAyudarlo"].ToString();
                txttieneotrocondiscapacidad.Value = dtConsultaDatos.Rows[0]["P19TieneOtroConDiscapacidad"].ToString();
                txtcualesonfortalezas.Value = dtConsultaDatos.Rows[0]["P20FortalezasyRetosComoPadre"].ToString();
                txtsituvieraoportunidad.Value = dtConsultaDatos.Rows[0]["P21DeseosDiscapacidad"].ToString();
                txtAsistentesaentrevista.Value = dtConsultaDatos.Rows[0]["P22AsistentesaEntrevista"].ToString();
                txtObservacionesEntrevista.Value = dtConsultaDatos.Rows[0]["P23Observaciones"].ToString();
                Session.Add("StrSecuencia", Secuencia.ToString());

            }
        }

        protected void _Save(object sender, EventArgs e)
        {
            string PACIENTE = Request.QueryString["CurrentPAX_ROWGUID"].ToString();
            string CENTRO = Request.QueryString["XCURRENTUSR_SGXID"].ToString();
            string USUARIO = Request.QueryString["CurrentUSR_ROWGUID"].ToString();
           // Secuencia = Session["StrSecuencia"].ToString();

            // Guardo el maestro de la entrevista 
            this.xQueryParameters.Add("@IdPaciente");
            this.xQueryParameters.Add("@Escolarizado");
            this.xQueryParameters.Add("@TipoEscuela");
            this.xQueryParameters.Add("@P1HabilidadesaDestacar");
            this.xQueryParameters.Add("@P2MayoresDificultades");
            this.xQueryParameters.Add("@P3CosasCotidianaloAlteran");
            this.xQueryParameters.Add("@P4InstruccionesSigue");
            this.xQueryParameters.Add("@P5MomentomasDificildelDia");
            this.xQueryParameters.Add("@P6CosasHaceIndependiente");
            this.xQueryParameters.Add("@P7AyudaTareasDomesticas");
            this.xQueryParameters.Add("@P8PuedeComerSolo");
            this.xQueryParameters.Add("@P9PuedeTomarSoloVasoSinTapa");
            this.xQueryParameters.Add("@P10PuedeVestirseyDesvestirseSolo");
            this.xQueryParameters.Add("@P11VaAlBanoSolo");
            this.xQueryParameters.Add("@P12CualesMayoresPreocupaciones");
            this.xQueryParameters.Add("@P13ComoseComunica");
            this.xQueryParameters.Add("@P14QueActividadesRealizaConFamilia");
            this.xQueryParameters.Add("@P15QueHaceparaEstimularlo");
            this.xQueryParameters.Add("@P16QueTantoConoceCondicion");
            this.xQueryParameters.Add("@P17ConQuienCompartidoDx");
            this.xQueryParameters.Add("@P18ConQuienSienteCuentaAyudarlo");
            this.xQueryParameters.Add("@P19TieneOtroConDiscapacidad");
            this.xQueryParameters.Add("@P20FortalezasyRetosComoPadre");
            this.xQueryParameters.Add("@P21DeseosDiscapacidad");
            this.xQueryParameters.Add("@P22AsistentesaEntrevista");
            this.xQueryParameters.Add("@P23Observaciones");
            this.xQueryParameters.Add("@Usuario");
            this.xQueryParameters.Add("@CENTRO");

            this.xQueryValues.Clear();
            this.xQueryValues.Add(PACIENTE);
            this.xQueryValues.Add(ddlEscolarizado.SelectedValue);
            this.xQueryValues.Add(ddlTipoEscuela.SelectedValue);
            this.xQueryValues.Add(txtCualHabilidadespudieradestacar.Value);
            this.xQueryValues.Add(txtCualesmayoresdificultadespresenta.Value);
            this.xQueryValues.Add(txtQuecosasvidacotidiana.Value);
            this.xQueryValues.Add(txtQueinstruccionessigue.Value);
            this.xQueryValues.Add(txtCualeselmomentomasdificil.Value);
            this.xQueryValues.Add(txtQuecosaspuedehacerindependiente.Value);
            this.xQueryValues.Add(txtAyudatareasdomesticas.Value);
            this.xQueryValues.Add(txtpuedecomersolo.Value);
            this.xQueryValues.Add(txtPuedetomarsolo.Value);
            this.xQueryValues.Add(txtpuedevestirsesolo.Value);
            this.xQueryValues.Add(txtvaalbanosolo.Value);
            this.xQueryValues.Add(txtCualesmayorespreocupaciones.Value);
            this.xQueryValues.Add(txtComosecomunica.Value);
            this.xQueryValues.Add(txtQueactividadesrealiza.Value);
            this.xQueryValues.Add(txtQuehaceparaestimularlo.Value);
            this.xQueryValues.Add(ddlEscala.SelectedValue);
            this.xQueryValues.Add(txtconquienescompartido.Value);
            this.xQueryValues.Add(txtconquiensientecuenta.Value);
            this.xQueryValues.Add(txttieneotrocondiscapacidad.Value);
            this.xQueryValues.Add(txtcualesonfortalezas.Value);
            this.xQueryValues.Add(txtsituvieraoportunidad.Value);
            this.xQueryValues.Add(txtAsistentesaentrevista.Value);
            this.xQueryValues.Add(txtObservacionesEntrevista.Value);
            this.xQueryValues.Add(USUARIO);
            this.xQueryValues.Add(CENTRO);
            DataTable dataTable2 = DB.ExecuteAdapter("PR_EntrenaFA_MaestroGUARDAR", this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure); if (dataTable2.Rows.Count != 0)
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

        protected void _Back(object sender, EventArgs e)
        {
            pnlConsulta.Visible = true;
            pnlData.Visible = false;
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

                /* CONSULTO EL NUCLEO FAMILIAR */
                this.xQueryParameters.Clear();
                this.xQueryParameters.Add("@PACIENTE");
                this.xQueryParameters.Add("@CENTRO");
                this.xQueryValues.Clear();
                this.xQueryValues.Add(PACIENTE.ToString());
                this.xQueryValues.Add(CENTRO.ToString());
                DataTable dtNucleoFamiliar = DB.ExecuteAdapter("PR_PACIENTE_NUCLEOFAMILIAR", this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure); if (dtNucleoFamiliar.Rows.Count != 0)
                rpNucleoFamiliar.DataSource = dtNucleoFamiliar;
                rpNucleoFamiliar.DataBind();

                this.xQueryParameters.Clear();
                this.xQueryParameters.Add("@PACIENTE");
                this.xQueryParameters.Add("@CENTRO");

                this.xQueryValues.Clear();
                this.xQueryValues.Add(PACIENTE.ToString());
                this.xQueryValues.Add(CENTRO.ToString());
                /* CONSULTO TABLA MAESTRO */
                DataTable dtConsultaDatos = DB.ExecuteAdapter("PR_EntrenaFA_MaestroBUSCA", this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure);
                if (dtConsultaDatos.Rows.Count > 0)
                {
                    Secuencia = dtConsultaDatos.Rows[0]["Secuencia"].ToString();
                    txtNombreEvaluador.Value = dtConsultaDatos.Rows[0]["NOMBRE_ESPECIALISTA"].ToString();
                    txtNombrePaciente.Value = dtConsultaDatos.Rows[0]["NOMBREPX"].ToString();
                    txtEdadCronologica.Value = dtConsultaDatos.Rows[0]["EDAD"].ToString();
                    txtExpedienteNo.Value = dtConsultaDatos.Rows[0]["RECORDID"].ToString();
                    txtFechanacimiento.Value = dtConsultaDatos.Rows[0]["FNACE"].ToString();
                    txtSexo.Value = dtConsultaDatos.Rows[0]["SEXO"].ToString();
                    txtcuidadoprincipal.Value = dtConsultaDatos.Rows[0]["CUIDADOPOR1"].ToString();
                    txtConQuienReside.Value = dtConsultaDatos.Rows[0]["RESIDECON1"].ToString();
                    txtfechaevaluacion.Value = dtConsultaDatos.Rows[0]["ROWCDTE"].ToString();
                    txtNivelEconomico.Value = dtConsultaDatos.Rows[0]["CATEGORIA"].ToString();
                    ddlEscolarizado.SelectedValue = dtConsultaDatos.Rows[0]["Escolarizado"].ToString();
                    ddlTipoEscuela.SelectedValue = dtConsultaDatos.Rows[0]["TipoEscuela"].ToString();
                    txtCualHabilidadespudieradestacar.Value = dtConsultaDatos.Rows[0]["P1HabilidadesaDestacar"].ToString();
                    txtCualesmayoresdificultadespresenta.Value = dtConsultaDatos.Rows[0]["P2MayoresDificultades"].ToString();
                    txtQuecosasvidacotidiana.Value = dtConsultaDatos.Rows[0]["P3CosasCotidianaloAlteran"].ToString();
                    txtQueinstruccionessigue.Value = dtConsultaDatos.Rows[0]["P4InstruccionesSigue"].ToString();
                    txtCualeselmomentomasdificil.Value = dtConsultaDatos.Rows[0]["P5MomentomasDificildelDia"].ToString();
                    txtQuecosaspuedehacerindependiente.Value = dtConsultaDatos.Rows[0]["P6CosasHaceIndependiente"].ToString();
                    txtAyudatareasdomesticas.Value = dtConsultaDatos.Rows[0]["P7AyudaTareasDomesticas"].ToString();
                    txtpuedecomersolo.Value = dtConsultaDatos.Rows[0]["P8PuedeComerSolo"].ToString();
                    txtPuedetomarsolo.Value = dtConsultaDatos.Rows[0]["P9PuedeTomarSoloVasoSinTapa"].ToString();
                    txtpuedevestirsesolo.Value = dtConsultaDatos.Rows[0]["P10PuedeVestirseyDesvestirseSolo"].ToString();
                    txtvaalbanosolo.Value = dtConsultaDatos.Rows[0]["P11VaAlBanoSolo"].ToString();
                    txtCualesmayorespreocupaciones.Value = dtConsultaDatos.Rows[0]["P12CualesMayoresPreocupaciones"].ToString();
                    txtComosecomunica.Value = dtConsultaDatos.Rows[0]["P13ComoseComunica"].ToString();
                    txtQueactividadesrealiza.Value = dtConsultaDatos.Rows[0]["P14QueActividadesRealizaConFamilia"].ToString();
                    txtQuehaceparaestimularlo.Value = dtConsultaDatos.Rows[0]["P15QueHaceparaEstimularlo"].ToString();
                    ddlEscala.SelectedValue = dtConsultaDatos.Rows[0]["P16QueTantoConoceCondicion"].ToString();
                    txtconquienescompartido.Value = dtConsultaDatos.Rows[0]["P17ConQuienCompartidoDx"].ToString();
                    txtconquiensientecuenta.Value = dtConsultaDatos.Rows[0]["P18ConQuienSienteCuentaAyudarlo"].ToString();
                    txttieneotrocondiscapacidad.Value = dtConsultaDatos.Rows[0]["P19TieneOtroConDiscapacidad"].ToString();
                    txtcualesonfortalezas.Value = dtConsultaDatos.Rows[0]["P20FortalezasyRetosComoPadre"].ToString();
                    txtsituvieraoportunidad.Value = dtConsultaDatos.Rows[0]["P21DeseosDiscapacidad"].ToString();
                    txtAsistentesaentrevista.Value = dtConsultaDatos.Rows[0]["P22AsistentesaEntrevista"].ToString();
                    txtObservacionesEntrevista.Value = dtConsultaDatos.Rows[0]["P23Observaciones"].ToString();
                    txtdireccionactual.Value = dtConsultaDatos.Rows[0]["CIUDAD"].ToString();
                    Session.Add("StrSecuencia", Secuencia.ToString());
                }
                else
                {
                    /* CONSULTO EL PACIENTE */
                    string ESPECIALISTAID = Request.QueryString["CurrentUSR_TERID"].ToString();
                    string USUARIO = Request.QueryString["CurrentUSR_ROWGUID"].ToString();
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
                    txtdireccionactual.Value = dataRowPaciente["CIUDAD"].ToString();
                    txtSexo.Value = "";
                    if (dataRowPaciente["sexoid"].ToString() == "M")
                    {
                        txtSexo.Value = "MASCULINO";
                    }

                    if (dataRowPaciente["sexoid"].ToString() == "F")
                    {
                        txtSexo.Value = "FEMENINO";
                    }
                    txtcuidadoprincipal.Value = dataRowPaciente["CUIDADOPOR1"].ToString();
                    txtConQuienReside.Value = dataRowPaciente["RESIDECON1"].ToString();


                }
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
            this.xQuery = "PR_EntrenaFA_MaestroBUSCA";
            DataTable dtEvaluacionCompleta = DB.ExecuteAdapter(this.xQuery, this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure);
            if (dtEvaluacionCompleta.Rows.Count > 0)
            {
                txtNombrePaciente.Value = dtEvaluacionCompleta.Rows[0]["NOMBREPX"].ToString();
                txtFechanacimiento.Value = dtEvaluacionCompleta.Rows[0]["FNACE"].ToString();
                txtEdadCronologica.Value = dtEvaluacionCompleta.Rows[0]["EDAD"].ToString();
                //txtCondicionEvaluacion.Value = dtEvaluacionCompleta.Rows[0]["CONDICIONESEVALUACION"].ToString();
                // this.txtnoevaluacion.Value = dtEvaluacionCompleta.Rows[0]["SECUENCIA"].ToString();
                this.txtfechaevaluacion.Value = dtEvaluacionCompleta.Rows[0]["ROWCDTE"].ToString();

                txtExpedienteNo.Value = dtEvaluacionCompleta.Rows[0]["RECORDID"].ToString();
                txtNombreEvaluador.Value = dtEvaluacionCompleta.Rows[0]["NOMBRE_ESPECIALISTA"].ToString();

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
                }

                if (this.xCommand == "VerResumenes")
                {
                    pnlConsulta.Visible = false;
                    pnlData.Visible = true;
                }

            }

        }
    }

}
