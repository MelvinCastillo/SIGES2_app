using System;
using System.Collections;
using System.Data;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using CAID.Data;
using System.Net;
using System.IO;

namespace CAID_V2.forms
{
    public partial class TFAudiovisuales : System.Web.UI.Page
    {
        private ArrayList xQueryValues = new ArrayList();
        private ArrayList xQueryParameters = new ArrayList();
        DataTable dtaudiovisuales = new DataTable();
        private string ARCHIVO = string.Empty;
        private string xCommand;
        private string xQuery;
        protected Panel pnlConsulta;
        protected HtmlButton btnNew;
        protected HtmlButton btnShow;
        protected Panel pnlData;
        protected RequiredFieldValidator valcmbPaciente;
        protected TextBox txtNotas;
        protected RequiredFieldValidator valtxttxtNotas;
        protected HtmlSelect cmbTipo;
        protected RequiredFieldValidator valcmbTipo;
        protected HtmlInputFile File1;

        private string TIPO
        {
            get
            {
                return this.cmbTipo.Value.ToString().Trim().ToUpper();
            }
        }

        private string NOTAS
        {
            get
            {
                return this.txtNotas.Text.ToString().Trim().ToUpper();
            }
        }

        private string ROWGUID
        {
            get
            {
                return this.xGUID.Value.ToString().ToUpper();
            }
        }

        private string ROWUSERID
        {
            get
            {
                return this.Session["CURRENTUSR_ID"].ToString();
            }
        }

        private string ROWSGXID
        {
            get
            {
                return this.Session["CURRENTUSR_SGXID"].ToString();
            }
        }

        private string ROOTDIRECTORY
        {
            get
            {
                return this.Server.MapPath("..\\multimedia\\");
            }
        }


        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GetData();
            }


        }
        protected void GetData()
        {
            dtaudiovisuales = DB.ExecuteAdapter(string.Format("SELECT NOMBREARCHIVO,Descripcion from Audiovisuales Order by descripcion", this.xQueryValues, CommandType.Text));
            if (dtaudiovisuales.Rows.Count > 0)
            {
                rpData.DataSource = dtaudiovisuales;
                rpData.DataBind();
            }
        }
        protected void rpData_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {

            //if e.Item
            //        Button btnDelete1 = new Button();
            //        btnDelete1 = (Button)rpDataHermanos.FindControl("btnDelete");
            //        btnDelete1.Visible = false; 

        }
        protected void _Back(object sender, EventArgs e)
        {
            pnlrecursos.Visible = true;
            contenedordocumentos.Visible = false;
            contenedordocumentos2.Visible = false;
            // this.Response.Redirect("http://caidsiges01:8000/HCL00000.aspx?X=" + IDPaciente);

        }

        protected void _Add(object sender, EventArgs e)
        {
            pnlrecursos.Visible = false;
            contenedordocumentos.Visible = true;
            contenedordocumentos2.Visible = false;

        }
        protected void _Save(object sender, EventArgs e)
        {
           // pnlrecursos.Visible = false;
            
                bool flag = false;
                if (this.File1.PostedFile != null && this.File1.PostedFile.ContentLength > 0)
                {
                    string extension = Path.GetExtension(Path.GetFileName(this.File1.PostedFile.FileName));
                    try
                    {
                        if (!Directory.Exists(this.ROOTDIRECTORY))
                            Directory.CreateDirectory(this.ROOTDIRECTORY);
                    }
                    catch
                    {
                    }

                    string upper = Guid.NewGuid().ToString().ToUpper();
                    string filename = string.Format("{0}{1}", (object)(this.ROOTDIRECTORY + upper), (object)extension);
                    try
                    {
                        flag = true;
                        this.File1.PostedFile.SaveAs(filename);
                       // this.Response.Write("El archivo fue cargado satisfactoriamente");
                    ((CAID_V2.Site2)this.Master)._Notify2("El archivo fue cargado satisfactoriamente");
                }
                    catch (Exception ex)
                    {
                        flag = false;
                        this.Response.Write("Error: " + ex.Message);
                    ((CAID_V2.Site2)this.Master)._Notify2("ERROR: "+ex.Message.ToString());

                }
                    finally
                    {
                        if (flag)
                        {
                            this.xQueryParameters.Clear();
                            this.xQueryValues.Clear();
                            this.ARCHIVO = string.Format("{0}{1}", (object)upper, (object)extension);
                            this.xQueryParameters.Add((object)"@Descripcion");
                            this.xQueryValues.Add((object)this.txtNombreRecurso.Text.ToString().ToUpper());
                            this.xQueryParameters.Add((object)"@TIPO");
                            this.xQueryValues.Add((object)this.TIPO);
                            this.xQueryParameters.Add((object)"@NOMBREARCHIVO");
                            this.xQueryValues.Add((object)this.ARCHIVO);
                            this.xQuery = "AudiovisualesSI";
                            if (DB.ExecuteNonQuery(this.xQuery, this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure))
                            {
                            //((Site_Master)this.Master)._Notify("Guardado Correctamente");
                            GetData();
                            _IniciarControles();
                            _Back(sender,e);
                            //((Site_Master)this.Master)._Notify("Guardado Correctamente");
                            ((CAID_V2.Site2)this.Master)._Notify2("Guardado Correctamente");
                        }
                    }
                    }
                }
                else
                    this.Response.Write("Debe seleccionar una imagen para cargar.");
            }

 


        protected void _Cancel(object sender, EventArgs e)
        {
            this._IniciarControles();
        }

        private void _IniciarControles()
        {
            this.txtNombreRecurso.Text = string.Empty;
            cmbTipo.Value = string.Empty;
            //this.txtNotas.Text = string.Empty;
        }



        protected void _VER(object sender, EventArgs e)
        {  
            string xCommand = ((LinkButton)sender).CommandName.ToString();
            if (xCommand == "verrecursos")
            { 
                //string strserver = "http://caidserv02:8000/";
                string strserver = "http://caidsiges01:8082/multimedia/";
                string RUTA = ((LinkButton)sender).CommandArgument.ToString();
                //framerecursos.Src = "";
                framerecursos.Attributes["Src"] = "";
                if (RUTA.ToString() != "")
                {
                    HttpWebRequest request = (HttpWebRequest)WebRequest.Create(strserver + RUTA.ToString());
                    bool pageExists = false;
                    try
                    {
                        request.Method = WebRequestMethods.Http.Head;
                        HttpWebResponse response = (HttpWebResponse)request.GetResponse();
                        pageExists = response.StatusCode == HttpStatusCode.OK;
                    }
                    catch
                    {
                        pageExists = false;

                    }
                     if (pageExists == true)
                    {
                        framerecursos.Attributes["Src"] = strserver + RUTA.ToString();
                        // framerecursos.Srcframerecursos.Src = strserver + RUTA.ToString();
                        contenedordocumentos.Visible = false;
                        contenedordocumentos2.Visible = true;
                        pnlrecursos.Visible = false;
                    }
                }
            }
            
        }
    }
}