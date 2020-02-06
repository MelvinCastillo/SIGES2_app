using System;
using System.Collections;
using System.Data;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using CAID.Data;

namespace CAID_V2.forms
{
    public partial class PlanMedico : System.Web.UI.Page
    {
        private ArrayList xQueryParameters = new ArrayList();
        private ArrayList xQueryValues = new ArrayList();
        String CURRENTUSR_SGXID;
        String CurrentUSR_ROWGUID;
        string IDPaciente;
#pragma warning disable CS0414 // The field 'PlanMedico.VarValida' is assigned but its value is never used
#pragma warning disable CS0414 // The field 'PlanMedico.VarValida' is assigned but its value is never used
        String VarValida;
#pragma warning restore CS0414 // The field 'PlanMedico.VarValida' is assigned but its value is never used
#pragma warning restore CS0414 // The field 'PlanMedico.VarValida' is assigned but its value is never used
        private string xQuery;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                this.ckEquiposMecanicos.Items.Clear();
                foreach (DataRow row in (InternalDataCollectionBase)DB.ExecuteAdapter("SELECT * FROM vEquiposMecanicos").Rows)
                    this.ckEquiposMecanicos.Items.Add(new ListItem(row["NOMBRE"].ToString(), row["ROWGUID"].ToString()));
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
            IDPaciente           = Request.QueryString["rowguidpaciente"].ToString();
            txtespecialidad.Text = Request.QueryString["XEspecialidad"].ToString();
            TxtTerapistaID.Text  = Request.QueryString["xTerapistaID"].ToString();
            TxtObjectivoID.Text  = Request.QueryString["XObjetivo"].ToString();
            CURRENTUSR_SGXID     = Request.QueryString["XCURRENTUSR_SGXID"].ToString();
            CurrentUSR_ROWGUID   = Request.QueryString["XCurrentUSR_ROWGUID"].ToString();
            Validar();

            //CAID.Site_Master site1 = new CAID.Site_Master();
            //txtusuario.Text = (string)site1.Session["CurrentUSR_TERID"].ToString();//((Label)this.site1.FindControl("lblUsuario"));


        }
        protected void _Save(object sender, EventArgs e)
        {
            //if (!Convert.ToBoolean(this.Session["CurrentUSR_ROLEDITAR"].ToString()))
              //  return;
            string str1 = "";
            for (int index = 0; index < this.ckEquiposMecanicos.Items.Count; ++index)
            {
                if (this.ckEquiposMecanicos.Items[index].Selected)
                    str1 = str1 + "," + this.ckEquiposMecanicos.Items[index].Value.Trim();
            }
            if (str1 != "")
                str1 = str1.Remove(0, 1);
            string str2 = this.TxtObjectivoID.Text.ToString();
            string str3 = "1";//this.cmbProxProceso.Value.ToString();
            string str4 = "";//this.txtOtrosPruebas.Value.ToString();
            string str5 = "";//this.txtEVALUACION.Text.Trim();
            string xREFGUID = IDPaciente.ToString(); //this.Session["CurrentPAX_ROWGUID"].ToString();
            string xTERGUID = this.TxtTerapistaID.Text.ToString(); //this.Session["CurrentUSR_TERID"].ToString();
            string xESPGUID = txtespecialidad.Text.ToString();//this.cmbTipo.Value.ToString();
            string str6 = this.CurrentUSR_ROWGUID.ToString();
            string str7 = this.CURRENTUSR_SGXID.ToString();
            //if (!((Site_Master)this.Master).Crear_ActoMédico(xREFGUID, xTERGUID, xESPGUID))
            //    return;
            if (DB.ExecuteNonQuery(string.Format("[HCL00018_EQUIPOSMECANICOSSI] '{0}','{1}','{2}','{3}','{4}','{5}','{6}','{7}','{8}'", (object)str2, (object)str3, (object)str1, (object)str4, (object)str5, (object)xREFGUID, (object)xTERGUID, (object)str6, (object)str7)))
            {
                VarValida = "Registro Guardado";
            //((Site_Master) this.Master)._Notify("Registro Guardado");
            //  this.Validar();
            }
        }
        private void Validar()
        {
            DataTable dataTable1 = DB.ExecuteAdapter(string.Format("HCL00018_EQUIPOSMECANICOSV @TERGUID = '{0}', @ROWSGXID = '{1}', @REFGUID = '{2}'", this.TxtTerapistaID.Text.ToString(), CURRENTUSR_SGXID.ToString(), IDPaciente.ToString()));
            if (dataTable1.Rows.Count == 0)
                return;
            char[] chArray = new char[5]
      {
        ' ',
        ',',
        '.',
        ':',
        '\t'
      };
            string[] strArray = dataTable1.Rows[0]["PRUEBACOMPLEMENTARIA"].ToString().Split(chArray);
            if (strArray[0] != "")
            {
                foreach (string str in strArray)
                    this.ckEquiposMecanicos.Items.FindByValue(str).Selected = true;
            }
            this.TxtObjectivoID.Text = dataTable1.Rows[0]["OBJGUID"].ToString();
            //this.cmbProxProceso.Value = dataTable1.Rows[0]["PROXIMAEVALUACION"].ToString();
            //this.txtOtrosPruebas.Value = dataTable1.Rows[0]["OTROS"].ToString();
            //this.txtEVALUACION.Text = dataTable1.Rows[0]["DATOS"].ToString();
            //this.cmbObjetivo.Disabled = true;
            //this.txtespecialidad.Text = dataTable1.Rows[0]["OBJGUID"].ToString();
            //DataTable dataTable2 = DB.ExecuteAdapter(string.Format("PAX00000X1 @REFGUID = '{0}', @ROWSGXID = '{1}', @USERID = '{2}'", this.Session["CurrentPAX_ROWGUID"], this.Session["CURRENTUSR_SGXID"], this.Session["CurrentUSR_TERID"]));
            //if (dataTable2.Rows.Count != 0)
            //{
            //    this.Session.Add("xHTML_Options", (object)dataTable2.Rows[0]["HTML_Options"].ToString());
            //    ((Site_Master)this.Master).Mostrar_Opciones_ActoMedico();
            //}
        }



    }
}