<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true"
    CodeBehind="FWeeFIM.aspx.cs" Inherits="CAID_V2.forms.FWeeFIM" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">
    <div class="container-fluid" id="content">
        <link href="../css/bootstrap.min2.css" rel="stylesheet" />
        <link href="../css/StyleSheet1.css" rel="stylesheet" />
        <link href="../css/font-awesome.min2.css" rel="stylesheet" />
        <link href="../css/plugins/datatable/datatables11015.min.css" rel="stylesheet" />
        <script src="../js/plugins/datatable/datatables11015.min.js"></script>
        <script src="../js/language/es-DO.js"></script>
        <script src="../js/canvasjs.min.js"></script>
        <script src="../js/notify.js" type="text/javascript"></script>
        <script src="../js/notify.min.js" type="text/javascript"></script>
        <script type="text/javascript">
            function notify(MSG, tipo) {
                $.notify(MSG, tipo);
            }

        </script>
        <script type="text/javascript">
            function scrollToDiv(control) {
                document.getElementById(control).scrollIntoView();
            }
        </script>
        <style>
            #toTop {
                position: fixed;
                bottom: 10px;
                right: 10px;
                cursor: pointer;
                display: none;
            }
        </style>
        <script type="text/javascript">
            $(document).ready(function () {
                $('body').append('<div id="toTop" class="btn btn-info"><span class="glyphicon glyphicon-chevron-up"></span> Ir al Inicio</div>');
                $(window).scroll(function () {
                    if ($(this).scrollTop() != 0) {
                        $('#toTop').fadeIn();
                    } else {
                        $('#toTop').fadeOut();
                    }
                });
                $('#toTop').click(function () {
                    $("html, body").animate({ scrollTop: 0 }, 600);
                    return false;
                });
            });
        </script>

        <style>
            input[type="checkbox"] {
                font-weight: bold;
                height: 20px;
                width: 20px;
                vertical-align: middle;
            }
        </style>
        <style type="text/css">
            input:checked {
                font-weight: bold;
                height: 20px;
                width: 20px;
            }
        </style>
        <%--HISTORIO--%>
        <asp:Panel runat="server" ID="pnlConsulta">
            <div class="row-fluid">
                <div class="col-sm-12">
                    <div class="box box-color box-bordered">
                        <div class="box-title">
                            <h3>
                                <i class="icon-reorder"></i>Hoja de Puntaje WeeFIM
                                
                            </h3>
                            <div class="actions">
                                <button type="button" id="btnadd" runat="server"
                                    class="btn btn-default" data-dismiss="modal" onserverclick="_Nuevo">
                                    <i class="icon-plus-sign"></i>&nbsp Nuevo</button>
                                <button type="button" id="Button1" runat="server"
                                    class="btn btn-primary" data-dismiss="modal" onserverclick="_BackMain">
                                    <i class="icon-arrow-left"></i>&nbsp Regresar
                                </button>
                                <a href="#" class="btn btn-mini content-refresh"><i class="icon-refresh"></i></a>
                                <a href="#" class="btn btn-mini content-slideUp"><i class="icon-angle-down"></i></a>
                            </div>
                        </div>
                        <div class="box-content nopadding">
                            <div class='form-horizontal form-bordered'>
                                <div class="control-group">
                                    <div class="box-content nopadding">
                                        <table id="tbevaluacionhistorico" class="table table-bordered dataTable dataTable-noheader" data-grouping="expandable">
                                            <thead>
                                                <tr>
                                                    <th>No.
                                                    </th>
                                                    <th>Fecha
                                                    </th>
                                                    <th>Edad
                                                    </th>
                                                    <th>Evaluador
                                                    </th>
                                                    <th>Metodo Administracion
                                                    </th>
                                                    <th>Lesión:
                                                    </th>
                                                    <th>Acciones
                                                    </th>

                                                </tr>
                                            </thead>
                                            <tbody>
                                                <asp:Repeater ID="rpHistorico" runat="server">
                                                    <ItemTemplate>
                                                        <tr>
                                                            <td>
                                                                <%# Eval("Secuencia")%>
                                                            </td>
                                                            <td>
                                                                <%# Eval("ROWCDTE")%>
                                                            </td>
                                                            <td>
                                                                <%# Eval("EdadMeses")%>
                                                            </td>
                                                            <td>
                                                                <%# Eval("NOMBRE_ESPECIALISTA")%>
                                                            </td>
                                                            <td>
                                                                <%# Eval("METODOADMINISTRACION")%>
                                                            </td>
                                                            <td>
                                                                <%# Eval("LESION")%>
                                                            </td>
                                                            <%----%>
                                                            <td>
                                                                <asp:LinkButton ID="btnBuscar" CssClass="btn btn-primary" runat="server" Text="Ver"
                                                                    CommandArgument='<%# Eval("Secuencia")%>' CommandName="VerDetalle" OnClick="_VerDetalle"><i class="icon-search" >&nbsp Ver</i></asp:LinkButton>
                                                            </td>

                                                        </tr>
                                                    </ItemTemplate>
                                                </asp:Repeater>
                                            </tbody>
                                        </table>

                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </asp:Panel>

        <%-- formulario principal --%>
        <%-- DATOS PERSONALES--%>
        <asp:Panel runat="server" ID="pnlData" Visible="false">
            <div class="row-fluid">
                <div class="col-sm-12">
                    <div class="box box-color box-bordered">
                        <div class="box-title box-color">
                            <h3><i class="icon-edit"></i>Datos Personales</h3>
                            <div class="actions">
                                <button type="button" id="tbnAdd" runat="server"
                                    class="btn btn-default" data-dismiss="modal" onserverclick="_Save">
                                    <%----%>
                                    <i class="icon-plus-sign"></i>&nbsp Guardar</button>
                                <button type="button" id="btnregresar" runat="server" validationgroup="pnlEdit"
                                    class="btn btn-default" data-dismiss="modal" onserverclick="_Back">
                                    <%----%>
                                    <i class="icon-arrow-left"></i>&nbsp Regresar</button>

                            </div>
                        </div>
                        <div>
                            <div class="box-content nopadding">
                                <div class='form-horizontal form-column form-bordered'>
                                    <div class="row">
                                        <%-- DATOS PERSONALES DEL PACIENTE--%>
                                        <div class="col-sm-6">
                                            <%-- 1- Nombre del Paciente--%>
                                            <div class="control-group">
                                                <label for="lblnombrePaciente" class="control-label col-sm-2">
                                                    Nombre del Niño:</label>
                                                <div class="controls">
                                                    <input type="text" name="txtNombrePaciente" id="txtNombrePaciente" placeholder="Digite Aqui" class="form-control" disabled runat="server">
                                                </div>
                                            </div>
                                            <%-- 2- Fecha de Nacimiento--%>
                                            <div class="control-group">
                                                <label for="lblFechaNacimiento" class="control-label col-sm-2">
                                                    Fecha Nacimiento</label>
                                                <div class="controls">
                                                    <input type="text" name="txtFechanacimiento" id="txtFechanacimiento" placeholder="Digite Aqui" class="form-control" disabled runat="server">
                                                </div>
                                            </div>
                                            <%-- 3- Edad Cronologica--%>
                                            <div class="control-group">
                                                <label for="lblEdadCronologica" class="control-label col-sm-2">
                                                    Edad</label>
                                                <div class="controls">
                                                    <input type="text" name="txtEdadCronologica" id="txtEdadCronologica"
                                                        placeholder="99" runat="server" disabled>
                                                </div>
                                            </div>
                                            <%-- 4- Fecha evaluacion--%>
                                            <div class="control-group">
                                                <label for="lblfechaevaluacion" class="control-label col-sm-2">
                                                    Fecha evaluación:</label>
                                                <div class="controls">
                                                    <input type="text" name="txtfechaevaluacion" id="txtfechaevaluacion" placeholder="Digite Aqui" class="form-control" disabled runat="server">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-sm-6">
                                            <%-- 1- No. Expediente--%>
                                            <div class="control-group">
                                                <label for="lblExpedienteNo" class="control-label col-sm-6">
                                                    Expediente:  
                                                </label>
                                                <div class="controls">
                                                    <input type="text" name="txtExpedienteNo" id="txtExpedienteNo" placeholder="Digite Aqui" class="form-control" disabled runat="server">
                                                </div>
                                            </div>
                                            <%-- 2- Metodo de Administracion--%>
                                            <div class="control-group">
                                                <label for="lblMetodoAdministracion" class="control-label col-sm-6">
                                                    Metodo Administra</label>
                                                <div class="controls">
                                                    <asp:DropDownList ID="ddlMetodoAdministracion" CssClass="input-medium" runat="server">
                                                        <asp:ListItem Value="0">-- Seleccione --</asp:ListItem>
                                                        <asp:ListItem Value="1">Observación Directa</asp:ListItem>
                                                        <asp:ListItem Value="2">Entrevista con:</asp:ListItem>
                                                    </asp:DropDownList>
                                                    <%--<input type="text" name="txtEntrevistaConOtros" id="txtEntrevistaConOtros" cssclass="input-medium" runat="server">--%>
                                                    <asp:TextBox ID="txtEntrevistaConOtros" CssClass="input-xlarge" Text='<%# Eval("ENTREVISTACONOTROS")%>' runat="server" placeholder="Digite Aqui" class="form-control"></asp:TextBox>

                                                </div>
                                            </div>
                                            <%-- 3- Nombre de Evaluador--%>
                                            <div class="control-group">
                                                <label for="lblnombreevaluador" class="control-label col-sm-6">
                                                    Evaluador:</label>
                                                <div class="controls">
                                                    <input type="text" name="txtNombreEvaluador" id="txtNombreEvaluador" class="form-control" disabled runat="server">
                                                </div>
                                            </div>
                                            <%-- 4- No. evaluación--%>
                                            <div class="control-group">
                                                <label for="lblnoevaluacion" class="control-label col-sm-6">
                                                    No. Evaluacion:  
                                                </label>
                                                <div class="controls">
                                                    <input type="text" name="txtnoevaluacion" id="txtnoevaluacion" placeholder="Digite Aqui" class="form-control" runat="server" disabled>
                                                </div>
                                            </div>
                                            <%--  5. Lesion--%>
                                            <div class="control-group">
                                                <label for="lblLesion" class="control-label col-sm-6">
                                                    Lesión:</label>
                                                <div class="controls">
                                                    <asp:DropDownList ID="ddlLesion" CssClass="input-large" runat="server">
                                                        <asp:ListItem Value="0">-- Seleccione --</asp:ListItem>
                                                        <asp:ListItem Value="1">Lesion Cerebral Traumatica</asp:ListItem>
                                                        <asp:ListItem Value="2">Amputaciones Multiples</asp:ListItem>
                                                        <asp:ListItem Value="3">Quemaduras</asp:ListItem>
                                                    </asp:DropDownList>
                                                </div>
                                            </div>
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <%--DATOS DE LA HOJA DE PUNTAJE WEEFIM--%>
            <div class="row-fluid" id="pndetalleevaluacion" runat="server">
                <div class="col-sm-12">
                    <div class="box box-color box-bordered">
                        <div>
                            <div class="box-title">
                                <h3>
                                    <i class="icon-edit"></i>PUNTAJE</h3>
                                <div class="actions">

                                    <%--<a href="#" class="btn btn-mini content-refresh"><i class="icon-refresh"></i></a>--%>
                                    <a href="#" class="btn btn-mini content-slideUp"><i class="icon-angle-down"></i></a>
                                </div>
                            </div>

                            <div class='form-horizontal form-bordered'>

                                <table id="tbevaluacion" class="table table-bordered dataTable dataTable-grouping" data-page-length="100" lang="es-DO">
                                    <thead>
                                        <tr>
                                            <th>Area</th>
                                            <th>Area</th>
                                            <th>Puntuación</th>
                                            <th>Valores 
                                                <br>
                                                Normales 
                                                <br>
                                                Edad</th>
                                            <th>Razón Puntuación</th>
                                            <th>Lesión?</th>
                                            <%--<th>NT</th>--%>
                                            <th style="display: none;"></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <asp:Repeater ID="rpevaluacion" runat="server">
                                            <ItemTemplate>
                                                <td class="hidden-480"><strong><%# Eval("grupo")%></strong></td>
                                                <td class="hidden-480"><%# Eval("Area")%>.<%# Eval("Actividad")%></td>
                                                <td class="hidden-480">
                                                    <asp:TextBox ID="txtpuntuacion" CssClass="input-mini" Text='<%# Eval("PUNTUACION")%>' runat="server" placeholder="Digite Aqui" class="form-control" Style="text-align: right;"></asp:TextBox>
                                                </td>
                                                <td class="hidden-480">
                                                    <asp:TextBox ID="txtvaloresnormales" CssClass="input-mini" Text='<%# Eval("VALORESNORMALES")%>' runat="server" placeholder="Digite Aqui" class="form-control" Style="text-align: right;"></asp:TextBox>
                                                </td>
                                                <td class="hidden-480">
                                                    <asp:TextBox ID="txtRazonPuntuacion" CssClass="input-xxlarge" Text='<%# Eval("RAZONPUNTUACION")%>' runat="server" placeholder="Digite Aqui" class="form-control"></asp:TextBox>
                                                </td>
                                                <td class="hidden-480">
                                                    <asp:DropDownList ID="ddlDebidoLesion" CssClass="input-mini" runat="server" SelectedValue='<%# Eval("DEBIDOALESION")%>'>
                                                        <asp:ListItem Value=""></asp:ListItem>
                                                        <asp:ListItem Value="SI">SI</asp:ListItem>
                                                        <asp:ListItem Value="NO">NO</asp:ListItem>
                                                    </asp:DropDownList>
                                                </td>
                                                <td class="hidden-480" style="display: none;">
                                                    <asp:Label ID="lblAREA" runat="server" Text='<%# Eval("AREA")%>'></asp:Label></td>
                                                </tr>
                                            </ItemTemplate>
                                        </asp:Repeater>
                                    </tbody>
                                </table>

                            </div>

                        </div>
                    </div>
                    <div class="col-sm-12">
                        <div class="control-group">
                            <label for="lblInterpretacionesFinales">
                                INTERPRETACIONES Y RECOMENDACIONES FINALES:</label>
                            <%-- <div class="controls">--%>
                            <textarea runat="server" name="txtInterpretacionesFinales" id="txtInterpretacionesFinales" rows="2" class="input-block-level" data-rule-required="true" placeholder=""></textarea>
                            <%--</div>--%>
                        </div>
                    </div>
                </div>

            </div>
        </asp:Panel>

        <%--WEEFIM GRAFICOS--%>
        <asp:Panel runat="server" ID="PNWEEFIMGRAFICOS" Visible="false">
            <div class="row-fluid">
                <div class="col-sm-12">
                    <div class="box box-color box-bordered green">
                        <div>
                            <script type="text/javascript">
                                window.onload = function () {
                                    var Url = { grafico_FWEEFIM: "<%: ResolveUrl("~/forms/FWEEFIM.aspx/ResultadoGrafico")%>" }
                                    $.ajax({
                                        type: "POST",
                                        data: '',
                                        url: Url.grafico_FWEEFIM,
                                        contentType: "application/json; charset=iso-8859-1",
                                        dataType: "json",
                                        success: function (result) {
                                            var objResult = result.d;
                                            var data = [];

                                            //var d1 = [[0, 3], [1, 3], [2, 5], [3, 7], [4, 8], [5, 10], [6, 11], [7, 9], [8, 5], [9, 13]];
                                            var arreglo = [];
                                            var dataPoints1 = [];
                                            var dataPoints2 = [];

                                            var colorvalores = "#1653e2";
                                            var colorpuntuacion = "#C24642";
                                            for (var i = 0; i < objResult.length; i++) {
                                                data[i] = {
                                                    //label: result.d[i].Texto,
                                                    //data: result.d[i].Valor1
                                                }
                                                //var arreglo = arreglo + '{x:' + result.d[i].ValorX + ',y:' + result.d[i].Valor1 + ',indexLabel:' + result.d[i].Texto + '}';
                                                if (i < (objResult.length - 1))
                                                    //{ arreglo = arreglo + ',' }  x: result.d[i].ValorX,
                                                    dataPoints1.push({ y: parseInt(result.d[i].Valor1), label: result.d[i].Texto, color: colorpuntuacion, indexLabel: String(result.d[i].Valor1) });
                                                dataPoints2.push({ y: parseInt(result.d[i].Valor2), label: result.d[i].Texto, color: colorvalores, indexLabel: String(result.d[i].Valor2) });

                                            }

                                            //$.each(result, function (key, value) {
                                            //    dataPoints1.push({ x: result.d[i].Texto, y: parseInt(result.d[i].Valor1) });
                                            //});
                                            //alert(arreglo);

                                            var chart = new CanvasJS.Chart("chartContainer", {
                                                animationEnabled: true,
                                                showInLegend: true,
                                                title: {
                                                    text: "Grafico WeeFIM"
                                                },
                                                toolTip: {
                                                    backgroundColor: "#fcfcf9",
                                                    borderColor: "#d8d80f",
                                                    fontColor: "black"
                                                },
                                                axisX: {
                                                    valueFormatString: "####", interval: 1
                                                },
                                                axisY: [{
                                                    title: "Puntuación",
                                                    lineColor: colorpuntuacion, // #369EAD
                                                    titleFontColor: colorpuntuacion,
                                                    labelFontColor: colorpuntuacion,
                                                    interlacedColor: "#F8F1E4",
                                                    gridThickness: 1,
                                                    toolTip: colorpuntuacion
                                                },
                                                {
                                                    title: "Valores Normales",
                                                    logarithmic: true,
                                                    lineColor: colorvalores, //#C24642
                                                    titleFontColor: colorvalores,
                                                    labelFontColor: colorvalores,
                                                    interlacedColor: "#F8F1E4",
                                                    gridThickness: 1,
                                                    toolTip: colorvalores
                                                }],
                                                axisY2: [{
                                                    title: "Puntuación",
                                                    lineColor: colorpuntuacion,
                                                    titleFontColor: colorpuntuacion, //#7F6084
                                                    toolTip: colorpuntuacion,
                                                    labelFontColor: colorpuntuacion

                                                },
                                                {
                                                    title: "Valores Normales",
                                                    logarithmic: true,
                                                    interval: 1,
                                                    lineColor: colorvalores, //#86B402
                                                    titleFontColor: colorvalores,
                                                    toolTip: colorvalores,
                                                    labelFontColor: colorvalores
                                                }],
                                                data: [
                                                    {
                                                        type: "spline",
                                                        showInLegend: true,
                                                        axisYIndex: 0, //Defaults to Zero
                                                        name: "Puntuación",
                                                        lineColor: colorpuntuacion,
                                                        titleFontColor: colorpuntuacion,
                                                        labelFontColor: colorpuntuacion,
                                                        toolTip: colorpuntuacion,
                                                        color: colorpuntuacion,
                                                        xValueFormatString: "####",
                                                        dataPoints: dataPoints1
                                                    },
                                                    {
                                                        type: "spline",
                                                        showInLegend: true,
                                                        axisYType: "secondary",
                                                        axisYIndex: 0, //When axisYType is secondary, axisYIndex indexes to secondary Y axis & not to primary Y axis
                                                        name: "Valores Normales",
                                                        lineColor: colorvalores,
                                                        titleFontColor: colorvalores,
                                                        labelFontColor: colorvalores,
                                                        toolTip: colorvalores,
                                                        color: colorvalores,
                                                        xValueFormatString: "####",
                                                        dataPoints: dataPoints2
                                                    }
                                                ]
                                            });

                                            chart.render();
                                            //updateChart();
                                        }
                                    })
                                }

                            </script>
                            <script type="text/javascript" src="../js/canvasjs.min.js"></script>
                            <div id="chartContainer" style="height: 100%; width: 100%;">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </asp:Panel>
    </div>

    <%--    <script type="text/javascript">
        $(document).ready(function () {

            var Url = { grafico_FWEEFIM: "<%: ResolveUrl("~/forms/FWEEFIM.aspx/ResultadoGrafico")%>" }
            $.ajax({
                type: "POST",
                data: '',
                url: Url.grafico_FWEEFIM,
                contentType: "application/json; charset=iso-8859-1",
                dataType: "json",
                success: function (result) {
                    var objResult = result.d;
                    var data = [];

                    //var d1 = [[0, 3], [1, 3], [2, 5], [3, 7], [4, 8], [5, 10], [6, 11], [7, 9], [8, 5], [9, 13]];
                    var arreglo = [];
                    for (var i = 0; i < objResult.length; i++) {
                        data[i] = {
                            label: result.d[i].Texto,
                            data: result.d[i].Valor1

                        }
                        var arreglo = arreglo + '[' + result.d[i].Texto + ',' + result.d[i].Texto + ']';
                        if (i < (objResult.length - 1))
                        { arreglo = arreglo + ',' }
                        // alert(arreglo);
                    }

                    $.plot($("#dashboardFWEEFIM"), data,
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

        });
    </script>--%>
    <%--BUENO--%>
    <%-- <script type="text/javascript">
        window.onload = function () {
            var chart = new CanvasJS.Chart("chartContainer", {
                title: {
                    text: "Grafico WeeFIM"
                },
                axisX: {
                    valueFormatString: "####",
                    interval: 1
                },
                axisY: [{
                    title: "Puntuacion",
                    lineColor: "#369EAD",
                    titleFontColor: "#369EAD",
                    labelFontColor: "#369EAD"
                },
                {
                    title: "Valores Normales",
                    logarithmic: true,
                    lineColor: "#C24642",
                    titleFontColor: "#C24642",
                    labelFontColor: "#C24642"
                }],
                axisY2: [{
                    title: "Puntuacion",
                    lineColor: "#7F6084",
                    titleFontColor: "#7F6084",
                    labelFontColor: "#7F6084"
                },
                {
                    title: "Valores Normales",
                    logarithmic: true,
                    interval: 1,
                    lineColor: "#86B402",
                    titleFontColor: "#86B402",
                    labelFontColor: "#86B402"
                }], 
                data: [
                //{
                //    type: "column",
                //    showInLegend: true,
                //    //axisYIndex: 0, //Defaults to Zero
                //    name: "Axis Y-1",
                //    xValueFormatString: "####",
                //    dataPoints: [
                //        { x: 2006, y: 6 },
                //        { x: 2007, y: 2 },
                //        { x: 2008, y: 5 },
                //        { x: 2009, y: 7 },
                //        { x: 2010, y: 1 },
                //        { x: 2011, y: 5 },
                //        { x: 2012, y: 5 },
                //        { x: 2013, y: 2 },
                //        { x: 2014, y: 2 }
                //    ]
                //},
                {
                    type: "spline",
                    showInLegend: true,
                    axisYIndex: 1, //Defaults to Zero
                    name: "Axis Y-2",
                    xValueFormatString: "####",
                    dataPoints: [
                        { x: 2006, y: 15 },
                        { x: 2007, y: 3 },
                        { x: 2008, y: 20 },
                        { x: 2009, y: 10 },
                        { x: 2010, y: 30 },
                        { x: 2011, y: 10 },
                        { x: 2012, y: 600 },
                        { x: 2013, y: 20 },
                        { x: 2014, y: 2 }
                    ]
                },
                //{
                //    type: "column",
                //    showInLegend: true,
                //    axisYType: "secondary",
                //    //axisYIndex: 0, //Defaults to Zero
                //    name: "Axis Y2-1",
                //    xValueFormatString: "####",
                //    dataPoints: [
                //        { x: 2006, y: 12 },
                //        { x: 2007, y: 20 },
                //        { x: 2008, y: 28 },
                //        { x: 2009, y: 34 },
                //        { x: 2010, y: 24 },
                //        { x: 2011, y: 45 },
                //        { x: 2012, y: 15 },
                //        { x: 2013, y: 34 },
                //        { x: 2014, y: 22 }
                //    ]
                //},
                {
                    type: "spline",
                    showInLegend: true,
                    axisYType: "secondary",
                    axisYIndex: 1, //When axisYType is secondary, axisYIndex indexes to secondary Y axis & not to primary Y axis
                    name: "Axis Y2-2",
                    xValueFormatString: "####",
                    dataPoints: [
                        { x: 2006, y: 86 },
                        { x: 2007, y: 15 },
                        { x: 2008, y: 27 },
                        { x: 2009, y: 78 },
                        { x: 2010, y: 46 },
                        { x: 2011, y: 70 },
                        { x: 2012, y: 50 },
                        { x: 2013, y: 60 },
                        { x: 2014, y: 50 }
                    ]
                }
                ]
            });

            chart.render();
        }
    </script>--%>
</asp:Content>

