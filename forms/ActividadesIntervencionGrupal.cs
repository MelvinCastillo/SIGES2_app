using CAID.Data;
using System;
using System.Collections;
using System.Data;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace CAID_V2.forms
{
    public class ActividadesIntervencionGrupal : Page
    {
        private ArrayList xQueryParameters = new ArrayList();
        private ArrayList xQueryValues = new ArrayList();
        private string xCommand;
        private string xQuery;
        protected HiddenField HiddenField1;
        protected HiddenField PacienteID;
        protected HiddenField MedicoID;
        protected HiddenField TerapistaID;
        protected HiddenField EnfermeraID;
        protected HiddenField OrigenID;
        protected HiddenField txtEnfID;
        protected HiddenField xGUID;
        protected HiddenField xActividadGUID;
        protected Panel pnlConsulta;
        protected HtmlButton btnNew;
        protected HtmlButton btnShow;
        protected Repeater rpData;
        protected Panel pnlData;
        protected HtmlButton btnSave;
        protected HtmlButton btnCancel;
        protected HtmlButton btnBack;
        protected HtmlInputText txtDescripcion;
        protected RequiredFieldValidator valtxtDescripcion;
        protected HtmlInputText txtFechaIni;
        protected HtmlButton btnFindHorario;
        protected RequiredFieldValidator RequiredFieldValidator2;
        protected HtmlSelect cmbHorario;
        protected RequiredFieldValidator cmbHorario1;
        protected TextBox txtObservacion;
        protected HtmlInputText txtRecordNo;
        protected HtmlButton btnFilter2;
        protected DropDownList cmbPaciente;
        protected TextBox txtParticipantes;
        protected HtmlButton btnAdd;
        protected Repeater rpDetalles;
        protected HtmlInputText txtfamiliar;
        protected DropDownList ddlParentesco;
        protected DropDownList ddlQuienDirige;
        protected DropDownList ddlquiennotas;
        protected DropDownList ddlquienpuerta;
        protected DropDownList ddlquienpuerta2;
        protected DropDownList ddlquienpuerta3;
        protected DropDownList ddlquienpuerta4;

        private string xBase
        {
            get
            {
                return "SMX00600"; // this.Page.GetType().BaseType.Name.ToString();
            }
        }

        private string REFGUID
        {
            get
            {
                return this.cmbPaciente.SelectedValue.ToString().ToUpper();
            }
        }

        private string FECHAINI
        {
            get
            {
                return this.txtFechaIni.Value.ToString();
            }
        }

        private string HORAORDINAL
        {
            get
            {
                return this.cmbHorario.Value.ToString().ToUpper();
            }
        }

        private string OBSERVACION
        {
            get
            {
                return this.txtObservacion.Text.ToString().ToUpper();
            }
        }

        private string DESCRIPCION
        {
            get
            {
                return this.txtDescripcion.Value.ToString().ToUpper();
            }
        }

        private string ROWGUID
        {
            get
            {
                return this.xGUID.Value.ToString().ToUpper();
            }
        }

        public static string ROWUSERID2;

        public string ROWUSERID
        {
            get
            {
                if (Request.QueryString["CURRENTUSR_ID"] != null)
                {
                    // public const string months = Request.QueryString["CURRENTUSR_ID"].ToString();
                    Session.Add("CURRENTUSR_ID", Request.QueryString["CURRENTUSR_ID"].ToString());
                }
                return this.Session["CURRENTUSR_ID"].ToString();
            }
        }

        private string ROWSGXID
        {
            get
            {
                if (Request.QueryString["CURRENTUSR_SGXID"] != null)
                {
                    Session.Add("CURRENTUSR_SGXID", Request.QueryString["CURRENTUSR_SGXID"].ToString());
                }

                return this.Session["CURRENTUSR_SGXID"].ToString();
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            //if (this.Session["CURRENTUSR_ID"].ToString().Trim() == string.Empty)
            //    this.Response.Redirect("login.aspx");
            //((CAID.Site_Master)this.Master)._ValidaAccesoPagina(this.xBase + ".aspx");
            if (this.Page.IsPostBack)
            {
                return;
            }
            else
            {
              
                if (Request.QueryString["CURRENTUSR_ID"] != null)
                {
                    ROWUSERID2 = Request.QueryString["CURRENTUSR_ID"].ToString();
                    Session.Add("CURRENTUSR_ID", Request.QueryString["CURRENTUSR_ID"].ToString());
                }
            }
            this.btnNew.Visible = true;// Convert.ToBoolean(this.Session["CURRENTUSR_fnCREAR"].ToString());
            this.btnShow.Visible = true;//Convert.ToBoolean(this.Session["CURRENTUSR_fnIMRIMIR"].ToString());
            this.btnSave.Visible = true;//Convert.ToBoolean(this.Session["CURRENTUSR_fnCREAR"].ToString()) || Convert.ToBoolean(this.Session["CURRENTUSR_fnMODIFICAR"].ToString());
            this.btnBack.Visible = true;//Convert.ToBoolean(this.Session["CURRENTUSR_fnMODIFICAR"].ToString());
            this._Iniciar();
        }

        private void _Iniciar()
        {
            this.pnlConsulta.Visible = true;
            this.pnlData.Visible = false;

            /* lleno el listado de Quien dirigio actividad, quien tomo notas y quien estuvo en puerta*/
            this.xQueryParameters.Clear();
            this.xQueryValues.Clear(); //order by nombre
             
            DataTable dtquienes = DB.ExecuteAdapter(string.Format("SELECT CEDULAID, FULLNAME  FROM vespecialistas WHERE ESPECIALIDADID = 'CAID-SD-HISCL-15' AND ROWSGXID = '" + ROWSGXID.ToString() + "' ORDER BY FULLNAME", this.xQueryValues, CommandType.Text));
            if (dtquienes.Rows.Count > 0)
            {
                this.ddlQuienDirige.Items.Add(new ListItem("-- SELECCIONE --", "0"));
                this.ddlquiennotas.Items.Add(new ListItem("-- SELECCIONE --", "0"));
                this.ddlquienpuerta.Items.Add(new ListItem("-- SELECCIONE --", "0"));
                this.ddlquienpuerta2.Items.Add(new ListItem("-- SELECCIONE --", "0"));
                this.ddlquienpuerta3.Items.Add(new ListItem("-- SELECCIONE --", "0"));
                this.ddlquienpuerta4.Items.Add(new ListItem("-- SELECCIONE --", "0"));
                foreach (DataRow row in (InternalDataCollectionBase)dtquienes.Rows)
                {
                    this.ddlQuienDirige.Items.Add(new ListItem(row["FULLNAME"].ToString(), row["CEDULAID"].ToString()));
                    this.ddlquiennotas.Items.Add(new ListItem(row["FULLNAME"].ToString(), row["CEDULAID"].ToString()));
                    this.ddlquienpuerta.Items.Add(new ListItem(row["FULLNAME"].ToString(), row["CEDULAID"].ToString()));
                    this.ddlquienpuerta2.Items.Add(new ListItem(row["FULLNAME"].ToString(), row["CEDULAID"].ToString()));
                    this.ddlquienpuerta3.Items.Add(new ListItem(row["FULLNAME"].ToString(), row["CEDULAID"].ToString()));
                    this.ddlquienpuerta4.Items.Add(new ListItem(row["FULLNAME"].ToString(), row["CEDULAID"].ToString()));
                }
            }

            this.xQueryParameters.Clear();
            this.xQueryValues.Clear();
            this.xQueryParameters.Add((object)"@NOMBRE");
            this.xQueryValues.Add((object)"%");
            this.xQueryParameters.Add((object)"@ROWSGXID");
            this.xQueryValues.Add((object)this.ROWSGXID);
            this.cmbPaciente.Items.Clear();
            this.cmbPaciente.Items.Add(new ListItem("-- SELECCIONE --", string.Empty));
            foreach (DataRow row in (InternalDataCollectionBase)DB.ExecuteAdapter("PAX00000S1", this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure).Rows)
                this.cmbPaciente.Items.Add(new ListItem(row["FULLNAME"].ToString(), row["ROWGUID"].ToString()));
            this.xQueryParameters.Clear();
            this.xQueryValues.Clear();
            this.xQueryParameters.Add((object)"@NOMBRE");
            this.xQueryValues.Add((object)"%");
            this.xQueryParameters.Add((object)"@ROWSGXID");
            this.xQueryValues.Add((object)this.ROWSGXID);
            this.cmbHorario.Items.Clear();
            this.cmbHorario.Items.Add(new ListItem("-- SELECCIONE --", string.Empty));
            string str1 = this.Request.QueryString["X"];
            if (str1 == null)
            {
                this.xGUID.Value = Guid.NewGuid().ToString().ToUpper();
                this.pnlConsulta.Visible = true;
                this.pnlData.Visible = false;
                this._Show((object)null, (EventArgs)null);
                this._IniciarControles();
            }
            else
            {
                this.xGUID.Value = str1;
                this.xQueryParameters.Clear();
                this.xQueryValues.Clear();
                this.xQueryParameters.Add((object)"@GUID");
                this.xQueryValues.Add((object)this.ROWGUID);
                this.xQueryParameters.Add((object)"@ROWSGXID");
                this.xQueryValues.Add((object)this.ROWSGXID);
                this.xQuery = this.xBase + "S2";
                DataTable dataTable = DB.ExecuteAdapter(this.xQuery, this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure);
                DataRow dataRow = dataTable.Rows.Count != 0 ? dataTable.Rows[0] : (DataRow)null;
                if (dataRow == null)
                    return;
                this.txtDescripcion.Value = dataRow["DESCRIPCION"].ToString();
                this.ddlQuienDirige.SelectedValue = dataRow["QUIENDIRIGE"].ToString();
                this.ddlquiennotas.SelectedValue = dataRow["QUIENNOTAS"].ToString();
                this.ddlquienpuerta.SelectedValue = dataRow["QUIENPUERTA"].ToString();
                this.ddlquienpuerta2.SelectedValue = dataRow["QUIENPUERTA2"].ToString();
                this.ddlquienpuerta3.SelectedValue = dataRow["QUIENPUERTA3"].ToString();
                this.ddlquienpuerta4.SelectedValue = dataRow["QUIENPUERTA4"].ToString();
                HtmlInputText txtFechaIni = this.txtFechaIni;
                DateTime dateTime1 = Convert.ToDateTime(dataRow["FECHAINI"].ToString());
                string str2 = dateTime1.ToString("MM/dd/yyyy");
                txtFechaIni.Value = str2;
                this.txtObservacion.Text = dataRow["OBSERVACION"].ToString();
                this.cmbHorario.Items.Clear();
                ListItemCollection items = this.cmbHorario.Items;
                dateTime1 = Convert.ToDateTime(dataRow["HORAINI"]);
                string str3 = dateTime1.ToString("hh:mm tt");
                string str4 = " - ";
                dateTime1 = Convert.ToDateTime(dataRow["HORAFIN"]);
                string str5 = dateTime1.ToString("hh:mm tt");
                ListItem listItem = new ListItem(str3 + str4 + str5, string.Empty);
                items.Add(listItem);
                this.btnSave.Disabled = true;
                this.txtDescripcion.Disabled = true;
                this.txtFechaIni.Disabled = true;
                this.cmbHorario.Disabled = true;
                this.btnFindHorario.Disabled = true;
                this.txtObservacion.Enabled = false;
                dateTime1 = DateTime.Now;
                string dateTime2 = dateTime1.ToString("MM/dd/yyyy");
                dateTime1 = Convert.ToDateTime(dataRow["FECHAINI"].ToString());
                string dateTime3 = dateTime1.ToString("MM/dd/yyyy");
                if (string.Compare(dateTime2, dateTime3) > 0)
                    this.btnAdd.Disabled = true;
                this._CagarDetalles();
                this.pnlConsulta.Visible = false;
                this.pnlData.Visible = true;
            }
            /* lleno el listado de parentesco*/
            this.xQueryParameters.Clear();
            this.xQueryValues.Clear(); //order by nombre
            DataTable dtparentesco = DB.ExecuteAdapter(string.Format("select * from vparticipantes", this.xQueryValues, CommandType.Text));
            if (dtparentesco.Rows.Count > 0)
            {
                this.ddlParentesco.Items.Add(new ListItem("SELECCIONE", "0"));
                foreach (DataRow row in (InternalDataCollectionBase)dtparentesco.Rows)
                {
                    this.ddlParentesco.Items.Add(new ListItem(row["NOMBRE"].ToString(), row["rowguid"].ToString()));
                }
            }
            
        }

        private void _IniciarControles()
        {
            this.cmbPaciente.SelectedValue = string.Empty;
            this.txtFechaIni.Value = string.Empty;
            this.cmbHorario.Value = string.Empty;
            this.txtObservacion.Text = string.Empty;
            this.rpDetalles.DataSource = (object)null;
            this.rpDetalles.DataBind();
        }

        private void _IniciarFormulario()
        {
            if (this.Request.QueryString["X"] == null)
            {
                this.xGUID.Value = Guid.NewGuid().ToString().ToUpper();
                this._IniciarControles();
                this.pnlConsulta.Visible = true;
                this.pnlData.Visible = false;
            }
            else
                this.Response.Redirect("ActividadesIntervencionGrupal.aspx");
            this._Show((object)null, (EventArgs)null);
        }

        protected void _New(object sender, EventArgs e)
        {
            this._IniciarControles();
            this.pnlConsulta.Visible = false;
            this.pnlData.Visible = true;
        }

        protected void _Export(object sender, EventArgs e)
        {
        }

        protected void _Show(object sender, EventArgs e)
        {
            this.xQueryParameters.Clear();
            this.xQueryValues.Clear();
            this.xQueryParameters.Add((object)"@ROWSGXID");
            this.xQueryValues.Add((object)this.ROWSGXID);
            this.xQueryParameters.Add((object)"@FECHA1");
            this.xQueryValues.Add((object)string.Empty);
            this.xQueryParameters.Add((object)"@FECHA2");
            this.xQueryValues.Add((object)string.Empty);
            this.xQueryParameters.Add((object)"@ESTATUS");
            this.xQueryValues.Add((object)-1);
            this.xQuery = "SMX00600S1";
            this.rpData.DataSource = (object)DB.ExecuteAdapter(this.xQuery, this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure);
            this.rpData.DataBind();
        }

        protected void _FindHoras(object sender, EventArgs e)
        {
            if (this.txtFechaIni.Value == "")
                return;
            this.cmbHorario.Items.Clear();
            this.cmbHorario.Items.Add(new ListItem("-- SELECCIONE --", string.Empty));
            foreach (DataRow row in (InternalDataCollectionBase)DB.ExecuteAdapter(string.Format("[SMX10050P5] @Intervalo = '60',@FECHA = '{0}', @ROWSGXID='{1}'", (object)this.FECHAINI, this.ROWSGXID.ToString())).Rows)
                this.cmbHorario.Items.Add(new ListItem(row["HoraDescripcion"].ToString(), row["Numero_Ordinal"].ToString()));

        }

        protected void _SaveDetalles(object sender, EventArgs e)
        {
            this.xQueryParameters.Clear();
            this.xQueryValues.Clear();
            this.xQueryParameters.Add((object)"@ACTIVIDADGUID");
            this.xQueryValues.Add((object)this.ROWGUID);
            this.xQueryParameters.Add((object)"@REFGUID");
            this.xQueryValues.Add((object)this.REFGUID);
            this.xQueryParameters.Add((object)"@PARTICIPANTES");
            this.xQueryValues.Add((object)this.txtParticipantes.Text);
            this.xQueryParameters.Add((object)"@ROWGUID");
            this.xQueryValues.Add((object)Guid.NewGuid().ToString().ToUpper());
            this.xQueryParameters.Add((object)"@ROWUSERID");
            this.xQueryValues.Add((object)ROWUSERID2);
            this.xQueryParameters.Add((object)"@ROWSGXID");
            this.xQueryValues.Add((object)this.ROWSGXID);
            this.xQueryParameters.Add((object)"@NOMBREFAMILIAR");
            this.xQueryValues.Add((object)this.txtfamiliar.Value);
            this.xQueryParameters.Add((object)"@PARENTESCO");
            this.xQueryValues.Add((object)this.ddlParentesco.SelectedValue);
            this.xQuery = this.xBase + "_DSI";
            if (!DB.ExecuteNonQuery(this.xQuery, this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure))
                return;
            this._CagarDetalles();
        }

        protected void _DeleteDetalles(object sender, EventArgs e)
        {
            string str = ((LinkButton)sender).CommandArgument.ToString();
            this.xQueryParameters.Clear();
            this.xQueryValues.Clear();
            this.xQueryParameters.Add((object)"@ROWGUID");
            this.xQueryValues.Add((object)str);
            this.xQueryParameters.Add((object)"@ROWUSERID");
            this.xQueryValues.Add((object)ROWUSERID2);
            this.xQueryParameters.Add((object)"@ROWSGXID");
            this.xQueryValues.Add((object)this.ROWSGXID);
            this.xQuery = "SMX00600_DSD";
            if (!DB.ExecuteNonQuery(this.xQuery, this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure))
                return;
            this._CagarDetalles();
        }

        protected void _Select(object sender, EventArgs e)
        {
            this.xCommand = ((LinkButton)sender).CommandName.ToString();
            this.xGUID.Value = ((LinkButton)sender).CommandArgument.ToString();
            try
            {
                if (this.xCommand == "Edit")
                {
                    // if (!Convert.ToBoolean(this.Session["CURRENTUSR_fnMODIFICAR"].ToString()))
                    //    return; 
                    //this.Response.Redirect("ActividadesIntervencionGrupal.aspx?X=" + this.ROWGUID+"&CURRENTUSR_SGXID="+ ROWSGXID);
                    this.Response.Redirect("ActividadesIntervencionGrupal.aspx?X=" + this.ROWGUID);

                }
                if (this.xCommand == "Delete")
                {
                    this.xQueryParameters.Clear();
                    this.xQueryValues.Clear();
                    this.xQueryParameters.Add((object)"@ROWGUID");
                    this.xQueryValues.Add((object)this.ROWGUID);
                    this.xQueryParameters.Add((object)"@ROWUSERID");
                    this.xQueryValues.Add((object)ROWUSERID2);
                    this.xQueryParameters.Add((object)"@ROWSGXID");
                    this.xQueryValues.Add((object)this.ROWSGXID);
                    this.xQuery = this.xBase + "SD";
                    if (DB.ExecuteNonQuery(this.xQuery, this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure))
                        this._Show((object)null, (EventArgs)null);
                }
            }
            catch
            {
            }
        }

        protected void _Save(object sender, EventArgs e)
        {
            this.xQueryParameters.Clear();
            this.xQueryValues.Clear();
            this.xQueryParameters.Add((object)"@DESCRIPCION");
            this.xQueryValues.Add((object)this.DESCRIPCION);
            this.xQueryParameters.Add((object)"@FECHAINI");
            this.xQueryValues.Add((object)this.FECHAINI);
            this.xQueryParameters.Add((object)"@HORAORDINAL");
            this.xQueryValues.Add((object)this.HORAORDINAL);
            this.xQueryParameters.Add((object)"@OBSERVACION");
            this.xQueryValues.Add((object)this.OBSERVACION);
            this.xQueryParameters.Add((object)"@ROWGUID");
            this.xQueryValues.Add((object)this.ROWGUID);
            this.xQueryParameters.Add((object)"@ROWUSERID");
            this.xQueryValues.Add((object)ROWUSERID2);
            this.xQueryParameters.Add((object)"@ROWSGXID");
            this.xQueryValues.Add((object)this.ROWSGXID);
            this.xQueryParameters.Add((object)"@ACTIVIDADESTATUS");
            this.xQueryValues.Add((object)0);
            this.xQueryParameters.Add((object)"@QUIENDIRIGE");
            this.xQueryValues.Add((object)ddlQuienDirige.SelectedValue);
            this.xQueryParameters.Add((object)"@QUIENNOTAS");
            this.xQueryValues.Add((object)ddlquiennotas.SelectedValue);
            this.xQueryParameters.Add((object)"@QUIENPUERTA");
            this.xQueryValues.Add((object)ddlquienpuerta.SelectedValue);
            this.xQueryParameters.Add((object)"@QUIENPUERTA2");
            this.xQueryValues.Add((object)ddlquienpuerta2.SelectedValue);
            this.xQueryParameters.Add((object)"@QUIENPUERTA3");
            this.xQueryValues.Add((object)ddlquienpuerta3.SelectedValue);
            this.xQueryParameters.Add((object)"@QUIENPUERTA4");
            this.xQueryValues.Add((object)ddlquienpuerta4.SelectedValue);
            this.xQuery = "SMX00600SI";
            if (!DB.ExecuteNonQuery(this.xQuery, this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure))
                return;
            this._IniciarFormulario();
            //((Site_Master) this.Master)._Notify("Actividad registrada en el sistema");

            Notify("Actividad registrada en el sistema", "success");
        }

        protected void _Cancel(object sender, EventArgs e)
        {
            this._IniciarControles();
        }

        protected void _Cancel2(object sender, EventArgs e)
        {
            this._IniciarControles();
        }

        protected void _Back(object sender, EventArgs e)
        {
            this._IniciarFormulario();
        }

        protected void _Back2(object sender, EventArgs e)
        {
            this.pnlConsulta.Visible = false;
            this.pnlData.Visible = true;
        }

        protected void _Search2(object sender, EventArgs e)
        {
            string upper = this.txtRecordNo.Value.ToString().ToUpper();
            if (upper.Trim() == string.Empty)
                return;
            this.xQueryParameters.Clear();
            this.xQueryValues.Clear();
            this.xQueryParameters.Add((object)"@CEDULAID");
            this.xQueryValues.Add((object)upper);
            this.xQueryParameters.Add((object)"@ROWSGXID");
            this.xQueryValues.Add((object)this.ROWSGXID);
            this.xQuery = "PAX20101P2";
            DataTable dataTable = DB.ExecuteAdapter(this.xQuery, this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure);
            if (dataTable.Rows.Count != 0)
            {
                this.cmbPaciente.SelectedValue = dataTable.Rows[0]["PACIENTEGUID"].ToString();
                this.txtRecordNo.Value = string.Empty;
            }
            else
                //((Site_Master)this.Master)._Notify("Record No. " + upper.Trim() + " No Registrado");
                Notify("Record No. " + upper.Trim() + " No Registrado", "success");

        }

        private void _CagarDetalles()
        {
            this.cmbPaciente.SelectedValue = string.Empty;
            this.txtParticipantes.Text = string.Empty;
            this.txtfamiliar.Value = string.Empty;
            this.ddlParentesco.SelectedValue = "0";
            this.xQueryParameters.Clear();
            this.xQueryValues.Clear();
            this.xQueryParameters.Add((object)"@ACTIVIDADGUID");
            this.xQueryValues.Add((object)this.ROWGUID);
            this.xQueryParameters.Add((object)"@ROWSGXID");
            this.xQueryValues.Add((object)this.ROWSGXID);
            this.xQuery = this.xBase + "_DS3";
            this.rpDetalles.DataSource = (object)DB.ExecuteAdapter(this.xQuery, this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure);
            this.rpDetalles.DataBind();
        }

        public void Notify(string msg, string tipo)
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "notify('" + msg + "','" + tipo + "');", true);
        }
        protected void _Back3(object sender, EventArgs e)
        {
            this.Response.Redirect("http://caidsiges01:8000/INDEX.aspx");
        }

    }
}
