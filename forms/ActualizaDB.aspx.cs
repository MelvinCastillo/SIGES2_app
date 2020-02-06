using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CAID.Data;
using System.Data;
using System.Collections;

namespace CAID_V2.forms
{
    public partial class ActualizaDB : System.Web.UI.Page
    {
        private ArrayList xQueryParameters = new ArrayList();
        private ArrayList xQueryValues = new ArrayList();
        private string xCommand;
        private string xQuery;
        string xsucursal;// = "CAID-SD";
        string xrowguid;
        string xestatus;
        // string USERNAME;
        string xpaciente;
        string xterapistaid;
        string xfechaini;
        string xfechafin;
        private string REFGUID_DIR
        {
            get
            {
                return Request.QueryString["PacienteID"].ToString();  //this.Session["PacienteID"].ToString();
            }
        }

       
        //private string ROWUSERID
        //{
        //    get
        //    {
        //        return Request.QueryString["CURRENTUSR_ID"].ToString(); // this.Session["CURRENTUSR_ID"].ToString();
        //    }
        //}

        private string ROWSGXID
        {
            get
            {
                return Request.QueryString["SUCURSAL"].ToString();
            }
        }
         
        private string FILIACIONID
        {
            get
            {
                return this.cmbNFParentesco.Value.ToString().ToUpper();
            }
        }

        private string NSSID
        {
            get
            {
                return string.Empty;
            }
        }

        private string CEDULAID
        {
            get
            {
                return this.txtNFCedula.Value.ToString().ToUpper();
            }
        }

        private string PASAPORTEID
        {
            get
            {
                return this.txtNFPasaporte.Value.ToString().ToUpper();
            }
        }

        private string NOMBRE1
        {
            get
            {
                return this.txtNFNombre1.Value.ToString().ToUpper();
            }
        }

        private string NOMBRE2
        {
            get
            {
                return this.txtNFNombre2.Value.ToString().ToUpper();
            }
        }

        private string APELLIDO1
        {
            get
            {
                return this.txtNFApellido1.Value.ToString().ToUpper();
            }
        }

        private string APELLIDO2
        {
            get
            {
                return this.txtNFApellido2.Value.ToString().ToUpper();
            }
        }

        private string FULLNAME
        {
            get
            {
                return this.NOMBRE1 + " " + this.NOMBRE2 + " " + this.APELLIDO1 + this.APELLIDO2;
            }
        }

        private string FNACE
        {
            get
            {
                return this.txtNFFechaNace.Value.ToString().ToUpper();
            }
        }

        private string ESTCIVILID
        {
            get
            {
                return this.cmbNFEstadoCivil.Value.ToString().ToUpper();
            }
        }

        private string ESCOLARIDADID
        {
            get
            {
                return this.cmbNFEstadoCivil.Value.ToString().ToUpper();
            }
        }

        private string ESCALAID
        {
            get
            {
                return this.cmbNFRangoSalarial.Value.ToString().ToUpper();
            }
        }

        private bool ESEMPLEADO
        {
            get
            {
                return this.cmbNFTrabaja.Value.ToString().ToUpper() == "SI";
            }
        }


        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                if (Request.QueryString["PROCESO"].ToString() == "CANCELAR")
                {
                    DivDEALTAPACIENTE.Visible = true; 
                    tbfechas.Style.Add("display", "block");
                    ddlestatusCitas.SelectedValue = "2";

                    //_Save(sender, e);
                }
                if (Request.QueryString["PROCESO"].ToString() == "UpdateTratamiento")
                {
                    DivActulizaTratamiento.Visible = true;
                    lblmensaje.Text = "Actualiza Tratamiento Paciente";
                    lblmensaje.ForeColor = System.Drawing.Color.Blue;
                    tbfechas.Style.Add("display", "none"); 

                }


                if (Request.QueryString["PROCESO"].ToString() == "DEALTA")
                {
                    DivDEALTASERVICIO.Visible = true;
                    lblmensaje.Text = "DE ALTA";
                    lblaltaservicio.Text = "DE ALTA";
                    lblmensaje.ForeColor = System.Drawing.Color.Blue; 
                    tbfechas.Style.Add("display", "none");
                    DivDEALTAPACIENTE.Visible = false;
                    ddlestatusCitas.SelectedValue = "6";

                }
                
                    if (Request.QueryString["PROCESO"].ToString() == "DEALTASERVICIO")
                {
                    DivDEALTASERVICIO.Visible = true;
                    lblmensaje.Text = "De ALTA SERVICIO";
                    lblmensaje.ForeColor = System.Drawing.Color.Blue;
                    tbfechas.Style.Add("display", "none");
                    DivDEALTAPACIENTE.Visible = false;
                    ddlestatusCitas.SelectedValue = "6";
                }

                if (Request.QueryString["PROCESO"].ToString() == "NotasPX")
                {
                    DivNotasPx.Visible = true;
                    lblmensaje.Text = "Notas";
                    lblmensaje.ForeColor = System.Drawing.Color.Blue;
                    //tbfechas.Style.Add("display", "none");
                    DivDEALTAPACIENTE.Visible = false;
                    //ddlestatusCitas.SelectedValue = "6";
                    /* DE ALTA SERVICIO*/
                    string xGUID = Request.QueryString["Paciente"].ToString();
                    string ROWSGXID = Request.QueryString["sucursal"].ToString();
                    this.xQueryParameters.Clear();
                    this.xQueryValues.Clear();
                    this.xQueryParameters.Add((object)"@ROWGUID");
                    this.xQueryValues.Add(xGUID.ToString());
                    this.xQueryParameters.Add((object)"@ROWSGXID");
                    this.xQueryValues.Add(ROWSGXID.ToString());
                     
                    DataTable dataTable  =  DB.ExecuteAdapter("PR_PAX00000_NotasBusca", this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure);
                    if (dataTable.Rows.Count != 0)
                    {
                        int index = dataTable.Rows.Count - 1;
                        this.txtnotaspx.Value = dataTable.Rows[index]["notas"].ToString(); 
                    }
                    lblnotaspx.Text = "Notas: " + Request.QueryString["fullname"].ToString(); 
                }
                if (Request.QueryString["PROCESO"].ToString() == "NucleoFamiliar")
                {
                    DivNucleoFamiliar.Visible = true;
                    string xGUID = Request.QueryString["ROWGUID"].ToString();
                    string ROWSGXID1 = Request.QueryString["sucursal"].ToString();
                    this.xQueryParameters.Clear();
                    this.xQueryValues.Clear();
                    this.xQueryParameters.Add((object)"@NOMBRE");
                    this.xQueryValues.Add((object)"%");
                    this.xQueryParameters.Add((object)"@ROWSGXID"); 
                    xsucursal = Request.QueryString["SUCURSAL"].ToString();
                    this.xQueryValues.Add((object)this.xsucursal);
                    this.cmbNFParentesco.Items.Clear();
                    this.cmbNFEscolaridad.Items.Clear();
                    this.cmbNFEstadoCivil.Items.Clear();
                    this.cmbNFRangoSalarial.Items.Clear();
                    this.cmbNFParentesco.Items.Add(new ListItem("-- SELECCIONE --", string.Empty));
                    this.cmbNFEscolaridad.Items.Add(new ListItem("-- SELECCIONE --", string.Empty));
                    this.cmbNFEstadoCivil.Items.Add(new ListItem("-- SELECCIONE --", string.Empty));
                    this.cmbNFRangoSalarial.Items.Add(new ListItem("-- SELECCIONE --", string.Empty));
                    foreach (DataRow row in (InternalDataCollectionBase)DB.ExecuteAdapter("SMX30003S1", this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure).Rows)
                        this.cmbNFParentesco.Items.Add(new ListItem(row["NOMBRE"].ToString(), row["ROWGUID"].ToString()));
                    foreach (DataRow row in (InternalDataCollectionBase)DB.ExecuteAdapter("SMX30015S1", this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure).Rows)
                        this.cmbNFEscolaridad.Items.Add(new ListItem(row["NOMBRE"].ToString(), row["ROWGUID"].ToString()));
                    foreach (DataRow row in (InternalDataCollectionBase)DB.ExecuteAdapter("SMX30007S1", this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure).Rows)
                        this.cmbNFEstadoCivil.Items.Add(new ListItem(row["NOMBRE"].ToString(), row["ROWGUID"].ToString()));
                    foreach (DataRow row in (InternalDataCollectionBase)DB.ExecuteAdapter("SMX30008S1", this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure).Rows)
                        this.cmbNFRangoSalarial.Items.Add(new ListItem(row["NOMBRE"].ToString(), row["ROWGUID"].ToString()));
                    this.cmbNFParentesco.Value = string.Empty;
                    this.txtNFCedula.Value = string.Empty;
                    this.txtNFPasaporte.Value = string.Empty;
                    this.txtNFNombre1.Value = string.Empty;
                    this.txtNFNombre2.Value = string.Empty;
                    this.txtNFApellido1.Value = string.Empty;
                    this.txtNFApellido2.Value = string.Empty;
                    this.txtNFFechaNace.Value = string.Empty;
                    this.cmbNFEscolaridad.Value = string.Empty;
                    this.cmbNFEstadoCivil.Value = string.Empty;
                    this.cmbNFTrabaja.Value = string.Empty;

                    this.xQueryParameters.Clear();
                    this.xQueryValues.Clear();
                    this.xQueryParameters.Add((object)"@ROWGUID");
                    this.xQueryValues.Add(xGUID.ToString());
                    this.xQueryParameters.Add((object)"@ROWSGXID");
                    this.xQueryValues.Add(ROWSGXID1.ToString());
                    DataTable dataTable =    DB.ExecuteAdapter("PAX00001S4", this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure);
                    if (dataTable.Rows.Count != 0)
                    {
                        int index = dataTable.Rows.Count - 1;
                        this.cmbNFParentesco.Value = dataTable.Rows[index]["FILIACIONID"].ToString();
                        this.txtNFCedula.Value = dataTable.Rows[index]["CEDULAID"].ToString();
                        this.txtNFPasaporte.Value = dataTable.Rows[index]["PASAPORTEID"].ToString();
                        this.txtNFNombre1.Value = dataTable.Rows[index]["NOMBRE1"].ToString();
                        this.txtNFNombre2.Value = dataTable.Rows[index]["NOMBRE2"].ToString();
                        this.txtNFApellido1.Value = dataTable.Rows[index]["APELLIDO1"].ToString();
                        this.txtNFApellido2.Value = dataTable.Rows[index]["APELLIDO2"].ToString();
                        this.txtNFFechaNace.Value = dataTable.Rows[index]["FNACE"].ToString();
                        this.cmbNFEscolaridad.Value = dataTable.Rows[index]["ESCOLARIDADID"].ToString();
                        this.cmbNFEstadoCivil.Value = dataTable.Rows[index]["ESTCIVILID"].ToString();
                        this.cmbNFTrabaja.Value = dataTable.Rows[index]["ESEMPLEADO"].ToString();
                        this.cmbNFRangoSalarial.Value = dataTable.Rows[index]["ESCALAID"].ToString();  
                    }
                }
                }
        }

        protected void _Save(object sender, EventArgs e)
        {
            if (ddlestatusCitas.SelectedValue == "-1")
            {
                ddlestatusCitas.Focus();
                Notify("Debe especificar un estatus", "error");
                return;
            }
            xfechaini = txtDesde.Value.ToString();
            xfechafin = txtHasta.Value.ToString();


            if (Request.QueryString["PROCESO"].ToString() == "CANCELAR")
            {
                xsucursal = Request.QueryString["SUCURSAL"].ToString();
                xterapistaid = Request.QueryString["terapistaid"].ToString();
                xpaciente = Request.QueryString["PACIENTE"].ToString();

                if (DB.ExecuteNonQuery(string.Format("[PR_CANCELACITASRECURRENTES] '{0}','{1}','{2}','{3}','{4}','{5}','{6}','{7}'", (object)xsucursal.ToString(), (object)xterapistaid.ToString(), (object)xpaciente.ToString().Trim(), ddlestatusCitas.SelectedValue, txtcomentariocita.Value.Trim(), "CANCELAR", xfechaini.ToString(), xfechafin.ToString())))
                {
                    string estatus = "";
                    if (ddlestatusCitas.SelectedValue == "2")
                    {
                        estatus = "CANCELADA";
                    }
                    if (ddlestatusCitas.SelectedValue == "6")
                    {
                        estatus = "DE ALTA";
                    }

                    lblmensaje.Text = "Cambio realizado con exito a: " + estatus;
                    lblmensaje.ForeColor = System.Drawing.Color.Blue;
                    //Notify("Registro Guardado", "success");
                    Page.ClientScript.RegisterOnSubmitStatement(typeof(Page), "closePage", "window.onunload = CloseWindow();");
                    Response.Clear();
                    Response.Write("<script>window.close();</script>");
                    Response.Flush();
                    Response.End();
                    
                }
                else
                    lblmensaje.ForeColor = System.Drawing.Color.Blue;
                //Notify("No se pudo almacenar la informacion", "error");
            }
        }
        protected void _SaveALTASERVICIO(object sender, EventArgs e)
        {

            if (txtcomentarioaltaservicio.Value.Trim() == "")
            {
                txtcomentarioaltaservicio.Focus();
                Notify("Debe especificar un comentario", "error");
                return;
            }
            string estatus = "";
            if (ddlestatusCitas.SelectedValue == "6")
            {
                estatus = "DE ALTA";
            }
            if (Request.QueryString["PROCESO"].ToString() == "DEALTA")
            {
                xsucursal = Request.QueryString["SUCURSAL"].ToString();
                xterapistaid = Request.QueryString["terapistaid"].ToString();
                xpaciente = Request.QueryString["PACIENTE"].ToString(); 
                if (DB.ExecuteNonQuery(string.Format("[PR_CANCELACITASRECURRENTES] '{0}','{1}','{2}','{3}','{4}','{5}','{6}','{7}'", (object)xsucursal.ToString(), (object)xterapistaid.ToString(), (object)xpaciente.ToString().Trim(), ddlestatusCitas.SelectedValue, txtcomentarioaltaservicio.Value.Trim(), "DEALTA", null, null)))
                { 
                    lblaltaservicio.Text = "Cambio realizado con exito a: " + estatus;
                    lblaltaservicio.ForeColor = System.Drawing.Color.Blue;
                    Page.ClientScript.RegisterOnSubmitStatement(typeof(Page), "closePage", "window.onunload = CloseWindow();");
                    Response.Clear();
                    Response.Write("<script>window.close();</script>");
                    Response.Flush();
                    Response.End();
                    //Notify("Registro Guardado", "success");
                }
                else
                    lblmensaje.ForeColor = System.Drawing.Color.Blue;
                //Notify("No se pudo almacenar la informacion", "error");
            }
            if (Request.QueryString["PROCESO"].ToString() == "DEALTASERVICIO")
            {
                xsucursal = Request.QueryString["SUCURSAL"].ToString();
                xterapistaid = Request.QueryString["terapistaid"].ToString();
                xpaciente = Request.QueryString["PACIENTE"].ToString();

                if (DB.ExecuteNonQuery(string.Format("[PR_PAX00000_DEALTAGuardar] '{0}','{1}','{2}','{3}'", (object)xpaciente.ToString().Trim(), (object)xterapistaid.ToString(), (object)xsucursal.ToString().Trim(), txtcomentarioaltaservicio.Value.Trim())))
                {  
                    lblaltaservicio.Text = "Cambio realizado con exito a: " + estatus;
                    lblaltaservicio.ForeColor = System.Drawing.Color.Blue;
                    Page.ClientScript.RegisterOnSubmitStatement(typeof(Page), "closePage", "window.onunload = CloseWindow();");
                    Response.Clear();
                    Response.Write("<script>window.close();</script>");
                    Response.Flush();
                    Response.End();
                }
                else
                    lblaltaservicio.ForeColor = System.Drawing.Color.Blue; 
            }
        }

        protected void _SaveNotasPX(object sender, EventArgs e)
        {

            if (txtnotaspx.Value.Trim() == "")
            {
                txtnotaspx.Focus();
                Notify("Debe especificar un comentario", "error");
                return;
            }  
            if (Request.QueryString["PROCESO"].ToString() == "NotasPX")  
            {
                xsucursal = Request.QueryString["SUCURSAL"].ToString(); 
                xpaciente = Request.QueryString["PACIENTE"].ToString();

                if (DB.ExecuteNonQuery(string.Format("[PR_PAX00000_NotasGuardar] '{0}','{1}','{2}'", (object)xpaciente.ToString().Trim(),  (object)xsucursal.ToString().Trim(), txtnotaspx.Value.Trim())))
                {
                    lblnotaspx.Text = "Cambio realizado con exito";
                    lblnotaspx.ForeColor = System.Drawing.Color.Blue;
                }
                else
                    lblnotaspx.ForeColor = System.Drawing.Color.Blue;
            }
        }

        protected void _ActualizaTratamiento(object sender, EventArgs e)
        {
            if (Request.QueryString["PROCESO"].ToString() == "UpdateTratamiento")
            {
                xsucursal = Request.QueryString["SUCURSAL"].ToString();
                http://caidsiges01:8082/forms/actualizadb.aspx? 
                // xterapistaid = Request.QueryString["terapistaid"].ToString();
                xrowguid = Request.QueryString["rowguid"].ToString();
                xestatus = ddlestatus.SelectedValue; 
                if (ddlestatus.SelectedValue.ToString() == "")
                {
                    lblmensaje.Text = "Debe especificar un Estatus";
                    lblmensaje.ForeColor = System.Drawing.Color.Red;
                }

                if (DB.ExecuteNonQuery(string.Format("[PR_TRATAMIENTOACTUALIZAR] '{0}','{1}','{2}'", (object)xsucursal.ToString(), (object)xrowguid.ToString().Trim(), (object)xestatus.ToString().Trim())))
                {
                    lblmensaje.Text = "Cambia Estatus Tratamiento";
                    lblmensaje.ForeColor = System.Drawing.Color.Blue;
                    //Notify("Registro Guardado", "success");
                    _Close(sender, e);
                    
                }
                else
                    lblmensaje.ForeColor = System.Drawing.Color.Blue;
                //Notify("No se pudo almacenar la informacion", "error");
            }
        }
        public void Notify(string msg, string tipo)
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "notify('" + msg + "','" + tipo + "');", true);
        }

        protected void _Close(object sender, EventArgs e)
        {

            xpaciente = Request.QueryString["PACIENTE"].ToString();
            Response.Write("<script language='javascript'> { window.close(); }</script>");
            //String x = "<script type='text/javascript'>window.open('http://caidsiges01:8000/HCL00010.aspx?X=" + xpaciente + ",'_blank', '');</script>";
            //ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "script", x, false);
            //Response.Write("<script language='javascript'> { window.close(); window.location = 'http://caidsiges01:8000/HCL00010.aspx?X='"+ xpaciente+";}</script>");
            //Response.Write("<script language='javascript'> { window.open(http://caidsiges01:8000/HCL00010.aspx?X=" + xpaciente + ",'_blank', ''); }</script>");
            String x = "http://caidsiges01:8000/HCL00010.aspx?X=" + xpaciente;
            //Response.Write("<script language='javascript'> { window.open('"+ x + "'); }</script>");
            //Response.Write("<script language='javascript'> { window.open('" + x + "'); self.close();}</script>");

        } 
        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Write("<script language='javascript'> { window.close(); }</script>");
        }

        protected void _SavePAX00001(object sender, EventArgs e)
        {
            string xGUID = Request.QueryString["ROWGUID"].ToString(); 

            this.xQueryParameters.Clear();
            this.xQueryValues.Clear();
            this.xQueryParameters.Add((object)"@REFGUID");
            this.xQueryValues.Add((object)this.REFGUID_DIR);
            this.xQueryParameters.Add((object)"@FILIACIONID");
            this.xQueryValues.Add((object)this.FILIACIONID);
            this.xQueryParameters.Add((object)"@NSSID");
            this.xQueryValues.Add((object)this.NSSID);
            this.xQueryParameters.Add((object)"@CEDULAID");
            this.xQueryValues.Add((object)this.CEDULAID);
            this.xQueryParameters.Add((object)"@PASAPORTEID");
            this.xQueryValues.Add((object)this.PASAPORTEID);
            this.xQueryParameters.Add((object)"@NOMBRE1");
            this.xQueryValues.Add((object)this.NOMBRE1);
            this.xQueryParameters.Add((object)"@NOMBRE2");
            this.xQueryValues.Add((object)this.NOMBRE2);
            this.xQueryParameters.Add((object)"@APELLIDO1");
            this.xQueryValues.Add((object)this.APELLIDO1);
            this.xQueryParameters.Add((object)"@APELLIDO2");
            this.xQueryValues.Add((object)this.APELLIDO2);
            this.xQueryParameters.Add((object)"@FULLNAME");
            this.xQueryValues.Add((object)this.FULLNAME);
            this.xQueryParameters.Add((object)"@FNACE");
            this.xQueryValues.Add((object)this.FNACE);
            this.xQueryParameters.Add((object)"@ESTCIVILID");
            this.xQueryValues.Add((object)this.ESTCIVILID);
            this.xQueryParameters.Add((object)"@ESCOLARIDADID");
            this.xQueryValues.Add((object)this.ESCOLARIDADID);
            this.xQueryParameters.Add((object)"@ESCALAID");
            this.xQueryValues.Add((object)this.ESCALAID);
            this.xQueryParameters.Add((object)"@ESEMPLEADO");
            this.xQueryValues.Add((object)this.ESEMPLEADO);
            this.xQueryParameters.Add((object)"@ROWGUID");
            this.xQueryValues.Add(xGUID.ToString());
            this.xQueryParameters.Add((object)"@ROWUSERID");
            this.xQueryValues.Add("");
            this.xQueryParameters.Add((object)"@ROWSGXID");
            this.xQueryValues.Add((object)this.ROWSGXID);
            this.xQuery = "PAX00001UP";
            DB.ExecuteNonQuery(this.xQuery, this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure);
            //this._CloseModal((object)null, (EventArgs)null);
            // Response.Write("<script language='javascript'> { window.close(); }</script>");
            // ClientScript.RegisterStartupScript(typeof(Page), "closePage", "window.close();", true); 
             
            Page.ClientScript.RegisterOnSubmitStatement(typeof(Page), "closePage", "window.onunload = CloseWindow();");
            Response.Clear();
            Response.Write("<script>window.close();</script>");
            Response.Flush();
            Response.End();
            //Page.ClientScript.RegisterOnSubmitStatement(typeof(Page), "closePage", "window.onunload = CloseWindow();");


        }
    }
}