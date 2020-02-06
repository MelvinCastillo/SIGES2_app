// Decompiled with JetBrains decompiler
// Type: CAID.PAX00000_A
// Assembly: CAID, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null
// MVID: DACE6779-43A1-43CA-8F66-682269B28117
// Assembly location: C:\Users\user\Desktop\CAID.dll

using CAID.Data;
using System;
using System.Collections;
using System.Data;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace CAID_V2.forms
{
    public class AlertasPacientes : Page
    {
        protected HtmlInputText txtRecordNo;
        protected HtmlButton btnFilter2;
        protected DropDownList cmbPaciente;

        private ArrayList xQueryParameters = new ArrayList();
        private ArrayList xQueryValues = new ArrayList();
        private string xCommand;
        private string xQuery;
        protected Repeater rpPaxHeader;
        protected HtmlButton tbnAdd;
        protected Repeater rpHistorico;
        protected Panel MNTAUXILIAR;
        protected Panel tabsearchpaciente;
        protected HtmlButton btnCloseMSG;
        protected TextBox txtAlertas;
        protected HtmlButton btnSaveNotas;
        protected HtmlGenericControl MainShadow;
        protected TextBox txtACTIVIDAD;
        string Secuencia;
        DataTable dtusuarios = new DataTable();
        protected DropDownList ddlasistio; 

        private string ROWSGXID
        {
            get
            {
                return Request.QueryString["CURRENTUSR_SGXID"].ToString();
            }
        }
        private string CurrentUSR_ROWGUID
        {
            get
            {
                return Request.QueryString["CurrentUSR_ROWGUID"].ToString();
            }
        }


        private string SCREEN
        {
            get
            {
                return Request.QueryString["SCREEN"].ToString();  //this.Session["CURRENTUSR_ID"].ToString();
            }
        }
        
        




        private string xBase
        {
            get
            {
                return this.Page.GetType().BaseType.Name.ToString();
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.Page.IsPostBack)
            {
                _Iniciar(); 
            }
            /*
            if (Request.QueryString["CURRENTUSR_SGXID"] != null)
            {
                string CURRENTUSR_SGXID = Request.QueryString["CURRENTUSR_SGXID"].ToString();
            }

            //if (this.IsPostBack)
             //   return; 
            this.rpPaxHeader.DataSource = (object)DB.ExecuteAdapter(string.Format("PAX00000S5 @REFGUID = '{0}', @ROWSGXID = '{1}'", this.Session["CurrentPAX_ROWGUID"], this.Session["CURRENTUSR_SGXID"]));
            this.rpPaxHeader.DataBind();
            this.Validar();
            */
        }
        private void _Iniciar()
        {

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
            Page.LoadComplete += new EventHandler(Page_LoadComplete);
            this.rpHistorico.DataSource = (object)DB.ExecuteAdapter(string.Format("PR_IG_ALERTASHISTORICO @REFGUID = '{0}',@ROWUSERID = '{1}', @ROWSGXID = '{2}', @SCREEN = '{3}'", cmbPaciente.SelectedValue, CurrentUSR_ROWGUID, ROWSGXID, SCREEN));
            this.rpHistorico.DataBind();
            if (SCREEN == "FRONT")
            {
                //tabsearchpaciente.
                //CmbPaciente12.Visible = false;
                //txtRecordNo.Visible = false;
                //cmbPaciente.Visible = false;
                //btnFilter2.Visible = false;

                tabsearchpaciente.Visible = false;
                tbnAdd.Visible = false;
            }

        }
        void Page_LoadComplete(object sender, EventArgs e)
        {

            dtusuarios = DB.ExecuteAdapter(string.Format("select ROWGUID,ESPECIALIDADID from VUSUARIOS  where ROWGUID ='" + CurrentUSR_ROWGUID.ToString() + "' and ROWSGXID ='" + ROWSGXID.ToString() + "'", this.xQueryValues, CommandType.Text));
            if (dtusuarios.Rows[0]["ESPECIALIDADID"].ToString()  != "CAID-SD-HISCL-15")//grupal
            {
                // rpHistorico._ddlasistio.
                // rpHistorico.Items[5].Visible = false;
                //ddlasistio.Enabled = false;
                //ddlasistio.Visible = false;
                //this.txtObservacion.Enabled = false;
                //ddlasistio.Attributes.Add("disabled", "disabled");
                //ddlasistio.Style["display"] = "block";

                foreach (RepeaterItem repeaterItem in this.rpHistorico.Items)
                {
                    DropDownList OBJDATO = (DropDownList)repeaterItem.FindControl("ddlasistio");
                    // OBJDATO.Attributes.Add("disabled", "disabled");
                    OBJDATO.Visible = false;
                }

            }
        }
         

        protected void _Add(object sender, EventArgs e)
        {
            if (this.cmbPaciente.SelectedValue == string.Empty)
            {
                Notify("Debe seleccionar un paciente", "error");
                return;
            }

            this.MainShadow.Attributes.Add("class", "navi");
            this.MNTAUXILIAR.Visible = true;
        }

        protected void _Save(object sender, EventArgs e)
        {
            if (this.cmbPaciente.SelectedValue == string.Empty)
            {
                Notify("Debe seleccionar un paciente", "error");
                return;
            }

            // if (!Convert.ToBoolean(this.Session["CurrentUSR_ROLEDITAR"].ToString()))
            //    return;
            string str1 = this.txtAlertas.Text.Trim();
            string str2 = cmbPaciente.SelectedValue;
            string str3 = CurrentUSR_ROWGUID;
            string str4 = ROWSGXID;
            string str5 = this.txtACTIVIDAD.Text.Trim();
            if (!DB.ExecuteNonQuery(string.Format("[PR_IG_ALERTAS] '{0}','{1}','{2}','{3}','{4}'", (object)str1, (object)str2, (object)str3, (object)str4, (object)str5)))
                return;
            this.Validar();
            _CloseModal(sender, e);
        }

        protected void _CloseModal(object sender, EventArgs e)
        {
            this.MainShadow.Attributes.Remove("class");
            if (!this.MNTAUXILIAR.Visible)
                return;
            this.MNTAUXILIAR.Visible = false;
        }

        private void Validar()
        {
            if (this.cmbPaciente.SelectedValue == string.Empty)
            {
                Notify("Debe seleccionar un paciente", "error");
                return;
            }
            this.txtAlertas.Text = string.Empty;
            this.txtACTIVIDAD.Text = string.Empty;  
            this.rpHistorico.DataSource = (object)DB.ExecuteAdapter(string.Format("PR_IG_ALERTASHISTORICO @REFGUID = '{0}',@ROWUSERID = '{1}', @ROWSGXID = '{2}', @SCREEN = '{3}'", cmbPaciente.SelectedValue, CurrentUSR_ROWGUID, ROWSGXID, SCREEN));
            this.rpHistorico.DataBind();
            DataTable dataTable = DB.ExecuteAdapter(string.Format("PAX00000X1 @REFGUID = '{0}', @ROWSGXID = '{1}', @USERID = '{2}'", this.Session["CurrentPAX_ROWGUID"], this.Session["CURRENTUSR_SGXID"], this.Session["CurrentUSR_ROWGUID"]));
            if (dataTable.Rows.Count == 0)
                return;
            this.Session.Add("xHTML_Options", (object)dataTable.Rows[0]["HTML_Options"].ToString());
            // ((Site_Master) this.Master).Mostrar_Opciones_ActoMedico();
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
                this.cmbPaciente.DataBind();
                this.txtRecordNo.Value = string.Empty;
                Validar();
            }
            else
            //((Site_Master)this.Master)._Notify("Record No. " + upper.Trim() + " No Registrado");
            {
                cmbPaciente.SelectedValue = string.Empty;
                Notify("Record No. " + upper.Trim() + " No Registrado", "success");
            }

        }
        public void Notify(string msg, string tipo)
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "notify('" + msg + "','" + tipo + "');", true);
        }
        protected void _Back(object sender, EventArgs e)
        {
            this.Response.Redirect("http://caidsiges01:8000/INDEX.aspx");
        }


        protected void ddlasistio_SelectedIndexChanged(object sender, EventArgs e)
        {
            _saveAsistio(sender,e);
        }

        protected void _saveAsistio(object sender, EventArgs e)
        {
            this.xQueryParameters.Add("@ROWGUID");
            this.xQueryParameters.Add("@ASISTIO");
            this.xQueryParameters.Add("@ROWSGXID");

            foreach (RepeaterItem repeaterItem in this.rpHistorico.Items)
            {
                int num1 = 0;
                Label OBJCODIGO = (Label)repeaterItem.FindControl("lblCODIGO");
                DropDownList OBJDATO = (DropDownList)repeaterItem.FindControl("ddlasistio");
                //TextBox OBJTxtpuntuacion = (TextBox)repeaterItem.FindControl("Txtpuntuacion");
                //TextBox OBJObservacion = (TextBox)repeaterItem.FindControl("txtObservacion"); 
                this.xQueryValues.Clear();
                this.xQueryValues.Add(OBJCODIGO.Text.ToString());
                this.xQueryValues.Add(OBJDATO.Text.ToString());
                //this.xQueryValues.Add(PACIENTE.ToString());
                //this.xQueryValues.Add(OBJDATO.SelectedValue);
                //this.xQueryValues.Add(USUARIO.ToString());
                this.xQueryValues.Add((object)this.ROWSGXID);
                //this.xQueryValues.Add(OBJObservacion.Text.ToString());

                DataTable dataTable2 = DB.ExecuteAdapter("PR_REFERIMIENTOS_GUARDAR", this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure); if (dataTable2.Rows.Count != 0) ;

            }
        }
        protected void _Select(object sender, EventArgs e)
        {
            this.xCommand = ((LinkButton)sender).CommandName.ToString();
            string xGUID  = ((LinkButton)sender).CommandArgument.ToString();
            try
            { 
                if (this.xCommand == "Delete" )
                {
                    this.xQuery = "UPDATE ALERTAS_IG SET ESTADO ="+ "'I'"  +" where ROWGUID= '" + xGUID + "' and rowsgxid='" + ROWSGXID + "'";
                    if (DB.ExecuteNonQuery(this.xQuery, this.xQueryParameters, this.xQueryValues, CommandType.Text))
                    {
                        this.rpHistorico.DataSource = (object)DB.ExecuteAdapter(string.Format("PR_IG_ALERTASHISTORICO @REFGUID = '{0}',@ROWUSERID = '{1}', @ROWSGXID = '{2}', @SCREEN = '{3}'", cmbPaciente.SelectedValue, CurrentUSR_ROWGUID, ROWSGXID, SCREEN));
                        this.rpHistorico.DataBind();
                    }
                } 
            }
            catch
            {
            }
        }

    }

}
