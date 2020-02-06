using System;
using System.Collections;
using System.Data;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using CAID.Data;


namespace CAID_V2.forms
{
    public partial class EF_RETROALIMENTACIONUSUARIO : System.Web.UI.Page
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
        DataTable dtobjetivos = new DataTable();
        DataTable dtobjetivosAsignados = new DataTable(); 

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
              _Buscar(sender, e);

                // consulto los objetivos 
                this.cmbTipoOBJ.Items.Clear();
                this.cmbTipoOBJ.Items.Add(new ListItem("-- SELECCIONE --", string.Empty));
                foreach (DataRow row in (InternalDataCollectionBase)DB.ExecuteAdapter("SELECT * FROM vTIPOOBJETIVO ORDER BY ORDEN").Rows)
                    this.cmbTipoOBJ.Items.Add(new ListItem(row["NOMBRE"].ToString(), row["ROWGUID"].ToString()));
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

                pnlConsulta.Visible = false;
                pnlData.Visible = true;

                /*INSERTO EN LA TABLA EF_RETROALIMENTACION_MAESTRO y MUESTRO LA INFORMACION PARA SER MODIFICADA*/
               
                this.dtConsultaDatos = DB.ExecuteAdapter(string.Format("PR_EF_RETROALIMENTACION_MAESTRO_NUEVO  @Paciente = '{0}',  @USUARIO = '{1}', @CENTRO = '{2}', @ESPECIALISTAID='{3}'", (object)PACIENTE, (object)USUARIO, (object)CENTRO, (object)ESPECIALISTAID));
                this.Secuencia = dtConsultaDatos.Rows[0]["Secuencia"].ToString();
                if (dtConsultaDatos == null)
                    return;
                //this.txtnoevaluacion.Value = Secuencia;
                this.txtfechaevaluacion.Value = dtConsultaDatos.Rows[0]["ROWCDTE"].ToString();  
                txtRecomendaciones.Value = dtConsultaDatos.Rows[0]["RECOMENDACIONES"].ToString(); 
                Session.Add("StrSecuencia", Secuencia.ToString());
                this.rpevaluacion.DataSource = (object)this.dtConsultaDatos;
                this.rpevaluacion.DataBind();

            }
        }

        protected void _Save(object sender, EventArgs e)
        {
            DataTable dataTable2 = new DataTable();
            string PACIENTE = Request.QueryString["CurrentPAX_ROWGUID"].ToString();
            string CENTRO = Request.QueryString["XCURRENTUSR_SGXID"].ToString();
            string USUARIO = Request.QueryString["CurrentUSR_ROWGUID"].ToString();
            string secuencia = Session["StrSecuencia"].ToString();

            // Guardo el maestro de la entrevista 
            this.xQueryParameters.Add("@SECUENCIA");
            this.xQueryParameters.Add("@Usuario");
            this.xQueryParameters.Add("@CENTRO");
            //this.xQueryParameters.Add("@DESARROLLOSESIONES");
            //this.xQueryParameters.Add("@NECESIDADESACTUALES");
            //this.xQueryParameters.Add("@DIFICULTADESRETOS");
            //this.xQueryParameters.Add("@TERAPIADEBEPERMANECER");
            this.xQueryParameters.Add("@RECOMENDACIONES");
            //this.xQueryParameters.Add("@REFERIMIENTOS");
            this.xQueryParameters.Add("@PRIORIZADOISCUSIONCASO");
            this.xQueryParameters.Add("@DATO");
            this.xQueryParameters.Add("@PACIENTE");
            this.xQueryParameters.Add("@CODIGO");
            foreach (RepeaterItem repeaterItem in this.rpevaluacion.Items)
            {
                //int num1 = 0;
                Label OBJCODIGO = (Label)repeaterItem.FindControl("lblCODIGO");
                DropDownList OBJDATO = (DropDownList)repeaterItem.FindControl("ddlDATO");

                this.xQueryValues.Clear();
                this.xQueryValues.Add(secuencia);
                this.xQueryValues.Add(USUARIO);
                this.xQueryValues.Add(CENTRO);
                this.xQueryValues.Add(txtRecomendaciones.Value);
                this.xQueryValues.Add(ddlPRIORIZADOISCUSIONCASO.SelectedValue);
                this.xQueryValues.Add(OBJDATO.SelectedValue);
                this.xQueryValues.Add(PACIENTE.ToString());
                this.xQueryValues.Add(OBJCODIGO.Text.ToString());
                dataTable2 = DB.ExecuteAdapter("PR_EF_RETROALIMENTACION_MAESTROGUARDAR", this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure); if (dataTable2.Rows.Count != 0) ;

            }

            if (dataTable2.Rows.Count>0)
            {
                DataRow row2 = dataTable2.Rows[0];
                if (row2["Conteo"].ToString() != "0")
                {
                    Notify("Registro Guardado", "success");
                    _Buscar(sender, e);
                    _Back(sender,e);
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
        }

        protected void _BackMain(object sender, EventArgs e)
        {
            if (Request.QueryString["CurrentPAX_ROWGUID"].ToString() != null)
                PACIENTE = Request.QueryString["CurrentPAX_ROWGUID"].ToString();
            this.Response.Redirect("http://caidsiges01:8000/HCL00000.aspx?X=" + PACIENTE);

        }
        protected void _BackMain1(object sender, EventArgs e)
        {
            pnlConsulta.Visible = true;
            pnlData.Visible = false;
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

                /* CONSULTO TABLA MAESTRO */
                DataTable dtConsultaDatos = DB.ExecuteAdapter("PR_EF_RETROALIMENTACION_MAESTROBUSCA", this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure);
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
                    rpHistorico.DataSource = dtConsultaDatos;
                    rpHistorico.DataBind(); 
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
            this.xQuery = "PR_EF_RETROALIMENTACION_MAESTROBUSCA_DET";
            DataTable dtEvaluacionCompleta = DB.ExecuteAdapter(this.xQuery, this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure);
            if (dtEvaluacionCompleta.Rows.Count > 0)
            {
                txtNombrePaciente.Value = dtEvaluacionCompleta.Rows[0]["NOMBREPX"].ToString();
                txtFechanacimiento.Value = dtEvaluacionCompleta.Rows[0]["FNACE"].ToString();
                txtEdadCronologica.Value = dtEvaluacionCompleta.Rows[0]["EDAD"].ToString(); 
                this.txtfechaevaluacion.Value = dtEvaluacionCompleta.Rows[0]["ROWCDTE"].ToString();

                txtExpedienteNo.Value = dtEvaluacionCompleta.Rows[0]["RECORDID"].ToString();
                txtNombreEvaluador.Value = dtEvaluacionCompleta.Rows[0]["NOMBRE_ESPECIALISTA"].ToString(); 
                txtRecomendaciones.Value = dtEvaluacionCompleta.Rows[0]["RECOMENDACIONES"].ToString();  

                /* Busco los objetivos asignados*/
                _FillObjAsignados(sender, e);
                /* Busco el detalle de las preguntas*/
                rpevaluacion.DataSource = dtEvaluacionCompleta;
                rpevaluacion.DataBind();



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

        protected void _FillObj(object sender, EventArgs e)
        {
            string ESPECIALISTAID = Request.QueryString["CurrentUSR_TERID"].ToString();
            string CENTRO = Request.QueryString["XCURRENTUSR_SGXID"].ToString(); 
            dtobjetivos = DB.ExecuteAdapter(string.Format("HCX00310S4 @ROWSGXID = '{0}', @TERID = '{1}', @TIPO = '{2}'", CENTRO.ToString(), ESPECIALISTAID.ToString(), (object)this.cmbTipoOBJ.SelectedValue));
            this.rpActividades.DataSource = dtobjetivos;
            this.rpActividades.DataBind();
        }

        protected void _FillObjAsignados(object sender, EventArgs e)
        {
            string secuencia = Session["StrSecuencia"].ToString();   
            string CENTRO = Request.QueryString["XCURRENTUSR_SGXID"].ToString();

            dtobjetivosAsignados = DB.ExecuteAdapter(string.Format("PR_EF_RETROALIMENTACION_DETALLE_BUSCA @SECUENCIA = '{0}', @ROWSGXID = '{1}'", secuencia.ToString(), CENTRO.ToString()));
            this.rpAsignadas.DataSource = dtobjetivosAsignados;
            this.rpAsignadas.DataBind();
        }
         

        protected void _SaveObjetivos(object sender, EventArgs e)
        { 

            if (this.cmbTipoOBJ.SelectedValue == "")
            {
                this.ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('Debe seleccione un objetivo!');", true);
            }
            else
            {
                string secuencia = Session["StrSecuencia"].ToString(); 
                string strobjetivoid = ((LinkButton)sender).CommandArgument.ToString();
                string CENTRO = Request.QueryString["XCURRENTUSR_SGXID"].ToString();
                string USUARIO = Request.QueryString["CurrentUSR_ROWGUID"].ToString();

                this.xQueryParameters.Clear();
                this.xQueryValues.Clear();
                this.xQueryParameters.Add((object)"@SECUENCIA");
                this.xQueryValues.Add(secuencia.ToString());
                this.xQueryParameters.Add((object)"@ROWSGXID");
                this.xQueryValues.Add(CENTRO.ToString());
                this.xQueryParameters.Add((object)"@OBJETIVO");
                this.xQueryValues.Add(strobjetivoid.ToString());
                this.xQueryParameters.Add((object)"@ROWUSERID");
                this.xQueryValues.Add(USUARIO.ToString());
                this.xQuery = "PR_EF_RETROALIMENTACION_DETALLE_NUEVO";
                if (!DB.ExecuteNonQuery(this.xQuery, this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure))
                    return;
                _FillObjAsignados(sender, e);
            }
        }


        protected void _DeleteObjetivos(object sender, EventArgs e)
        {
            string secuencia = Session["StrSecuencia"].ToString();
            string CENTRO = Request.QueryString["XCURRENTUSR_SGXID"].ToString();
            string strobjetivoid = ((LinkButton)sender).CommandArgument.ToString();

            this.xQueryParameters.Clear();
            this.xQueryValues.Clear();
            this.xQueryParameters.Add((object)"@SECUENCIA");
            this.xQueryValues.Add(secuencia.ToString());
            this.xQueryParameters.Add((object)"@ROWSGXID");
            this.xQueryValues.Add(CENTRO.ToString());
            this.xQueryParameters.Add((object)"@OBJETIVO");
            this.xQueryValues.Add(strobjetivoid.ToString());
            this.xQuery = "PR_EF_RETROALIMENTACION_DETALLE_BORRAR";
            if (!DB.ExecuteNonQuery(this.xQuery, this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure))
                return;
           this._FillObjAsignados((object)null, (EventArgs)null);
        }

    }

}
