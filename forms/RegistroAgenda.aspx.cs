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
using System.Text;
using CAID_V2;

namespace CAID
{
    public class RegistroAgenda : Page
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

        protected DropDownList CmbTipo;
        protected RequiredFieldValidator valCmbTipo;
        protected DropDownList CmbTipoTemas;

        protected HtmlInputText TxtActividad;
        protected RequiredFieldValidator valTxtActividad;
        protected HtmlInputText txtFechaInicio;
        protected RequiredFieldValidator valtxtFechaInicio;
        protected HtmlInputText txtFechaFin;
        protected RequiredFieldValidator valtxtFechaFin;
        protected HtmlSelect CmbEstatus;
        protected RequiredFieldValidator valCmbEstatus;
        protected HtmlTextArea TxtComentario;
        protected RequiredFieldValidator valTxtComentario;


        private string xBase
        {
            get
            {
                return this.Page.GetType().BaseType.Name.ToString();
            }
        }
        private HtmlLink botonaprobar
        {
            set
            {
                //btnAprobar = btnAprobar;
                //return this.CmbTipo.SelectedValue.ToString().Trim().ToUpper();
            }
        }
        private string Tipo
        {
            get
            {
                return this.CmbTipo.SelectedValue.ToString().Trim().ToUpper();
            }
        }
        private string Actividad
        {
            get
            {
                return this.TxtActividad.Value.ToString().Trim().ToUpper();
            }
            set { }
        }
        private string FechaInicio
        {
            get
            {
                return this.txtFechaInicio.Value.ToString().Trim().ToUpper();
            }
        }
        private string FechaFin
        {
            get
            {
                return this.txtFechaFin.Value.ToString().Trim().ToUpper();
            }
        }
        private string Estatus
        {
            get
            {
                return this.CmbEstatus.Value.ToString().Trim().ToUpper();
            }
        }
        private string Comentario
        {
            get
            {

                return this.TxtComentario.Value.ToString().Trim().ToUpper();
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

        private string ESTADOAUTORIZACION
        {
            get
            {
                return Request.QueryString["AUTORIZA"].ToString();  //this.Session["CURRENTUSR_ID"].ToString();
            }
        }
        private string ROWSGXID
        {
            get
            {

                return Request.QueryString["LOCALIDAD"].ToString(); //this.Session["CURRENTUSR_SGXID"].ToString();
            }
        }

        private string PACIENTE
        {
            get
            {
                if (Request.QueryString["X"] != null)
                {
                    return Request.QueryString["X"].ToString();
                }
                else
                    return "";

            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                _FillTipo();
                this._Iniciar();
                this.xGUID.Value = Guid.NewGuid().ToString().ToUpper();
                if (Request.QueryString["X"] != null)
                {
                    if (Request.QueryString["X"].ToString() != "")
                {
                    CmbTipoTemas.Visible = true;
                    TxtActividad.Visible = false;
                }
                }
            }
        }

        private void _Iniciar()
        {
            this.xQueryParameters.Clear();
            this.xQueryValues.Clear();
            this.xQueryParameters.Add((object)"@NOMBRE");
            this.xQueryValues.Add((object)"%");
            this.xQueryParameters.Add((object)"@ROWSGXID");
            this.xQueryValues.Add((object)this.ROWSGXID);
            string str = this.Request.QueryString["XNO"];
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
            this.CmbTipo.SelectedValue = string.Empty;
            this.TxtActividad.Value = string.Empty;
            this.txtFechaInicio.Value = DateTime.Now.ToString("dd/MM/yyyy");
            this.txtFechaFin.Value = DateTime.Now.ToString("dd/MM/yyyy");
            this.TxtComentario.Value = string.Empty;
            this.CmbEstatus.Value = "SOLICITADA";

        }

        private void _IniciarFormulario()
        {
            if (this.Request.QueryString["XNO"] == null)
            {
                this.xGUID.Value = Guid.NewGuid().ToString().ToUpper();
                this._IniciarControles();
                this.pnlConsulta.Visible = true;
                this.pnlData.Visible = false;
            }
            else
                this.Response.Redirect(this.xBase + ".aspx?USUARIO=" + ROWUSERID + "&LOCALIDAD=" + ROWSGXID + "&XNO=DATA&AUTORIZA=X");
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
            if (ESTADOAUTORIZACION == "APROBAR" && ((this.ROWUSERID).ToUpper() == "M.CASTILLO" || (this.ROWUSERID).ToUpper() == "R.RAMOS"))
            {
                txtBuscar.Value = "";
            }
            else
            {
                this.xQueryParameters.Clear();
                this.xQueryValues.Clear();
                this.xQuery = "select nombre  FROM SGX00100 where usr='" + (this.ROWUSERID).ToUpper() + "' and rowsgxid='" + ROWSGXID + "'";
                DataTable dataTable = DB.ExecuteAdapter(this.xQuery, this.xQueryParameters, this.xQueryValues, CommandType.Text);
                DataRow dataRow = dataTable.Rows.Count != 0 ? dataTable.Rows[0] : (DataRow)null;
                if (dataRow == null)
                    return;
                txtBuscar.Value = dataRow["nombre"].ToString();
            }
            this.xQueryParameters.Clear();
            this.xQueryValues.Clear();
            this.xQueryParameters.Add((object)"@NOMBRE");
            this.xQueryValues.Add((object)this.txtBuscar.Value.ToString());
            //this.xQueryParameters.Add((object) "@TOP");
            //this.xQueryValues.Add((object) this.Session["TOP"].ToString());
            this.xQueryParameters.Add((object)"@ROWSGXID");
            this.xQueryValues.Add((object)this.ROWSGXID);
            this.xQueryParameters.Add((object)"@PACIENTE");
            this.xQueryValues.Add((object)this.PACIENTE);

            this.xQuery = "PR_Agenda_Busca";
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
                if (this.xCommand == "Delete" /*&& Convert.ToBoolean(this.Session["CURRENTUSR_fnELIMINAR"].ToString())*/)
                {
                    this.xQuery = "Delete from Agenda where id= '" + ROWGUID + "' and rowsgxid='" + ROWSGXID + "'";
                    if (DB.ExecuteNonQuery(this.xQuery, this.xQueryParameters, this.xQueryValues, CommandType.Text))
                        this._Show((object)null, (EventArgs)null);
                }
                if (this.xCommand == "Aprobar" && (ESTADOAUTORIZACION == "APROBAR") && ((ROWUSERID).ToUpper() == "M.CASTILLO" || (ROWUSERID).ToUpper() == "R.RAMOS"))
                {
                    this.xQuery = "update Agenda set ESTATUS = 'APROBADA' where id='" + ROWGUID + "' and rowsgxid='" + ROWSGXID + "'";
                    if (DB.ExecuteNonQuery(this.xQuery, this.xQueryParameters, this.xQueryValues, CommandType.Text))
                    {
                        this._Show((object)null, (EventArgs)null);

                    }

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
            this.xQueryParameters.Add((object)"@id");
            this.xQueryValues.Add((object)this.xGUID.Value);
            this.xQueryParameters.Add((object)"@asunto");
            if (CmbTipoTemas.SelectedValue != string.Empty)
            { this.xQueryValues.Add(CmbTipoTemas.SelectedItem.Text.Trim()); }
            else
                this.xQueryValues.Add((object)this.Actividad);

            this.xQueryParameters.Add((object)"@tipoAgenda");
            this.xQueryValues.Add((object)this.Tipo);
            this.xQueryParameters.Add((object)"@inicio");
            this.xQueryValues.Add((object)this.FechaInicio);
            this.xQueryParameters.Add((object)"@fin");
            this.xQueryValues.Add((object)this.FechaFin);
            this.xQueryParameters.Add((object)"@comentario");
            this.xQueryValues.Add((object)this.Comentario);
            this.xQueryParameters.Add((object)"@Estatus");
            this.xQueryValues.Add((object)this.Estatus);
            this.xQueryParameters.Add((object)"@userID");
            this.xQueryValues.Add((object)this.ROWUSERID);
            this.xQueryParameters.Add((object)"@rowsgxid");
            this.xQueryValues.Add((object)this.ROWSGXID);
            this.xQueryParameters.Add((object)"@PACIENTE");
            this.xQueryValues.Add((object)this.PACIENTE);

            this.xQuery = "PR_AGENDA";

            if (!DB.ExecuteNonQuery(this.xQuery, this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure))
            {
                return;
            }
            else
            { /* creo el texto para enviar el correo*/
                this.xQuery = "select *  FROM vagenda where id='" + ROWGUID + "' and rowsgxid='" + ROWSGXID + "'";

                DataTable dataTable = DB.ExecuteAdapter(this.xQuery, this.xQueryParameters, this.xQueryValues, CommandType.Text);
                DataRow dataRow = dataTable.Rows.Count != 0 ? dataTable.Rows[0] : (DataRow)null;
                if (dataRow == null)
                    return;
                String nombresolicitante;
                String asunto;
                String tipo;
                String Fechainicioaprobacion;
                String url;
                nombresolicitante = dataRow["NombreUsuarioCreacion"].ToString();
                asunto = dataRow["asunto"].ToString();
                tipo = dataRow["DescTipo"].ToString();
                Fechainicioaprobacion = dataRow["inicio"].ToString();

                // url = "http://caidsiges01:8082/forms/RegistroAgenda.aspx?LOCALIDAD=" + ROWSGXID + "&usuario=" + this.ROWUSERID + "&X=DATA&AUTORIZA=APROBAR";
                url = "http://caidsiges01:8082/forms/RegistroAgenda.aspx?LOCALIDAD=" + ROWSGXID + "&usuario=R.RAMOS&XNO=DATA&AUTORIZA=APROBAR";

                StringBuilder sb = new StringBuilder();
                //sb.Append("< link rel = 'stylesheet' href = 'https://www.w3schools.com/w3css/4/w3.css' >");
                sb.Append("<strong><h5>Estimada Coordinacion General</h5></strong> <br/>");
                sb.Append(" Nos place informarle que tiene una actividad pendiente de aprobacion ");
                sb.Append("referente a: <strong>" + asunto + "</strong> y el tipo de actividad es: <strong>" + tipo);
                sb.Append(" </strong> solicitada por el colaborador: <strong>" + nombresolicitante);
                sb.Append(" </strong> para la fecha: <strong> " + Fechainicioaprobacion);
                sb.Append(" </strong> presione el siguiente enlace para  </div><a href=" + url + " target='_blank'>AUTORIZAR LA ACTIVIDAD</a><div> <br/>");
                //sb.Append(" presione el siguiente enlace a su aprobacion <button type='button' onclick=" + url + ">APROBAR SOLICITUD</button> <br/>");
                sb.Append("Atentamente, <br/>");
                sb.Append("<strong><h5>SISTEMA SIGES</h5><strong>");
                //this.xQuery = "SPENVIAREMAIL";

                /*envio email*/
                this.xQueryParameters.Clear();
                this.xQueryValues.Clear();
                this.xQueryParameters.Add((object)"@Destino");
                this.xQueryValues.Add((object)"coordinaciongeneralcaid@gmail.com,coordinaciongeneral@caid.gob.do"); //
                this.xQueryParameters.Add((object)"@asunto");
                this.xQueryValues.Add((object)"SOLICITUD APROBACION ACTIVIDAD " + nombresolicitante + " para la fecha " + Fechainicioaprobacion);
                this.xQueryParameters.Add((object)"@cuerpo");
                this.xQueryValues.Add((object)sb.ToString());
                this.xQuery = "SPENVIAREMAIL";
                if (DB.ExecuteNonQuery(this.xQuery, this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure))
                    // DataTable dataTable1 =  DB.ExecuteAdapter(this.xQuery, this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure);
                    this._IniciarFormulario();


            }
            _Back(sender, e);
        }

        protected void _Cancel(object sender, EventArgs e)
        {
            this._IniciarControles();
        }

        protected void _Back(object sender, EventArgs e)
        {
            //ROWGUID == "";
            //if (ROWGUID.ToString() != "")
            //{

            //    //pnlData.Visible = false;
            //    this.Response.Redirect(this.xBase + ".aspx?&USUARIO=" + ROWUSERID + "&LOCALIDAD=" + ROWSGXID + "&X=" + ROWGUID+ "&AUTORIZA=X");
            //}
            //else
            //{

            //pnlData.Visible = false;
            this.Response.Redirect(this.xBase + ".aspx?USUARIO=" + ROWUSERID + "&LOCALIDAD=" + ROWSGXID + "&XNO=DATA&AUTORIZA=X" + "&X=" + PACIENTE);
            //}
        }

        protected void _BackCAID(object sender, EventArgs e)
        {
            if (Request.QueryString["X"] != null)
            {
                if (Request.QueryString["X"].ToString() != "")
                {
                    this.Response.Redirect("http://caidsiges01:8000/HCL00000.aspx?X=" + PACIENTE);
                }
            }
            else
                this.Response.Redirect("http://caidsiges01:8000/index.aspx");

            // this.Response.Redirect(this.xBase + ".aspx?USUARIO=" + ROWUSERID + "&LOCALIDAD=" + ROWSGXID + "&XNO=DATA&AUTORIZA=X" + "&X=" + PACIENTE);

        }
        private void _FillTipo()
        {

            try
            {
                this.xQueryParameters.Add((object)"@NOMBRE");
                this.xQueryValues.Add((object)"%");
                this.xQueryParameters.Add((object)"@ROWSGXID");
                this.xQueryValues.Add(ROWSGXID);
                this.CmbTipo.Items.Add(new ListItem("-- SELECCIONE --", string.Empty));
                foreach (DataRow row in (InternalDataCollectionBase)DB.ExecuteAdapter("PR_BUSCATIPOAGENDA", this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure).Rows)
                    this.CmbTipo.Items.Add(new ListItem(row["FULLNAME"].ToString(), row["TipoAgenda"].ToString()));

            }
            catch
            {
            }
        }

        private void _FillTipoTemas(int tipoagenda)
        {

            try
            {
                this.xQueryParameters.Add((object)"@tipoagenda");
                this.xQueryValues.Add(tipoagenda);
                this.CmbTipoTemas.Items.Clear();
                this.CmbTipoTemas.Items.Add(new ListItem("-- SELECCIONE --", string.Empty));
                foreach (DataRow row in (InternalDataCollectionBase)DB.ExecuteAdapter("PR_BUSCATIPOAGENDATEMAS", this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure).Rows)
                    this.CmbTipoTemas.Items.Add(new ListItem(row["descripcion"].ToString(), row["Secuencia"].ToString()));
                if (this.CmbTipoTemas.Items.Count > 1)
                {
                    CmbTipoTemas.Visible = true;
                    TxtActividad.Visible = false;
                }
                else
                {
                    CmbTipoTemas.SelectedValue = string.Empty;
                    CmbTipoTemas.Visible = false;
                    TxtActividad.Visible = true;
                }
            }
            catch
            {
            }
        }


        protected void rpData_RowDataBound(object sender, RepeaterItemEventArgs e)
        {
            var lb = (LinkButton)e.Item.FindControl("btnAprobar");
            if (lb != null)
            {
                if (ESTADOAUTORIZACION == "APROBAR" && ((this.ROWUSERID).ToUpper() == "M.CASTILLO" || (this.ROWUSERID).ToUpper() == "R.RAMOS"))
                    lb.Visible = true;
                else
                    lb.Visible = false;
            }

        }

        protected void CmbTipo_SelectedIndexChanged(object sender, EventArgs e)
        {
            _FillTipoTemas(Convert.ToInt16(CmbTipo.SelectedValue));
        }
    }
}
