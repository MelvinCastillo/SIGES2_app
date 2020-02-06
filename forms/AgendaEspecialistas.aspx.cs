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
    public partial class AgendaEspecialistas : System.Web.UI.Page
    {
        private ArrayList xQueryParameters = new ArrayList();
        private ArrayList xQueryValues = new ArrayList();

        private DataTable BuscoDataAgenda
        {
            get
            {
                this.xQueryParameters.Clear();
                this.xQueryValues.Clear();
                //this.xQueryParameters.Add((object)"@ROWSGXID");
                //this.xQueryValues.Add((object)this.ROWSGXID);
                //this.xQueryParameters.Add((object)"@MNUTYPE");
                //this.xQueryValues.Add((object)"TOP");
                //this.xQueryParameters.Add((object)"@USERID");
                //this.xQueryValues.Add((object)this.ROWUSERID);
                return DB.ExecuteAdapter("SP_AgendaEspecialistas", this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure);
            }
        }
         
        protected void Page_Load(object sender, EventArgs e)
        {

            //this.xQueryParameters.Clear();
            //this.xQueryValues.Clear();
            DataTable dt = new DataTable();
            dt = DB.ExecuteAdapter("SP_AgendaEspecialistas", this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure);
            DataRow dataRow = dt.Rows.Count != 0 ? dt.Rows[0] : (DataRow)null;
            Session.Add("XJSON", dataRow["JSON"].ToString());
        }
    }
}