using CAID.Data;
using System;
using System.Web;
using System.Web.UI.WebControls;
using System.Collections;

using System.Drawing;
using System.Web.UI.DataVisualization.Charting;
using System.Data;

namespace CAID_V2.forms
{
    public partial class ResumenEstadisticos : System.Web.UI.Page
    {
        private static Random rand = new Random();
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

        private string ROWUSERID
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
        private string ROWSGXID1
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
        protected void _BuscarPacientes(object sender, EventArgs e)
        {
            string ROWSGXID = "CAID-SD";
            int index = 0;
            DataSet dataSet = new DataSet();
            DataTable table = new DataTable();
            DataSet dataSet1 = new DataSet();
            DataTable table1 = new DataTable();

            #region PacientesDistribucionporGenero
            //chartDistribucionGenero.DataSource = (object)null;
            //chartDistribucionGenero.DataBind();
            //chartDistribucionGenero.ChartAreas.Add("chartDistribucionGenero");
            //chartDistribucionGenero.ChartAreas[0].AxisX.Title = "Fecha de Atención";
            //chartDistribucionGenero.ChartAreas[0].AxisX.TitleFont = new Font("Sans Serif", 13f, FontStyle.Bold);
            //chartDistribucionGenero.ChartAreas[0].AxisX.IntervalType = DateTimeIntervalType.Days;
            //chartDistribucionGenero.ChartAreas[0].AxisX.Interval = 2.0;
            //chartDistribucionGenero.ChartAreas[0].AxisY.Title = "Porcentaje";
            //chartDistribucionGenero.ChartAreas[0].AxisY.TitleFont = new Font("Sans Serif", 11f, FontStyle.Bold);
            chartDistribucionGenero.ChartAreas[0].BorderDashStyle = ChartDashStyle.Solid;
            chartDistribucionGenero.ChartAreas[0].BorderWidth = 1;
            xQueryParameters.Clear();
            xQueryValues.Clear();
            xQueryParameters.Add((object)"@REPORTID");
            //xQueryValues.Add((object)cmbTareas.SelectedValue);
            xQueryValues.Add((object)10);
            xQueryParameters.Add((object)"@ROWSGXID");
            xQueryValues.Add((object)ROWSGXID);
            table = DB.ExecuteAdapter(string.Format("SGX00000R10_ESTADISTICAS"), xQueryParameters, xQueryValues, CommandType.StoredProcedure);
            dataSet.Tables.Add(table);
            if (dataSet.Tables[0].Rows.Count > 0)
            {
                chartDistribucionGenero.Legends.Add("PARAMETRO");
                chartDistribucionGenero.Series.Add("PARAMETRO");
                chartDistribucionGenero.Legends[0].Font = new Font("Verdana", 13, FontStyle.Bold);
                chartDistribucionGenero.Series[index].ChartType = SeriesChartType.Pie;
                chartDistribucionGenero.Series[index].Points.DataBindXY((IEnumerable)dataSet.Tables[0].DefaultView, "Parametro", (IEnumerable)dataSet.Tables[0].DefaultView, "Cantidad");
                chartDistribucionGenero.Series[index].IsVisibleInLegend = true;
                chartDistribucionGenero.Series[index].IsValueShownAsLabel = true;
                chartDistribucionGenero.Series[index].CustomProperties = "PieLabelStyle=Inside";
                //chartClaseSociales.Series[index].Label = "#AXISLABEL ->" + "#VALY{G}";
                //chartClaseSociales.Series[index].Label = "#VALY{G}";
                //chartClaseSociales.Series[index].ToolTip = "VALOR: #VALY{G}";
                chartDistribucionGenero.Series[index].ToolTip = "VALOR: #AXISLABEL";
                Color color = Color.FromArgb(ResumenEstadisticos.rand.Next(256), ResumenEstadisticos.rand.Next(256), ResumenEstadisticos.rand.Next(256));
                //chartClaseSociales.Series[index].BorderWidth = 0;
                //chartClaseSociales.Series[index].MarkerSize = 1;
                //chartClaseSociales.Series[index].MarkerStyle = MarkerStyle.Circle;
                chartDistribucionGenero.Series[index].MarkerColor = color;
                chartDistribucionGenero.Series[index].Color = color;
                chartDistribucionGenero.ChartAreas[0].Area3DStyle.Inclination = 20;
                //chartClaseSociales.Legends[0].LegendStyle = LegendStyle.Row;
                //chartClaseSociales.Legends[0].TableStyle = LegendTableStyle.Tall;
                //chartClaseSociales.Legends[0].Docking = Docking.Bottom; 
                chartDistribucionGenero.Legends[index].Enabled = true;
                chartDistribucionGenero.Legends[0].LegendStyle = LegendStyle.Row;
                //chartClaseSociales.Legends[0].TableStyle = LegendTableStyle.Tall;
                chartDistribucionGenero.Legends[0].Docking = Docking.Top;
                chartDistribucionGenero.ChartAreas[index].Area3DStyle.Enable3D = true;
                chartDistribucionGenero.Series[0].Font = new Font("Verdana", 13, FontStyle.Bold);
                //chart1.ChartAreas[1].Position.Y = chart1.ChartAreas[0].Position.Bottom;
                //chart1.ChartAreas[1].Position.Height = 20;
                int num = index + 1;
            }
            #endregion

            #region PacientesRangoEdades
            //chartRangoEdades.DataSource = (object)null;
            //chartRangoEdades.DataBind();
            //chartRangoEdades.ChartAreas.Add("chartRangoEdades");
            //chartRangoEdades.ChartAreas[0].AxisX.Title = "Fecha de Atención";
            //chartRangoEdades.ChartAreas[0].AxisX.TitleFont = new Font("Sans Serif", 13f, FontStyle.Bold);
            //chartRangoEdades.ChartAreas[0].AxisX.IntervalType = DateTimeIntervalType.Days;
            //chartRangoEdades.ChartAreas[0].AxisX.Interval = 2.0;
            //chartRangoEdades.ChartAreas[0].AxisY.Title = "Porcentaje";
            //chartRangoEdades.ChartAreas[0].AxisY.TitleFont = new Font("Sans Serif", 11f, FontStyle.Bold);
            chartRangoEdades.ChartAreas[0].BorderDashStyle = ChartDashStyle.Solid;
            chartRangoEdades.ChartAreas[0].BorderWidth = 1;
            xQueryParameters.Clear();
            xQueryValues.Clear();
            xQueryParameters.Add((object)"@REPORTID");
            //xQueryValues.Add((object)cmbTareas.SelectedValue);
            xQueryValues.Add((object)15);
            xQueryParameters.Add((object)"@ROWSGXID");
            xQueryValues.Add((object)ROWSGXID);

            table1 = DB.ExecuteAdapter(string.Format("SGX00000R10_ESTADISTICAS"), xQueryParameters, xQueryValues, CommandType.StoredProcedure);
            dataSet1.Tables.Add(table1);
            if (dataSet1.Tables[0].Rows.Count > 0)
            {
                chartRangoEdades.Legends.Add("PARAMETRO");
                chartRangoEdades.Series.Add("PARAMETRO");
                chartRangoEdades.Series[index].ChartType = SeriesChartType.Doughnut;
                chartRangoEdades.Series[index].Points.DataBindXY((IEnumerable)dataSet1.Tables[0].DefaultView, "Parametro", (IEnumerable)dataSet1.Tables[0].DefaultView, "Cantidad");
                chartRangoEdades.Series[index].IsVisibleInLegend = true;
                chartRangoEdades.Series[index].IsValueShownAsLabel = true;
                chartRangoEdades.Series[index].CustomProperties = "PieLabelStyle=Inside";
                chartRangoEdades.Series[index]["PieDrawingStyle"] = "SoftEdge";
                //chartClaseSociales.Series[index].Label = "#AXISLABEL ->" + "#VALY{G}";
                //chartClaseSociales.Series[index].Label = "#VALY{G}";
                //chartClaseSociales.Series[index].ToolTip = "VALOR: #VALY{G}";
                chartRangoEdades.Series[index].ToolTip = "VALOR: #AXISLABEL";
                Color color = Color.FromArgb(ResumenEstadisticos.rand.Next(256), ResumenEstadisticos.rand.Next(256), ResumenEstadisticos.rand.Next(256));
                //chartClaseSociales.Series[index].BorderWidth = 0;
                //chartClaseSociales.Series[index].MarkerSize = 1;
                //chartClaseSociales.Series[index].MarkerStyle = MarkerStyle.Circle;
                chartRangoEdades.Series[index].MarkerColor = color;
                chartRangoEdades.Series[index].Color = color;
                chartRangoEdades.ChartAreas[0].Area3DStyle.Inclination = 20;
                //chartClaseSociales.Legends[0].LegendStyle = LegendStyle.Row;
                //chartClaseSociales.Legends[0].TableStyle = LegendTableStyle.Tall;
                //chartClaseSociales.Legends[0].Docking = Docking.Bottom; 
                chartRangoEdades.Legends[index].Enabled = true;
                chartRangoEdades.Legends[0].LegendStyle = LegendStyle.Row;
                //chartClaseSociales.Legends[0].TableStyle = LegendTableStyle.Tall;
                chartRangoEdades.Legends[0].Docking = Docking.Top;
                chartRangoEdades.ChartAreas[index].Area3DStyle.Enable3D = true;
                chartRangoEdades.Legends[0].Font = new Font("Verdana", 13, FontStyle.Bold);
                chartRangoEdades.Series[0].Font = new Font("Verdana", 13, FontStyle.Bold);
                int num = index + 1;
            }
            #endregion

            #region PacientesEstatus
            //chartClaseSociales.DataSource = (object)null;
            //chartClaseSociales.DataBind();
            //chartClaseSociales.ChartAreas.Add("chtArea");
            //chartClaseSociales.ChartAreas[0].AxisX.Title = "Fecha de Atención";
            //chartClaseSociales.ChartAreas[0].AxisX.TitleFont = new Font("Sans Serif", 13f, FontStyle.Bold);
            //chartClaseSociales.ChartAreas[0].AxisX.IntervalType = DateTimeIntervalType.Days;
            //chartClaseSociales.ChartAreas[0].AxisX.Interval = 2.0;
            //chartClaseSociales.ChartAreas[0].AxisY.Title = "Porcentaje";
            //chartClaseSociales.ChartAreas[0].AxisY.TitleFont = new Font("Sans Serif", 11f, FontStyle.Bold);
            chartEstatus.ChartAreas[0].BorderDashStyle = ChartDashStyle.Solid;
            chartEstatus.ChartAreas[0].BorderWidth = 1;
            xQueryParameters.Clear();
            xQueryValues.Clear();
            xQueryParameters.Add((object)"@REPORTID");
            //xQueryValues.Add((object)cmbTareas.SelectedValue);
            xQueryValues.Add((object)21);
            xQueryParameters.Add((object)"@ROWSGXID");
            xQueryValues.Add((object)ROWSGXID);
            table = DB.ExecuteAdapter(string.Format("SGX00000R10_ESTADISTICAS"), xQueryParameters, xQueryValues, CommandType.StoredProcedure);
            dataSet = new DataSet();
            dataSet.Tables.Add(table);
            if (dataSet.Tables[0].Rows.Count > 0)
            {
                chartEstatus.Legends.Add("PARAMETRO");
                chartEstatus.Series.Add("PARAMETRO");
                chartEstatus.Series[index].ChartType = SeriesChartType.Pie;
                chartEstatus.Series[index].Points.DataBindXY((IEnumerable)dataSet.Tables[0].DefaultView, "Parametro", (IEnumerable)dataSet.Tables[0].DefaultView, "Cantidad");
                chartEstatus.Series[index].IsVisibleInLegend = true;
                chartEstatus.Series[index].IsValueShownAsLabel = true;
                chartEstatus.Series[index].CustomProperties = "PieLabelStyle=Outside";
                //chartClaseSociales.Series[index].Label = "#AXISLABEL ->" + "#VALY{G}";
                //chartClaseSociales.Series[index].Label = "#VALY{G}";
                //chartClaseSociales.Series[index].ToolTip = "VALOR: #VALY{G}";
                //chartEstatus.Series[index].ToolTip = "VALOR: #AXISLABEL";
                chartEstatus.Series[index].ToolTip = "#AXISLABEL #PERCENT de un total de: #TOTAL";
                Color color = Color.FromArgb(ResumenEstadisticos.rand.Next(256), ResumenEstadisticos.rand.Next(256), ResumenEstadisticos.rand.Next(256));
                //chartClaseSociales.Series[index].BorderWidth = 0;
                //chartClaseSociales.Series[index].MarkerSize = 1;
                //chartClaseSociales.Series[index].MarkerStyle = MarkerStyle.Circle;
                chartEstatus.Series[index].MarkerColor = color;
                chartEstatus.Series[index].Color = color;
                chartEstatus.ChartAreas[0].Area3DStyle.Inclination = 40;
                //chartClaseSociales.Legends[0].LegendStyle = LegendStyle.Row;
                //chartClaseSociales.Legends[0].TableStyle = LegendTableStyle.Tall;
                //chartClaseSociales.Legends[0].Docking = Docking.Bottom; 
                chartEstatus.Legends[index].Enabled = true;
                chartEstatus.Legends[0].LegendStyle = LegendStyle.Table; 
                chartEstatus.Legends[0].TableStyle = LegendTableStyle.Auto;// LegendTableStyle.Tall;
                chartEstatus.Legends[0].Docking = Docking.Top;
                chartEstatus.ChartAreas[index].Area3DStyle.Enable3D = true;
                chartEstatus.Legends[0].Font = new Font("Verdana", 8, FontStyle.Bold);
                chartEstatus.Series[0].Font = new Font("Verdana", 13, FontStyle.Bold);
                int num = index + 1;
            }
            #endregion

            #region PacientesClasesSociales
            //chartClaseSociales.DataSource = (object)null;
            //chartClaseSociales.DataBind();
            chartClaseSociales.ChartAreas.Add("chtArea");
            //chartClaseSociales.ChartAreas[0].AxisX.Title = "Fecha de Atención";
            //chartClaseSociales.ChartAreas[0].AxisX.TitleFont = new Font("Sans Serif", 13f, FontStyle.Bold);
            //chartClaseSociales.ChartAreas[0].AxisX.IntervalType = DateTimeIntervalType.Days;
            //chartClaseSociales.ChartAreas[0].AxisX.Interval = 2.0;
            //chartClaseSociales.ChartAreas[0].AxisY.Title = "Porcentaje";
            //chartClaseSociales.ChartAreas[0].AxisY.TitleFont = new Font("Sans Serif", 11f, FontStyle.Bold);
            chartClaseSociales.ChartAreas[0].BorderDashStyle = ChartDashStyle.Solid;
            chartClaseSociales.ChartAreas[0].BorderWidth = 1;
            xQueryParameters.Clear();
            xQueryValues.Clear();
            xQueryParameters.Add((object)"@REPORTID");
            //xQueryValues.Add((object)cmbTareas.SelectedValue);
            xQueryValues.Add((object)20);
            xQueryParameters.Add((object)"@ROWSGXID");
            xQueryValues.Add((object)ROWSGXID);
            table = DB.ExecuteAdapter(string.Format("SGX00000R10_ESTADISTICAS"), xQueryParameters, xQueryValues, CommandType.StoredProcedure);
            dataSet = new DataSet();
            dataSet.Tables.Add(table);

            if (dataSet.Tables[0].Rows.Count > 0)
            {

                chartClaseSociales.Series.Add("PARAMETRO");  
                DataRow row = dataSet.Tables[0].Rows[index];
                //chartClaseSociales.Legends.Add(row["PARAMETRO"].ToString());
                chartClaseSociales.Series.Add(row["PARAMETRO"].ToString());
                chartClaseSociales.Series[index].ChartType = SeriesChartType.RangeColumn;
                chartClaseSociales.Series[index].Points.DataBindXY((IEnumerable)dataSet.Tables[0].DefaultView, "Parametro", (IEnumerable)dataSet.Tables[0].DefaultView, "Cantidad");
                chartClaseSociales.Series[index].IsVisibleInLegend = true;
                chartClaseSociales.Series[index].IsValueShownAsLabel = true;
                chartEstatus.Series[index].CustomProperties = "PieLabelStyle=Inside";
                chartClaseSociales.Series[index].ToolTip = "VALOR: #AXISLABEL";
                //chartClaseSociales.ChartAreas[0].Area3DStyle.Inclination = 20;
                //chartClaseSociales.Legends[0].Enabled = true;
                //chartClaseSociales.Legends[0].LegendStyle = LegendStyle.Table;
                //chartClaseSociales.Legends[0].TableStyle = LegendTableStyle.Auto;
                //chartClaseSociales.Legends[0].Docking = Docking.Bottom;
                //chartClaseSociales.ChartAreas[index].Area3DStyle.Enable3D = true;
                //chartClaseSociales.Legends[0].Font = new Font("Verdana", 8, FontStyle.Bold);
                chartClaseSociales.Series[0].Font = new Font("Verdana", 13, FontStyle.Bold);
                //int num = index + 1;
                int index2 = 0;
                foreach (DataPoint point in chartClaseSociales.Series[0].Points)
                {
                    Color color1 = Color.FromArgb(ResumenEstadisticos.rand.Next(256), ResumenEstadisticos.rand.Next(256), ResumenEstadisticos.rand.Next(256));
                    chartClaseSociales.Series[0].Points[index2].Color = color1;
                    ++index2;
                }

            }


        }

        #endregion
    }
}
 