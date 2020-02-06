using CAID.Data;
using System;
using System.Collections;
using System.Data;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace CAID_V2.forms
{
    public class ActividadesIntervencionGrupalConsultaPX : Page
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

        protected Repeater rpData;
        protected Panel pnlData;
        protected HtmlButton btnBack;
        protected HtmlInputText txtDescripcion;
        //protected HtmlInputText txtRecordNo;
        protected HtmlButton btnFilter2;
        protected DropDownList cmbPaciente;
        //protected TextBox txtParticipantes;
        protected Repeater rpDetalles;

        private string ROWSGXID
        {
            get
            {
                return Request.QueryString["CURRENTUSR_SGXID"].ToString();
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.Page.IsPostBack)
            {
                _Iniciar();
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
            this.cmbPaciente.Items.Clear();
            this.cmbPaciente.Items.Add(new ListItem("-- SELECCIONE --", string.Empty));
            foreach (DataRow row in (InternalDataCollectionBase)DB.ExecuteAdapter("PAX00000S1", this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure).Rows)
                this.cmbPaciente.Items.Add(new ListItem(row["FULLNAME"].ToString(), row["ROWGUID"].ToString()));

        }
        protected void _Show(object sender, EventArgs e)
        {
            /* Busco actividades del paciente*/ 
            if (cmbPaciente.SelectedValue != "")
            { 
                this.xQueryParameters.Clear();
                this.xQueryValues.Clear();
                this.xQueryParameters.Add((object)"@ROWGUID");
                this.xQueryValues.Add((object)cmbPaciente.SelectedValue);
                this.xQueryParameters.Add((object)"@ROWSGXID");
                this.xQueryValues.Add((object)this.ROWSGXID);
                this.xQuery = "PR_IG_ConsultaActividadesPX";
                this.rpDetalles.DataSource = (object)DB.ExecuteAdapter(this.xQuery, this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure);
                this.rpDetalles.DataBind();
            }

        }

        protected void _Back(object sender, EventArgs e)
        {
            this.Response.Redirect("http://caidsiges01:8000/INDEX.aspx");
        }

    }
}
