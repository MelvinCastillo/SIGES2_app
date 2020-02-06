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
    public partial class chossen2 : System.Web.UI.Page
    {
        private ArrayList xQueryParameters = new ArrayList();
        private ArrayList xQueryValues = new ArrayList();
#pragma warning disable CS0169 // The field 'chossen.xCommand' is never used
#pragma warning disable CS0169 // The field 'chossen.xCommand' is never used
#pragma warning disable CS0169 // The field 'chossen.xQuery' is never used
        private string xCommand;
#pragma warning restore CS0169 // The field 'chossen.xCommand' is never used
#pragma warning restore CS0169 // The field 'chossen.xQuery' is never used
#pragma warning restore CS0169 // The field 'chossen.xCommand' is never used
#pragma warning disable CS0169 // The field 'chossen.xQuery' is never used
        private string xQuery;
#pragma warning restore CS0169 // The field 'chossen.xQuery' is never used
        string ROWSGXID = "CAID-SD";
        string USERNAME;

        protected void Page_Load(object sender, EventArgs e)
        {
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
            }
        }
        protected void _boton(object sender, EventArgs e)
        {

            Label1.Text = DPPaciente.SelectedValue.ToString();

        }

        protected void Label1_DataBinding(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Label1.Text = DPPaciente.SelectedValue.ToString();
            Label1.Text = DPPaciente.Text;
        }

    }

 
}