﻿using CAID.Data;
using System;
using System.Collections;
using System.Data;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace CAID_V2.forms
{
    public partial class SMX00510_MASIVAS : Page
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
        protected HtmlInputText txtFecha1;
        protected HtmlInputText txtFecha2;
        protected HtmlSelect cmbEstatusC;
        protected HtmlButton btnShow;
        protected HtmlButton btnCancel;
        protected Repeater rpData;
        protected Panel pnlData;
        protected HtmlButton btnSave;
        protected HtmlButton btnBack;
        protected HtmlSelect cmbEstatus;
        protected RequiredFieldValidator valcmbEstatus;
        protected HtmlTextArea txtdatosllamada;
        protected HtmlTextArea txtdatosllamada1;
        protected HtmlSelect cmbPaciente;
        protected RequiredFieldValidator RequiredFieldValidator1;
        protected HtmlInputText txtFechaIni;
        protected RequiredFieldValidator RequiredFieldValidator2;
        protected HtmlSelect cmbOrigenTratamiento;
        protected RequiredFieldValidator RequiredFieldValidator3;
        protected HtmlSelect cmbTerapista;
        protected RequiredFieldValidator RequiredFieldValidator5;
        protected HtmlSelect cmbMedico;
        protected HtmlSelect cmbEnfermera;
        protected HtmlSelect cmbHorario;
        protected RequiredFieldValidator cmbHorario1;
        protected HtmlTextArea txtObservacion;

        private string xBase
        {
            get
            {
                return this.Page.GetType().BaseType.Name.ToString();
            }
        }

        private string REFGUID
        {
            get
            {
                return this.cmbPaciente.Value.ToString().ToUpper();
            }
        }

        private string MEDID
        {
            get
            {
                return this.cmbMedico.Value.ToString().ToUpper();
            }
        }

        private string TERID
        {
            get
            {
                return this.cmbTerapista.Value.ToString().Trim().ToUpper();
            }
        }

        private string ENFID
        {
            get
            {
                return this.cmbEnfermera.Value.ToString().Trim().ToUpper();
            }
        }

        private string ORIGENID
        {
            get
            {
                return this.cmbOrigenTratamiento.Value.ToString().Trim().ToUpper();
            }
        }

        private string FECHAINI
        {
            get
            {
                return this.txtFechaIni.Value.ToString();
            }
        }

        private string OBSERVACION
        {
            get
            {
                return this.txtObservacion.Value.ToString().ToUpper();
            }
        }

        private string ROWGUID
        {
            get
            {
                return this.xGUID.Value.ToString().ToUpper();
            }
        }

        private string ROWUSERID
        {
            get
            {
                return Request.QueryString["CURRENTUSR_ROWGUID"].ToString();
                //return this.Session["CURRENTUSR_ID"].ToString();
            }
        }

        private string ROWSGXID
        {
            get
            {
                return Request.QueryString["CURRENTUSR_SGXID"].ToString();
                //return this.Session["CURRENTUSR_SGXID"].ToString();
            }
        }

        private string FECHA1
        {
            get
            {
                return this.txtFecha1.Value.ToString();
            }
        }

        private string FECHA2
        {
            get
            {
                return this.txtFecha2.Value.ToString();
            }
        }

        private string ESPECIALISTA
        {
            get
            {
                return string.Empty;
            }
        }

        private string ESTATUS
        {
            get
            {
                return this.cmbEstatusC.Value.ToString().ToUpper();
            }
        }

        private string COMENTARIO
        {
            get
            {
                return this.txtdatosllamada.Value.ToString().ToUpper();
            }
        }

        private int CITAESTATUS
        {
            get
            {
                return Convert.ToInt32(this.cmbEstatus.Value);
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            //if (this.Session["CURRENTUSR_ID"].ToString().Trim() == string.Empty)
            //    this.Response.Redirect("login.aspx");
            //((Site_Master)this.Master)._ValidaAccesoPagina(this.xBase + ".aspx");
            if (this.Page.IsPostBack)
                return;
            this.xGUID.Value = Guid.NewGuid().ToString().ToUpper();

            //this.btnShow.Visible = Convert.ToBoolean(this.Session["CURRENTUSR_fnIMRIMIR"].ToString());
            //this.btnBack.Visible = Convert.ToBoolean(this.Session["CURRENTUSR_fnMODIFICAR"].ToString());
            this._Iniciar();
        }

        private void _Iniciar()
        {
            this.pnlConsulta.Visible = true;
            //this.pnlData.Visible = false;
            this.xQueryParameters.Clear();
            this.xQueryValues.Clear();
            this.xQueryParameters.Add((object)"@NOMBRE");
            this.xQueryValues.Add((object)"%");
            this.xQueryParameters.Add((object)"@ROWSGXID");
            this.xQueryValues.Add((object)this.ROWSGXID);
            this.xGUID.Value = Guid.NewGuid().ToString().ToUpper(); 
            this.rpData.DataSource = (object)null;
            this.rpData.DataBind();
            this._IniciarControles();
            /*
           this.cmbPaciente.Items.Clear();
           this.cmbPaciente.Items.Add(new ListItem("-- SELECCIONE --", string.Empty));

           foreach (DataRow row in (InternalDataCollectionBase)DB.ExecuteAdapter("PAX00000S1", this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure).Rows)
               this.cmbPaciente.Items.Add(new ListItem(row["FULLNAME"].ToString(), row["ROWGUID"].ToString()));
           this.cmbOrigenTratamiento.Items.Clear();
           this.cmbOrigenTratamiento.Items.Add(new ListItem("-- SELECCIONE --", string.Empty));
           foreach (DataRow row in (InternalDataCollectionBase)DB.ExecuteAdapter("SMX30014S1", this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure).Rows)
               this.cmbOrigenTratamiento.Items.Add(new ListItem(row["NOMBRE"].ToString(), row["ROWGUID"].ToString()));
           this.xQueryParameters.Clear();
           this.xQueryValues.Clear();
           this.xQueryParameters.Add((object)"@NOMBRE");
           this.xQueryValues.Add((object)"%");
           this.xQueryParameters.Add((object)"@ROWSGXID");
           this.xQueryValues.Add((object)this.ROWSGXID);
           this.xQueryParameters.Add((object)"@ClaseID");
           this.xQueryValues.Add((object)1);
           this.cmbMedico.Items.Clear();
           this.cmbMedico.Items.Add(new ListItem("-- SELECCIONE --", string.Empty));
           foreach (DataRow row in (InternalDataCollectionBase)DB.ExecuteAdapter("SMX00300S3", this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure).Rows)
               this.cmbMedico.Items.Add(new ListItem(row["FULLNAME"].ToString(), row["ROWGUID"].ToString()));
           this.xQueryParameters.Clear();
           this.xQueryValues.Clear();
           this.xQueryParameters.Add((object)"@NOMBRE");
           this.xQueryValues.Add((object)"%");
           this.xQueryParameters.Add((object)"@ROWSGXID");
           this.xQueryValues.Add((object)this.ROWSGXID);
           this.xQueryParameters.Add((object)"@ClaseID");
           this.xQueryValues.Add((object)2);
           this.cmbTerapista.Items.Clear();
           this.cmbTerapista.Items.Add(new ListItem("-- SELECCIONE --", string.Empty));
           foreach (DataRow row in (InternalDataCollectionBase)DB.ExecuteAdapter("SMX00300S3", this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure).Rows)
               this.cmbTerapista.Items.Add(new ListItem(row["FULLNAME"].ToString(), row["ROWGUID"].ToString()));
           this.xQueryParameters.Clear();
           this.xQueryValues.Clear();
           this.xQueryParameters.Add((object)"@NOMBRE");
           this.xQueryValues.Add((object)"%");
           this.xQueryParameters.Add((object)"@ROWSGXID");
           this.xQueryValues.Add((object)this.ROWSGXID);
           this.xQueryParameters.Add((object)"@ClaseID");
           this.xQueryValues.Add((object)3);
           this.cmbEnfermera.Items.Clear();
           this.cmbEnfermera.Items.Add(new ListItem("-- SELECCIONE --", string.Empty));
           foreach (DataRow row in (InternalDataCollectionBase)DB.ExecuteAdapter("SMX00300S3", this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure).Rows)
               this.cmbEnfermera.Items.Add(new ListItem(row["FULLNAME"].ToString(), row["ROWGUID"].ToString()));
           string str = this.Request.QueryString["X"];
           if (str == null)
           {
               this.xGUID.Value = Guid.NewGuid().ToString().ToUpper();
               this.pnlConsulta.Visible = true;
               this.pnlData.Visible = false;
               this.rpData.DataSource = (object)null;
               this.rpData.DataBind();
               this._IniciarControles();
           }
           else
           {
               this.xGUID.Value = str;
               this.xQueryParameters.Clear();
               this.xQueryValues.Clear();
               this.xQueryParameters.Add((object)"@GUID");
               this.xQueryValues.Add((object)this.ROWGUID);
               this.xQueryParameters.Add((object)"@ROWSGXID");
               this.xQueryValues.Add((object)this.ROWSGXID);
               this.xQuery = "SMX00500S2";
               DataTable dataTable = DB.ExecuteAdapter(this.xQuery, this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure);
               DataRow dataRow = dataTable.Rows.Count != 0 ? dataTable.Rows[0] : (DataRow)null;
               if (dataRow == null)
                   return;
               this.cmbPaciente.Value = dataRow["REFGUID"].ToString();
               this.cmbOrigenTratamiento.Value = dataRow["ORIGENID"].ToString();
               this.cmbMedico.Value = dataRow["MEDID"].ToString();
               this.cmbTerapista.Value = dataRow["TERID"].ToString();
               this.cmbEnfermera.Value = dataRow["ENFID"].ToString();
               this.cmbEstatus.Value = dataRow["CITAESTATUS"].ToString();
               this.txtFechaIni.Value = Convert.ToDateTime(dataRow["FECHAINI"].ToString()).ToString("MM/dd/yyyy");
               this.txtObservacion.Value = dataRow["OBSERVACION"].ToString();
               this.pnlConsulta.Visible = false;
               this.pnlData.Visible = true;
           }*/
        }

        private void _IniciarControles()
        {
            //this.cmbPaciente.Value = string.Empty;
            //this.cmbMedico.Value = string.Empty;
            //this.cmbOrigenTratamiento.Value = string.Empty;
            //this.cmbEnfermera.Value = string.Empty;
            //this.cmbTerapista.Value = string.Empty;
            //this.txtFechaIni.Value = string.Empty;
            //this.txtFecha2.Value = string.Empty;
        }

        private void _IniciarFormulario()
        {
            if (this.Request.QueryString["X"] == null)
            {
                this.xGUID.Value = Guid.NewGuid().ToString().ToUpper();
                this._IniciarControles();
                this.pnlConsulta.Visible = true;
                //this.pnlData.Visible = false;
            }
            else
                this.Response.Redirect(this.xBase + ".aspx");
            this._Show((object)null, (EventArgs)null);
        }

        protected void _New(object sender, EventArgs e)
        {
            this._IniciarControles();
            this.pnlConsulta.Visible = false;
            //this.pnlData.Visible = true;
        }

        protected void _Export(object sender, EventArgs e)
        {
        }

        protected void _Show(object sender, EventArgs e)
        {
            this.xQueryParameters.Clear();
            this.xQueryValues.Clear();
            this.xQueryParameters.Add((object)"@NOMBRE");
            this.xQueryValues.Add((object)"%");
            this.xQueryParameters.Add((object)"@ROWSGXID");
            this.xQueryValues.Add((object)this.ROWSGXID);
            this.xQueryParameters.Add((object)"@FECHA1");
            this.xQueryValues.Add((object)this.FECHA1);
            this.xQueryParameters.Add((object)"@FECHA2");
            this.xQueryValues.Add((object)this.FECHA2);
            this.xQueryParameters.Add((object)"@ESPECIALISTA");
            this.xQueryValues.Add((object)this.ESPECIALISTA);
            this.xQueryParameters.Add((object)"@ESTATUS");
            this.xQueryValues.Add((object)0); //programadas
            this.xQueryParameters.Add((object)"@RECORD");
            this.xQueryValues.Add((object)-1);
            this.xQuery = "SMX00500S6";
            this.rpData.DataSource = (object)DB.ExecuteAdapter(this.xQuery, this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure);
            this.rpData.DataBind();
        }

        protected void _Select(object sender, EventArgs e)
        {
            this.xCommand = ((LinkButton)sender).CommandName.ToString();
            this.xGUID.Value = ((LinkButton)sender).CommandArgument.ToString();
            try
            {
                this.Response.Redirect(this.xBase + ".aspx?X=" + this.ROWGUID + "&CURRENTUSR_SGXID=" + this.ROWUSERID);
            }
            catch
            {
            }
        }
        /*
            protected void _Save(object sender, EventArgs e)
            {
                this.xQueryParameters.Clear();
                this.xQueryValues.Clear();
                string str = this.Request.QueryString["X"];
                this.xQueryParameters.Add((object)"@CITAID");
                this.xQueryValues.Add((object)str);
                this.xQueryParameters.Add((object)"@COMENTARIO");
                this.xQueryValues.Add((object)this.txtdatosllamada1.Value);
                this.xQueryParameters.Add((object)"@ROWGUID");
                this.xQueryValues.Add((object)this.ROWGUID);
                this.xQueryParameters.Add((object)"@ROWUSERID");
                this.xQueryValues.Add((object)this.ROWUSERID);
                this.xQueryParameters.Add((object)"@ROWSGXID");
                this.xQueryValues.Add((object)this.ROWSGXID);
                this.xQuery = this.xBase + "SI";
                DB.ExecuteNonQuery(this.xQuery, this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure);
                this.xQueryParameters.Clear();
                this.xQueryValues.Clear();
                this.xQueryParameters.Add((object)"@CITAESTATUS");
                this.xQueryValues.Add((object)1);//confirmadas
                this.xQueryParameters.Add((object)"@ROWGUID");
                this.xQueryValues.Add((object)str);
                this.xQueryParameters.Add((object)"@ROWUSERID");
                this.xQueryValues.Add((object)this.ROWUSERID);
                this.xQueryParameters.Add((object)"@ROWSGXID");
                this.xQueryValues.Add((object)this.ROWSGXID);
                this.xQuery = "SMX00500SA";
                DB.ExecuteNonQuery(this.xQuery, this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure);
                this._IniciarFormulario();
            }
        */
        protected void _Save(String ROWGUID)
        {
            /*this.xQueryParameters.Clear();
            this.xQueryValues.Clear();
            string str = this.Request.QueryString["X"];
            this.xQueryParameters.Add((object)"@CITAID");
            this.xQueryValues.Add((object)str);
            this.xQueryParameters.Add((object)"@COMENTARIO");
            this.xQueryValues.Add((object)this.txtdatosllamada1.Value);
            this.xQueryParameters.Add((object)"@ROWGUID");
            this.xQueryValues.Add((object)ROWGUID);
            this.xQueryParameters.Add((object)"@ROWUSERID");
            this.xQueryValues.Add((object)this.ROWUSERID);
            this.xQueryParameters.Add((object)"@ROWSGXID");
            this.xQueryValues.Add((object)this.ROWSGXID);
            this.xQuery = this.xBase + "SI";
            DB.ExecuteNonQuery(this.xQuery, this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure);
            */
            this.xQueryParameters.Clear();
            this.xQueryValues.Clear();
            this.xQueryParameters.Add((object)"@CITAESTATUS");
            this.xQueryValues.Add((object)1);//confirmadas
            this.xQueryParameters.Add((object)"@ROWGUID");
            this.xQueryValues.Add((object)ROWGUID);
            this.xQueryParameters.Add((object)"@ROWUSERID");
            this.xQueryValues.Add((object)this.ROWUSERID);
            this.xQueryParameters.Add((object)"@ROWSGXID");
            this.xQueryValues.Add((object)this.ROWSGXID); 
            this.xQueryParameters.Add((object)"@COMENTARIO");
            this.xQueryValues.Add((object)this.txtdatosllamada1.Value);
            this.xQuery = "SMX00500SA2";
            DB.ExecuteNonQuery(this.xQuery, this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure);

        }

        /*
                protected void _Save2(object sender, EventArgs e)
                    {
                        this.xQueryParameters.Clear();
                        this.xQueryValues.Clear();
                        this.xQueryParameters.Add((object)"@OBJID");
                        this.xQueryValues.Add((object)this.ROWGUID);
                        this.xQueryParameters.Add((object)"@ROWGUID");
                        this.xQueryValues.Add((object)this.xActividadGUID.Value);
                        this.xQueryParameters.Add((object)"@ROWUSERID");
                        this.xQueryValues.Add((object)this.ROWUSERID);
                        this.xQueryParameters.Add((object)"@ROWSGXID");
                        this.xQueryValues.Add((object)this.ROWSGXID);
                        this.xQuery = this.xBase + "_DSI";
                        if (!DB.ExecuteNonQuery(this.xQuery, this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure))
                            ;
                        this.pnlConsulta.Visible = false;
                        this.pnlData.Visible = true;
                    }
                */

        protected void _Clean(object sender, EventArgs e)
        {
            this.txtFecha2.Value = string.Empty;
            this.txtFecha1.Value = string.Empty;
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
         
        protected void _Confirmar(object sender, EventArgs e)
        {
            int i = 0;
            HtmlInputCheckBox Seleccionado = new HtmlInputCheckBox();
            HtmlInputText textROWGUID = new HtmlInputText();
            foreach (RepeaterItem repeaterItem in this.rpData.Items)
            {
                Seleccionado = (HtmlInputCheckBox)repeaterItem.FindControl("ckmarca");
                textROWGUID = (HtmlInputText)repeaterItem.FindControl("textROWGUID");
                //TextBox OBJNombre =  (TextBox)repeaterItem.FindControl("textnombre");
                if (Seleccionado.Checked)
                {
                    i = i + 1;
                    //txtBuscar.Value = OBJNombre.Text.ToString();
                    _Save(textROWGUID.Value);
                }
        
                //txtBuscar.Value = i.ToString();
                //else
                //{
                //    txtBuscar.Value = "NO seleccionado";
                //}

            }
            this._IniciarFormulario();
            Notify("Cantidad de Citas Confirmadas: " + i.ToString(), "success");
            this._Show((object)null, (EventArgs)null);
        }

        public void Notify(string msg, string tipo)
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "notify('" + msg + "','" + tipo + "');", true);
        }

    }
}
