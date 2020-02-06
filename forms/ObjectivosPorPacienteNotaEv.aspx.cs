using System;
using System.Collections;
using System.Data;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using CAID.Data;

namespace CAID_V2.forms
{
    public partial class ObjectivosPorPacienteNotaEv : System.Web.UI.Page
    {

        private ArrayList xQueryParameters = new ArrayList();
        private ArrayList xQueryValues = new ArrayList();
#pragma warning disable CS0169 // The field 'ObjectivosPorPacienteNotaEv.CURRENTUSR_SGXID' is never used
#pragma warning disable CS0169 // The field 'ObjectivosPorPacienteNotaEv.CURRENTUSR_SGXID' is never used
#pragma warning disable CS0169 // The field 'ObjectivosPorPacienteNotaEv.CurrentUSR_ROWGUID' is never used
        String CURRENTUSR_SGXID;
        String CurrentUSR_ROWGUID;
        string IDPaciente;
        String VarValida;
        private string xQuery;

        protected void Page_Load(object sender, EventArgs e)
        {
            IDPaciente = Request.QueryString["rowguidpaciente"].ToString();
            txtespecialidad.Text = Request.QueryString["XEspecialidad"].ToString();
            TxtTerapistaID.Text = Request.QueryString["xTerapistaID"].ToString();
            TxtObjectivoID.Text = Request.QueryString["XObjetivo"].ToString();
            CURRENTUSR_SGXID = Request.QueryString["XCURRENTUSR_SGXID"].ToString();
            CurrentUSR_ROWGUID = Request.QueryString["XCurrentUSR_ROWGUID"].ToString();
            if (!IsPostBack)
            {
                this.ckobjectivosPorPaciente.Items.Clear();
                //HCX00300S5 @REFGUID = 'CAID-SD-00001', @ROWSGXID = 'CAID-SD', @ESPGUID = 'CAID-SD-HISCL-13'
                DataTable dtObjetivos = DB.ExecuteAdapter(string.Format("[HCX00300S5] '{0}','{1}','{2}'", (object)IDPaciente, (object)CURRENTUSR_SGXID, (object)txtespecialidad.Text.ToString()));
                if (dtObjetivos.Rows.Count == 0)
                {
                    form1.Visible = false;
                    ckobjectivosPorPaciente.Visible = false;
                    btnSave.Visible = false;
                    return;
                }
                foreach (DataRow row in (InternalDataCollectionBase)dtObjetivos.Rows)
                    this.ckobjectivosPorPaciente.Items.Add(new ListItem(row["NOMBRE"].ToString(), row["ROWGUID"].ToString()));
            }
            //BUSCO LA SUCURSAL DEL PACIENTE*/
            this.xQueryParameters.Clear();
            this.xQueryValues.Clear();
            this.xQuery = "SELECT ROWSGXID FROM PAX00000 where ROWGUID ='" + Request.QueryString["rowguidpaciente"].ToString() + "'";

            DataTable dataTable2 = DB.ExecuteAdapter(this.xQuery, this.xQueryParameters, this.xQueryValues, CommandType.Text);
            if (dataTable2.Rows.Count != 0)
            {
                DataRow row2 = dataTable2.Rows[0];
                TxtPacienteRowguid.Text = row2["ROWSGXID"].ToString();
            }

            Validar();

            CAID.Site_Master site1 = new CAID.Site_Master();
            //txtusuario.Text = (string)site1.Session["CurrentUSR_TERID"].ToString();//((Label)this.site1.FindControl("lblUsuario"));


        }
        protected void _Save(object sender, EventArgs e)
        {
            string strObjSeleccionado = "";
            for (int index = 0; index < this.ckobjectivosPorPaciente.Items.Count; ++index)
            {
                if (this.ckobjectivosPorPaciente.Items[index].Selected)
                    strObjSeleccionado = strObjSeleccionado + "@" + this.ckobjectivosPorPaciente.Items[index].Text.Trim();
            }

            if (strObjSeleccionado != "")
                strObjSeleccionado = strObjSeleccionado.Remove(0, 1);
            string strObjectivoID = this.TxtObjectivoID.Text.ToString();
            string xREFGUID = IDPaciente.ToString(); //this.Session["CurrentPAX_ROWGUID"].ToString();
            string xTERGUID = this.TxtTerapistaID.Text.ToString(); //this.Session["CurrentUSR_TERID"].ToString();
            string xESPGUID = txtespecialidad.Text.ToString();//this.cmbTipo.Value.ToString();
            string strUserid = this.CurrentUSR_ROWGUID.ToString();
            string strsucursal = this.CURRENTUSR_SGXID.ToString();
            if (DB.ExecuteNonQuery(string.Format("[HCL00015_OBJECTIVOSSI] '{0}','{1}','{2}','{3}','{4}','{5}'", (object)strObjectivoID, (object)strObjSeleccionado, (object)xREFGUID, (object)xTERGUID, (object)strUserid, (object)strsucursal)))
            {
                VarValida = "Registro Guardado";
            }
        }
        private void Validar()
        {
            DataTable dataTable1 = DB.ExecuteAdapter(string.Format("HCL00015_OBJECTIVOSV @TERGUID = '{0}', @ROWSGXID = '{1}', @REFGUID = '{2}'", this.TxtTerapistaID.Text.ToString(), CURRENTUSR_SGXID.ToString(), IDPaciente.ToString()));
            if (dataTable1.Rows.Count == 0)
                return;
            char[] chArray = new char[1]
      {
        //' ',
        //',',
        //'.',
        //':',
        //'\t'
        '@'

      };
            //string valor = "";
            //string[] strArray = dataTable1.Rows[0]["OBJECTIVOSELECCIONADOS"].ToString().Split(chArray);
            string[] strArray = dataTable1.Rows[0]["OBJECTIVOSELECCIONADOS"].ToString().Split(chArray);
            if (strArray[0] != "")
            {
                foreach (string str in strArray)
                {
                    //valor = dataTable1.Rows[0]["OBJGUID"].ToString();
                    this.ckobjectivosPorPaciente.Items.FindByText(str).Selected = true;
                }
            }
            this.TxtObjectivoID.Text = dataTable1.Rows[0]["OBJGUID"].ToString();
        }



    }
}