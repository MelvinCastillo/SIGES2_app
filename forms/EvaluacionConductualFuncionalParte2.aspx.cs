using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.ComponentModel;
using CrystalDecisions.Shared;
using CrystalDecisions.ReportSource;
using CrystalDecisions.CrystalReports.Engine;
using CAID.Data;
using System.Data;
using System.Collections;
using System.Data.SqlClient;

namespace CAID_V2.forms
{
    public partial class EvaluacionConductualFuncionalParte2 : System.Web.UI.Page
    {
        private ArrayList xQueryParameters = new ArrayList();
        private ArrayList xQueryValues = new ArrayList();
#pragma warning disable CS0169 // The field 'ConsultaPaciente.xCommand' is never used
#pragma warning disable CS0169 // The field 'ConsultaPaciente.xCommand' is never used
        private string xCommand;
#pragma warning restore CS0169 // The field 'ConsultaPaciente.xCommand' is never used
#pragma warning restore CS0169 // The field 'ConsultaPaciente.xCommand' is never used
        private string xQuery;
        string usuario;
        string centro;
        string IDPaciente;
        string TerapistaID;
        DataTable dataTable1 = new DataTable();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["rowguidpaciente"] != null)
            { 
                if (Request.QueryString["rowguidpaciente"].ToString() != "")
                IDPaciente = Request.QueryString["rowguidpaciente"].ToString();
            else
                IDPaciente = "";

            if (Request.QueryString["XTerapistaID"].ToString() != "")
                TerapistaID = Request.QueryString["XTerapistaID"].ToString();
            else
                TerapistaID = "";

            if (Request.QueryString["XCurrentUSR_ROWGUID"].ToString() != "")
                usuario = Request.QueryString["XCurrentUSR_ROWGUID"].ToString();
           else
                usuario = "";

            if (Request.QueryString["XCURRENTUSR_SGXID"].ToString() != "")
                centro = Request.QueryString["XCURRENTUSR_SGXID"].ToString();
            else
                centro = "";

            if (this.ckReglamentoafectiva.Items.Count == 0)
                this.ckReglamentoafectiva.Items.Add(new ListItem("", "0"));

            if (this.ckDistorsioncognitiva.Items.Count == 0)
                this.ckDistorsioncognitiva.Items.Add(new ListItem("", "2"));

            if (this.ckRefuerzo.Items.Count == 0)
                this.ckRefuerzo.Items.Add(new ListItem("", "3"));

            if (this.ckModelado.Items.Count == 0)
                this.ckModelado.Items.Add(new ListItem("", "4"));

            if (this.ckProblemasfamiliares.Items.Count == 0)
                this.ckProblemasfamiliares.Items.Add(new ListItem("", "5"));

            if (this.ckFisiologica.Items.Count == 0)
                this.ckFisiologica.Items.Add(new ListItem("", "6"));

            if (this.ckComunicarnecesidad.Items.Count == 0)
                this.ckComunicarnecesidad.Items.Add(new ListItem("", "7"));

            if (this.ckPlanterapeutico.Items.Count == 0)
                this.ckPlanterapeutico.Items.Add(new ListItem("", "8"));

            if (!IsPostBack)
            {
                if (Request.QueryString["rowguidpaciente"].ToString() != "")
                    _BuscarHistorico();
            }
            }

        }
         
        private void _Iniciar()
        {

        }
        private void _BuscarHistorico()
        {
            dataTable1 = DB.ExecuteAdapter(string.Format("HCL00031H_HISTORICO @TERGUID = '{0}', @ROWSGXID = '{1}', @REFGUID = '{2}'", TerapistaID.ToString(), centro.ToString(), IDPaciente.ToString()));
                this.rpHistorico.DataSource = (object)dataTable1;
                this.rpHistorico.DataBind();
            if (dataTable1.Rows.Count != 0)
            {
                if ((Boolean)dataTable1.Rows[0]["Reglamentoafectiva"] == true)
                    ckReglamentoafectiva.Items[0].Selected = true;

                if ((Boolean)dataTable1.Rows[0]["Distorsioncognitiva"] == true)
                    ckDistorsioncognitiva.Items[0].Selected = true;

                if ((Boolean)dataTable1.Rows[0]["Refuerzo"] == true)
                    ckRefuerzo.Items[0].Selected = true;

                if ((Boolean)dataTable1.Rows[0]["Modelado"] == true)
                    ckModelado.Items[0].Selected = true;

                if ((Boolean)dataTable1.Rows[0]["Problemasfamiliares"] == true)
                    ckProblemasfamiliares.Items[0].Selected = true;

                if ((Boolean)dataTable1.Rows[0]["Fisiologica"] == true)
                    ckFisiologica.Items[0].Selected = true;

                if ((Boolean)dataTable1.Rows[0]["Comunicarnecesidad"] == true)
                    ckComunicarnecesidad.Items[0].Selected = true;

                if ((Boolean)dataTable1.Rows[0]["Planterapeutico"] == true)
                    ckPlanterapeutico.Items[0].Selected = true;

            }
        }

        protected void _Save(object sender, EventArgs e)
        {
            string strpaciente = this.IDPaciente.ToString();
            string strterapistaid = TerapistaID.ToString(); //this.Session["CurrentPAX_ROWGUID"].ToString();
            string strcentro = this.centro.ToString(); //this.Session["CurrentUSR_TERID"].ToString();
            string strusuario = usuario.ToString();//this.cmbTipo.Value.ToString();
            int Reglamentoafectiva;
            int Distorsioncognitiva;
            int Refuerzo;
            int Modelado;
            int Problemasfamiliares;
            int Fisiologica;
            int Comunicarnecesidad;
            int Planterapeutico;

            if (this.ckReglamentoafectiva.Items[0].Selected)
                Reglamentoafectiva = 1;
            else
                Reglamentoafectiva = 0;
            if (this.ckDistorsioncognitiva.Items[0].Selected)
                Distorsioncognitiva = 1;
            else
                Distorsioncognitiva = 0;
            if (this.ckRefuerzo.Items[0].Selected)
                Refuerzo = 1;
            else
                Refuerzo = 0;
            if (this.ckModelado.Items[0].Selected)
                Modelado = 1;
            else
                Modelado = 0;
            if (this.ckProblemasfamiliares.Items[0].Selected)
                Problemasfamiliares = 1;
            else
                Problemasfamiliares = 0;

            if (this.ckFisiologica.Items[0].Selected)
                Fisiologica = 1;
            else
                Fisiologica = 0;
            if (this.ckComunicarnecesidad.Items[0].Selected)
                Comunicarnecesidad = 1;
            else
                Comunicarnecesidad = 0;
            if (this.ckPlanterapeutico.Items[0].Selected)
                Planterapeutico = 1;
            else
                Planterapeutico = 0;

            DataTable dataTable2 = DB.ExecuteAdapter(string.Format("HCL00031SI_ACTUALIZACAMPOS '{0}','{1}','{2}','{3}','{4}','{5}','{6}','{7}','{8}','{9}','{10}','{11}'", (object)strpaciente, (object)strterapistaid, (object)strusuario, (object)strcentro, (object)Reglamentoafectiva, (object)Distorsioncognitiva, (object)Refuerzo, (object)Modelado, (object)Problemasfamiliares, (object)Fisiologica, (object)Comunicarnecesidad, (object)Planterapeutico));
            if (dataTable2.Rows.Count != 0)
            {
                DataRow row2 = dataTable2.Rows[0];
                if (row2["Conteo"].ToString() != "0")
                {
                    //Label1.Text = "Registro Guardado";
                    Notify("Registro Guardado", "success");

                }
                else
                    // Label1.Text = "NO GUARDO";
                    Notify("No se pudo almacenar la informacion, PRIMERO GUARDE LA PARTE 1", "error");
            }
            else
                // Label1.Text = "NO GUARDO";
                Notify("No se pudo almacenar la informacion, PRIMERO GUARDE LA PARTE 1", "error");

            _BuscarHistorico();

        }

        protected void LlenoPantalla()
        {
            //    if (Request.QueryString["NOMBRE"].ToString() != "")
            //    {
            //        xGUID = Request.QueryString["NOMBRE"].ToString();
            //    }

            //    ROWSGXID = Request.QueryString["LOCALIDAD"].ToString();
            //    //this.xGUID = DPPaciente.SelectedValue.ToString();
            //    this.xQueryParameters.Clear();
            //    this.xQueryValues.Clear();
            //    this.xQueryParameters.Add((object)"@GUID");
            //    this.xQueryValues.Add((object)this.xGUID.ToString());
            //    this.xQueryParameters.Add((object)"@ROWSGXID");
            //    this.xQueryValues.Add((object)this.ROWSGXID);
            //    this.xQuery = "PAX00000S2";
            //    DataTable dataTable = DB.ExecuteAdapter(this.xQuery, this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure);
            //    DataRow dataRow = dataTable.Rows.Count != 0 ? dataTable.Rows[0] : (DataRow)null;
            //    if (dataRow == null)
            //        return;
            //    /* this.txtNombre1.Value = dataRow["NOMBRE1"].ToString();
            //     this.txtNombre2.Value = dataRow["NOMBRE2"].ToString();
            //     this.txtApellido1.Value = dataRow["APELLIDO1"].ToString();
            //     this.txtApellido2.Value = dataRow["APELLIDO2"].ToString();
            //     this.txtApodo.Value = dataRow["APODO"].ToString(); */
            //    DPPaciente.Text = dataRow["FULLNAME"].ToString();
            //    DPPaciente.SelectedValue = xGUID;
            //    //+ " " + dataRow["NOMBRE2"].ToString() + " " + dataRow["APELLIDO1"].ToString() + " " + dataRow["APELLIDO2"].ToString();
            //    this.cmbSexo.Value = dataRow["SEXOID"].ToString();
            //    this.txtNSS.Value = dataRow["NSSID"].ToString();
            //    this.txtFechaNace.Value = Convert.ToDateTime(dataRow["FNACE"].ToString()).ToString("MM/dd/yyyy");
            //    this.cmbPais.SelectedValue = dataRow["PAISID"].ToString();
            //    //this._FillCiudades();
            //    this.cmbCiudad.Value = dataRow["CIUDADID"].ToString();
            //    this.cmbCondicion.Value = dataRow["COINDICION"].ToString();
            //    this.cmbResideCon.Value = dataRow["RESIDECON"].ToString();
            //    this.txtResideCon.Value = dataRow["RESIDECON1"].ToString();
            //    this.cmbCuidadoPor.Value = dataRow["CUIDADOPOR"].ToString();
            //    this.txtCuidadoPor.Value = dataRow["CUIDADOPOR1"].ToString();
            //    this.cmbARS.Value = dataRow["ARSID"].ToString();
            //    this.cmbPREDIAGNOSTICO.Value = dataRow["PREDIAGNOSTICO"].ToString();
            //    this.txtOtrosPrediagnostico.Value = dataRow["OTROSPREDIAGNOSTICO"].ToString();
            //    this.cmbCategoria.Value = dataRow["CATEGORIAID"].ToString();
            //    this.PAISID = dataRow["PAISID"].ToString();
            //    this.TxtAgenteServicioSocial.Value = dataRow["USUARIO"].ToString();
            //    this.TxtEstatusPaciente.Value = dataRow["ESTATUSDESCRIPCION"].ToString();

            //    //LLENO LAS DIRECCIONES
            //    ROWSGXID = Request.QueryString["LOCALIDAD"].ToString();
            //    this.xGUID = DPPaciente.SelectedValue.ToString();
            //    this.xQueryParameters.Clear();
            //    this.xQueryValues.Clear();
            //    this.xQueryParameters.Add((object)"@REFGUID");
            //    this.xQueryValues.Add((object)xGUID);
            //    this.xQueryParameters.Add((object)"@ROWSGXID");
            //    this.xQueryValues.Add((object)this.ROWSGXID);
            //    DataTable dataTableDirecciones = DB.ExecuteAdapter("SMX00100S3", this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure);
            //    if (dataTable.Rows.Count != 0)
            //    {
            //        int index = dataTableDirecciones.Rows.Count - 1;
            //        this.txtDirDireccion.Value = dataTableDirecciones.Rows[index]["DIRECCION"].ToString();
            //        this.cmbDirPais.SelectedValue = dataTableDirecciones.Rows[index]["PAISID"].ToString();
            //        this.cmbDirMunicipio.SelectedValue = dataTableDirecciones.Rows[index]["MUNICIPIOID"].ToString();
            //        this.cmbDirSector.Value = dataTableDirecciones.Rows[index]["SECTORID"].ToString();
            //        this.cmbDirZona.Value = dataTableDirecciones.Rows[index]["ZONAID"].ToString();
            //        this.txtDirTel1.Value = dataTableDirecciones.Rows[index]["TEL1"].ToString();
            //        this.txtDirTel2.Value = dataTableDirecciones.Rows[index]["TEL2"].ToString();
            //        this.txtDirTel3.Value = dataTableDirecciones.Rows[index]["TEL3"].ToString();
            //        this.txtDirTel4.Value = dataTableDirecciones.Rows[index]["TEL4"].ToString();
            //        this.cmbPropietarioTel1.Value = dataTableDirecciones.Rows[index]["PROPIETARIOTEL1"].ToString();
            //        this.cmbPropietarioTel2.Value = dataTableDirecciones.Rows[index]["PROPIETARIOTEL2"].ToString();
            //        this.cmbPropietarioTel3.Value = dataTableDirecciones.Rows[index]["PROPIETARIOTEL3"].ToString();
            //        this.cmbPropietarioTel4.Value = dataTableDirecciones.Rows[index]["PROPIETARIOTEL4"].ToString();
            //    }
            //    this._FillCiudades(dataRow["CIUDADID"].ToString());

            //    //this.pnlConsulta.Visible = false;
            //    //this.pnlData.Visible = true;

            //    /*BUSCO NUCLEO FAMILIAR */
            //    this.xQueryParameters.Clear();
            //    this.xQueryValues.Clear();
            //    this.xQueryParameters.Add((object)"@REFGUID");
            //    this.xQueryValues.Add((object)xGUID.ToString());
            //    this.xQueryParameters.Add((object)"@ROWSGXID");
            //    this.xQueryValues.Add((object)this.ROWSGXID);
            //    this.rpNucleoFamiliar.DataSource = (object)DB.ExecuteAdapter("PAX00001S3", this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure);
            //    this.rpNucleoFamiliar.DataBind();

            //    /* CITAS RECURRENTES*/
            //    this.xQueryParameters.Clear();
            //    this.xQueryValues.Clear();
            //    this.xQueryParameters.Add((object)"@REFGUID");
            //    this.xQueryValues.Add((object)xGUID.ToString());
            //    this.xQueryParameters.Add((object)"@ROWSGXID");
            //    this.xQueryValues.Add((object)this.ROWSGXID);
            //    this.rpCitasRecurrentes.DataSource = (object)DB.ExecuteAdapter("SMX00501S1_CITASRECURRENTES_PAX", this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure);
            //    this.rpCitasRecurrentes.DataBind();

            //    /* AUSENCIAS Y TARDANZAS*/
            //    string nombrecompleto = dataRow["NOMBRE1"].ToString() + " " + dataRow["NOMBRE2"].ToString() + " " + dataRow["APELLIDO1"].ToString() + " " + dataRow["APELLIDO2"].ToString();
            //    this.xQueryParameters.Clear();
            //    this.xQueryValues.Clear();
            //    this.xQueryParameters.Add((object)"@NOMBRE");
            //    this.xQueryValues.Add((object)nombrecompleto.ToString());
            //    this.xQueryParameters.Add((object)"@ROWSGXID");
            //    this.xQueryValues.Add((object)this.ROWSGXID);
            //    this.rpDataPaciente.DataSource = (object)DB.ExecuteAdapter("PR_TardanzasyAusencias_Busca", this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure);
            //    this.rpDataPaciente.DataBind();

        }
        public void Notify(string msg, string tipo)
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "notify('" + msg + "','" + tipo + "');", true);
        }
    }
}