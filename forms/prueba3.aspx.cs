using System;
using System.Collections;
using System.Data;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using CAID.Data;

namespace CAID_V2.forms
{
    public partial class prueba3 : System.Web.UI.Page
    {
        private ArrayList xQueryParameters = new ArrayList();
        private ArrayList xQueryValues = new ArrayList();
        private string xCommand;
        private string xQuery;
        protected void Page_Load(object sender, EventArgs e)
        {
             

            if (!IsPostBack)
            {
                //this.ckparticipantes.Items.Clear();
                //this.xQueryParameters.Clear();
                //this.xQueryValues.Clear();
                //DataTable dtparticipantes = DB.ExecuteAdapter(string.Format("select * from vparticipantes order by nombre", this.xQueryValues, CommandType.Text));
                //if (dtparticipantes.Rows.Count == 0)
                //{
                //    ckparticipantes.Visible = false;

                //}
                //else
                //{
                //    foreach (DataRow row in (InternalDataCollectionBase)dtparticipantes.Rows)
                //    {
                //        this.ckparticipantes.Items.Add(new ListItem(row["NOMBRE"].ToString(), row["codigo"].ToString()));
                //                       }
                //}
            }
        }
    }
}