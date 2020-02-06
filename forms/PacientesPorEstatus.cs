using CAID.Data;
using System;
using System.Collections;
using System.Data;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace CAID_V2.forms
{
    public class PacientesPorEstatus : Page
    {
        private ArrayList xQueryParameters = new ArrayList();
        private ArrayList xQueryValues = new ArrayList();
        private int RECORDID = -1;
        private string CATEGORIAID = string.Empty;
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
        protected DropDownList cmbAgenteSocial;
        protected RequiredFieldValidator valcmbAgenteSocial;
        //protected HtmlTextArea txtMotivoEstatus;

        private string xBase
        {
            get
            {
                return this.Page.GetType().BaseType.Name.ToString();
            }
        }

        private string AgenteSocial
        {
            get
            {
                return this.cmbAgenteSocial.SelectedValue.ToString().Trim().ToUpper();
            }
            set
            {
                this.cmbAgenteSocial.SelectedValue.ToString().Trim().ToUpper();
            }
        }

        //private string MOTIVOESTATUS
        //{
        //    get
        //    {
        //        return this.txtMotivoEstatus.Value.ToString().Trim().ToUpper();
        //    }
        //}

        private string ROWGUID
        {
            get
            {
                return this.xGUID.Value.ToString().ToUpper();
            }
        }


        private string ROWSGXID
        {
            get
            {
                //return this.Session["CURRENTUSR_SGXID"].ToString(); 
                return Request.QueryString["CURRENTUSR_SGXID"].ToString();
                       
                     
            }
        }

        private string ROOTDIRECTORY
        {
            get
            {
                return this.Server.MapPath(".\\records\\") + this.ROWGUID;
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            // if (this.Session["CURRENTUSR_ID"].ToString().Trim() == string.Empty)
            //  this.Response.Redirect("login.aspx");
            //  ((Site_Master) this.Master)._ValidaAccesoPagina(this.xBase + ".aspx");
            
            if (this.Page.IsPostBack)
                return;
            this.Session["TOP"] = (object)"100000000";
            this.xGUID.Value = Guid.NewGuid().ToString().ToUpper();
            this.btnNew.Visible = false;
            this.btnShow.Visible = true; //Convert.ToBoolean(this.Session["CURRENTUSR_fnIMRIMIR"].ToString());
            this.btnSave.Visible = true; //Convert.ToBoolean(this.Session["CURRENTUSR_fnCREAR"].ToString()) || Convert.ToBoolean(this.Session["CURRENTUSR_fnMODIFICAR"].ToString());
            this.btnBack.Visible = true; // Convert.ToBoolean(this.Session["CURRENTUSR_fnMODIFICAR"].ToString());
            this._Iniciar();
        }

        private void _Iniciar()
        {
            this.xQueryParameters.Clear();
            this.xQueryValues.Clear();
            this.xQueryParameters.Add((object)"@ROWSGXID");
            this.xQueryValues.Add((object)this.ROWSGXID);
            //if (this.Session["CURRENTUSR_SGXID1"].ToString().Trim() =="")
            if (ROWSGXID.ToString() !="")
             Session.Add("CURRENTUSR_SGXID1", this.ROWSGXID);

            this.xQueryParameters.Add((object)"@ROLID");
            this.xQueryValues.Add((object)"AGENTSOC-CAID-SD");
            this.cmbAgenteSocial.Items.Add(new ListItem("-- SELECCIONE --", string.Empty));

            foreach (DataRow row in (InternalDataCollectionBase)DB.ExecuteAdapter("SGX00100S1_USUARIOSXROLES", this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure).Rows)
                this.cmbAgenteSocial.Items.Add(new ListItem(row["NOMBRE"].ToString(), row["NOMBRE"].ToString()));
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
                this.xQuery = "PAX00000S2";
                DataTable dataTable = DB.ExecuteAdapter(this.xQuery, this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure);
                DataRow dataRow = dataTable.Rows.Count != 0 ? dataTable.Rows[0] : (DataRow)null;
                if (dataRow == null)
                    return;
                this.cmbAgenteSocial.SelectedValue = dataRow["ESTATUS"].ToString();
                // this.txtMotivoEstatus.Value = dataRow["MOTIVOESTATUS"].ToString();
                this.pnlConsulta.Visible = false;
                this.pnlData.Visible = true;
            }
        }

        private void _IniciarControles()
        {
            //this.txtMotivoEstatus.Value = string.Empty;
            this.cmbAgenteSocial.SelectedValue = string.Empty;
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
                this.Response.Redirect(this.xBase + ".aspx?CURRENTUSR_SGXID="+ this.Session["CURRENTUSR_SGXID1"].ToString());
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
            this.xQueryParameters.Add((object)"@TOP");
            this.xQueryValues.Add((object)this.Session["TOP"].ToString());
            this.xQueryParameters.Add((object)"@ROWSGXID");
            this.xQueryValues.Add((object)this.ROWSGXID);
            this.xQuery = "PAX00000S7";
            this.rpData.DataSource = (object)DB.ExecuteAdapter(this.xQuery, this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure);
            this.rpData.DataBind();
            if (this.rpData.Items.Count == 0)
                return;
            this.Session["TOP"] = (object)(Convert.ToInt32(this.Session["TOP"].ToString()) + 100).ToString();
        }

        protected void _Select(object sender, EventArgs e)
        {
            this.xCommand = ((LinkButton)sender).CommandName.ToString();
            this.xGUID.Value = ((LinkButton)sender).CommandArgument.ToString();
            try
            {
                if (this.xCommand == "Edit")
                {
                    this.Response.Redirect(this.xBase + ".aspx?X=" + this.ROWGUID + "&CURRENTUSR_SGXID=" + this.ROWSGXID);
                }

            }
            catch
            {
            }
        }

        protected void _Save(object sender, EventArgs e)
        {
            if (cmbAgenteSocial.SelectedValue != "")
            {
                AgenteSocial = cmbAgenteSocial.SelectedValue;
                this.xQueryParameters.Clear();
                this.xQueryValues.Clear(); 
                this.xQueryParameters.Add((object)"@ROWSGXID");
                this.xQueryValues.Add((object)this.ROWSGXID);
                this.xQueryParameters.Add((object)"@PACIENTE");
                this.xQueryValues.Add((object)this.ROWGUID);
                this.xQueryParameters.Add((object)"@AGENTESOCIALID");
                this.xQueryValues.Add((object)this.AgenteSocial);
                this.xQuery = "PR_ACTUALIZAAGENTESOCIAL";
                if (!DB.ExecuteNonQuery(this.xQuery, this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure))
                    return;
                // ((Site_Master) this.Master)._Notify("Estatus actualizado!");
                //this._Show((object)null, (EventArgs)null);
                _IniciarFormulario();
            }
        }

        protected void _Cancel(object sender, EventArgs e)
        {
            this._IniciarControles();
        }

        protected void _Back(object sender, EventArgs e)
        {
            this.Response.Redirect(this.xBase + ".aspx?CURRENTUSR_SGXID="+ this.Session["CURRENTUSR_SGXID1"].ToString().Trim());
        }
        protected void _Back2(object sender, EventArgs e)
        {
            this.Response.Redirect("http://caidsiges01:8000/index.aspx");
        }



    }
}
