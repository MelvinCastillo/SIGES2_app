using System;
using System.Collections;
using System.Data;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using CAID.Data;


namespace CAID_V2.forms
{
    public partial class TFEntrevistaInicial : System.Web.UI.Page
    {
        private ArrayList xQueryParameters = new ArrayList();
        private ArrayList xQueryValues = new ArrayList();
        private string xCommand;
        private string xQuery;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //Lista de participantes
                this.ckparticipantes.Items.Clear();
                this.xQueryParameters.Clear();
                this.xQueryValues.Clear(); //order by nombre
                DataTable dtparticipantes = DB.ExecuteAdapter(string.Format("select * from vparticipantes", this.xQueryValues, CommandType.Text));
                if (dtparticipantes.Rows.Count == 0)
                {
                    ckparticipantes.Visible = false;
                    ckpersonaCargo.Visible = false;
                    ckmanejadisciplina.Visible = false;
                    ckpersonavivenencasa.Visible = false;

                }
                else
                {
                    foreach (DataRow row in (InternalDataCollectionBase)dtparticipantes.Rows)
                    {
                        this.ckparticipantes.Items.Add(new ListItem(row["NOMBRE"].ToString(), row["codigo"].ToString()));
                        this.ckpersonaCargo.Items.Add(new ListItem(row["NOMBRE"].ToString(), row["codigo"].ToString()));
                        this.ckmanejadisciplina.Items.Add(new ListItem(row["NOMBRE"].ToString(), row["codigo"].ToString()));
                        this.ckpersonavivenencasa.Items.Add(new ListItem(row["NOMBRE"].ToString(), row["codigo"].ToString()));

                    }
                }
                //Lista de estilos de crianza
                this.ddestilocrianza.Items.Clear();
                this.xQueryParameters.Clear();
                this.xQueryValues.Clear();
                DataTable dtestilocrianza = DB.ExecuteAdapter(string.Format("select Codigo,Nombre from ESTILOCRIANZA order by nombre", this.xQueryValues, CommandType.Text));
                if (dtestilocrianza.Rows.Count > 0)
                {
                    this.ddestilocrianza.Items.Add(new ListItem("-- SELECCIONE --", string.Empty));
                    foreach (DataRow row in (InternalDataCollectionBase)dtestilocrianza.Rows)
                        this.ddestilocrianza.Items.Add(new ListItem(row["NOMBRE"].ToString(), row["codigo"].ToString()));
                }

                //Lista de estado civil
                this.ddEstadoCivil.Items.Clear();
                this.xQueryParameters.Clear();
                this.xQueryValues.Clear();
                DataTable dtestadocivil = DB.ExecuteAdapter(string.Format("select Codigo,Nombre from ESTADOCIVIL order by nombre", this.xQueryValues, CommandType.Text));
                if (dtestadocivil.Rows.Count > 0)
                {
                    this.ddEstadoCivil.Items.Add(new ListItem("-- SELECCIONE --", string.Empty));
                    foreach (DataRow row in (InternalDataCollectionBase)dtestadocivil.Rows)
                        this.ddEstadoCivil.Items.Add(new ListItem(row["NOMBRE"].ToString(), row["codigo"].ToString()));
                }

                //Lista de estructura Familiar
                this.ddEstructuraFamiliar.Items.Clear();
                this.xQueryParameters.Clear();
                this.xQueryValues.Clear();
                DataTable dtestructurafamiliar = DB.ExecuteAdapter(string.Format("select Codigo,Nombre from ESTRUCTURAFAMILIAR order by nombre", this.xQueryValues, CommandType.Text));
                if (dtestructurafamiliar.Rows.Count > 0)
                {
                    this.ddEstructuraFamiliar.Items.Add(new ListItem("-- SELECCIONE --", string.Empty));
                    foreach (DataRow row in (InternalDataCollectionBase)dtestructurafamiliar.Rows)
                        this.ddEstructuraFamiliar.Items.Add(new ListItem(row["NOMBRE"].ToString(), row["codigo"].ToString()));
                }
                //Lista de Relacion entre los padres
                this.ddlrelacionpadres.Items.Clear();
                this.xQueryParameters.Clear();
                this.xQueryValues.Clear();
                DataTable dtrelacionapadres = DB.ExecuteAdapter(string.Format("select Codigo,Nombre from RELACIONPADRES order by nombre", this.xQueryValues, CommandType.Text));
                if (dtrelacionapadres.Rows.Count > 0)
                {
                    this.ddlrelacionpadres.Items.Add(new ListItem("-- SELECCIONE --", string.Empty));
                    this.ddlrelacionpacientemadre.Items.Add(new ListItem("-- SELECCIONE --", string.Empty)); 
                    this.ddrelacinopacientepadre.Items.Add(new ListItem("-- SELECCIONE --", string.Empty)); 
                    this.ddlrelacionpacientecuidador.Items.Add(new ListItem("-- SELECCIONE --", string.Empty));
                    foreach (DataRow row in (InternalDataCollectionBase)dtrelacionapadres.Rows)
                    {
                        this.ddlrelacionpadres.Items.Add(new ListItem(row["NOMBRE"].ToString(), row["codigo"].ToString()));
                        this.ddlrelacionpacientemadre.Items.Add(new ListItem(row["NOMBRE"].ToString(), row["codigo"].ToString()));
                        this.ddrelacinopacientepadre.Items.Add(new ListItem(row["NOMBRE"].ToString(), row["codigo"].ToString()));
                        this.ddlrelacionpacientecuidador.Items.Add(new ListItem(row["NOMBRE"].ToString(), row["codigo"].ToString()));
                    }
                }

                //Lista de Situaciones Especiales dentro del ambito escolar
                this.cksituacionesespeciales.Items.Clear();
                this.xQueryParameters.Clear();
                this.xQueryValues.Clear();
                DataTable ddsituacionesespeciales = DB.ExecuteAdapter(string.Format("select Codigo,Nombre from SITUACIONESESPECIALESESCOLARES order by nombre", this.xQueryValues, CommandType.Text));
                if (ddsituacionesespeciales.Rows.Count > 0)
                { 
                    foreach (DataRow row in (InternalDataCollectionBase)ddsituacionesespeciales.Rows)
                        this.cksituacionesespeciales.Items.Add(new ListItem(row["NOMBRE"].ToString(), row["codigo"].ToString()));
                }

                //Lista de Conducta e interaccion de ninos con su grupo de pares
                this.ddconductaeinteraccion.Items.Clear();
                this.xQueryParameters.Clear();
                this.xQueryValues.Clear();
                DataTable dtconductaeinteraccion = DB.ExecuteAdapter(string.Format("select Codigo,Nombre from CONDUCTANINOS order by nombre", this.xQueryValues, CommandType.Text));
                if (dtconductaeinteraccion.Rows.Count > 0)
                { 
                    this.ddconductaeinteraccion.Items.Add(new ListItem("-- SELECCIONE --", string.Empty));
                    this.ddconductaeinteraccionadultos.Items.Add(new ListItem("-- SELECCIONE --", string.Empty));
                    foreach (DataRow row in (InternalDataCollectionBase)dtconductaeinteraccion.Rows)
                    {
                        this.ddconductaeinteraccion.Items.Add(new ListItem(row["NOMBRE"].ToString(), row["codigo"].ToString()));
                        this.ddconductaeinteraccionadultos.Items.Add(new ListItem(row["NOMBRE"].ToString(), row["codigo"].ToString()));
                    }
                }


                //Lista de problemas identificados por el terapeuta respectivas evidencias
                this.ckproblemasidentificados.Items.Clear();
                this.xQueryParameters.Clear();
                this.xQueryValues.Clear();
                DataTable dtproblemasidentificados = DB.ExecuteAdapter(string.Format("select Codigo,Nombre from PLANINTERVENCION order by nombre", this.xQueryValues, CommandType.Text));
                if (dtproblemasidentificados.Rows.Count > 0)
                {
                    foreach (DataRow row in (InternalDataCollectionBase)dtproblemasidentificados.Rows)
                    {
                        this.ckproblemasidentificados.Items.Add(new ListItem(row["NOMBRE"].ToString(), row["codigo"].ToString())); 
                    }
                }

                //Objetivos terapeuticos planteados por el terapeuta 
                this.ckobjetivosplanteados.Items.Clear();
                this.xQueryParameters.Clear();
                this.xQueryValues.Clear();
                DataTable dtobjetivosplanteados = DB.ExecuteAdapter(string.Format("select Codigo,Nombre from OBJECTIVOSTERAPEUTICOS order by nombre", this.xQueryValues, CommandType.Text));
                if (dtobjetivosplanteados.Rows.Count > 0)
                {
                    foreach (DataRow row in (InternalDataCollectionBase)dtobjetivosplanteados.Rows)
                    { 
                        this.ckobjetivosplanteados.Items.Add(new ListItem(row["NOMBRE"].ToString(), row["codigo"].ToString()));
                    }
                }

                //Lista de Conducta de participantes durante la session
                this.ddConductaparticipantesensession.Items.Clear();
                this.xQueryParameters.Clear();
                this.xQueryValues.Clear();
                DataTable dtConductaparticipantesensession = DB.ExecuteAdapter(string.Format("select Codigo,Nombre from CONDUCTAPARTICIPANTES order by nombre", this.xQueryValues, CommandType.Text));
                if (dtConductaparticipantesensession.Rows.Count > 0)
                { 
                    this.ddConductaparticipantesensession.Items.Add(new ListItem("-- SELECCIONE --", string.Empty));
                    foreach (DataRow row in (InternalDataCollectionBase)dtConductaparticipantesensession.Rows)
                    {
                        this.ddConductaparticipantesensession.Items.Add(new ListItem(row["NOMBRE"].ToString(), row["codigo"].ToString())); 
                    }
                }

                //Lista de Situaciones que generan malestar en la pareja-familia
                this.ddsituacionesquegeneran.Items.Clear();
                this.xQueryParameters.Clear();
                this.xQueryValues.Clear();
                DataTable dtsituacionesquegeneran = DB.ExecuteAdapter(string.Format("select Codigo,Nombre from CONDUCTAPARTICIPANTES order by nombre", this.xQueryValues, CommandType.Text));
                if (dtsituacionesquegeneran.Rows.Count > 0)
                {
                    this.ddsituacionesquegeneran.Items.Add(new ListItem("-- SELECCIONE --", string.Empty));
                    foreach (DataRow row in (InternalDataCollectionBase)dtsituacionesquegeneran.Rows)
                    {
                        this.ddsituacionesquegeneran.Items.Add(new ListItem(row["NOMBRE"].ToString(), row["codigo"].ToString()));
                    }
                }

                //Lista de Diagnostico o sospecha de trastorno Mental
                this.ckDiagnosticoTranstornoMental.Items.Clear();
                this.xQueryParameters.Clear();
                this.xQueryValues.Clear();
                DataTable dtDiagnosticoTrastornoMental = DB.ExecuteAdapter(string.Format("select Codigo,Nombre from DiagnosticoTranstornoMental order by nombre", this.xQueryValues, CommandType.Text));
                if (dtDiagnosticoTrastornoMental.Rows.Count > 0)
                {
                     
                    foreach (DataRow row in (InternalDataCollectionBase)dtDiagnosticoTrastornoMental.Rows)
                    {
                        this.ckDiagnosticoTranstornoMental.Items.Add(new ListItem(row["NOMBRE"].ToString(), row["codigo"].ToString()));
                        this.ckDiagnosticoosospechatrastornopadre.Items.Add(new ListItem(row["NOMBRE"].ToString(), row["codigo"].ToString()));
                    }
                }


                //Lista de Antecedentesdrogodependientes
                this.ckAntecedentesdrogodependientes.Items.Clear();
                this.xQueryParameters.Clear();
                this.xQueryValues.Clear();
                DataTable dtAntecedentesdrogodependientes = DB.ExecuteAdapter(string.Format("select Codigo,Nombre from AntecedentesDrogoDependientes order by LEN(Nombre) DESC", this.xQueryValues, CommandType.Text));
                if (dtAntecedentesdrogodependientes.Rows.Count > 0)
                {

                    foreach (DataRow row in (InternalDataCollectionBase)dtAntecedentesdrogodependientes.Rows)
                    {
                        this.ckAntecedentesdrogodependientes.Items.Add(new ListItem(row["NOMBRE"].ToString(), row["codigo"].ToString()));
                        this.ckAntecedentesdrogodependientespadre.Items.Add(new ListItem(row["NOMBRE"].ToString(), row["codigo"].ToString()));
                        
                    }
                }

            }
        }
    }
}