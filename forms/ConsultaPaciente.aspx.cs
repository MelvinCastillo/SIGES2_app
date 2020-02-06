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

namespace CAID_V2.forms
{
    public partial class ConsultaPaciente : System.Web.UI.Page
    {
        private ArrayList xQueryParameters = new ArrayList();
        private ArrayList xQueryValues = new ArrayList();
#pragma warning disable CS0169 // The field 'ConsultaPaciente.xCommand' is never used
#pragma warning disable CS0169 // The field 'ConsultaPaciente.xCommand' is never used
        private string xCommand;
#pragma warning restore CS0169 // The field 'ConsultaPaciente.xCommand' is never used
#pragma warning restore CS0169 // The field 'ConsultaPaciente.xCommand' is never used
        private string xQuery;
        string ROWSGXID;// = "CAID-SD";
        string USERNAME;
        string xGUID;
        string PAISID;
        protected void Page_Load(object sender, EventArgs e)
        {

            //if (Page != null && Page.EnableEventValidation)
            //{
            //    Form.Attributes["onsubmit"] = "return AllowFormToRun();";
            //}


            if (!IsPostBack)
            {
                USERNAME = Request.QueryString["USUARIO"].ToString();
                ROWSGXID = Request.QueryString["LOCALIDAD"].ToString();

                this.xQueryParameters.Add((object)"@NOMBRE");
                this.xQueryValues.Add((object)"%");
                this.xQueryParameters.Add((object)"@ROWSGXID");
                this.xQueryValues.Add(ROWSGXID); 
                this.DPPaciente.Items.Add(new ListItem("-- SELECCIONE --", string.Empty));
                foreach (DataRow row in (InternalDataCollectionBase)DB.ExecuteAdapter("PAX00000S1", this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure).Rows)
                    this.DPPaciente.Items.Add(new ListItem(row["FULLNAME"].ToString(), row["ROWGUID"].ToString()));

                _Iniciar();
            }
        }

        private void _FillCiudades(string ciudad)
        {
            try
            {
                this.xQueryParameters.Clear();
                this.xQueryValues.Clear();
                this.xQueryParameters.Add((object)"@PAISID");
                this.xQueryValues.Add((object)ciudad);
                this.xQueryParameters.Add((object)"@ROWSGXID");
                this.xQueryValues.Add((object)this.ROWSGXID);
                this.cmbCiudad.Items.Clear();
                this.cmbCiudad.Items.Add(new ListItem("-- SELECCIONE --", string.Empty));
                foreach (DataRow row in (InternalDataCollectionBase)DB.ExecuteAdapter("SMX00002S3", this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure).Rows)
                    this.cmbCiudad.Items.Add(new ListItem(row["NOMBRE"].ToString(), row["ROWGUID"].ToString()));
            }
            catch
            {
            }
        }

        private void _Iniciar()
        {
            this.xQueryParameters.Add((object)"@NOMBRE");
            this.xQueryValues.Add((object)"%");
            this.xQueryParameters.Add((object)"@ROWSGXID");
            this.xQueryValues.Add((object)this.ROWSGXID);
            this.cmbCategoria.Items.Add(new ListItem("-- SELECCIONE --", string.Empty));
            foreach (DataRow row in (InternalDataCollectionBase)DB.ExecuteAdapter("PAX00200S1", this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure).Rows)
                this.cmbCategoria.Items.Add(new ListItem(row["NOMBRE"].ToString(), row["ROWGUID"].ToString()));
            this.xQueryParameters.Clear();
            this.xQueryValues.Clear();
            this.xQueryParameters.Add((object)"@NOMBRE");
            this.xQueryValues.Add((object)"%");
            this.xQueryParameters.Add((object)"@ROWSGXID");
            this.xQueryValues.Add((object)this.ROWSGXID);
            this.cmbPais.Items.Clear();
            this.cmbCiudad.Items.Clear();
            this.cmbARS.Items.Clear();
            this.cmbPais.Items.Add(new ListItem("-- SELECCIONE --", string.Empty));
            this.cmbCiudad.Items.Add(new ListItem("-- SELECCIONE --", string.Empty));
            this.cmbARS.Items.Add(new ListItem("-- SELECCIONE --", string.Empty));
            this.cmbPREDIAGNOSTICO.Items.Add(new ListItem("-- SELECCIONE --", string.Empty));
            this.cmbDIAGNOSTICO1.Items.Add(new ListItem("-- SELECCIONE --", string.Empty));
            this.cmbDIAGNOSTICO2.Items.Add(new ListItem("-- SELECCIONE --", string.Empty));

            /* cargo catalogos generales*/
            this.xQueryParameters.Clear();
            this.xQueryValues.Clear();
            this.xQueryParameters.Add((object)"@NOMBRE");
            this.xQueryValues.Add((object)"%");
            this.xQueryParameters.Add((object)"@ROWSGXID");
            this.xQueryValues.Add((object)this.ROWSGXID);
            foreach (DataRow row in (InternalDataCollectionBase)DB.ExecuteAdapter("SMX00001S1", this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure).Rows)
                this.cmbPais.Items.Add(new ListItem(row["NOMBRE"].ToString(), row["ROWGUID"].ToString()));
            foreach (DataRow row in (InternalDataCollectionBase)DB.ExecuteAdapter("SMX00200S1", this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure).Rows)
                this.cmbARS.Items.Add(new ListItem(row["NOMBRE"].ToString(), row["ROWGUID"].ToString()));
            foreach (DataRow row in (InternalDataCollectionBase)DB.ExecuteAdapter("PAX00700S1", this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure).Rows)
            { 
                this.cmbPREDIAGNOSTICO.Items.Add(new ListItem(row["NOMBRE"].ToString(), row["ROWGUID"].ToString()));
                this.cmbDIAGNOSTICO1.Items.Add(new ListItem(row["NOMBRE"].ToString(), row["ROWGUID"].ToString()));
                this.cmbDIAGNOSTICO2.Items.Add(new ListItem(row["NOMBRE"].ToString(), row["ROWGUID"].ToString()));

            }
            /* busca direcciones y telefonos */
            this.txtDirDireccion.Value = string.Empty;
            this.cmbDirPais.SelectedValue = string.Empty;
            this.cmbDirMunicipio.SelectedValue = string.Empty;
            this.cmbDirSector.Value = string.Empty;
            this.cmbDirZona.Value = string.Empty;
            this.txtDirTel1.Value = string.Empty;
            this.txtDirTel2.Value = string.Empty;
            this.txtDirTel3.Value = string.Empty;
            this.txtDirTel4.Value = string.Empty;
            //this.xREFGUID.Value = REFGUID;
            //this.xTOKEN.Value = TOKEN;
            //this.MainShadow.Attributes.Add("class", "navi");
            //this.SMX00100.Visible = true;
            this.xQueryParameters.Clear();
            this.xQueryValues.Clear();
            this.xQueryParameters.Add((object)"@NOMBRE");
            this.xQueryValues.Add((object)"%");
            this.xQueryParameters.Add((object)"@ROWSGXID");
            this.xQueryValues.Add((object)this.ROWSGXID);
            this.cmbPropietarioTel1.Items.Clear();
            this.cmbPropietarioTel2.Items.Clear();
            this.cmbPropietarioTel3.Items.Clear();
            this.cmbPropietarioTel4.Items.Clear();
            this.cmbPropietarioTel1.Items.Add(new ListItem("-- SELECCIONE --", string.Empty));
            this.cmbPropietarioTel2.Items.Add(new ListItem("-- SELECCIONE --", string.Empty));
            this.cmbPropietarioTel3.Items.Add(new ListItem("-- SELECCIONE --", string.Empty));
            this.cmbPropietarioTel4.Items.Add(new ListItem("-- SELECCIONE --", string.Empty));
            foreach (DataRow row in (InternalDataCollectionBase)DB.ExecuteAdapter("SMX30003S1", this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure).Rows)
            {
                this.cmbPropietarioTel1.Items.Add(new ListItem(row["NOMBRE"].ToString(), row["ROWGUID"].ToString()));
                this.cmbPropietarioTel2.Items.Add(new ListItem(row["NOMBRE"].ToString(), row["ROWGUID"].ToString()));
                this.cmbPropietarioTel3.Items.Add(new ListItem(row["NOMBRE"].ToString(), row["ROWGUID"].ToString()));
                this.cmbPropietarioTel4.Items.Add(new ListItem(row["NOMBRE"].ToString(), row["ROWGUID"].ToString()));
            }
            this.xQueryParameters.Clear();
            this.xQueryValues.Clear();
            this.xQueryParameters.Add((object)"@NOMBRE");
            this.xQueryValues.Add((object)"%");
            this.xQueryParameters.Add((object)"@ROWSGXID");
            this.xQueryValues.Add((object)this.ROWSGXID);
            this.cmbDirPais.Items.Clear();
            this.cmbDirProvincia.Items.Clear();
            this.cmbDirMunicipio.Items.Clear();
            this.cmbDirSector.Items.Clear();
            this.cmbDirZona.Items.Clear();
            this.cmbDirPais.Items.Add(new ListItem("-- SELECCIONE --", string.Empty));
            this.cmbDirProvincia.Items.Add(new ListItem("-- SELECCIONE --", string.Empty));
            this.cmbDirMunicipio.Items.Add(new ListItem("-- SELECCIONE --", string.Empty));
            this.cmbDirSector.Items.Add(new ListItem("-- SELECCIONE --", string.Empty));
            this.cmbDirZona.Items.Add(new ListItem("-- SELECCIONE --", string.Empty));
            foreach (DataRow row in (InternalDataCollectionBase)DB.ExecuteAdapter("SMX00001S1", this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure).Rows)
                this.cmbDirPais.Items.Add(new ListItem(row["NOMBRE"].ToString(), row["ROWGUID"].ToString()));
            foreach (DataRow row in (InternalDataCollectionBase)DB.ExecuteAdapter("SMX00002S1", this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure).Rows)
                this.cmbDirProvincia.Items.Add(new ListItem(row["NOMBRE"].ToString(), row["ROWGUID"].ToString()));
            foreach (DataRow row in (InternalDataCollectionBase)DB.ExecuteAdapter("SMX00003S1", this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure).Rows)
                this.cmbDirMunicipio.Items.Add(new ListItem(row["NOMBRE"].ToString(), row["ROWGUID"].ToString()));
            foreach (DataRow row in (InternalDataCollectionBase)DB.ExecuteAdapter("SMX00004S1", this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure).Rows)
                this.cmbDirSector.Items.Add(new ListItem(row["NOMBRE"].ToString(), row["ROWGUID"].ToString()));
            foreach (DataRow row in (InternalDataCollectionBase)DB.ExecuteAdapter("SMX00005S1", this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure).Rows)
                this.cmbDirZona.Items.Add(new ListItem(row["NOMBRE"].ToString(), row["ROWGUID"].ToString()));
            //this.cmbDirPais.SelectedValue = (string)CURRENTUSR.DEFAULT_PAIS;
             
                if (Request.QueryString["NOMBRE"].ToString() != "")
                {
                LlenoPantalla( );
                } 
            
        }

        private void _FillProvinciasyZonas(string zona)
        {
            try
            {
                this.xQueryParameters.Clear();
                this.xQueryValues.Clear();
                this.xQueryParameters.Add((object)zona);
                this.xQueryValues.Add((object)this.PAISID);
                this.xQueryParameters.Add((object)"@ROWSGXID");
                this.xQueryValues.Add((object)this.ROWSGXID);
                this.cmbDirProvincia.Items.Clear();
                this.cmbDirProvincia.Items.Add(new ListItem("-- SELECCIONE --", string.Empty));
                foreach (DataRow row in (InternalDataCollectionBase)DB.ExecuteAdapter("SMX00002S4", this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure).Rows)
                    this.cmbDirProvincia.Items.Add(new ListItem(row["NOMBRE"].ToString(), row["ROWGUID"].ToString()));
                this.xQueryParameters.Clear();
                this.xQueryValues.Clear();
                this.xQueryParameters.Add((object)"@PAISID");
                this.xQueryValues.Add((object)this.PAISID);
                this.xQueryParameters.Add((object)"@ROWSGXID");
                this.xQueryValues.Add((object)this.ROWSGXID);
                this.cmbDirZona.Items.Clear();
                this.cmbDirZona.Items.Add(new ListItem("-- SELECCIONE --", string.Empty));
                foreach (DataRow row in (InternalDataCollectionBase)DB.ExecuteAdapter("SMX00005S4", this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure).Rows)
                    this.cmbDirZona.Items.Add(new ListItem(row["NOMBRE"].ToString(), row["ROWGUID"].ToString()));
            }
            catch
            {
            }
        }

        private void _FillMunicipios(string municipio)
        {
            try
            {
                this.xQueryParameters.Clear();
                this.xQueryValues.Clear();
                this.xQueryParameters.Add((object)municipio);
                this.xQueryValues.Add("%");
                this.xQueryParameters.Add((object)"@ROWSGXID");
                this.xQueryValues.Add((object)this.ROWSGXID);
                this.cmbDirMunicipio.Items.Clear();
                this.cmbDirMunicipio.Items.Add(new ListItem("-- SELECCIONE --", string.Empty));
                foreach (DataRow row in (InternalDataCollectionBase)DB.ExecuteAdapter("SMX00003S4", this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure).Rows)
                    this.cmbDirMunicipio.Items.Add(new ListItem(row["NOMBRE"].ToString(), row["ROWGUID"].ToString()));
            }
            catch
            {
            }
        }

        private void _FillSectores(string sector)
        {
            try
            {
                this.xQueryParameters.Clear();
                this.xQueryValues.Clear();
                this.xQueryParameters.Add((object)sector);
                this.xQueryValues.Add((object)"%");
                this.xQueryParameters.Add((object)"@ROWSGXID");
                this.xQueryValues.Add((object)this.ROWSGXID);
                this.cmbDirSector.Items.Clear();
                this.cmbDirSector.Items.Add(new ListItem("-- SELECCIONE --", string.Empty));
                foreach (DataRow row in (InternalDataCollectionBase)DB.ExecuteAdapter("SMX00004S4", this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure).Rows)
                    this.cmbDirSector.Items.Add(new ListItem(row["NOMBRE"].ToString(), row["ROWGUID"].ToString()));
            }
            catch
            {
            }
        }

        protected void _Show(object sender, EventArgs e)
        {
            if (Request.QueryString["NOMBRE"].ToString() != "")
                {
                xGUID = Request.QueryString["NOMBRE"].ToString();
                }
                
            ROWSGXID = Request.QueryString["LOCALIDAD"].ToString();
            this.xGUID = DPPaciente.SelectedValue.ToString();
            this.xQueryParameters.Clear();
            this.xQueryValues.Clear();
            this.xQueryParameters.Add((object)"@GUID");
            this.xQueryValues.Add((object)this.xGUID.ToString());
            this.xQueryParameters.Add((object)"@ROWSGXID");
            this.xQueryValues.Add((object)this.ROWSGXID);
            this.xQuery = "PAX00000S2";
            DataTable dataTable = DB.ExecuteAdapter(this.xQuery, this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure);
            DataRow dataRow = dataTable.Rows.Count > 0 ? dataTable.Rows[0] : (DataRow)null;
            if (dataRow == null)
                return;
            /* this.txtNombre1.Value = dataRow["NOMBRE1"].ToString();
             this.txtNombre2.Value = dataRow["NOMBRE2"].ToString();
             this.txtApellido1.Value = dataRow["APELLIDO1"].ToString();
             this.txtApellido2.Value = dataRow["APELLIDO2"].ToString();
             this.txtApodo.Value = dataRow["APODO"].ToString(); */
            // DPPaciente.Text =  dataRow["NOMBRE1"].ToString() +" "+  dataRow["NOMBRE2"].ToString() + " " + dataRow["APELLIDO1"].ToString() + " " + dataRow["APELLIDO2"].ToString();
            this.cmbSexo.Value = dataRow["SEXOID"].ToString();
            this.txtNSS.Value = dataRow["NSSID"].ToString();
            this.txtFechaNace.Value = Convert.ToDateTime(dataRow["FNACE"].ToString()).ToString("MM/dd/yyyy");
            this.txtCategoria.Value = dataRow["CATEGORIADESC"].ToString();
            this.cmbPais.SelectedValue = dataRow["PAISID"].ToString();
            //this._FillCiudades();
            this.cmbCiudad.Value = dataRow["CIUDADID"].ToString();
            this.cmbCondicion.Value = dataRow["COINDICION"].ToString();
            this.cmbResideCon.Value = dataRow["RESIDECON"].ToString();
            this.txtResideCon.Value = dataRow["RESIDECON1"].ToString();
            this.cmbCuidadoPor.Value = dataRow["CUIDADOPOR"].ToString();
            this.txtCuidadoPor.Value = dataRow["CUIDADOPOR1"].ToString();
            this.cmbARS.Value = dataRow["ARSID"].ToString();
            this.cmbPREDIAGNOSTICO.Value = dataRow["PREDIAGNOSTICO"].ToString();
            this.cmbDIAGNOSTICO1.Value = dataRow["Diagnostico1"].ToString();
            this.cmbDIAGNOSTICO2.Value = dataRow["Diagnostico2"].ToString(); 
            this.txtOtrosPrediagnostico.Value = dataRow["OTROSPREDIAGNOSTICO"].ToString();
            this.cmbCategoria.Value = dataRow["CATEGORIAID"].ToString();
            this.PAISID = dataRow["PAISID"].ToString();
            this.TxtAgenteServicioSocial.Value = dataRow["USUARIO"].ToString();
            this.TxtEstatusPaciente.Value = dataRow["ESTATUSDESCRIPCION"].ToString();
            this.TxtMotivoEstatus.Value = dataRow["MOTIVOESTATUS"].ToString(); 
            this.lbledad1.Text = dataRow["edad"].ToString();
            this.lblfechamodificacion.Text = dataRow["Fechamodificacion"].ToString();


            this.FillDireccionesTelefonos(sender, e);
            this._FillCiudades(dataRow["CIUDADID"].ToString());

            //this.pnlConsulta.Visible = false;
            //this.pnlData.Visible = true;

            /*BUSCO NUCLEO FAMILIAR */
            this.xQueryParameters.Clear();
            this.xQueryValues.Clear();
            this.xQueryParameters.Add((object)"@REFGUID");
            this.xQueryValues.Add((object)xGUID.ToString());
            this.xQueryParameters.Add((object)"@ROWSGXID");
            this.xQueryValues.Add((object)this.ROWSGXID);
            this.rpNucleoFamiliar.DataSource = (object)DB.ExecuteAdapter("PAX00001S3", this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure);
            this.rpNucleoFamiliar.DataBind();

            /* CITAS RECURRENTES*/
            this.xQueryParameters.Clear();
            this.xQueryValues.Clear();
            this.xQueryParameters.Add((object)"@REFGUID");
            this.xQueryValues.Add((object)xGUID.ToString());
            this.xQueryParameters.Add((object)"@ROWSGXID");
            this.xQueryValues.Add((object)this.ROWSGXID);
            this.rpCitasRecurrentes.DataSource = (object)DB.ExecuteAdapter("SMX00501S1_CITASRECURRENTES_PAX", this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure);
            this.rpCitasRecurrentes.DataBind();

            /* AUSENCIAS Y TARDANZAS*/
            string nombrecompleto = dataRow["NOMBRE1"].ToString() + " " + dataRow["NOMBRE2"].ToString() + " " + dataRow["APELLIDO1"].ToString() + " " + dataRow["APELLIDO2"].ToString();
            this.xQueryParameters.Clear();
            this.xQueryValues.Clear();
            this.xQueryParameters.Add((object)"@NOMBRE");
            this.xQueryValues.Add((object)nombrecompleto.ToString());
            this.xQueryParameters.Add((object)"@ROWSGXID");
            this.xQueryValues.Add((object)this.ROWSGXID);
            this.rpDataPaciente.DataSource = (object)DB.ExecuteAdapter("PR_TardanzasyAusencias_Busca", this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure);
            this.rpDataPaciente.DataBind();

            /* DE ALTA SERVICIO*/
            this.xQueryParameters.Clear();
            this.xQueryValues.Clear();
            this.xQueryParameters.Add((object)"@ROWGUID");
            this.xQueryValues.Add((object)xGUID.ToString());
            this.xQueryParameters.Add((object)"@ROWSGXID");
            this.xQueryValues.Add((object)this.ROWSGXID);
            this.rpDataDEALTASERVICIO.DataSource = (object)DB.ExecuteAdapter("PR_PAX00000_DEALTABusca", this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure);
            this.rpDataDEALTASERVICIO.DataBind();

        }

        protected void FillDireccionesTelefonos(object sender, EventArgs e)
        {
            ROWSGXID = Request.QueryString["LOCALIDAD"].ToString();
            this.xGUID = DPPaciente.SelectedValue.ToString();
            this.xQueryParameters.Clear();
            this.xQueryValues.Clear();
            this.xQueryParameters.Add((object)"@REFGUID");
            this.xQueryValues.Add((object)xGUID);
            this.xQueryParameters.Add((object)"@ROWSGXID");
            this.xQueryValues.Add((object)this.ROWSGXID);
            DataTable dataTable = DB.ExecuteAdapter("SMX00100S3", this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure);
            if (dataTable.Rows.Count > 0)
            {
                int index = dataTable.Rows.Count - 1;
                this.txtDirDireccion.Value = dataTable.Rows[index]["DIRECCION"].ToString();
                this.cmbDirPais.SelectedValue = dataTable.Rows[index]["PAISID"].ToString();
                this.cmbDirProvincia.SelectedValue = dataTable.Rows[index]["PROVINCIAID"].ToString();
                this.cmbDirMunicipio.SelectedValue = dataTable.Rows[index]["MUNICIPIOID"].ToString();
                this.cmbDirSector.Value = dataTable.Rows[index]["SECTORID"].ToString();
                this.cmbDirZona.Value = dataTable.Rows[index]["ZONAID"].ToString();
                this.txtDirTel1.Value = dataTable.Rows[index]["TEL1"].ToString();
                this.txtDirTel2.Value = dataTable.Rows[index]["TEL2"].ToString();
                this.txtDirTel3.Value = dataTable.Rows[index]["TEL3"].ToString();
                this.txtDirTel4.Value = dataTable.Rows[index]["TEL4"].ToString();
                this.cmbPropietarioTel1.Value = dataTable.Rows[index]["PROPIETARIOTEL1"].ToString();
                this.cmbPropietarioTel2.Value = dataTable.Rows[index]["PROPIETARIOTEL2"].ToString();
                this.cmbPropietarioTel3.Value = dataTable.Rows[index]["PROPIETARIOTEL3"].ToString();
                this.cmbPropietarioTel4.Value = dataTable.Rows[index]["PROPIETARIOTEL4"].ToString();
            }
        }

        protected void LlenoPantalla()
        {
            if (Request.QueryString["NOMBRE"].ToString() != "")
            {
                xGUID = Request.QueryString["NOMBRE"].ToString();
            }

            ROWSGXID = Request.QueryString["LOCALIDAD"].ToString();
            //this.xGUID = DPPaciente.SelectedValue.ToString();
            this.xQueryParameters.Clear();
            this.xQueryValues.Clear();
            this.xQueryParameters.Add((object)"@GUID");
            this.xQueryValues.Add((object)this.xGUID.ToString());
            this.xQueryParameters.Add((object)"@ROWSGXID");
            this.xQueryValues.Add((object)this.ROWSGXID);
            this.xQuery = "PAX00000S2";
            DataTable dataTable = DB.ExecuteAdapter(this.xQuery, this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure);
            DataRow dataRow = dataTable.Rows.Count > 0 ? dataTable.Rows[0] : (DataRow)null;
            if (dataRow == null)
                return;
            /* this.txtNombre1.Value = dataRow["NOMBRE1"].ToString();
             this.txtNombre2.Value = dataRow["NOMBRE2"].ToString();
             this.txtApellido1.Value = dataRow["APELLIDO1"].ToString();
             this.txtApellido2.Value = dataRow["APELLIDO2"].ToString();
             this.txtApodo.Value = dataRow["APODO"].ToString(); */
            DPPaciente.Text = dataRow["FULLNAME"].ToString();
            DPPaciente.SelectedValue = xGUID;
            //+ " " + dataRow["NOMBRE2"].ToString() + " " + dataRow["APELLIDO1"].ToString() + " " + dataRow["APELLIDO2"].ToString();
            this.cmbSexo.Value = dataRow["SEXOID"].ToString();
            this.txtNSS.Value = dataRow["NSSID"].ToString();
            this.txtFechaNace.Value = Convert.ToDateTime(dataRow["FNACE"].ToString()).ToString("MM/dd/yyyy");
            this.txtCategoria.Value = dataRow["CATEGORIADESC"].ToString();
            this.cmbPais.SelectedValue = dataRow["PAISID"].ToString();
            //this._FillCiudades();
            this.cmbCiudad.Value = dataRow["CIUDADID"].ToString();
            this.cmbCondicion.Value = dataRow["COINDICION"].ToString();
            this.cmbResideCon.Value = dataRow["RESIDECON"].ToString();
            this.txtResideCon.Value = dataRow["RESIDECON1"].ToString();
            this.cmbCuidadoPor.Value = dataRow["CUIDADOPOR"].ToString();
            this.txtCuidadoPor.Value = dataRow["CUIDADOPOR1"].ToString();
            this.cmbARS.Value = dataRow["ARSID"].ToString();
            this.cmbPREDIAGNOSTICO.Value = dataRow["PREDIAGNOSTICO"].ToString();
            this.cmbDIAGNOSTICO1.Value = dataRow["Diagnostico1"].ToString();
            this.cmbDIAGNOSTICO2.Value = dataRow["Diagnostico2"].ToString();
            this.txtOtrosPrediagnostico.Value = dataRow["OTROSPREDIAGNOSTICO"].ToString();
            this.cmbCategoria.Value = dataRow["CATEGORIAID"].ToString();
            this.PAISID = dataRow["PAISID"].ToString();
            this.TxtAgenteServicioSocial.Value = dataRow["USUARIO"].ToString();
            this.TxtEstatusPaciente.Value = dataRow["ESTATUSDESCRIPCION"].ToString();
            this.TxtMotivoEstatus.Value = dataRow["MOTIVOESTATUS"].ToString();  
            

            //LLENO LAS DIRECCIONES
            ROWSGXID = Request.QueryString["LOCALIDAD"].ToString();
            this.xGUID = DPPaciente.SelectedValue.ToString();
            this.xQueryParameters.Clear();
            this.xQueryValues.Clear();
            this.xQueryParameters.Add((object)"@REFGUID");
            this.xQueryValues.Add((object)xGUID);
            this.xQueryParameters.Add((object)"@ROWSGXID");
            this.xQueryValues.Add((object)this.ROWSGXID);
            DataTable dataTableDirecciones = DB.ExecuteAdapter("SMX00100S3", this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure);
            if (dataTableDirecciones.Rows.Count > 0)
            {
                int index = dataTableDirecciones.Rows.Count - 1;
                this.txtDirDireccion.Value = dataTableDirecciones.Rows[index]["DIRECCION"].ToString();
                this.cmbDirPais.SelectedValue = dataTableDirecciones.Rows[index]["PAISID"].ToString();
                this.cmbDirMunicipio.SelectedValue = dataTableDirecciones.Rows[index]["MUNICIPIOID"].ToString();
                this.cmbDirSector.Value = dataTableDirecciones.Rows[index]["SECTORID"].ToString();
                this.cmbDirZona.Value = dataTableDirecciones.Rows[index]["ZONAID"].ToString();
                this.txtDirTel1.Value = dataTableDirecciones.Rows[index]["TEL1"].ToString();
                this.txtDirTel2.Value = dataTableDirecciones.Rows[index]["TEL2"].ToString();
                this.txtDirTel3.Value = dataTableDirecciones.Rows[index]["TEL3"].ToString();
                this.txtDirTel4.Value = dataTableDirecciones.Rows[index]["TEL4"].ToString();
                this.cmbPropietarioTel1.Value = dataTableDirecciones.Rows[index]["PROPIETARIOTEL1"].ToString();
                this.cmbPropietarioTel2.Value = dataTableDirecciones.Rows[index]["PROPIETARIOTEL2"].ToString();
                this.cmbPropietarioTel3.Value = dataTableDirecciones.Rows[index]["PROPIETARIOTEL3"].ToString();
                this.cmbPropietarioTel4.Value = dataTableDirecciones.Rows[index]["PROPIETARIOTEL4"].ToString();
            }
            this._FillCiudades(dataRow["CIUDADID"].ToString());

            //this.pnlConsulta.Visible = false;
            //this.pnlData.Visible = true;

            /*BUSCO NUCLEO FAMILIAR */
            this.xQueryParameters.Clear();
            this.xQueryValues.Clear();
            this.xQueryParameters.Add((object)"@REFGUID");
            this.xQueryValues.Add((object)xGUID.ToString());
            this.xQueryParameters.Add((object)"@ROWSGXID");
            this.xQueryValues.Add((object)this.ROWSGXID);
            this.rpNucleoFamiliar.DataSource = (object)DB.ExecuteAdapter("PAX00001S3", this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure);
            this.rpNucleoFamiliar.DataBind();

            /* CITAS RECURRENTES*/
            this.xQueryParameters.Clear();
            this.xQueryValues.Clear();
            this.xQueryParameters.Add((object)"@REFGUID");
            this.xQueryValues.Add((object)xGUID.ToString());
            this.xQueryParameters.Add((object)"@ROWSGXID");
            this.xQueryValues.Add((object)this.ROWSGXID);
            this.rpCitasRecurrentes.DataSource = (object)DB.ExecuteAdapter("SMX00501S1_CITASRECURRENTES_PAX", this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure);
            this.rpCitasRecurrentes.DataBind();

            /* AUSENCIAS Y TARDANZAS*/
            string nombrecompleto = dataRow["NOMBRE1"].ToString() + " " + dataRow["NOMBRE2"].ToString() + " " + dataRow["APELLIDO1"].ToString() + " " + dataRow["APELLIDO2"].ToString();
            this.xQueryParameters.Clear();
            this.xQueryValues.Clear();
            this.xQueryParameters.Add((object)"@NOMBRE");
            this.xQueryValues.Add((object)nombrecompleto.ToString());
            this.xQueryParameters.Add((object)"@ROWSGXID");
            this.xQueryValues.Add((object)this.ROWSGXID);
            this.rpDataPaciente.DataSource = (object)DB.ExecuteAdapter("PR_TardanzasyAusencias_Busca", this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure);
            this.rpDataPaciente.DataBind();

        }
    }
}