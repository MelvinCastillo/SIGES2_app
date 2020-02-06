// Decompiled with JetBrains decompiler
// Type: CAID.index
// Assembly: CAID, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null
// MVID: DACE6779-43A1-43CA-8F66-682269B28117
// Assembly location: C:\Users\user\Desktop\CAID.dll

using CAID.Data;
using CAID.Entity;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Web.Script.Services;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web;

namespace CAID_V2.forms
{
    public partial class Estadisticas : Page
    {
        private static ArrayList xQueryParameters = new ArrayList();
        private static ArrayList xQueryValues = new ArrayList();
        private string xCommand;
        protected HiddenField data_genero;
        protected HiddenField data_em;
        protected HiddenField data_pa;

        private string xBase
        {
            get
            {
                return this.Page.GetType().BaseType.Name.ToString();
            }
        }

        private  string ROWUSERID
        {
            get
            {
                return HttpContext.Current.Request.QueryString["CURRENTUSR_ID"].ToString(); // CURRENTUSR.get_ID();
            }
        }

        private static string ROWSGXID
        {
            get
            {
                return "";// HttpContext.Current.Request.QueryString["CURRENTUSR_SGXID"].ToString();
                //return Request.QueryString["CURRENTUSR_SGXID"].ToString();
            }
        }
        private  string ROWSGXID1
        {
            get
            {
                return Request.QueryString["CURRENTUSR_SGXID"].ToString();
                //return Request.QueryString["CURRENTUSR_SGXID"].ToString();
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            /*   ClacificacionSocioeconomicaPacientes(ROWSGXID1.ToString());

               if (Session["CurrentUSR_ROLDASHBOARD"] != null)
               {
                   Session.Add("CurrentUSR_ROLDASHBOARD1", "/forms/Estadisticas.aspx");
                   //Session.Add("CURRENTUSR_SGXID", ROWSGXID1.ToString()); 
                  // DiagnosticoPacientesRecibidos();
                   //ClacificacionSocioeconomicaPacientes(ROWSGXID1.ToString());
                  // StatusPacientes();
                  // RangoEdadPacientes();
                 //  DistribucionPacientesGenero();
                   this.Response.Redirect(this.Session["CurrentUSR_ROLDASHBOARD1"].ToString());
               }
               */
            //if (!IsPostBack)
            //{
            //    ClacificacionSocioeconomicaPacientes(ROWSGXID1.ToString());
            //   // this.Response.AddHeader("Refresh", Convert.ToString(this.Session.Timeout * 60 - 10));
            //    //if (!(this.Session["CurrentUSR_ROLDASHBOARD"].ToString().ToLower() != "index.aspx"))
            //      //  return;
            //}

            if (Session["CurrentUSR_ROLDASHBOARD"] != null)
            {
                Session.Add("CurrentUSR_ROLDASHBOARD", "index.aspx");
            }
            else
                Session.Add("CurrentUSR_ROLDASHBOARD", "index.aspx");

            this.Response.AddHeader("Refresh", Convert.ToString(this.Session.Timeout * 60 - 10));
            if (!(this.Session["CurrentUSR_ROLDASHBOARD"].ToString().ToLower() != "index.aspx"))
                return;
            this.Response.Redirect(this.Session["CurrentUSR_ROLDASHBOARD"].ToString());
        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public static List<Estadisticas.Diagnostico> DiagnosticoPacientesRecibidos()
        {
            return Estadisticas.Diagnostico.GetAll();
        }

        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        [WebMethod]
        public static List<Estadisticas.Genero> DistribucionPacientesGenero()
        {
            return Estadisticas.Genero.GetAll();
        }

        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        [WebMethod]
        public static List<Estadisticas.RangoEdad> RangoEdadPacientes()
        {
            return Estadisticas.RangoEdad.GetAll();
        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public static List<Estadisticas.Status> StatusPacientes()
        {
            return Estadisticas.Status.GetAll();
        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json,UseHttpGet =false)]
        public static List<Estadisticas.Clacificacion> ClacificacionSocioeconomicaPacientes(string ROWSGXID)
        {
            return Estadisticas.Clacificacion.GetAll(ROWSGXID);
        }

        public class Diagnostico
        {
            public string DiagnosticoRecibidos { get; set; }

            public int Pacientes { get; set; }

            public static List<Estadisticas.Diagnostico> GetAll()
            {
                return new List<Estadisticas.Diagnostico>()
        {
          new Estadisticas.Diagnostico()
          {
            DiagnosticoRecibidos = "Trastorno del Espectro Autista (TEA)",
            Pacientes = 491
          },
          new Estadisticas.Diagnostico()
          {
            DiagnosticoRecibidos = "Parálisis Cerebral Infantil",
            Pacientes = 164
          },
          new Estadisticas.Diagnostico()
          {
            DiagnosticoRecibidos = "Síndrome de Down",
            Pacientes = 124
          },
          new Estadisticas.Diagnostico()
          {
            DiagnosticoRecibidos = "Retraso Psicomotor",
            Pacientes = 65
          },
          new Estadisticas.Diagnostico()
          {
            DiagnosticoRecibidos = "Déficit de Atencion y Aprendizaje",
            Pacientes = 44
          },
          new Estadisticas.Diagnostico()
          {
            DiagnosticoRecibidos = "Trastorno del Habla y del Lenguaje",
            Pacientes = 44
          },
          new Estadisticas.Diagnostico()
          {
            DiagnosticoRecibidos = "Diagnostico no definido",
            Pacientes = 26
          },
          new Estadisticas.Diagnostico()
          {
            DiagnosticoRecibidos = "Discapacidad Intelectual",
            Pacientes = 9
          },
          new Estadisticas.Diagnostico()
          {
            DiagnosticoRecibidos = "Síndrome de West",
            Pacientes = 5
          },
          new Estadisticas.Diagnostico()
          {
            DiagnosticoRecibidos = "Sindrome de Rett",
            Pacientes = 4
          },
          new Estadisticas.Diagnostico()
          {
            DiagnosticoRecibidos = "Síndrome de Edward",
            Pacientes = 2
          },
          new Estadisticas.Diagnostico()
          {
            DiagnosticoRecibidos = "Síndrome de Goldenhartd",
            Pacientes = 2
          },
          new Estadisticas.Diagnostico()
          {
            DiagnosticoRecibidos = "Distrofia Muscular Degenerativa",
            Pacientes = 2
          },
          new Estadisticas.Diagnostico()
          {
            DiagnosticoRecibidos = "Síndrome Arnold Chiari",
            Pacientes = 1
          }
        };
            }
        }

        public class Genero
        {
            public string Sexo { get; set; }

            public int Pacientes { get; set; }

            public static List<Estadisticas.Genero> GetAll()
            { 
                DataTable dataTable = DB.ExecuteAdapter(string.Format("SGX00000R10 @REPORTID ='{0}', @ROWSGXID = '{1}'", (object)10, (object)ROWSGXID));
                List<Estadisticas.Genero> generoList = new List<Estadisticas.Genero>();
                foreach (DataRow row in (InternalDataCollectionBase)dataTable.Rows)
                    generoList.Add(new Estadisticas.Genero()
                    {
                        Sexo = row["Parametro"].ToString(),
                        Pacientes = Convert.ToInt32(row["Cantidad"].ToString())
                    });
                return generoList;
            }
        }

        public class RangoEdad
        {
            public string Rango { get; set; }

            public int Pacientes { get; set; }

            public static List<Estadisticas.RangoEdad> GetAll()
            { 
                DataTable dataTable = DB.ExecuteAdapter(string.Format("SGX00000R10 @REPORTID ='{0}', @ROWSGXID = '{1}'", (object)15, (object)ROWSGXID));
                List<Estadisticas.RangoEdad> rangoEdadList = new List<Estadisticas.RangoEdad>();
                foreach (DataRow row in (InternalDataCollectionBase)dataTable.Rows)
                    rangoEdadList.Add(new Estadisticas.RangoEdad()
                    {
                        Rango = row["Parametro"].ToString(),
                        Pacientes = Convert.ToInt32(row["Cantidad"].ToString())
                    });
                return rangoEdadList;
            }
        }

        public class Clacificacion
        {
            public string ClasificacionSocial { get; set; }

            public int Pacientes { get; set; }

            public static List<Estadisticas.Clacificacion> GetAll(string ROWSGXID)
            {
                string ROWSGXID1 = ROWSGXID.ToString(); // HttpContext.Current.Request.QueryString["CURRENTUSR_SGXID"].ToString();
                DataTable dataTable = DB.ExecuteAdapter(string.Format("SGX00000R10 @REPORTID ='{0}', @ROWSGXID = '{1}'", (object)20, (object)ROWSGXID1));
                List<Estadisticas.Clacificacion> clacificacionList = new List<Estadisticas.Clacificacion>();
                foreach (DataRow row in (InternalDataCollectionBase)dataTable.Rows)
                    clacificacionList.Add(new Estadisticas.Clacificacion()
                    {
                        ClasificacionSocial = row["Parametro"].ToString(),
                        Pacientes = Convert.ToInt32(row["Cantidad"].ToString())
                    });
                return clacificacionList;
            }
        }

        public class Status
        {
            public string Estatus { get; set; }

            public int Pacientes { get; set; }

            public static List<Estadisticas.Status> GetAll()
            {
                return new List<Estadisticas.Status>()
        {
          new Estadisticas.Status()
          {
            Estatus = "En proceso evaluación",
            Pacientes = 444
          },
          new Estadisticas.Status()
          {
            Estatus = "Plan Terapéutico",
            Pacientes = 285
          },
          new Estadisticas.Status()
          {
            Estatus = "En Espera Plan Terapeutico",
            Pacientes = 183
          },
          new Estadisticas.Status() { Estatus = "Retirado", Pacientes = 34 },
          new Estadisticas.Status() { Estatus = "Declinado", Pacientes = 19 },
          new Estadisticas.Status()
          {
            Estatus = "Salida por Edad",
            Pacientes = 17
          },
          new Estadisticas.Status() { Estatus = "Fallecido", Pacientes = 1 }
        };
            }
        }
    }
}
