// Decompiled with JetBrains decompiler
// Type: CAID.PAX00000
// Assembly: CAID, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null
// MVID: DACE6779-43A1-43CA-8F66-682269B28117
// Assembly location: C:\Users\user\Desktop\CAID.dll

using CAID.Data;
using CAID.Entity;
using System;
using System.Collections;
using System.Data;
using System.IO;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace CAID
{
    public class TardanzasyAusencias2 : Page
    {
        private ArrayList xQueryParameters = new ArrayList();
        private ArrayList xQueryValues = new ArrayList();
        //private int RECORDID = -1;
        //private int AGENTSOCIALID = -1;
        //private int MEDICOID = -1;
        //private int TERAPISTAID = -1;
        private string xCommand;
        private string xQuery;
        protected HiddenField xGUID;
        protected Panel pnlConsulta;
        protected HtmlInputText txtBuscar;
        protected HtmlButton btnShow;
        protected HtmlButton btnNew;
        protected Repeater rpData;
        protected Panel pnlData;
        protected HtmlButton btnSave;
        protected HtmlButton btnCancel;
        protected HtmlButton btnBack;

        protected DropDownList CmbPaciente;
        protected RequiredFieldValidator valcmbPaciente;

        protected HtmlSelect CmbTipo;
        protected RequiredFieldValidator valCmbTipo1;

        protected HtmlSelect CmbEsJustificada;
        protected RequiredFieldValidator valCmbEsJustificada;

        protected HtmlInputText txtFecha;
        protected RequiredFieldValidator valtxtFecha;

        protected HtmlInputText TxtQuienLlamo;
        protected RequiredFieldValidator valTxtQuienLlamo;

        protected HtmlTextArea TxtMotivo;
        protected RequiredFieldValidator valTxtMotivo;

        protected DropDownList dpservicio;
        protected RequiredFieldValidator valdpservicio;


        private string xBase
        {
            get
            {
                return this.Page.GetType().BaseType.Name.ToString();
            }
        }

        private string Paciente
        {
            get
            {
                return this.CmbPaciente.SelectedValue.ToString().Trim().ToUpper();
            }
        }



        private string servicio
        {
            get
            {
                return this.dpservicio.SelectedValue.ToString().Trim().ToUpper();
            }
        }

        private string Tipo
        {
            get
            {
                return this.CmbTipo.Value.ToString().Trim().ToUpper();
            }
        }

        private string EsJustificada
        {
            get
            {
                return this.CmbEsJustificada.Value.ToString().Trim().ToUpper();
            }
        } 

        private  string Fecha
        {
            get
            {
                return this.txtFecha.Value.ToString().Trim().ToUpper(); 
            }
        }

        private string QuienLlamo
        {
            get
            {

                return this.TxtQuienLlamo.Value.ToString().Trim().ToUpper();
            }
        }

        private string Motivo
        {
            get
            {
                return this.TxtMotivo.Value.ToString().Trim().ToUpper();
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
                return Request.QueryString["USUARIO"].ToString();  //this.Session["CURRENTUSR_ID"].ToString();
            }
        }

        private string ROWSGXID
        {
            get
            {

                return Request.QueryString["LOCALIDAD"].ToString(); //this.Session["CURRENTUSR_SGXID"].ToString();
            }
        }
        /*
            private string ROOTDIRECTORY
            {
              get
              {
                return this.Server.MapPath(".\\records\\") + this.ROWGUID;
              }
            }
        */
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (String.IsNullOrEmpty(Request.QueryString["LOCALIDAD"]))
                {
                    this.Response.Redirect("http://caidsiges01:8000/index.aspx");
                }
                if (String.IsNullOrEmpty(Request.QueryString["USUARIO"]))
                {
                    this.Response.Redirect("http://caidsiges01:8000/index.aspx"); 
                }
                _FillPaciente();
                _FillServicio();
                this._Iniciar();
                this.xGUID.Value = Guid.NewGuid().ToString().ToUpper();
            }
           
            //if (this.Session["CURRENTUSR_ID"].ToString().Trim() == string.Empty)
            //    this.Response.Redirect("login.aspx");
            //((Site_Master)this.Master)._ValidaAccesoPagina(this.xBase + ".aspx");
            //if (this.Page.IsPostBack)
            //    return;
            //this.Session["TOP"] = (object)"100";

            //this.btnNew.Visible = Convert.ToBoolean(this.Session["CURRENTUSR_fnCREAR"].ToString());
            //this.btnShow.Visible = Convert.ToBoolean(this.Session["CURRENTUSR_fnIMRIMIR"].ToString());
            //this.btnSave.Visible = Convert.ToBoolean(this.Session["CURRENTUSR_fnCREAR"].ToString()) || Convert.ToBoolean(this.Session["CURRENTUSR_fnMODIFICAR"].ToString());
            //this.btnBack.Visible = Convert.ToBoolean(this.Session["CURRENTUSR_fnMODIFICAR"].ToString());

        }

        private void _Iniciar()
        {
            this.xQueryParameters.Clear();
            this.xQueryValues.Clear();
            this.xQueryParameters.Add((object)"@NOMBRE");
            this.xQueryValues.Add((object)"%");
            this.xQueryParameters.Add((object)"@ROWSGXID");
            this.xQueryValues.Add((object)this.ROWSGXID);
            string str = this.Request.QueryString["X"];
            if ((str == null) || (str == ""))
            {
                this.xGUID.Value = Guid.NewGuid().ToString().ToUpper();
                this.pnlConsulta.Visible = true;
                this.pnlData.Visible = false;
                this.rpData.DataSource = (object)null;
                this.rpData.DataBind();
                this._IniciarControles();
            }
            else if (str == "DATA")
            {
                this._Show((object)null, (EventArgs)null);
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
                //this.xQuery = this.xBase + "S2";
                this.xQuery = this.xBase + "?USUARIO=" + ROWUSERID + "&LOCALIDAD=" + ROWSGXID;
                DataTable dataTable = DB.ExecuteAdapter(this.xQuery, this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure);
                DataRow dataRow = dataTable.Rows.Count != 0 ? dataTable.Rows[0] : (DataRow)null;
                if (dataRow == null)
                    return;


                /*
                this.txtNombre1.Value = dataRow["NOMBRE1"].ToString();
                this.txtNombre2.Value = dataRow["NOMBRE2"].ToString();
                this.txtApellido1.Value = dataRow["APELLIDO1"].ToString();
                this.txtApellido2.Value = dataRow["APELLIDO2"].ToString();
                this.txtApodo.Value = dataRow["APODO"].ToString();
                this.cmbSexo.Value = dataRow["SEXOID"].ToString();
                this.txtNSS.Value = dataRow["NSSID"].ToString();
                this.txtFechaNace.Value = Convert.ToDateTime(dataRow["FNACE"].ToString()).ToString("MM/dd/yyyy");
                this.cmbPais.SelectedValue = dataRow["PAISID"].ToString();
                this._FillCiudades();
                this.cmbCiudad.Value = dataRow["CIUDADID"].ToString();
                this.cmbCondicion.Value = dataRow["COINDICION"].ToString();
                this.cmbResideCon.Value = dataRow["RESIDECON"].ToString();
                this.txtResideCon.Value = dataRow["RESIDECON1"].ToString();
                this.cmbCuidadoPor.Value = dataRow["CUIDADOPOR"].ToString();
                this.txtCuidadoPor.Value = dataRow["CUIDADOPOR1"].ToString();
                this.cmbARS.Value = dataRow["ARSID"].ToString();
                this.cmbPREDIAGNOSTICO.Value = dataRow["PREDIAGNOSTICO"].ToString();
                this.txtOtrosPrediagnostico.Value = dataRow["OTROSPREDIAGNOSTICO"].ToString();
                this.cmbCategoria.Value = dataRow["CATEGORIAID"].ToString();
                */
                this.pnlConsulta.Visible = false;
                this.pnlData.Visible = true;
            }
        }

        private void _IniciarControles()
        {
            this.CmbPaciente.SelectedValue = string.Empty;
            this.txtFecha.Value = string.Empty;
            this.TxtMotivo.Value = string.Empty;
            this.TxtQuienLlamo.Value = string.Empty;
            this.CmbTipo.Value = string.Empty;

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
                this.Response.Redirect(this.xBase + ".aspx");
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
            this.Response.Redirect(this.xBase + "R1.aspx");
        }

        protected void _Show(object sender, EventArgs e)
        {
            this.pnlConsulta.Visible = true;
            this.pnlData.Visible = false;
            this.xQueryParameters.Clear();
            this.xQueryValues.Clear();
            this.xQueryParameters.Add((object)"@NOMBRE");
            this.xQueryValues.Add((object)this.txtBuscar.Value.ToString());
            //this.xQueryParameters.Add((object) "@TOP");
            //this.xQueryValues.Add((object) this.Session["TOP"].ToString());
            this.xQueryParameters.Add((object)"@ROWSGXID");
            this.xQueryValues.Add((object)this.ROWSGXID);
            this.xQuery = "PR_TardanzasyAusencias_Busca";
            this.rpData.DataSource = (object)DB.ExecuteAdapter(this.xQuery, this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure);
            this.rpData.DataBind();
            if (this.rpData.Items.Count == 0)
                return;
            //this.Session["TOP"] = (object) (Convert.ToInt32(this.Session["TOP"].ToString()) + 100).ToString();
        }

        protected void _Select(object sender, EventArgs e)
        {
            this.xCommand = ((LinkButton)sender).CommandName.ToString();
            this.xGUID.Value = ((LinkButton)sender).CommandArgument.ToString();
            try
            {
                //    if (this.xCommand == "Edit")
                //    {
                //        if (!Convert.ToBoolean(this.Session["CURRENTUSR_fnMODIFICAR"].ToString()))
                //            return;
                //        this.Response.Redirect(this.xBase + ".aspx?X=" + this.ROWGUID);
                //    }
                //    if (this.xCommand == "Delete" && Convert.ToBoolean(this.Session["CURRENTUSR_fnELIMINAR"].ToString()))
                //    {
                this.xQueryParameters.Clear();
                this.xQueryValues.Clear();
                this.xQueryParameters.Add((object)"@ROWGUID");
                this.xQueryValues.Add((object)this.ROWGUID);
                this.xQueryParameters.Add((object)"@ROWUSERID");
                this.xQueryValues.Add((object)this.ROWUSERID);
                this.xQueryParameters.Add((object)"@ROWSGXID");
                this.xQueryValues.Add((object)this.ROWSGXID);
                this.xQuery = "Delete from TardanzasyAusencias where id= '" + ROWGUID + "' and sucursal='" + ROWSGXID + "'";
                if (DB.ExecuteNonQuery(this.xQuery, this.xQueryParameters, this.xQueryValues, CommandType.Text))
                    this._Show((object)null, (EventArgs)null);
                //}
            }
            catch
            {
            }
        }

        protected void _Save(object sender, EventArgs e)
        {
            this.xQueryParameters.Clear();
            this.xQueryValues.Clear();

            this.xQueryParameters.Add((object)"@id");
            this.xQueryValues.Add((object)this.xGUID.Value);
            this.xQueryParameters.Add((object)"@Idpaciente");
            this.xQueryValues.Add((object)this.Paciente);
            this.xQueryParameters.Add((object)"@Fecha");
            this.xQueryValues.Add((object)this.Fecha);
            this.xQueryParameters.Add((object)"@QuienLLamo");
            this.xQueryValues.Add((object)this.QuienLlamo);
            this.xQueryParameters.Add((object)"@EsJustificada");
            this.xQueryValues.Add((object)this.EsJustificada);
            this.xQueryParameters.Add((object)"@Tipo");
            this.xQueryValues.Add((object)this.Tipo);
            this.xQueryParameters.Add((object)"@MotivoDispensa");
            this.xQueryValues.Add((object)this.Motivo);
            this.xQueryParameters.Add((object)"@Sucursal");
            this.xQueryValues.Add((object)this.ROWSGXID);
            this.xQueryParameters.Add((object)"@Usuario");
            this.xQueryValues.Add((object)this.ROWUSERID);
            this.xQueryParameters.Add((object)"@servicio");
            this.xQueryValues.Add((object)this.servicio);

            this.xQuery = "PR_TardanzasyAusencias";

            if (!DB.ExecuteNonQuery(this.xQuery, this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure))
                return;
            try
            {
                txtBuscar.Value = CmbPaciente.SelectedItem.ToString();
                /* if (!Directory.Exists(this.ROOTDIRECTORY))
                   Directory.CreateDirectory(this.ROOTDIRECTORY);
                   */
                Notify(CmbTipo.Value+ " " + dpservicio.SelectedItem.Text  + " Guardada", "success");
            }
            catch
            {
            }
            //this._IniciarFormulario();
        }

        protected void _Cancel(object sender, EventArgs e)
        {
            this._IniciarControles();
        }

        protected void _Back(object sender, EventArgs e)
        {
            if (Paciente.ToString() != "")
            {
                this._IniciarFormulario(); 
                this.Response.Redirect(this.xBase + ".aspx?X=" + Paciente + "&USUARIO=" + ROWUSERID + "&LOCALIDAD=" + ROWSGXID);
            }
            else
                this.Response.Redirect(this.xBase + ".aspx?USUARIO=" + ROWUSERID + "&LOCALIDAD=" + ROWSGXID);

        }

        //protected void CmbPaciente_SelectedIndexChanged(object sender, EventArgs e)
        //{
        //  //this._FillCiudades()
        //}

        protected void _OpenModalNF(object sender, EventArgs e)
        {
            // ((Site_Master) this.Master)._OpenPAX00001(this.ROWGUID, Guid.NewGuid().ToString().ToUpper());
        }

        protected void _OpenModalDirecciones(object sender, EventArgs e)
        {
            //((Site_Master) this.Master)._OpenSMX00100(this.ROWGUID, Guid.NewGuid().ToString().ToUpper());
        }
        private void _FillPaciente()
        {
            try
            {
                this.xQueryParameters.Add((object)"@NOMBRE");
                this.xQueryValues.Add((object)"%");
                this.xQueryParameters.Add((object)"@ROWSGXID");
                this.xQueryValues.Add(ROWSGXID);
                this.CmbPaciente.Items.Add(new ListItem("-- SELECCIONE --", string.Empty));
                foreach (DataRow row in (InternalDataCollectionBase)DB.ExecuteAdapter("PR_BUSCAPACIENTES", this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure).Rows)
                    this.CmbPaciente.Items.Add(new ListItem(row["FULLNAME"].ToString(), row["ROWGUID"].ToString()));
            }
            catch
            {
            }
        }
        private void _FillServicio()
        {
            try
            {
                this.xQueryParameters.Clear();
                this.xQueryValues.Clear();
                this.xQueryParameters.Add((object)"@NOMBRE");
                this.xQueryValues.Add((object)"%");
                this.xQueryParameters.Add((object)"@ROWSGXID");
                this.xQueryValues.Add(ROWSGXID);
                this.dpservicio.Items.Add(new ListItem("-- SELECCIONE --", string.Empty));
                foreach (DataRow row in (InternalDataCollectionBase)DB.ExecuteAdapter("SELECT * FROM vSERVICIOS_CONSULTA ORDER BY NOMBRE", this.xQueryParameters, this.xQueryValues, CommandType.Text).Rows)
                    this.dpservicio.Items.Add(new ListItem(row["NOMBRE"].ToString(), row["ROWGUID"].ToString()));
            }
            catch
            {
            }
        }
        public void Notify(string msg, string tipo)
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "notify('" + msg + "','" + tipo + "');", true);

        }

    }
}
