<%@ Master Language="C#" AutoEventWireup="true" CodeBehind="Site2.master.cs" Inherits="CAID_V2.Site2" %>

<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <!-- Apple devices fullscreen -->
    <meta name="apple-mobile-web-app-capable" content="yes" />
    <!-- Apple devices fullscreen -->
    <meta name="apple-mobile-web-app-status-bar-style" content="black-translucent" />
    <meta name="keywords" content="jQuery,Bootstrap,Calendar,HTML,CSS,JavaScript,responsive,month,week,year,day">
    <title>SIGES</title>
    <!-- Bootstrap -->
    <link rel="stylesheet" href="../css/bootstrap.min.css">
    <!-- Bootstrap responsive -->
    <link rel="stylesheet" href="../css/bootstrap-responsive.min.css">
    <!-- jQuery UI -->
    <link rel="stylesheet" href="../css/plugins/jquery-ui/smoothness/jquery-ui.css">
    <link rel="stylesheet" href="../css/plugins/jquery-ui/smoothness/jquery.ui.theme.css">
    <!-- dataTables -->
    <link rel="stylesheet" href="../css/plugins/datatable/TableTools.css">
    <!-- PageGuide -->
    <link rel="stylesheet" href="../css/plugins/pageguide/pageguide.css">
    <!-- Fullcalendar -->
    <link rel="stylesheet" href="../css/plugins/fullcalendar/fullcalendar.css">
    <link rel="stylesheet" href="../css/plugins/fullcalendar/fullcalendar.print.css" media="print">
    <!-- Tagsinput -->
    <link rel="stylesheet" href="../css/plugins/tagsinput/jquery.tagsinput.css">
    <!-- chosen -->
    <link rel="stylesheet" href="../css/plugins/chosen/chosen.css">
    <!-- multi select -->
    <link rel="stylesheet" href="../css/plugins/multiselect/multi-select.css">
    <!-- timepicker -->
    <link rel="stylesheet" href="../css/plugins/timepicker/bootstrap-timepicker.min.css">
    <!-- colorpicker -->
    <link rel="stylesheet" href="../css/plugins/colorpicker/colorpicker.css">
    <!-- Datepicker -->
    <link rel="stylesheet" href="../css/plugins/datepicker/datepicker.css">
    <!-- Daterangepicker -->
    <link rel="stylesheet" href="../css/plugins/daterangepicker/daterangepicker.css">
    <!-- Plupload -->
    <link rel="stylesheet" href="../css/plugins/plupload/jquery.plupload.queue.css">
    <!-- select2 -->
    <link rel="stylesheet" href="../css/plugins/select2/select2.css">
    <!-- icheck -->
    <link rel="stylesheet" href="../css/plugins/icheck/all.css">
    <!-- Theme CSS -->
    <link rel="stylesheet" href="../css/style.css">
    <!-- Color CSS -->
    <link rel="stylesheet" href="../css/themes.css">
    <!-- Morris chart -->
    <link rel="stylesheet" type="text/css/morris/morris.css" />
    <link rel="stylesheet" type="text/css/jquery-ui.min.css" />
    <!-- jQuery -->
    <script src="../js/jquery.min.js"></script>
    <!-- Nice Scroll -->
    <script src="../js/plugins/nicescroll/jquery.nicescroll.min.js"></script>
    <!-- jQuery -->
    <script src="../js/jquery.min.js"></script>
    <!-- Nice Scroll -->
    <script src="../js/plugins/nicescroll/jquery.nicescroll.min.js"></script>
    <!-- jQuery UI -->
    <script src="../js/plugins/jquery-ui/jquery.ui.core.min.js"></script>
    <script src="../js/plugins/jquery-ui/jquery.ui.widget.min.js"></script>
    <script src="../js/plugins/jquery-ui/jquery.ui.mouse.min.js"></script>
    <script src="../js/plugins/jquery-ui/jquery.ui.draggable.min.js"></script>
    <script src="../js/plugins/jquery-ui/jquery.ui.resizable.min.js"></script>
    <script src="../js/plugins/jquery-ui/jquery.ui.spinner.js"></script>
    <script src="../js/plugins/jquery-ui/jquery.ui.sortable.min.js"></script>
    <script src="../js/plugins/jquery-ui/jquery.ui.slider.js"></script>
    <!-- Touch enable for jquery UI -->
    <script src="../js/plugins/touch-punch/jquery.touch-punch.min.js"></script>
    <!-- slimScroll -->
    <script src="../js/plugins/slimscroll/jquery.slimscroll.min.js"></script>
    <!-- Bootstrap -->
    <script src="../js/bootstrap.min.js"></script>
    <!-- vmap -->
    <script src="../js/plugins/vmap/jquery.vmap.min.js"></script>
    <script src="../js/plugins/vmap/jquery.vmap.world.js"></script>
    <script src="../js/plugins/vmap/jquery.vmap.sampledata.js"></script>
    <!-- Bootbox -->
    <script src="../js/plugins/bootbox/jquery.bootbox.js"></script>
    <!-- Flot -->
    <script src="../js/plugins/flot/jquery.flot.min.js"></script>
    <script src="../js/plugins/flot/jquery.flot.bar.order.min.js"></script>
    <script src="../js/plugins/flot/jquery.flot.pie.min.js"></script>
    <script src="../js/plugins/flot/jquery.flot.resize.min.js"></script>
    <script src="../js/plugins/flot/jquery.flot.stack.js"></script>
    <script src="../js/plugins/flot/jquery.flot.JUMlib.js"></script>
    <script src="../js/plugins/flot/jquery.flot.spider.js"></script>
    <!-- imagesLoaded -->
    <script src="../js/plugins/imagesLoaded/jquery.imagesloaded.min.js"></script>
    <!-- PageGuide -->
    <script src="../js/plugins/pageguide/jquery.pageguide.js"></script>
    <!-- FullCalendar -->
    <script src="../js/plugins/fullcalendar/fullcalendar.min.js"></script>
    <!-- Chosen -->
    <script src="../js/plugins/chosen/chosen.jquery.min.js"></script>
    <!-- PLUpload -->
    <script src="../js/plugins/plupload/plupload.full.js"></script>
    <script src="../js/plugins/plupload/jquery.plupload.queue.js"></script>
    <!-- Custom file upload -->
    <script src="../js/plugins/fileupload/bootstrap-fileupload.min.js"></script>
    <script src="../js/plugins/mockjax/jquery.mockjax.js"></script>
    <!-- select2 -->
    <script src="../js/plugins/select2/select2.min.js"></script>
    <!-- icheck -->
    <script src="../js/plugins/icheck/jquery.icheck.min.js"></script>
    <!-- dataTables -->
    <script src="../js/plugins/datatable/jquery.dataTables.min.js"></script>
    <script src="../js/plugins/datatable/TableTools.min.js"></script>
    <script src="../js/plugins/datatable/ColReorderWithResize.js"></script>
    <script src="../js/plugins/datatable/ColVis.min.js"></script>
    <script src="../js/plugins/datatable/jquery.dataTables.columnFilter.js"></script>
    <script src="../js/plugins/datatable/jquery.dataTables.grouping.js"></script>
    <!-- Masked inputs -->
    <script src="../js/plugins/maskedinput/jquery.maskedinput.min.js"></script>
    <!-- TagsInput -->
    <script src="../js/plugins/tagsinput/jquery.tagsinput.min.js"></script>
    <!-- Datepicker -->
    <script src="../js/plugins/datepicker/bootstrap-datepicker.js"></script>
    <!-- Daterangepicker -->
    <script src="../js/plugins/daterangepicker/daterangepicker.js"></script>
    <script src="../js/plugins/daterangepicker/moment.min.js"></script>
    <!-- Timepicker -->
    <script src="../js/plugins/timepicker/bootstrap-timepicker.min.js"></script>
    <!-- Colorpicker -->
    <script src="../js/plugins/colorpicker/bootstrap-colorpicker.js"></script>
    <!-- Chosen -->
    <script src="../js/plugins/chosen/chosen.jquery.min.js"></script>
    <!-- MultiSelect -->
    <script src="../js/plugins/multiselect/jquery.multi-select.js"></script>
    <!-- CKEditor -->
    <script src="../js/plugins/ckeditor/ckeditor.js"></script>
    <!-- PLUpload -->
    <script src="../js/plugins/plupload/plupload.full.js"></script>
    <script src="../js/plugins/plupload/jquery.plupload.queue.js"></script>
    <!-- Custom file upload -->
    <script src="../js/plugins/fileupload/bootstrap-fileupload.min.js"></script>
    <script src="../js/plugins/mockjax/jquery.mockjax.js"></script>
    <!-- select2 -->
    <script src="../js/plugins/select2/select2.min.js"></script>
    <!-- icheck -->
    <script src="../js/plugins/icheck/jquery.icheck.min.js"></script>
    <!-- complexify -->
    <script src="../js/plugins/complexify/jquery.complexify-banlist.min.js"></script>
    <script src="../js/plugins/complexify/jquery.complexify.min.js"></script>
    <!-- Mockjax -->
    <script src="../js/plugins/mockjax/jquery.mockjax.js"></script>
    <!-- Validation -->
    <script src="../js/plugins/validation/jquery.validate.min.js"></script>
    <script src="../js/plugins/validation/additional-methods.min.js"></script>
    <!-- Form -->
    <script src="../js/plugins/form/jquery.form.min.js"></script>
    <!-- Wizard -->
    <script src="../js/plugins/wizard/jquery.form.wizard.min.js"></script>
    <script src="../js/plugins/mockjax/jquery.mockjax.js"></script>
    <!-- Validation -->
    <script src="../js/plugins/validation/jquery.validate.min.js"></script>
    <script src="../js/plugins/validation/additional-methods.min.js"></script>
    <!-- Morris.js charts -->
    <%--<script src="../js/plugins/raphael/raphael-min.js" type="text/javascript"></script> 24/20/2017--%>
    <%--<script src="../js/plugins/morris/morris.min.js" type="text/javascript"></script> 24/20/2017--%>
    <!-- Theme framework -->
    <script src="../js/eakroko.min.js"></script>
    <!-- Theme scripts -->
    <script src="../js/application.min.js"></script>
    <!-- Just for demonstration -->
    <%--<script src="../js/demonstration.min.js"></script>--%>
    <%--<script src="../js/cycle.js" type="text/javascript"></script>
    <script src="../js/json_parse.js" type="text/javascript"></script>
    <script src="../js/json_parse_state.js" type="text/javascript"></script>
    <script src="../js/json2.js" type="text/javascript"></script> 24/20/2017 --%>
     
    <%--Toast Message--%>
    <%--<script>
        function toast(options) {
            var data = [
              '<div style="color:white;font-size: 18px;left:50%;position:absolute;min-width:50px;background:rgb(88,88,88);padding:15px;font-family:arial;border:solid 1px #555;display:none;box-shadow:0px 0px 2px green;" class="toast">',
                '<div style="color:white;" class="toast-body">',
                '</div>',
              '<div>'
            ];

            var $toast = $(data.join(''));
            $toast.find(".toast-body").text(options.message);

            $toast.appendTo("body");
            $toast.fadeIn('fast', function () {
                setTimeout(function () {
                    $toast.fadeOut(function () {
                        $toast.remove();
                    });
                }, options.duration | 2000);
            }).css({
                marginLeft: (($toast.width() / 2) * -1) + "px",
                top: "10%",
                zIndex: "1000"
            });

        };

    </script>--%>

    <!-- Favicon -->
    <link rel="shortcut icon" href="img/favicon.ico" />
    <!-- Apple devices Homescreen icon -->
    <link rel="apple-touch-icon-precomposed" href="img/apple-touch-icon-precomposed.png" />
    <%--<style type="text/css">
        .navi {
            position: fixed;
            width: 100%;
            height: 100%;
            left: 0;
            top: 0;
            background: #333333;
            background: rgba(51,51,51,0.7);
            z-index: 10;
        }
    </style>--%>
    <%-- <style type="text/css">
        .chart-label {
            color: #000;
            font-size: 9pt;
            font-weight: bolder;
            padding: 2px;
            text-align: center;
        }

        .pieLabel div {
            font-size: 9pt !important;
            font-weight: 700;
        }
    </style>--%>
    <%-- <script type="text/javascript">
        $(document).ready(function () {

            var Url = {
                grafico_DiagnosticoPacientesRecibidos: "<%: ResolveUrl("~/index.aspx/DiagnosticoPacientesRecibidos")%>",
                grafico_DistribucionPacientesGenero: "<%: ResolveUrl("~/index.aspx/DistribucionPacientesGenero")%>",
                grafico_RangoEdadPacientes: "<%: ResolveUrl("~/index.aspx/RangoEdadPacientes")%>",
                grafico_StatusPacientes: "<%: ResolveUrl("~/index.aspx/StatusPacientes")%>",
                grafico_ClacificacionSocioeconomicaPacientes: "<%: ResolveUrl("~/index.aspx/ClacificacionSocioeconomicaPacientes")%>"
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
    </script>--%>
</head>
<body class="theme-satblue">
    <div id="navigation">
        <div class="container-fluid">
            <a href="http://caidsiges01:8000/LOGIN.aspx" id="brand">SIGES</a> <a href="#" class="toggle-nav" rel="tooltip"
                data-placement="bottom" title="Toggle navigation"><i class="icon-reorder"></i>
            </a>
            <%-- Menú Superior --%>
            <ul class='main-nav'> 
                <asp:Literal ID="MenuTop" runat="server"></asp:Literal>
                <%--<li><a href="http://caidsiges01:8000/index.aspx" runat="server" id="lblEmpresa">CAID</a> </li>--%>
                <ul class='main-nav'><li>



					<a href="#" data-toggle="dropdown" class='dropdown-toggle'>



						<span>Recepción</span>



						<span class="caret"></span>



					</a>



					<ul class="dropdown-menu"><li><a href="http://caidsiges01:8082/forms/TardanzasyAusencias2.aspx?LOCALIDAD=CAID-SD&USUARIO=M.CASTILLO"> Registro Tardanzas y Ausencias</a> </li><li><a href="PAX20101.aspx"> Control de Visitas</a> </li><li><a href="PAX20101R3.aspx"> Salidas Pendientes</a> </li><li><a href="PAX20101R2.aspx"> Histórico de Visitas</a> </li><li><a href="PAX40100.aspx"> Form. Actualización de Datos</a> </li></ul></li><li>



					<a href="#" data-toggle="dropdown" class='dropdown-toggle'>



						<span>Admisión y Registro</span>



						<span class="caret"></span>



					</a>



					<ul class="dropdown-menu"><li><a href="PAX00000.aspx?X=DATA"> Admisiones</a> </li><li><a href="PAX00300.aspx?X=DATA"> Prospectos</a> </li><li><a href="HCX00001.aspx"> Carnetización</a> </li></ul></li><li>



					<a href="#" data-toggle="dropdown" class='dropdown-toggle'>



						<span>Facturación</span>



						<span class="caret"></span>



					</a>



					<ul class="dropdown-menu"><li><a href="FTX10100.aspx"> Control de Caja</a> </li><li><a href="FTX10103.aspx"> Movimientos de Caja</a> </li><li><a href="FTX00000.aspx"> Registro de Facturas</a> </li><li><a href="FTX00000_N.aspx"> Registro de Notas Contables</a> </li><li><a href="FTX00000_P.aspx"> Registro de Pagos</a> </li><li><a href="FTX00000_A.aspx?X=DATA"> Apertura de Factura</a> </li></ul></li><li>



					<a href="#" data-toggle="dropdown" class='dropdown-toggle'>



						<span>Control de Citas</span>



						<span class="caret"></span>



					</a>



					<ul class="dropdown-menu"><li><a href="PAX00800.ASPX"> Cambio de Estatus de Paciente</a> </li><li><a href="http://caidsiges01:8082/forms/EstadisticasCitasConfirmadasyAusentes.aspx?x=64C361FA-686D-4714-ACE2-028E4A3C1F25&XCURRENTUSR_SGXID=CAID-SD"> Consulta Citas Confirmadas y Ausentes</a> </li><li><a href="http://caidsiges01:8082/forms/RegistroAgenda.aspx?USUARIO=M.CASTILLO&LOCALIDAD=CAID-SD&XNO=DATA&AUTORIZA=X&X"> Registro de Actividades</a> </li><li><a href="http://caidsiges01:8082/forms/EstadisticasCitas.aspx?x=64C361FA-686D-4714-ACE2-028E4A3C1F25"> Consulta Citas por Especialidad</a> </li><li><a href="SMX00500.aspx"> Programación de Citas</a> </li><li><a href="SMX00502.aspx"> Citas para Ruta Básica</a> </li><li><a href="SMX00501.aspx"> Citas Recurrentes</a> </li><li><a href="SMX00510.aspx"> Confirmación de Citas</a> </li><li><a href="SMX00520.aspx"> Consultar Agenda</a> </li><li><a href="SMX00503.aspx"> Citas Grupales</a> </li><li><a href="SMX10050.aspx"> Horarios</a> </li></ul></li><li>



					<a href="#" data-toggle="dropdown" class='dropdown-toggle'>



						<span>Servicio Social</span>



						<span class="caret"></span>



					</a>



					<ul class="dropdown-menu"><li><a href="PAX00102.aspx"> Entrevista Inicial</a> </li><li><a href="http://caidsiges01:8082/forms/SeguimientodeCasos.aspx?LOCALIDAD=CAID-SD&USUARIO=64C361FA-686D-4714-ACE2-028E4A3C1F25"> Seguimiento de Casos</a> </li><li><a href="
http://caidsiges01:8082/forms/RPTSEGUIMIENTOCASOS.aspx?LOCALIDAD=CAID-SD&USUARIO=64C361FA-686D-4714-ACE2-028E4A3C1F25"> Reporte de Seguimiento de Casos</a> </li><li><a href="PAX00101.aspx#"> Clasif. Dígital Escala Socioeconómica</a> </li><li><a href="PAX00100_MC.ASPX"> Actualización de Categorías</a> </li><li><a href="PAX00102R1.aspx"> Reporte Entrevista Servicio Social</a> </li><li><a href="http://caidsiges01:8082/forms/PacientesPorEstatus.aspx?CURRENTUSR_SGXID=CAID-SD"> Estatus General de Pacientes</a> </li><li><a href="SMX30051.aspx"> Listado de Estatus</a> </li></ul></li><li>



					<a href="#" data-toggle="dropdown" class='dropdown-toggle'>



						<span>Evaluación y Diagnóstico</span>



						<span class="caret"></span>



					</a>



					<ul class="dropdown-menu"><li><a href="http://caidsiges01:8082/forms/PacientesPorEstatusEVDPediatria.aspx?CURRENTUSR_SGXID=CAID-SD"> Estatus Pediatria y EVD</a> </li><li><a href="PAX00800.aspx"> Estatus de Pacientes</a> </li></ul></li><li>



					<a href="#" data-toggle="dropdown" class='dropdown-toggle'>



						<span>Intervención Grupal</span>



						<span class="caret"></span>



					</a>



					<ul class="dropdown-menu"><li><a href="http://caidsiges01:8082/forms/ActividadesIntervencionGrupal.aspx?CURRENTUSR_SGXID=CAID-SD&CURRENTUSR_ID=64C361FA-686D-4714-ACE2-028E4A3C1F25"> Programacion Actividades Nuevo</a> </li><li><a href="http://caidsiges01:8082/forms/ActividadesIntervencionGrupalConsultaPX.aspx?CURRENTUSR_SGXID=CAID-SD"> Consulta de Actividades Pacientes</a> </li><li><a href="http://caidsiges01:8082/forms/AlertasPacientes.aspx?CURRENTUSR_SGXID=CAID-SD&CURRENTUSR_ROWGUID=64C361FA-686D-4714-ACE2-028E4A3C1F25"> Registro de Alertas</a> </li><li><a href="
http://caidsiges01:8082/forms/RptActividadesxPX.aspx?LOCALIDAD=CAID-SD&USUARIO=64C361FA-686D-4714-ACE2-028E4A3C1F25"> Historico Sesiones Por Pacientes</a> </li><li><a href="http://caidsiges01:8082/forms/EstadisticasIGrupal.aspx?ROWSGXID=CAID-SD"> Estadisticas de Servicio IG</a> </li><li><a href="SMX00600_A.aspx"> Agenda de Actividades</a> </li></ul></li><li>



					<a href="#" data-toggle="dropdown" class='dropdown-toggle'>



						<span>Gestión de Salud</span>



						<span class="caret"></span>



					</a>



					<ul class="dropdown-menu"><li><a href="http://caidsiges01:8082/forms/ODP_ConsultaAlertas.aspx?CURRENTUSR_SGXID=CAID-SD"> Consulta Alertas ODP</a> </li><li><a href="http://caidsiges01:8082/forms/PlanTratamientoEXCEL.aspx?CURRENTUSR_ID=&CURRENTUSR_SGXID=CAID-SD"> Plan Tratamiento EXCEL</a> </li><li><a href="http://caidsiges01:8082/forms/TFAudiovisuales.aspx"> Herramientas y Recursos</a> </li><li><a href="http://caidsiges01:8082/forms/ConsultaPaciente.aspx?LOCALIDAD=CAID-SD&USUARIO=64C361FA-686D-4714-ACE2-028E4A3C1F25&NOMBRE=X"> Consulta de Pacientes</a> </li><li><a href="HCX00300.aspx"> Plan de Tratamiento</a> </li><li><a href="#">Plan Único</a> </li><li><a href="HCL00014.ASPX"> Cargar Multimedia</a> </li><li><a href="HCL00000R2.ASPX"> Consultar Historial Clínico</a> </li><li><a href="HCX00310.ASPX"> Registro de Objetivos y Actividades</a> </li><li><a href="HCL00023.ASPX"> Asignación de Objetivos y Tareas</a> </li><li><a href="HCL00036R1.aspx"> Histórico Intervenciones Terapéuticas</a> </li><li><a href="HCL00039R1.aspx"> Histórico Hoja de Data</a> </li><li><a href="HCL00039R3.aspx"> Evolución Hoja de Data (Gráfica)</a> </li><li><a href="EME00001.aspx"> Consulta de Emergencia</a> </li><li><a href="HCL00000R3.aspx"> Atenciones por Especialista</a> </li><li><a href="HCX00500.aspx"> Discusión de Casos</a> </li><li><a href="HCX00600.aspx"> Evaluación Multidisciplinaria</a> </li></ul></li><li>



					<a href="#" data-toggle="dropdown" class='dropdown-toggle'>



						<span>Reportes</span>



						<span class="caret"></span>



					</a>



					<ul class="dropdown-menu"><li><a href="http://caidsiges01:8082/forms/EstadisticasDiagnosticosInstitucionales.aspx?LOCALIDAD=CAID-SD&USUARIO=64C361FA-686D-4714-ACE2-028E4A3C1F25"> Diagnostico x Grupo de Edades</a> </li><li><a href="http://caidsiges01:8082/forms/FacturacionSubsidiados.aspx?LOCALIDAD=CAID-SD"> Facturacion Pacientes Subsidiados</a> </li><li><a href="SGX00000RG.aspx"> Estadísticas Generales</a> </li><li><a href="PAX20100R2.aspx"> Control de Visitas</a> </li><li><a href="PAX20100R3.aspx"> Estadísticas de Asistencia</a> </li><li><a href="PAX20101R1.aspx"> Reporte de Visitas e Interaciones</a> </li><li><a href="FTX00000R2.aspx"> Reporte de Facturas</a> </li><li><a href="FTX00000_DR1.aspx"> Reporte Servicios Facturados</a> </li></ul></li><li>



					<a href="#" data-toggle="dropdown" class='dropdown-toggle'>



						<span>Configuración</span>



						<span class="caret"></span>



					</a>



					<ul class="dropdown-menu"><li class='dropdown-submenu'>



								<a href="#" data-toggle="dropdown">Conf. Archivos Maestros</a>



								<ul class="dropdown-menu"><li><a href="SMX30020F.aspx"> Diagnósticos Frecuentes</a> </li><li><a href="PAX00700.aspx"> Pre-Diagnósticos</a> </li><li><a href="SMX30020.aspx"> Catálogo de Diagnósticos</a> </li><li><a href="SMX30017.aspx"> Conceptos de Admisión</a> </li><li><a href="SMX30013.aspx"> Especialidades Médicas</a> </li><li><a href="SMX30007.aspx"> Estados Civiles</a> </li><li><a href="SMX30028.aspx"> Exámenes Auxiliares</a> </li><li><a href="SMX30022.aspx"> Estudios de Imágenes</a> </li><li><a href="SMX30021.aspx"> Estudios de Laboratorios</a> </li><li><a href="FTX30002.ASPX"> Formas de Pago</a> </li><li><a href="SMX30023.aspx"> Medicamentos</a> </li><li><a href="SMX30010.aspx"> Meses del Año</a> </li><li><a href="SMX30018.aspx"> Motivos de Visitas</a> </li><li><a href="SMX30014.aspx"> Orígenes de Atención</a> </li><li><a href="SMX30003.aspx"> Tipo de Filiación</a> </li><li><a href="SMX30004.aspx"> Tipos de Contactos</a> </li><li><a href="SMX30001.aspx"> Tipos de Monedas</a> </li><li><a href="FTX30001.aspx"> Tipos de NCF</a> </li><li><a href="SMX30024.aspx"> Tipos de Notas Contables</a> </li><li><a href="SMX30006.aspx"> Tipos de Subsidios</a> </li><li><a href="SMX30002.aspx"> Tipos de Tarifas</a> </li></ul></li><li class='dropdown-submenu'>



								<a href="#" data-toggle="dropdown">Conf. Trabajo Social</a>



								<ul class="dropdown-menu"><li><a href="PAX00100_G.aspx?X=DATA"> Grupos de Preguntas</a> </li><li><a href="PAX00100_P.aspx"> Preguntas</a> </li><li><a href="SMX30015.aspx"> Grados de Escolaridad</a> </li><li><a href="SMX30009.aspx"> Horarios Laborales</a> </li><li><a href="SMX30005.aspx"> Conceptos Financieros</a> </li><li><a href="SMX30012.aspx"> Cargos y Posiciones</a> </li><li><a href="SMX30011.aspx"> Departamentos</a> </li><li><a href="SMX30008.aspx"> Escalas Salariales</a> </li><li><a href="PAX00200.aspx"> Categorías de Pacientes</a> </li></ul></li><li class='dropdown-submenu'>



								<a href="#" data-toggle="dropdown">Conf. Aseguradoras</a>



								<ul class="dropdown-menu"><li><a href="SMX00200.aspx"> Compañías Aseguradoras</a> </li><li><a href="SMX00201.aspx"> Planes de Atención</a> </li><li><a href="SMX00202.aspx"> Registro de Coberturas</a> </li></ul></li><li class='dropdown-submenu'>



								<a href="#" data-toggle="dropdown">Conf. Recepción</a>



								<ul class="dropdown-menu"><li><a href="SMX30016.aspx"> Guía de Información</a> </li></ul></li><li class='dropdown-submenu'>



								<a href="#" data-toggle="dropdown">Conf. Regional</a>



								<ul class="dropdown-menu"><li><a href="SMX00001.aspx?X=DATA"> Países</a> </li><li><a href="SMX00002.aspx?X=DATA"> Provincias</a> </li><li><a href="SMX00003.aspx?X=DATA"> Municipios</a> </li><li><a href="SMX00004.aspx?X=DATA"> Sectores</a> </li><li><a href="SMX00005.aspx?X=DATA"> Zonas</a> </li></ul></li></ul></li><li>



					<a href="#" data-toggle="dropdown" class='dropdown-toggle'>



						<span>Sistema</span>



						<span class="caret"></span>



					</a>



					<ul class="dropdown-menu"><li><a href="#">Costos Hospitalarios</a> </li><li><a href="SGX00000.aspx?X=DATA"> Compañías</a> </li><li><a href="SGX00100.aspx?X=DATA"> Usuarios</a> </li><li><a href="SGX00002.aspx?X=DATA"> Roles</a> </li><li><a href="SGX00001.aspx?X=DATA"> Opciones</a> </li><li><a href="SGX00003.aspx?X=DATA"> Accesos</a> </li><li><a href="SGX00004.aspx"> Componentes del Acto Médico</a> </li><li><a href="SGX00102.ASPX"> Mis Favoritos</a> </li><li><a href="SMX00300.ASPX"> Profesionales</a> </li></ul></li></ul>
            </ul>
            <div class="user">
                <div class="dropdown">
                    <a href="http://caidsiges01:8000/index.aspx" runat="server" id="lblUsuario" class='dropdown-toggle' data-toggle="dropdown">
                        <img src="../img/demo/user-avatar.jpg" alt=""></a>
                    <ul class="dropdown-menu pull-right">
                        <li><a href="http://caidsiges01:8000/fichas/USERMANUAL.pdf" target="_blank">Guía de Usuario</a> </li>
                        <li><a href="http://caidsiges01:8000/SGX00100_P.aspx">Cambiar Clave</a> </li>
                        <li><a href="http://caidsiges01:8000/logoff.aspx">Cerrar Sesión</a> </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <%--Nav Hidden--%>
    <%--<div class="container-fluid nav-hidden" id="content">--%>
    <%-- Nav Show--%>
    <%--<div class="container-fluid" id="content">--%>
    <%-- Menú Lateral --%>
    <%--<div id="left" style="visibility:hidden" width:"0%" height:"0%""  >
            <asp:Repeater ID="MenuLeft" runat="server">
                <ItemTemplate>
                    <%# Eval("HTML_LEFT")%>
                </ItemTemplate>
            </asp:Repeater>
        
        </div>--%>

    <%--<div id="main">--%>
    <div class="container-fluid">
        <form id="frmWebSite" runat="server">
            <div>
                <asp:Literal ID="_MenuActoMedico" runat="server"></asp:Literal>
                <asp:HiddenField ID="xMAINPAXGUID" runat="server" />
                <asp:HiddenField ID="xMAINPAXNAM" runat="server" />
                <asp:HiddenField ID="xREFGUID" runat="server" />
                <asp:HiddenField ID="xTOKEN" runat="server" />
                <p>
                </p>
                <asp:ContentPlaceHolder ID="MainContent" runat="server">
                </asp:ContentPlaceHolder>
                <%--
                    -------------------------------------------------------------------------------
                    ----------------             FORMULARIOS MODALES               ----------------
                    -------------------------------------------------------------------------------
                      
                <%--Sombra--%>
                <div id="MainShadow" runat="server">
                </div>
            </div>
        </form>
    </div>
    <%-- </div>--%>
</body>
</html>
