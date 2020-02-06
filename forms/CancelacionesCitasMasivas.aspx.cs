/*using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;try
using System.Web.UI.WebControls;

namespace CAID_V2.forms
{
    public partial class CancelacionesCitasMasivas : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
    }
}*/

using CAID.Data;
using System;
using System.Collections;
using System.Data;
using System.Globalization;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace CAID_V2.forms
{
    public partial class CancelacionesCitasMasivas : Page
    {
        private ArrayList xQueryParameters = new ArrayList();
        private ArrayList xQueryValues = new ArrayList();
        private string xCommand;
        private string xQuery;
        protected HiddenField xGUID;
        protected HtmlButton btnSave;
        protected HtmlButton btnEditar;
        protected HtmlButton btnCancel;
        protected HtmlButton btnBack;

        /*
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
protected Repeater rpPaxHeader;

protected DropDownList cmbPaciente;
protected RequiredFieldValidator RequiredFieldValidator1;
protected HtmlInputText txtFechaIni;
protected RequiredFieldValidator RequiredFieldValidator2;
protected HtmlInputText txtCant;
protected DropDownList cmbOrigenTratamiento;
protected RequiredFieldValidator RequiredFieldValidator3;
protected DropDownList cmbTerapista;
protected RequiredFieldValidator RequiredFieldValidator5;
protected HtmlSelect cmbHorario;
protected RequiredFieldValidator cmbHorario1;
protected TextBox txtParticipantes;
protected TextBox txtObservacion;
*/

        private string xBase
        {
            get
            {
                return this.Page.GetType().BaseType.Name.ToString();
            }
        }



        private string MEDID
        {
            get
            {
                return string.Empty;
            }
        }

        private string TERID
        {
            get
            {
                return this.cmbTerapista.SelectedValue.ToString().Trim().ToUpper();
            }
        }

        private string ENFID
        {
            get
            {
                return string.Empty;
            }
        }

        private string ORIGENID
        {
            get
            {
                return this.cmbOrigenTratamiento.SelectedValue.ToString().Trim().ToUpper();
            }
        }

        //private string DETALLES
        //{
        //    get
        //    {
        //        return this.txtParticipantes.Text.Trim().ToString();
        //    }
        //}

        private string FECHAINICIO
        {
            get
            {
                return this.txtFechaIni.Value.ToString();
            }
        }

        private string FECHAFIN
        {
            get
            {
                return this.txtFechaFin.Value.ToString();
            }
        }

        private string HORAINICIO
        {
            get
            {
                return this.txtHoraIni.Value.ToString().ToUpper();
            }
        }

        private string HORAFIN
        {
            get
            {
                return this.txtHoraFin.Value.ToString().ToUpper();
            }
        }

        private string OBSERVACION
        {
            get
            {
                return this.txtObservacion.Text.ToString().ToUpper();
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

            if (String.IsNullOrEmpty(Request.QueryString["CURRENTUSR_SGXID"]))
                this.Response.Redirect("http://caidsiges01:8000/login.aspx");
            /*
            ((Site_Master)this.Master)._ValidaAccesoPagina(this.xBase + ".aspx");
            */
            if (this.Page.IsPostBack)
                return;
            /* this.xGUID.Value = Guid.NewGuid().ToString().ToUpper();
             this.btnSave.Visible = Convert.ToBoolean(this.Session["CURRENTUSR_fnCREAR"].ToString()) || Convert.ToBoolean(this.Session["CURRENTUSR_fnMODIFICAR"].ToString());
             this.btnBack.Visible = Convert.ToBoolean(this.Session["CURRENTUSR_fnMODIFICAR"].ToString());
             */
            this._Iniciar();

        }

        private void _Iniciar()
        {

            this.xQueryParameters.Clear();
            this.xQueryValues.Clear();
            this.xQueryParameters.Add((object)"@NOMBRE");
            this.xQueryValues.Add((object)"%");
            this.xQueryParameters.Add((object)"@ROWSGXID");
            this.xQueryValues.Add((object)this.ROWSGXID);

            this.cmbOrigenTratamiento.Items.Clear();
            this.cmbOrigenTratamiento.Items.Add(new ListItem("-- SELECCIONE --", string.Empty));
            foreach (DataRow row in (InternalDataCollectionBase)DB.ExecuteAdapter("SMX30014S1", this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure).Rows)
                this.cmbOrigenTratamiento.Items.Add(new ListItem(row["NOMBRE"].ToString(), row["ROWGUID"].ToString()));
            this.cmbTerapista.Items.Clear();
            this.cmbTerapista.Items.Add(new ListItem("-- SELECCIONE --", string.Empty));
            this.xQueryParameters.Clear();
            this.xQueryValues.Clear();
            this.xQueryParameters.Add((object)"@NOMBRE");
            this.xQueryValues.Add((object)"%");
            this.xQueryParameters.Add((object)"@ROWSGXID");
            this.xQueryValues.Add((object)this.ROWSGXID);

            /*
            if (this.Request.QueryString["X"] == null)
            {
                this.xGUID.Value = Guid.NewGuid().ToString().ToUpper();
                this.pnlConsulta.Visible = true;
                this.pnlData.Visible = false;
                this._Show((object)null, (EventArgs)null);
                this.rpData.DataSource = (object)null;
                this.rpData.DataBind();
                this._IniciarControles();
                this.btnSave.Visible = true;
                this.btnEditar.Visible = false;
            }
            else
            {
                this.btnSave.Visible = false;
                this.btnEditar.Visible = true;
                string str = this.Request.QueryString["X"];
                this.xQueryParameters.Clear();
                this.xQueryValues.Clear();
                this.xQueryParameters.Add((object)"@TIPOGUID");
                this.xQueryValues.Add((object)str);
                this.xQueryParameters.Add((object)"@ROWSGXID");
                this.xQueryValues.Add((object)this.ROWSGXID);
                this.xQuery = this.xBase + "S2";
                DataTable dataTable = DB.ExecuteAdapter(this.xQuery, this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure);
                DataRow dataRow = dataTable.Rows.Count != 0 ? dataTable.Rows[0] : (DataRow)null;
                if (dataRow == null)
                    return;
                this.cmbPaciente.SelectedValue = dataRow["REFGUID"].ToString();
                this.cmbPaciente_SelectedIndexChanged((object)null, (EventArgs)null);
                this.cmbOrigenTratamiento.SelectedValue = dataRow["ORIGENID"].ToString();
                this.cmbOrigenTratamiento_SelectedIndexChanged((object)null, (EventArgs)null);
                this.cmbTerapista.SelectedValue = dataRow["TERID"].ToString();
                this.cmbTerapista_SelectedIndexChanged((object)null, (EventArgs)null);
                this.txtCant.Value = Convert.ToString(dataTable.Rows.Count);
                this.txtFechaIni.Value = Convert.ToDateTime(dataRow["FECHAINI"].ToString()).ToString("MM/dd/yyyy");
                this.txtParticipantes.Text = dataRow["DETALLES"].ToString();
                this.txtObservacion.Text = dataRow["OBSERVACION"].ToString();
                this.cmbHorario.Value = dataRow["HORAORDINAL"].ToString();
                this.cmbPaciente.Enabled = false;
                this.cmbOrigenTratamiento.Enabled = false;
                this.txtCant.Disabled = true;
                this.pnlConsulta.Visible = false;
                this.pnlData.Visible = true;
            }*/
        }

        private void _IniciarControles()
        {
            this.xGUID.Value = Guid.NewGuid().ToString().ToUpper();
            this.cmbOrigenTratamiento.SelectedValue = string.Empty;
            this.cmbTerapista.SelectedValue = string.Empty;
            this.txtFechaIni.Value = string.Empty;
            this.txtFechaFin.Value = string.Empty;
            this.txtHoraIni.Value = string.Empty;
            this.txtHoraFin.Value = string.Empty;
            this.txtObservacion.Text = string.Empty;
        }

        private void _IniciarFormulario()
        {
            if (this.Request.QueryString["X"] == null)
            {
                this.xGUID.Value = Guid.NewGuid().ToString().ToUpper();
                this._IniciarControles();
            }
            else
                this.Response.Redirect(this.xBase + ".aspx");
            this._Show((object)null, (EventArgs)null);
        }

        protected void _Select(object sender, EventArgs e)
        {
            this.xCommand = ((LinkButton)sender).CommandName.ToString();
            string str = ((LinkButton)sender).CommandArgument.ToString();
            try
            {
                if (this.xCommand == "Edit")
                {
                    if (!Convert.ToBoolean(this.Session["CURRENTUSR_fnMODIFICAR"].ToString()))
                        return;
                    this.Response.Redirect(this.xBase + ".aspx?X=" + str);
                }
                if (this.xCommand == "Delete")
                {
                    this.xQueryParameters.Clear();
                    this.xQueryValues.Clear();
                    this.xQueryParameters.Add((object)"@TIPOGUID");
                    this.xQueryValues.Add((object)str);
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

        protected void _Export(object sender, EventArgs e)
        {
        }

        protected void _Show(object sender, EventArgs e)
        {
            this.xQueryParameters.Clear();
            this.xQueryValues.Clear();
            this.xQueryParameters.Add((object)"@ROWSGXID");
            this.xQueryValues.Add((object)this.ROWSGXID);
            this.xQuery = "SMX00501S1";
        }

        protected void _New(object sender, EventArgs e)
        {
            this._IniciarControles();
            this.btnSave.Visible = true;
            this.btnEditar.Visible = false;
        }

        /*protected void _Editar(object sender, EventArgs e)
        {
            string str = this.Request.QueryString["X"];
            this.xQueryParameters.Clear();
            this.xQueryValues.Clear();
            this.xQueryParameters.Add((object)"@TIPOGUID");
            this.xQueryValues.Add((object)str);
            this.xQueryParameters.Add((object)"@ROWSGXID");
            this.xQueryValues.Add((object)this.ROWSGXID);
            this.xQuery = this.xBase + "S2";
            DataTable dataTable = DB.ExecuteAdapter(this.xQuery, this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure);
            
            string[] strArray = this.FECHAINI.Split('/');
            DateTime dateTime = new DateTime(Convert.ToInt32(strArray[2]), Convert.ToInt32(strArray[0]), Convert.ToInt32(strArray[1]));
            for (int index = 0; index <= num - 1; ++index)
            {
                this.xQueryParameters.Clear();
                this.xQueryValues.Clear();
                this.xQueryParameters.Add((object)"@TERID");
                this.xQueryValues.Add((object)this.TERID);
                this.xQueryParameters.Add((object)"@FECHAINI");
                this.xQueryValues.Add((object)dateTime.ToString("MM/dd/yyyy"));
                this.xQueryParameters.Add((object)"@HORAORDINAL");
                this.xQueryValues.Add((object)this.HORAORDINAL);
                this.xQueryParameters.Add((object)"@OBSERVACION");
                this.xQueryValues.Add((object)this.OBSERVACION);
                this.xQueryParameters.Add((object)"@ROWGUID");
                this.xQueryValues.Add((object)dataTable.Rows[index]["ROWGUID"].ToString());
                this.xQueryParameters.Add((object)"@ROWUSERID");
                this.xQueryValues.Add((object)this.ROWUSERID);
                this.xQueryParameters.Add((object)"@ROWSGXID");
                this.xQueryValues.Add((object)this.ROWSGXID);
                this.xQueryParameters.Add((object)"@DETALLES");
                this.xQueryValues.Add((object)this.DETALLES);
                this.xQuery = "SMX00501S3";
                DB.ExecuteNonQuery(this.xQuery, this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure);
                dateTime = dateTime.AddDays(7.0);
            }
            this._IniciarFormulario();
        }
         */

        /*  protected void cmbTerapista_SelectedIndexChanged(object sender, EventArgs e)
          {
              this.cmbHorario.Items.Clear();
              this.cmbHorario.Items.Add(new ListItem("-- SELECCIONE --", string.Empty));
              foreach (DataRow row in (InternalDataCollectionBase)DB.ExecuteAdapter(string.Format("[SMX10050P2] @TERID = '{0}',@FECHA = '{1}'", (object)this.TERID, (object)this.FECHAINI)).Rows)
                  this.cmbHorario.Items.Add(new ListItem(row["HoraDescripcion"].ToString(), row["Numero_Ordinal"].ToString()));
          }*/

        protected void cmbOrigenTratamiento_SelectedIndexChanged(object sender, EventArgs e)
        {
            this.xQueryParameters.Clear();
            this.xQueryValues.Clear();
            this.xQueryParameters.Add((object)"@NOMBRE");
            this.xQueryValues.Add((object)"%");
            this.xQueryParameters.Add((object)"@ROWSGXID");
            this.xQueryValues.Add((object)this.ROWSGXID);
            this.xQueryParameters.Add((object)"@ClaseID");
            this.xQueryValues.Add((object)0);
            this.xQueryParameters.Add((object)"@ESPECIALIDADID");
            this.xQueryValues.Add((object)this.ORIGENID);
            this.cmbTerapista.Items.Clear();
            this.cmbTerapista.Items.Add(new ListItem("-- SELECCIONE --", string.Empty));
            foreach (DataRow row in (InternalDataCollectionBase)DB.ExecuteAdapter("SMX00300S4", this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure).Rows)
                this.cmbTerapista.Items.Add(new ListItem(row["FULLNAME"].ToString(), row["ROWGUID"].ToString()));
        }

        protected void _Save(object sender, EventArgs e)
        {
            var FECHAINICIO = "";
            var FECHAFIN = "";

            try
            {
                FECHAINICIO = FormatDate(this.FECHAINICIO);
            }
            catch (Exception ex)
            {
                txtObservacion.Text = ex.Message;
                Notify("Verifique el formato Fecha Inicio", "error");
                return; 
            }
            try
            {
                FECHAFIN = FormatDate(this.FECHAFIN);
            }
            catch
            {
                Notify("Verifique el formato Fecha Final", "error");
                return;
            }

            //var FECHAFIN = FormatDate(this.FECHAFIN); 

            this.xQueryParameters.Clear();
            this.xQueryValues.Clear();
            this.xQueryParameters.Add((object)"@ORIGENID");
            this.xQueryValues.Add((object)this.ORIGENID);

            this.xQueryParameters.Add((object)"@TERID");
            this.xQueryValues.Add((object)this.TERID);

            this.xQueryParameters.Add((object)"@FECHAINICIO");
            this.xQueryValues.Add((object)FECHAINICIO.ToString());

            this.xQueryParameters.Add((object)"@FECHAFIN");
            this.xQueryValues.Add((object)FECHAFIN.ToString());

            this.xQueryParameters.Add((object)"@HORAINICIO");
            this.xQueryValues.Add((object)this.HORAINICIO.ToString());


            this.xQueryParameters.Add((object)"@HORAFIN");
            this.xQueryValues.Add((object)this.HORAFIN.ToString());

            this.xQueryParameters.Add((object)"@OBSERVACION");
            this.xQueryValues.Add((object)this.OBSERVACION);

            this.xQueryParameters.Add((object)"@ROWSGXID");
            this.xQueryValues.Add((object)this.ROWSGXID);

            this.xQuery = "PR_CANCELACITASRECURRENTES_MASIVA";
            //DB.ExecuteNonQuery(this.xQuery, this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure); ;

            DataTable dataTable = DB.ExecuteAdapter(this.xQuery, this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure);
            DataRow dataRow = dataTable.Rows.Count != 0 ? dataTable.Rows[0] : (DataRow)null;
            string strcitascanceladas = dataRow["CANTIDAD"].ToString();
            if (strcitascanceladas =="0")
            {
                Notify("No se pudieron cancelar las citas, verifique", "error");
               return;
            }
            else
            {
                Notify("Cantidad de Citas Canceladas: " + strcitascanceladas, "success");
               this._IniciarFormulario();
            }

            //this.cmbPaciente.SelectedValue = dataRow["CANTIDAD"].ToString();



        }
        public void Notify(string msg, string tipo)
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "notify('" + msg + "','" + tipo + "');", true);
        }
        protected void _Back2(object sender, EventArgs e)
        {
            this.Response.Redirect("http://caidsiges01:8000/INDEX.aspx");
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
        private String FormatDate(String _Date)
        {
            DateTime Dt = DateTime.Now;
            IFormatProvider mFomatter = new System.Globalization.CultureInfo("en-GB");
            Dt = DateTime.Parse(_Date, mFomatter);
            return Dt.ToString("yyyy-MM-dd");
        }
    }
}
