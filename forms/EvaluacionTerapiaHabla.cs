using CAID.Data;
using System;
using System.Collections;
using System.Data;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;


namespace CAID_V2.forms
{
    public partial class EvaluacionTerapiaHabla : System.Web.UI.Page
    {
        private ArrayList xQueryParameters = new ArrayList();
        private ArrayList xQueryValues = new ArrayList();
        private string xCommand;
        private string xQuery;
        /*
        protected Repeater rpPaxHeader; 
        protected HtmlGenericControl H1;
        protected HtmlSelect cmbTipo;
        protected RequiredFieldValidator cmbTipo1;
        protected CheckBoxList ckExpresiones;
        protected HtmlInputText txtVocales;
        protected HtmlInputText txtCVocales;
        protected HtmlInputText txtSilabas;
        protected HtmlInputText txtCSilabas;
        protected HtmlInputText txtPalabras;
        protected HtmlInputText txtCPalabras;
        protected HtmlInputText txtFrases;
        protected HtmlInputText txtCFrases;
        protected HtmlInputText txtOraciones;
        protected HtmlInputText txtCOraciones;
        protected TextBox txtVoz;
        protected HtmlSelect cmbSeReconoce;
        //protected HtmlSelect cmbSigueInstrucciones;
        protected DropDownList cmbSigueInstrucciones;
        protected HtmlSelect cmbFuncionesAuditivas;
        protected HtmlSelect cmbRespiracion;
        protected TextBox txtEVALUACION;
        protected HtmlButton btnSave;
        protected HtmlGenericControl H2;
        protected CheckBoxList ckLabios;
        protected HtmlInputText txtCLabios;
        protected CheckBoxList ckFuncionLabial;
        protected HtmlSelect cmbMandibula;
        protected HtmlInputText txtCMandibula;
        protected CheckBoxList ckDientes2;
        protected CheckBoxList ckBRUXISMO;
        protected HtmlSelect cmbDientes;
        protected HtmlInputText txtOtros;
        protected HtmlSelect cmbPaladar;
        protected HtmlInputText txtCPaladar;
        protected HtmlSelect cmbVeloPaladar;
        protected HtmlInputText txtCVeloPaladar;
        protected CheckBoxList ckLengua;
        protected HtmlInputText txtCLengua;
        protected HtmlSelect cmbUvula;
        protected HtmlInputText txtCUvula;
        protected HtmlButton Button1;
  */
        string IDPaciente;

        private string xBase
        {
            get
            {
                return this.Page.GetType().BaseType.Name.ToString();
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (this.IsPostBack)
                return;

            ((Site2)this.Master).Mostrar_Opciones_ActoMedico();

            DataTable dtpaciente = DB.ExecuteAdapter(string.Format("select convert(varchar(10),fnace,103) as FNacimiento,   Direccion from vpaciente WHERE ROWGUID ='" + Request.QueryString["CurrentPAX_ROWGUID"].ToString()+ "' AND ROWSGXID ='" + Request.QueryString["CURRENTUSR_SGXID"].ToString()+"'"));
            if (dtpaciente.Rows.Count > 0)
            {
                txtFechaNacimiento.Value = dtpaciente.Rows[0]["FNacimiento"].ToString();
                txtLugardeResidenciadelNino.Value = dtpaciente.Rows[0]["Direccion"].ToString();
            }
                //this.Session["CurrentUSR_ROWGUID"].ToString();
                this.rpPaxHeader.DataSource = (object)DB.ExecuteAdapter(string.Format("PAX00000S5 @REFGUID = '{0}', @ROWSGXID = '{1}'", Request.QueryString["CurrentPAX_ROWGUID"].ToString(), Request.QueryString["CURRENTUSR_SGXID"].ToString()));
            this.rpPaxHeader.DataBind();
            this.cmbTipo.Items.Clear();
            this.cmbTipo.Items.Add(new ListItem("-- SELECCIONE --", string.Empty));
            foreach (DataRow row in (InternalDataCollectionBase)DB.ExecuteAdapter(string.Format("SGX00100S4 @ROWSGXID = '{0}', @TERID = '{1}'", Request.QueryString["CURRENTUSR_SGXID"].ToString(), Request.QueryString["CurrentUSR_TERID"].ToString())).Rows)
                this.cmbTipo.Items.Add(new ListItem(row["ESPECIALIDADNOMBRE"].ToString(), row["ESPECIALIDADID"].ToString()));
            if (this.cmbTipo.Items.Count == 2)
                this.cmbTipo.SelectedIndex = 1;

            this.ckExpresiones.Items.Clear();
            foreach (DataRow row in (InternalDataCollectionBase)DB.ExecuteAdapter("SELECT * FROM vR_FORMASEXPRESIONES").Rows)
                this.ckExpresiones.Items.Add(new ListItem(row["NOMBRE"].ToString(), row["ROWGUID"].ToString()));
            this.ckLabios.Items.Clear();
            foreach (DataRow row in (InternalDataCollectionBase)DB.ExecuteAdapter("SELECT * FROM vAnatomiaLabial").Rows)
                this.ckLabios.Items.Add(new ListItem(row["NOMBRE"].ToString(), row["ROWGUID"].ToString()));
            this.ckFuncionLabial.Items.Clear();
            foreach (DataRow row in (InternalDataCollectionBase)DB.ExecuteAdapter("SELECT * FROM vFuncionLabial ORDER BY ORDEN").Rows)
                this.ckFuncionLabial.Items.Add(new ListItem(row["NOMBRE"].ToString(), row["ROWGUID"].ToString()));
            this.ckDientes2.Items.Clear();
            foreach (DataRow row in (InternalDataCollectionBase)DB.ExecuteAdapter("SELECT * FROM vDientes ORDER BY ORDEN").Rows)
                this.ckDientes2.Items.Add(new ListItem(row["NOMBRE"].ToString(), row["ROWGUID"].ToString()));
            this.ckLengua.Items.Clear();
            foreach (DataRow row in (InternalDataCollectionBase)DB.ExecuteAdapter("SELECT * FROM vLengua ORDER BY ORDEN").Rows)
                this.ckLengua.Items.Add(new ListItem(row["NOMBRE"].ToString(), row["ROWGUID"].ToString().Trim()));
            this.ckBRUXISMO.Items.Clear();
            foreach (DataRow row in (InternalDataCollectionBase)DB.ExecuteAdapter("SELECT * FROM vBRUXISMO  ORDER BY ORDEN").Rows)
                this.ckBRUXISMO.Items.Add(new ListItem(row["NOMBRE"].ToString(), row["ROWGUID"].ToString()));
            this.Validar();
        }

        protected void _Save(object sender, EventArgs e)
        {
            //if (!Convert.ToBoolean(this.Session["CurrentUSR_ROLEDITAR"].ToString()))
            // return;
            string str1 = "";
            for (int index = 0; index < this.ckExpresiones.Items.Count; ++index)
            {
                if (this.ckExpresiones.Items[index].Selected)
                    str1 = str1 + "," + this.ckExpresiones.Items[index].Value.Trim();
            }
            if (str1 != "")
                str1 = str1.Remove(0, 1);
            string str2 = "";
            for (int index = 0; index < this.ckLabios.Items.Count; ++index)
            {
                if (this.ckLabios.Items[index].Selected)
                    str2 = str2 + "," + this.ckLabios.Items[index].Value.Trim();
            }
            if (str2 != "")
                str2 = str2.Remove(0, 1);
            string str3 = "";
            for (int index = 0; index < this.ckFuncionLabial.Items.Count; ++index)
            {
                if (this.ckFuncionLabial.Items[index].Selected)
                    str3 = str3 + "," + this.ckFuncionLabial.Items[index].Value.Trim();
            }
            if (str3 != "")
                str3 = str3.Remove(0, 1);
            string str4 = "";
            for (int index = 0; index < this.ckDientes2.Items.Count; ++index)
            {
                if (this.ckDientes2.Items[index].Selected)
                    str4 = str4 + "," + this.ckDientes2.Items[index].Value.Trim();
            }
            if (str4 != "")
                str4 = str4.Remove(0, 1);
            string str5 = "";
            for (int index = 0; index < this.ckLengua.Items.Count; ++index)
            {
                if (this.ckLengua.Items[index].Selected)
                    str5 = str5 + "," + this.ckLengua.Items[index].Value.Trim();
            }
            if (str5 != "")
                str5 = str5.Remove(0, 1);
            Decimal num1 = new Decimal(0);
            Decimal num2;
            try
            {
                num2 = Convert.ToDecimal(this.txtVocales.Value);
            }
            catch
            {
                num2 = new Decimal(0);
            }
            Decimal num3 = new Decimal(0);
            Decimal num4;
            try
            {
                num4 = Convert.ToDecimal(this.txtSilabas.Value);
            }
            catch
            {
                num4 = new Decimal(0);
            }
            Decimal num5 = new Decimal(0);
            Decimal num6;
            try
            {
                num6 = Convert.ToDecimal(this.txtPalabras.Value);
            }
            catch
            {
                num6 = new Decimal(0);
            }
            Decimal num7 = new Decimal(0);
            Decimal num8;
            try
            {
                num8 = Convert.ToDecimal(this.txtFrases.Value);
            }
            catch
            {
                num8 = new Decimal(0);
            }
            Decimal num9 = new Decimal(0);
            Decimal num10;
            try
            {
                num10 = Convert.ToDecimal(this.txtOraciones.Value);
            }
            catch
            {
                num10 = new Decimal(0);
            }
            string str6 = "";
            string str7 = this.txtEVALUACION.Text.Trim();
            string str8 = this.txtCVocales.Value.Trim();
            string str9 = this.txtCSilabas.Value.Trim();
            string str10 = this.txtCPalabras.Value.Trim();
            string str11 = this.txtCFrases.Value.Trim();
            string str12 = this.txtCOraciones.Value.Trim();
            string str13 = this.txtVoz.Text.Trim();
            string str14 = this.cmbSeReconoce.Value.Trim();
            //string str15 = this.cmbSigueInstrucciones.Value.Trim();
            string str15 = this.cmbSigueInstrucciones.SelectedValue.Trim();
            string str16 = this.cmbFuncionesAuditivas.Value.Trim();
            string str17 = this.cmbRespiracion.Value.Trim();
            string str18 = this.cmbMandibula.Value.Trim();
            string str19 = this.cmbDientes.Value.Trim();
            string str20 = this.txtOtros.Value.Trim();
            string str21 = this.cmbPaladar.Value.Trim();
            string str22 = this.cmbVeloPaladar.Value.Trim();
            string str23 = this.cmbUvula.Value.Trim();
            string str24 = this.txtCLabios.Value.Trim();
            string str25 = this.txtCMandibula.Value.Trim();
            string str26 = this.txtCPaladar.Value.Trim();
            string str27 = this.txtCVeloPaladar.Value.Trim();
            string str28 = this.txtCLengua.Value.Trim();
            string str29 = this.txtCUvula.Value.Trim();
            string xREFGUID = Request.QueryString["CurrentPAX_ROWGUID"].ToString();
            string xTERGUID = Request.QueryString["CurrentUSR_TERID"].ToString();
            string str30 = Request.QueryString["CurrentUSR_ROWGUID"].ToString();
            string str31 = Request.QueryString["CURRENTUSR_SGXID"].ToString();


            string MOTIVOCONSULTA = txtMotivodeConsulta.Value;
            string HARECIBIDOTERAPIALENGUAJE = ddlHARECIBIDOTERAPIADELLENGUAJE.SelectedValue;
            string PORCUANTOTIEMPO = txtPORCUANTOTIEMPO.Value;
            string DATOSRELEVANTESDEHISTORIA = txtDatosRevelantedeHistoriaClinica.Value;
            string TRAUMATISMOCONPERDIDADECONOCIMIENTO = txtTraumatismoConPerdidaDeConocimiento.Value;
            string TRAUMATISMOCONPERDIDADECONOCIMIENTOCUALES = txtTraumatismoConPerdidaDeConocimientoCuales.Value;
            string DIFICULTADESRESPIRATORIAS = txtDificultadesRespiratorias.Value;
            string DIFICULTADESRESPIRATORIASCUALES = txtDificultadesRespiratoriasCuales.Value;
            string CRISISOPROCESOSFEBRILESCONCONVULSIONES = txtCrisisOProcesosFebrilesConConvulsiones.Value;
            string CRISISOPROCESOSFEBRILESCONCONVULSIONES_AQUEEDAD = txtCrisisOProcesosFebrilesConConvulsiones.Value;
            string CRISISOPROCESOSFEBRILESCONCONVULSIONES_FRECUENCIA = txtConQueFrecuencia.Value;
            string OTITIS = ddlotitis.SelectedValue;
            string OTITISLADO = ddlotitisLado.SelectedValue;
            string ALERGIAS = ddlAlergia.SelectedValue;
            string AQUEESALERGICO = txtAQueEsAlergico.Value;
            string HIPERTROFIADEADENOIDES = ddlHipertrofiaDeAdenoides.SelectedValue;
            string CIRUGIA = ddlCirugia.SelectedValue;
            string CIRUGIA_CUALES = txtCirugiaCuales.Value;
            string HOSPITALIZACIONES = ddlHospitalizaciones.SelectedValue;
            string TRATAMIENTOFARMACOLOGICO = ddlTratamientoFarmacologico.SelectedValue;
            string TRATAMIENTOFARMACOLOGICO_CUALES = txtTratamientoFarmacologicoCuales.Value;
            string COMENTARIO_ENFERMEDADESCONGENITAS = txtComentariosENFERMEDADESCONGENITAS.Text;
            string SUCCION = dllSUCCION.SelectedValue;
            string SUCCION_TIPO = ddlSUCCIONTIPO.SelectedValue;
            string LECHEMATERNA = ddlLECHEMATERNA.SelectedValue;
            string LECHEMATERNA_TIEMPO = txtLECHEMATERNATIEMPO.Value;
            string LECHEARTIFICIAL = ddlLECHEARTIFICIAL.SelectedValue;
            string LECHEARTIFICIAL_TIEMPO = txtLECHEARTIFICIALTIEMPO.Value;
            string BIBERON = ddlBIBERON.SelectedValue;
            string TIPODEALIMENTOINGIERE = ddlTipoDeAlimentoQueIngiereConMayorFrecuencia.SelectedValue;
            string SEAUTOALIMENTA = ddlSEAUTOALIMENTA.SelectedValue;
            string EXISTENESTIMULOSDISTRACTORES = ddlExistenEstímulosDistractoresDuranteLaAlimentacion.SelectedValue;
            string EXISTENESTIMULOSDISTRACTORES_CUALES = txtExistenEstímulosDistractoresDuranteLaAlimentacionCuales.Value;
            string SABORESPREFERIDOS = ddlSaboresPreferidos.SelectedValue;
            string TEMPERATURA = ddlTemperatura.SelectedValue;
            string NUMERODECOMIDASALDIA = txtNumeroDeComidasAlDia.Value;
            string DEGLUCION = ddlDeglucion.SelectedValue;
            string SOSTUVOLACABEZA = txtSostuvolaCabeza.Value;
            string SESENTO = txtSeSento.Value;
            string GATEO = txtGATEO.Value;
            string CAMINO = txtcamino.Value;
            string MIRAALOSOJOSCUANDOLEHABLAN = ddlMIRAALOSOJOSCUANDOLEHABLAN.SelectedValue;
            string ESCUCHACUANDOLEHABLAN = ddlESCUCHACUANDOLEHABLAN.SelectedValue;
            string PERMANECESENTADO = ddlPERMANECESENTADO.SelectedValue;
            string REACCIONAALCAMBIOENUNJUEGO = ddlREACCIONAALCAMBIOENUNJUEGO.SelectedValue;
            string MANTIENELAATENCIONDURANTEACTIVIDADES = ddlMANTIENELAATENCIONDURANTEACTIVIDADES.SelectedValue;
            string RECUERDADONDEESTANLOSOBJETOS = ddlRECUERDADONDEESTANLOSOBJETOS.SelectedValue;
            string RECONOCEOBJETOSOIMAGENESVISTAS = ddlRECONOCEOBJETOSOIMAGENESVISTAS.SelectedValue;
            string ASOCIAOBJETOSIMAGENES = ddlASOCIAOBJETOSIMAGENES.SelectedValue;
            string AQUEEDADINICIOLAESCUELA = txtAQUEEDADINICIOLAESCUELA.Value;
            string HATENIDOPROBLEMASDEADAPTACION = ddlHATENIDOPROBLEMASDEADAPTACION.SelectedValue;
            string EMPAREJAIMAGENESIGUALES = ddlEMPAREJAIMAGENESIGUALES.SelectedValue;
            string REALIZACONTACTOVISUAL = ddlREALIZACONTACTOVISUAL.SelectedValue;
            string COMOTELLAMAS = txtCOMOTELLAMAS.Value;
            string CUANTOSANOSTIENES = txtCUANTOSANIOSTIENES.Value;
            string CONQUIENHASVENIDO = txtCONQUIENHASVENIDO.Value;
            string CUALESELNOMBREDETUPAPA = txtCUALESELNOMBREDETUPAPA.Value;
            string CUALESELNOMBREDETUMAMA = txtCUALESELNOMBREDETUMAMA.Value;
            string TIENESHERMANOS = txtTIENESHERMANOS.Value;
            string COMOSELLAMAN = txtCOMOSELLAMAN.Value;
            string CUALESELNOMBREDETUCOLEGIO = txtCUALESELNOMBREDETUCOLEGIO.Value;
            string QUETEGUSTACOMER = txtQUETEGUSTACOMER.Value;
            string QUETEGUSTAJUGAR = txtQUETEGUSTAJUGAR.Value;
            string OBJETIVOSATRABAJAR = txtOBJETIVOSATRABAJAR.Text;
            string OBSERVACIONES = txtOBSERVACIONES.Text;

            string strbruxismo = "";
            for (int index = 0; index < this.ckBRUXISMO.Items.Count; ++index)
            {
                if (this.ckBRUXISMO.Items[index].Selected)
                    strbruxismo = strbruxismo + "," + this.ckBRUXISMO.Items[index].Value.Trim();
            }
            if (strbruxismo != "")
                strbruxismo = strbruxismo.Remove(0, 1); 
            Session.Add("CURRENTUSR_ID", Request.QueryString["CurrentUSR_ROWGUID"].ToString());
            Session.Add("CURRENTUSR_SGXID", Request.QueryString["CURRENTUSR_SGXID"].ToString());

            string xESPGUID = this.cmbTipo.Value.ToString();
            if (!((Site2)this.Master).Crear_ActoMédico(xREFGUID, xTERGUID, xESPGUID))
                return;
            if (DB.ExecuteNonQuery(string.Format("[HCL00021SI] '{0}','{1}', '{2}', '{3}', '{4}', '{5}', '{6}', '{7}', '{8}', '{9}', '{10}', '{11}', '{12}', '{13}','{14}','{15}','{16}','{17}','{18}','{19}','{20}','{21}','{22}' ,'{23}','{24}','{25}','{26}','{27}','{28}','{29}','{30}','{31}','{32}','{33}','{34}','{35}','{36}','{37}','{38}','{39}','{40}','{41}','{42}','{43}','{44}','{45}','{46}','{47}','{48}','{49}','{50}','{51}','{52}','{53}','{54}','{55}','{56}','{57}','{58}','{59}','{60}','{61}','{62}','{63}','{64}','{65}','{66}','{67}','{68}','{69}','{70}','{71}','{72}','{73}','{74}','{75}','{76}','{77}','{78}','{79}','{80}','{81}','{82}','{83}','{84}','{85}','{86}','{87}','{88}','{89}','{90}','{91}','{92}','{93}','{94}','{95}','{96}','{97}','{98}','{99}','{100}','{101}','{102}','{103}'", (object)str6, (object)str1, (object)num2, (object)str8, (object)num4, (object)str9, (object)num6, (object)str10, (object)num8, (object)str11, (object)num10, (object)str12, (object)str13, (object)str14, (object)str15, (object)str16, (object)str17, (object)str2, (object)str18, (object)str19, (object)str20, (object)str21, (object)str22, (object)str5, (object)str23, (object)str24, (object)str25, (object)str26, (object)str27, (object)str28, (object)str29, (object)str7, (object)xREFGUID, (object)xTERGUID, (object)str30, (object)str31, (object)str3, (object)str4, MOTIVOCONSULTA, HARECIBIDOTERAPIALENGUAJE, PORCUANTOTIEMPO, DATOSRELEVANTESDEHISTORIA, TRAUMATISMOCONPERDIDADECONOCIMIENTO, TRAUMATISMOCONPERDIDADECONOCIMIENTOCUALES, DIFICULTADESRESPIRATORIAS, DIFICULTADESRESPIRATORIASCUALES, CRISISOPROCESOSFEBRILESCONCONVULSIONES, CRISISOPROCESOSFEBRILESCONCONVULSIONES_AQUEEDAD, CRISISOPROCESOSFEBRILESCONCONVULSIONES_FRECUENCIA, OTITIS, OTITISLADO, ALERGIAS, AQUEESALERGICO, HIPERTROFIADEADENOIDES, CIRUGIA, CIRUGIA_CUALES, HOSPITALIZACIONES, TRATAMIENTOFARMACOLOGICO, TRATAMIENTOFARMACOLOGICO_CUALES, COMENTARIO_ENFERMEDADESCONGENITAS, SUCCION, SUCCION_TIPO, LECHEMATERNA, LECHEMATERNA_TIEMPO, LECHEARTIFICIAL, LECHEARTIFICIAL_TIEMPO, BIBERON, TIPODEALIMENTOINGIERE, SEAUTOALIMENTA, EXISTENESTIMULOSDISTRACTORES, EXISTENESTIMULOSDISTRACTORES_CUALES, SABORESPREFERIDOS, TEMPERATURA, NUMERODECOMIDASALDIA, DEGLUCION, SOSTUVOLACABEZA, SESENTO, GATEO, CAMINO, MIRAALOSOJOSCUANDOLEHABLAN, ESCUCHACUANDOLEHABLAN, PERMANECESENTADO, REACCIONAALCAMBIOENUNJUEGO, MANTIENELAATENCIONDURANTEACTIVIDADES, RECUERDADONDEESTANLOSOBJETOS, RECONOCEOBJETOSOIMAGENESVISTAS, ASOCIAOBJETOSIMAGENES, AQUEEDADINICIOLAESCUELA, HATENIDOPROBLEMASDEADAPTACION, EMPAREJAIMAGENESIGUALES, REALIZACONTACTOVISUAL, COMOTELLAMAS, CUANTOSANOSTIENES, CONQUIENHASVENIDO, CUALESELNOMBREDETUPAPA, CUALESELNOMBREDETUMAMA, TIENESHERMANOS, COMOSELLAMAN, CUALESELNOMBREDETUCOLEGIO, QUETEGUSTACOMER, QUETEGUSTAJUGAR, OBJETIVOSATRABAJAR, OBSERVACIONES,strbruxismo)))
            {
                Notify("Registro Guardado", "success");
                this.Validar();
            }
        }

        public void Notify(string msg, string tipo)
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "notify('" + msg + "','" + tipo + "');", true);
        }


        protected void _Select(object sender, EventArgs e)
        {
        }

        private void Validar()
        {
            DataTable dataTable1 = DB.ExecuteAdapter(string.Format("HCL00021H @ROWSGXID = '{0}' , @REFGUID = '{1}'", Request.QueryString["CURRENTUSR_SGXID"].ToString(), Request.QueryString["CurrentPAX_ROWGUID"].ToString()));
            if (dataTable1.Rows.Count == 0)
                return;
            char[] chArray = new char[5]
            {
        ' ',
        ',',
        '.',
        ':',
        '\t'
            };
            string[] strArray1 = dataTable1.Rows[0]["COMOSEEXPRESA"].ToString().Split(chArray);
            string[] strArray2 = dataTable1.Rows[0]["LABIOS"].ToString().Split(chArray);
            string[] strArray3 = dataTable1.Rows[0]["FUNCIONLABIAL"].ToString().Split(chArray);
            string[] strArray4 = dataTable1.Rows[0]["DIENTES2"].ToString().Split(chArray);
            string[] strArray5 = dataTable1.Rows[0]["LENGUA"].ToString().Split(chArray);
            if (strArray1[0] != "")
            {
                foreach (string str in strArray1)
                    this.ckExpresiones.Items.FindByValue(str).Selected = true;
            }
            if (strArray2[0] != "")
            {
                foreach (string str in strArray2)
                    this.ckLabios.Items.FindByValue(str).Selected = true;
            }
            if (strArray3[0] != "")
            {
                foreach (string str in strArray3)
                    this.ckFuncionLabial.Items.FindByValue(str).Selected = true;
            }
            if (strArray4[0] != "")
            {
                foreach (string str in strArray4)
                    this.ckDientes2.Items.FindByValue(str).Selected = true;
            }
            if (strArray5[0] != "")
            {
                foreach (string str in strArray5)
                    this.ckLengua.Items.FindByValue(str).Selected = true;
            }
            this.txtVocales.Value = dataTable1.Rows[0]["VOCALES"].ToString();
            this.txtSilabas.Value = dataTable1.Rows[0]["SILABAS"].ToString();
            this.txtPalabras.Value = dataTable1.Rows[0]["PALABRAS"].ToString();
            this.txtFrases.Value = dataTable1.Rows[0]["FRASES"].ToString();
            this.txtOraciones.Value = dataTable1.Rows[0]["ORACIONES"].ToString();
            this.txtCVocales.Value = dataTable1.Rows[0]["CVOCALES"].ToString();
            this.txtCSilabas.Value = dataTable1.Rows[0]["CSILABAS"].ToString();
            this.txtCPalabras.Value = dataTable1.Rows[0]["CPALABRAS"].ToString();
            this.txtCFrases.Value = dataTable1.Rows[0]["CFRASES"].ToString();
            this.txtCOraciones.Value = dataTable1.Rows[0]["CORACIONES"].ToString();
            this.txtVoz.Text = dataTable1.Rows[0]["VOZ"].ToString();
            this.cmbSeReconoce.Value = dataTable1.Rows[0]["SERECONOCE"].ToString();
            //this.cmbSigueInstrucciones.Value = dataTable1.Rows[0]["SIGUEINSTRUCCIONES"].ToString();
            this.cmbSigueInstrucciones.SelectedValue = dataTable1.Rows[0]["SIGUEINSTRUCCIONES"].ToString();
            this.cmbFuncionesAuditivas.Value = dataTable1.Rows[0]["FUNCIONESAUDITIVAS"].ToString();
            this.cmbRespiracion.Value = dataTable1.Rows[0]["RESPIRACION"].ToString();
            this.cmbMandibula.Value = dataTable1.Rows[0]["MANDIBULA"].ToString();
            this.cmbDientes.Value = dataTable1.Rows[0]["DIENTES"].ToString();
            this.txtOtros.Value = dataTable1.Rows[0]["OTROS"].ToString();
            this.cmbPaladar.Value = dataTable1.Rows[0]["PALADAR"].ToString();
            this.cmbVeloPaladar.Value = dataTable1.Rows[0]["VELOPALADAR"].ToString();
            this.cmbUvula.Value = dataTable1.Rows[0]["UVULA"].ToString();
            this.txtCLabios.Value = dataTable1.Rows[0]["CLABIOS"].ToString();
            this.txtCMandibula.Value = dataTable1.Rows[0]["CMANDIBULA"].ToString();
            this.txtCPaladar.Value = dataTable1.Rows[0]["CPALADAR"].ToString();
            this.txtCVeloPaladar.Value = dataTable1.Rows[0]["CVELOPALADAR"].ToString();
            this.txtCLengua.Value = dataTable1.Rows[0]["CLENGUA"].ToString();
            this.txtCUvula.Value = dataTable1.Rows[0]["CUVULA"].ToString();
            this.txtEVALUACION.Text = dataTable1.Rows[0]["DATOS"].ToString();

            txtTraumatismoConPerdidaDeConocimientoCuales.Value = dataTable1.Rows[0]["TRAUMATISMOCONPERDIDADECONOCIMIENTOCUALES"].ToString();
            txtTraumatismoConPerdidaDeConocimiento.Value = dataTable1.Rows[0]["TRAUMATISMOCONPERDIDADECONOCIMIENTO"].ToString();
            txtTratamientoFarmacologicoCuales.Value = dataTable1.Rows[0]["TRATAMIENTOFARMACOLOGICO_CUALES"].ToString();
            ddlTratamientoFarmacologico.SelectedValue = dataTable1.Rows[0]["TRATAMIENTOFARMACOLOGICO"].ToString();
            ddlTipoDeAlimentoQueIngiereConMayorFrecuencia.SelectedValue = dataTable1.Rows[0]["TIPODEALIMENTOINGIERE"].ToString();
            txtTIENESHERMANOS.Value = dataTable1.Rows[0]["TIENESHERMANOS"].ToString();
            ddlTemperatura.SelectedValue = dataTable1.Rows[0]["TEMPERATURA"].ToString();
            ddlSUCCIONTIPO.SelectedValue = dataTable1.Rows[0]["SUCCION_TIPO"].ToString();
            dllSUCCION.SelectedValue = dataTable1.Rows[0]["SUCCION"].ToString();
            txtSostuvolaCabeza.Value = dataTable1.Rows[0]["SOSTUVOLACABEZA"].ToString();
            txtSeSento.Value = dataTable1.Rows[0]["SESENTO"].ToString();
            ddlSEAUTOALIMENTA.SelectedValue = dataTable1.Rows[0]["SEAUTOALIMENTA"].ToString();
            ddlSaboresPreferidos.SelectedValue = dataTable1.Rows[0]["SABORESPREFERIDOS"].ToString();
            ddlRECUERDADONDEESTANLOSOBJETOS.SelectedValue = dataTable1.Rows[0]["RECUERDADONDEESTANLOSOBJETOS"].ToString();
            ddlRECONOCEOBJETOSOIMAGENESVISTAS.SelectedValue = dataTable1.Rows[0]["RECONOCEOBJETOSOIMAGENESVISTAS"].ToString();
            ddlREALIZACONTACTOVISUAL.SelectedValue = dataTable1.Rows[0]["REALIZACONTACTOVISUAL"].ToString();
            ddlREACCIONAALCAMBIOENUNJUEGO.SelectedValue = dataTable1.Rows[0]["REACCIONAALCAMBIOENUNJUEGO"].ToString();
            txtQUETEGUSTAJUGAR.Value = dataTable1.Rows[0]["QUETEGUSTAJUGAR"].ToString();
            txtQUETEGUSTACOMER.Value = dataTable1.Rows[0]["QUETEGUSTACOMER"].ToString();
            txtPORCUANTOTIEMPO.Value = dataTable1.Rows[0]["PORCUANTOTIEMPO"].ToString();
            ddlPERMANECESENTADO.SelectedValue = dataTable1.Rows[0]["PERMANECESENTADO"].ToString();
            ddlotitisLado.SelectedValue = dataTable1.Rows[0]["OTITISLADO"].ToString();
            ddlotitis.SelectedValue = dataTable1.Rows[0]["OTITIS"].ToString();
            txtOBSERVACIONES.Text = dataTable1.Rows[0]["OBSERVACIONES"].ToString();
            txtOBJETIVOSATRABAJAR.Text = dataTable1.Rows[0]["OBJETIVOSATRABAJAR"].ToString();
            txtNumeroDeComidasAlDia.Value = dataTable1.Rows[0]["NUMERODECOMIDASALDIA"].ToString();
            txtMotivodeConsulta.Value = dataTable1.Rows[0]["MOTIVOCONSULTA"].ToString();
            ddlMIRAALOSOJOSCUANDOLEHABLAN.SelectedValue = dataTable1.Rows[0]["MIRAALOSOJOSCUANDOLEHABLAN"].ToString();
            ddlMANTIENELAATENCIONDURANTEACTIVIDADES.SelectedValue = dataTable1.Rows[0]["MANTIENELAATENCIONDURANTEACTIVIDADES"].ToString();
            txtLECHEMATERNATIEMPO.Value = dataTable1.Rows[0]["LECHEMATERNA_TIEMPO"].ToString();
            ddlLECHEMATERNA.SelectedValue = dataTable1.Rows[0]["LECHEMATERNA"].ToString();
            txtLECHEARTIFICIALTIEMPO.Value = dataTable1.Rows[0]["LECHEARTIFICIAL_TIEMPO"].ToString();
            ddlLECHEARTIFICIAL.SelectedValue = dataTable1.Rows[0]["LECHEARTIFICIAL"].ToString();
            ddlHospitalizaciones.SelectedValue = dataTable1.Rows[0]["HOSPITALIZACIONES"].ToString();
            ddlHipertrofiaDeAdenoides.SelectedValue = dataTable1.Rows[0]["HIPERTROFIADEADENOIDES"].ToString();
            ddlHATENIDOPROBLEMASDEADAPTACION.SelectedValue = dataTable1.Rows[0]["HATENIDOPROBLEMASDEADAPTACION"].ToString();
            ddlHARECIBIDOTERAPIADELLENGUAJE.SelectedValue = dataTable1.Rows[0]["HARECIBIDOTERAPIALENGUAJE"].ToString();
            txtGATEO.Value = dataTable1.Rows[0]["GATEO"].ToString();
            txtExistenEstímulosDistractoresDuranteLaAlimentacionCuales.Value = dataTable1.Rows[0]["EXISTENESTIMULOSDISTRACTORES_CUALES"].ToString();
            ddlExistenEstímulosDistractoresDuranteLaAlimentacion.SelectedValue = dataTable1.Rows[0]["EXISTENESTIMULOSDISTRACTORES"].ToString();
            ddlESCUCHACUANDOLEHABLAN.SelectedValue = dataTable1.Rows[0]["ESCUCHACUANDOLEHABLAN"].ToString();
            ddlEMPAREJAIMAGENESIGUALES.SelectedValue = dataTable1.Rows[0]["EMPAREJAIMAGENESIGUALES"].ToString();
            txtDificultadesRespiratoriasCuales.Value = dataTable1.Rows[0]["DIFICULTADESRESPIRATORIASCUALES"].ToString();
            txtDificultadesRespiratorias.Value = dataTable1.Rows[0]["DIFICULTADESRESPIRATORIAS"].ToString();
            ddlDeglucion.SelectedValue = dataTable1.Rows[0]["DEGLUCION"].ToString();
            txtDatosRevelantedeHistoriaClinica.Value = dataTable1.Rows[0]["DATOSRELEVANTESDEHISTORIA"].ToString();
            txtCUANTOSANIOSTIENES.Value = dataTable1.Rows[0]["CUANTOSANOSTIENES"].ToString();
            txtCUALESELNOMBREDETUPAPA.Value = dataTable1.Rows[0]["CUALESELNOMBREDETUPAPA"].ToString();
            txtCUALESELNOMBREDETUMAMA.Value = dataTable1.Rows[0]["CUALESELNOMBREDETUMAMA"].ToString();
            txtCUALESELNOMBREDETUCOLEGIO.Value = dataTable1.Rows[0]["CUALESELNOMBREDETUCOLEGIO"].ToString();
            txtConQueFrecuencia.Value = dataTable1.Rows[0]["CRISISOPROCESOSFEBRILESCONCONVULSIONES_FRECUENCIA"].ToString();
            txtCrisisOProcesosFebrilesConConvulsiones.Value = dataTable1.Rows[0]["CRISISOPROCESOSFEBRILESCONCONVULSIONES_AQUEEDAD"].ToString();
            txtCrisisOProcesosFebrilesConConvulsiones.Value = dataTable1.Rows[0]["CRISISOPROCESOSFEBRILESCONCONVULSIONES"].ToString();
            txtCONQUIENHASVENIDO.Value = dataTable1.Rows[0]["CONQUIENHASVENIDO"].ToString();
            txtCOMOTELLAMAS.Value = dataTable1.Rows[0]["COMOTELLAMAS"].ToString();
            txtCOMOSELLAMAN.Value = dataTable1.Rows[0]["COMOSELLAMAN"].ToString();
            txtComentariosENFERMEDADESCONGENITAS.Text = dataTable1.Rows[0]["COMENTARIO_ENFERMEDADESCONGENITAS"].ToString();
            txtCirugiaCuales.Value = dataTable1.Rows[0]["CIRUGIA_CUALES"].ToString();
            ddlCirugia.SelectedValue = dataTable1.Rows[0]["CIRUGIA"].ToString();
            txtcamino.Value = dataTable1.Rows[0]["CAMINO"].ToString();
            ddlBIBERON.SelectedValue = dataTable1.Rows[0]["BIBERON"].ToString();
            ddlASOCIAOBJETOSIMAGENES.SelectedValue = dataTable1.Rows[0]["ASOCIAOBJETOSIMAGENES"].ToString();
            txtAQueEsAlergico.Value = dataTable1.Rows[0]["AQUEESALERGICO"].ToString();
            txtAQUEEDADINICIOLAESCUELA.Value = dataTable1.Rows[0]["AQUEEDADINICIOLAESCUELA"].ToString();
            ddlAlergia.SelectedValue = dataTable1.Rows[0]["ALERGIAS"].ToString();

            string[] strBRUXISMO = dataTable1.Rows[0]["BRUXISMO"].ToString().Split(chArray);
            if (strBRUXISMO[0] != "")
            {
                foreach (string str in strBRUXISMO)
                    this.ckBRUXISMO.Items.FindByValue(str).Selected = true;
            }

            this.cmbTipo.Disabled = true;
            //DataTable dataTable2 = DB.ExecuteAdapter(string.Format("PAX00000X1 @REFGUID = '{0}', @ROWSGXID = '{1}', @USERID = '{2}'", Request.QueryString["CurrentPAX_ROWGUID"].ToString(), Request.QueryString["CURRENTUSR_SGXID"].ToString(), Request.QueryString["CurrentUSR_ROWGUID"].ToString()));
            //if (dataTable2.Rows.Count != 0)
            //{
            //    this.Session.Add("xHTML_Options", (object)dataTable2.Rows[0]["HTML_Options"].ToString());
            //    ((Site2)this.Master).Mostrar_Opciones_ActoMedico();
            //}
        }

        protected void _Back(object sender, EventArgs e)
        {
            if (Request.QueryString["CurrentPAX_ROWGUID"].ToString() != "")
                IDPaciente = Request.QueryString["CurrentPAX_ROWGUID"].ToString();
            this.Response.Redirect("http://caidsiges01:8000/HCL00000.aspx?X=" + IDPaciente);

        }
    }
}
