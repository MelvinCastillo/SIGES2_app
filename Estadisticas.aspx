<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true"  
    CodeBehind="Estadisticas.aspx.cs" Inherits="CAID_V2.forms.Estadisticas" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <script type="text/javascript">
    <%--function getLocalidad() {

        return '<%=@Session["CURRENTUSR_SGXID"].ToString()%>';
    }--%>
</script>


    <asp:HiddenField ID="data_genero" runat="server" ClientIDMode="Static" />
    <asp:HiddenField ID="data_em" runat="server" ClientIDMode="Static" />
    <asp:HiddenField ID="data_pa" runat="server" ClientIDMode="Static" />
    <%--<div class="row-fluid">
        <div class="span6">
            <div class="box">
                <div class="box-title">
                    <h3>
                        <i class="icon-bar-chart"></i>Género
                    </h3>
                    <div class="actions">
                        <a href="#" class="btn btn-mini content-refresh"><i class="icon-refresh"></i></a>
                        <a href="#" class="btn btn-mini content-slideUp"><i class="icon-angle-down"></i>
                        </a>
                    </div>
                </div>
                <div class="box-content">
                    <div id="GENERO-pie-chart" class='flot'>
                    </div>
                </div>
            </div>
        </div>
        <div class="span6">
            <div class="box">
                <div class="box-title">
                    <h3>
                        <i class="icon-bar-chart"></i>Edades
                    </h3>
                    <div class="actions">
                        <a href="#" class="btn btn-mini content-refresh"><i class="icon-refresh"></i></a>
                        <a href="#" class="btn btn-mini content-slideUp"><i class="icon-angle-down"></i>
                        </a>
                    </div>
                </div>
                <div class="box-content">
                    <div id="EDADES-pie-chart" class='flot'>
                    </div>
                </div>
            </div>
        </div>
    </div>--%>
    <%--    Graficos--%>
    <div class="row-fluid">
        <div class="span6">
            <div class="box">
                <div class="box-title">
                    <h3>
                        <i class="icon-bar-chart"></i>Distribución Pacientes por Género
                    </h3>
                    <div class="actions">
                        <a href="#" class="btn btn-mini content-refresh"><i class="icon-refresh"></i></a>
                        <a href="#" class="btn btn-mini content-slideUp"><i class="icon-angle-down"></i>
                        </a>
                    </div>
                </div>
                <div class="box-content">
                    <div id="dashboard-grph-genero" class='flot'>
                    </div>
                </div>
            </div>
        </div>
        <div class="span6">
            <div class="box">
                <div class="box-title">
                    <h3>
                        <i class="icon-bar-chart"></i>Rango Edad Pacientes
                    </h3>
                    <div class="actions">
                        <a href="#" class="btn btn-mini content-refresh"><i class="icon-refresh"></i></a>
                        <a href="#" class="btn btn-mini content-slideUp"><i class="icon-angle-down"></i>
                        </a>
                    </div>
                </div>
                <div class="box-content">
                    <div id="dashboard-grph-rangoedad" class='flot'>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="row-fluid">
        <div class="span12">
            <div class="box">
                <div class="box-title">
                    <h3>
                        <i class="icon-bar-chart"></i>Diagnóstico Pacientes Recibidos
                    </h3>
                    <div class="actions">
                        <a href="#" class="btn btn-mini content-refresh"><i class="icon-refresh"></i></a>
                        <a href="#" class="btn btn-mini content-slideUp"><i class="icon-angle-down"></i>
                        </a>
                    </div>
                </div>
                <div class="box-content">
                    <div id="dashboard-grph-diagnosticos" class='flot'>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="row-fluid">
        <div class="span6">
            <div class="box">
                <div class="box-title">
                    <h3>
                        <i class="icon-bar-chart"></i>Status Pacientes
                    </h3>
                    <div class="actions">
                        <a href="#" class="btn btn-mini content-refresh"><i class="icon-refresh"></i></a>
                        <a href="#" class="btn btn-mini content-slideUp"><i class="icon-angle-down"></i>
                        </a>
                    </div>
                </div>
                <div class="box-content">
                    <div id="dashboard-grph-statuspacientes" class='flot'>
                    </div>
                </div>
            </div>
        </div>
        <div class="span6">
            <div class="box">
                <div class="box-title">
                    <h3>
                        <i class="icon-bar-chart"></i>Clasificación Socioeconómica pacientes
                    </h3>
                    <div class="actions">
                        <a href="#" class="btn btn-mini content-refresh"><i class="icon-refresh"></i></a>
                        <a href="#" class="btn btn-mini content-slideUp"><i class="icon-angle-down"></i>
                        </a>
                    </div>
                </div>
                <div class="box-content">
                    <div id="dashboard-grph-categorias" class='flot'>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <asp:HiddenField ID="HiddenField1" runat="server" />
    <%--Calendario--%>
    <%--<div class="row-fluid">
        <div class="span12">
            <div class="box">
                <div class="box-title">
                    <h3>
                        <i class="icon-calendar"></i>Programacion Mensual</h3>
                </div>
                <div class="box-content nopadding">
                    <div class="calendar">
                    </div>
                </div>
            </div>
        </div>
    </div>--%>
           <script type="text/javascript">
               $(document).ready(function () {

                   var Url = {
                       grafico_DiagnosticoPacientesRecibidos: "<%: ResolveUrl("Estadisticas.aspx/DiagnosticoPacientesRecibidos")%>",
                   grafico_DistribucionPacientesGenero: "<%: ResolveUrl("Estadisticas.aspx/DistribucionPacientesGenero")%>",
                grafico_RangoEdadPacientes: "<%: ResolveUrl("Estadisticas.aspx/RangoEdadPacientes")%>",
                grafico_StatusPacientes: "<%: ResolveUrl("Estadisticas.aspx/StatusPacientes")%>",
                grafico_ClacificacionSocioeconomicaPacientes: "<%: ResolveUrl("Estadisticas.aspx/ClacificacionSocioeconomicaPacientes")%>"
                   }

                   $.ajax({
                       type: "POST",
                       data: '',
                       url: Url.grafico_DiagnosticoPacientesRecibidos,
                       contentType: "application/json; charset=utf-8",
                       dataType: "json",
                       success: function (result) {
                           var objResult = result.d;
                           var data = [];

                           for (var i = 0; i < objResult.length; i++) {
                               data[i] = {
                                   label: result.d[i].DiagnosticoRecibidos,
                                   data: result.d[i].Pacientes
                               }
                           }

                           $.plot($("#dashboard-grph-diagnosticos"), data,
                               {
                                   series: {
                                       pie: {
                                           show: true,
                                           radius: 1,
                                           label: {
                                               show: true,
                                               left: 7,
                                               threshold: 0.1,
                                               formatter: function (label, series) {
                                                   return '<div class="chart-label">' + Math.round(series.percent) + '%</div>';
                                               },
                                               background: {
                                                   opacity: 0.8
                                               }
                                           }
                                       }
                                   },
                                   legend: {
                                       show: true
                                   }
                               });
                       },
                       async: false,
                       error: function (XMLHttpRequest) {
                           alert("ERROR");
                       }
                   });

                   $.ajax({
                       type: "POST",
                       data: '',
                       url: Url.grafico_DistribucionPacientesGenero,
                       contentType: "application/json; charset=utf-8",
                       dataType: "json",
                       success: function (result) {
                           var objResult = result.d;
                           var data = [];

                           for (var i = 0; i < objResult.length; i++) {
                               data[i] = {
                                   label: result.d[i].Sexo,
                                   data: result.d[i].Pacientes
                               }
                           }

                           $.plot($("#dashboard-grph-genero"), data,
                               {
                                   series: {
                                       pie: {
                                           innerRadius: 0.5,
                                           show: true,
                                           radius: 1,
                                           label: {
                                               show: true,
                                               radius: 3 / 4,
                                               formatter: function (label, series) {
                                                   return '<div class="chart-label">' + Math.round(series.percent) + '%</div>';
                                               }
                                           }
                                       }
                                   },
                                   legend: {
                                       show: true
                                   }
                               });
                       },
                       async: false,
                       error: function (XMLHttpRequest) {
                           alert("ERROR");
                       }
                   });

                   $.ajax({
                       type: "POST",
                       data: '',
                       url: Url.grafico_RangoEdadPacientes,
                       contentType: "application/json; charset=utf-8",
                       dataType: "json",
                       success: function (result) {
                           var objResult = result.d;
                           var data = [];

                           for (var i = 0; i < objResult.length; i++) {
                               data[i] = {
                                   label: result.d[i].Rango,
                                   data: result.d[i].Pacientes
                               }
                           }

                           $.plot($("#dashboard-grph-rangoedad"), data,
                               {
                                   series: {
                                       pie: {
                                           show: true,
                                           radius: 1,
                                           label: {
                                               show: true,
                                               radius: 2 / 4,
                                               formatter: function (label, series) {
                                                   return '<div class="chart-label">' + Math.round(series.percent) + '%</div>';
                                               }
                                           }
                                       }
                                   },
                                   legend: {
                                       show: true,
                                       position: "sw"
                                   }
                               });
                       },
                       async: false,
                       error: function (XMLHttpRequest) {
                           alert("ERROR");
                       }
                   });

                   $.ajax({
                       type: "POST",
                       data: '',
                       url: Url.grafico_StatusPacientes,
                       contentType: "application/json; charset=utf-8",
                       dataType: "json",
                       success: function (result) {
                           var objResult = result.d;
                           var data = [];

                           for (var i = 0; i < objResult.length; i++) {
                               data[i] = {
                                   label: result.d[i].Estatus,
                                   data: result.d[i].Pacientes
                               }
                           }

                           $.plot($("#dashboard-grph-statuspacientes"), data,
                               {
                                   series: {
                                       pie: {
                                           show: true,
                                           radius: 1,
                                           label: {
                                               show: true,
                                               left: 7,
                                               formatter: function (label, series) {
                                                   return '<div class="chart-label">' + Math.round(series.percent) + '%</div>';
                                               },
                                               background: {
                                                   opacity: 0.8
                                               }
                                           }
                                       }
                                   },
                                   legend: {
                                       show: true
                                   }
                               });
                       },
                       async: false,
                       error: function (XMLHttpRequest) {
                           alert("ERROR");
                       }
                   });

                   $.ajax({
                       type: "POST",
                       data: '',
                       url: Url.grafico_ClacificacionSocioeconomicaPacientes,
                       contentType: "application/json; charset=utf-8",
                       dataType: "json",
                       success: function (result) {
                           var objResult = result.d;
                           var data = [];

                           for (var i = 0; i < objResult.length; i++) {
                               data[i] = {
                                   label: result.d[i].ClasificacionSocial,
                                   data: result.d[i].Pacientes
                               }
                           }

                           $.plot($("#dashboard-grph-categorias"), data,
                               {
                                   series: {
                                       pie: {
                                           show: true,
                                           label: {
                                               show: true,
                                               color: '#fff'
                                           }
                                       }
                                   },
                                   legend: {
                                       show: false
                                   }
                               });
                       },
                       async: false,
                       error: function (XMLHttpRequest) {
                           alert("ERROR");
                       }
                   });
               });
    </script>
</asp:Content>
