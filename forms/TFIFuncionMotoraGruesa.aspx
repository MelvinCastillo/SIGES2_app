﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true"
    CodeBehind="TFIFuncionMotoraGruesa.aspx.cs" Inherits="CAID_V2.forms.TFIFuncionMotoraGruesa" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">
    <div class="container-fluid" id="content">
        <link href="../css/bootstrap.min2.css" rel="stylesheet" />
        <link href="../css/StyleSheet1.css" rel="stylesheet" />
        <link href="../css/font-awesome.min2.css" rel="stylesheet" />
        <link href="../css/plugins/datatable/datatables11015.min.css" rel="stylesheet" />
        <script src="../js/notify.js" type="text/javascript"></script>
        <script src="../js/notify.min.js" type="text/javascript"></script>
        <script src="../js/plugins/datatable/datatables11015.min.js"></script>
        <script src="../js/language/es-DO.js"></script>

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
                                <i class="icon-reorder"></i>Medida de Funcion Motora Gruesa
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
                                                    <th>Nivel
                                                    </th>
                                                    <th>Evaluador
                                                    </th>
                                                    <th>Indicativa?
                                                    </th>
                                                    <th>Condiciones de la evaluación
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
                                                                <%# Eval("NIVELGMFCS")%>
                                                            </td>
                                                            <td>
                                                                <%# Eval("NOMBRE_ESPECIALISTA")%>
                                                            </td>
                                                            <td>
                                                                <%# Eval("EVALUACIONINDICATIVA")%>
                                                            </td>
                                                            <td>
                                                                <%# Eval("EVALUACIONINDICATIVACOMENTARIOS")%>
                                                            </td>
                                                            <%----%>
                                                            <td>
                                                                <asp:LinkButton ID="btnBuscar" CssClass="btn btn-primary" runat="server" Text="Ver"
                                                                    CommandArgument='<%# Eval("Secuencia")%>' CommandName="VerDetalle" OnClick="_VerDetalle"><i class="icon-search" >&nbsp Ver</i></asp:LinkButton>
                                                                <asp:LinkButton ID="btnresumenes" CssClass="btn btn-green" runat="server" Text="Resumenes"
                                                                    CommandArgument='<%# Eval("Secuencia")%>' CommandName="VerResumenes" OnClick="_VerDetalle"><i class="icon-search" >&nbsp Resumenes</i></asp:LinkButton>

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
                                <button type="button" id="btnverResumenes" runat="server"
                                    class="btn btn-default" data-dismiss="modal" onserverclick="_VerResumenes">
                                    <%----%>
                                    <i class="icon-dashboard"></i>&nbsp Resumenes</button>
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
                                            <%-- 2- GMFCS Nivel--%>
                                            <div class="control-group">
                                                <label for="lblnombrepadre" class="control-label col-sm-6">
                                                    GMFCS Nivel</label>
                                                <div class="controls">
                                                    <asp:DropDownList ID="ddlGMFCSNivel" CssClass="input-medium" runat="server">
                                                        <asp:ListItem Value="">-- Seleccione --</asp:ListItem>
                                                        <asp:ListItem Value="I">I</asp:ListItem>
                                                        <asp:ListItem Value="II">II</asp:ListItem>
                                                        <asp:ListItem Value="III">III</asp:ListItem>
                                                        <asp:ListItem Value="IV">IV</asp:ListItem>
                                                        <asp:ListItem Value="V">V</asp:ListItem>
                                                    </asp:DropDownList>
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
                                                    <input type="text" name="txtnoevaluacion" id="txtnoevaluacion" placeholder="Digite Aqui" class="form-control" disabled runat="server">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-sm-12">
                                            <div class="control-group">
                                                <label for="lbltxtcomentarios" class="control-label col-sm-2">
                                                    Condiciones de la evaluación</label>
                                                <div class="controls">
                                                    <textarea runat="server" name="txtCondicionEvaluacion" id="txtCondicionEvaluacion" rows="2" class="input-block-level" data-rule-required="true" placeholder="   (e.g., habitación, vestido, hora, otras personas presentes)"></textarea>
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
            <%--DATOS DE LA EVALUACION--%>
            <div class="row-fluid" id="pndetalleevaluacion" runat="server">
                <div class="col-sm-12">
                    <div class="box box-color box-bordered">
                        <div>
                            <div class="box-title">
                                <h3>
                                    <i class="icon-edit"></i>Evaluacion</h3>
                                <div class="actions">
                                    <%--<button type="submit" id="Button1" runat="server" class="btn">--%>
                                    <%--onserverclick="_Print"--%>
                                    <%-- <i class="icon-print"></i>
                                    </button>--%>
                                    <a href="#" class="btn btn-mini content-slideUp"><i class="icon-angle-down"></i>
                                    </a>
                                </div>
                            </div>
                            <%--<div class="box-content nopadding">--%>
                            <div class='form-horizontal form-bordered'>
                                <div class="col-sm-12">
                                    <h4>CLAVE PARA PUNTUACION</h4>
                                    <p>
                                        <b>0</b>= No lo inicia    <b>1</b>= Inicia          <b>2</b>= Lo completa parcialmente <b>3</b>= Lo completa  <b>9</b> (o dejado en blanco) = no evaluado (NT) [usado en la puntuación GMAE-2*] 
                                    </p>
                                    Es importante diferenciar una puntuación real de "0" (el niño no lo inicia) de un elemento que NO FUE EVALUADO (NT). 
                                </div>
                                <div class="box-content nopadding">
                                    <table id="tbevaluacion" class="table table-bordered dataTable dataTable-grouping" data-page-length="100" lang="es-DO">
                                        <thead>
                                            <tr>
                                                <th>Grupo</th>
                                                <th>Actividad</th>
                                                <th>P0</th>
                                                <th>P1</th>
                                                <th>P2</th>
                                                <th>P3</th>
                                                <th>NT</th>
                                                <th style="display: none;"></th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <asp:Repeater ID="rpevaluacion" runat="server">
                                                <ItemTemplate>
                                                    <tr>
                                                        <td class="hidden-480"><strong><%# Eval("grupo")%></strong></td>
                                                        <td class="hidden-480"><%# Eval("Actividad")%></td>
                                                        <td class="hidden-480">
                                                            <asp:CheckBox ID="ckpunto0" runat="server" Enabled="True" Checked='<%# Eval("PUNTUACION0")%>' />
                                                        </td>
                                                        <td class="hidden-480">
                                                            <asp:CheckBox ID="ckpunto1" runat="server" Enabled="True" Checked='<%# Eval("PUNTUACION1")%>' /></td>
                                                        <td class="hidden-480">
                                                            <asp:CheckBox ID="ckpunto2" runat="server" Enabled="True" Checked='<%# Eval("PUNTUACION2")%>' /></td>
                                                        <td class="hidden-480">
                                                            <asp:CheckBox ID="ckpunto3" runat="server" Enabled="True" Checked='<%# Eval("PUNTUACION3")%>' /></td>
                                                        <td class="hidden-480">
                                                            <asp:CheckBox ID="ckpuntoNT" runat="server" Enabled="True" Checked='<%# Eval("PUNTUACIONNT")%>' /></td>
                                                        <td class="hidden-480" style="display: none;">
                                                            <asp:Label ID="lblNT" runat="server" Text='<%# Eval("NT")%>'></asp:Label></td>

                                                    </tr>
                                                </ItemTemplate>
                                            </asp:Repeater>
                                        </tbody>
                                    </table>
                                    <div class="row-fluid">
                                        <div class="col-sm-6">
                                            <div class="control-group">
                                                <label for="lblEvaluacionIndicativaEjecucion">
                                                    Ha sido esta evaluacion indicativa de la ejecución "regular"del niño?:</label>
                                                <asp:DropDownList ID="ddlEvaluacionIndicativaEjecucion" CssClass="input-medium" runat="server">
                                                    <asp:ListItem Value="">-- Seleccione --</asp:ListItem>
                                                    <asp:ListItem Value="SI">SI</asp:ListItem>
                                                    <asp:ListItem Value="NO">NO</asp:ListItem>
                                                </asp:DropDownList>
                                            </div>
                                        </div>
                                        <div class="col-sm-6">
                                            <div class="control-group">
                                                <label for="lblcomentarioIndicativaEjecucion">
                                                    COMENTARIOS:</label>
                                                <%-- <div class="controls">--%>
                                                <textarea runat="server" name="txtcomentarioIndicativaEjecucion" id="txtcomentarioIndicativaEjecucion" rows="2" class="input-block-level" data-rule-required="true" placeholder=""></textarea>
                                                <%--</div>--%>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                            </div>

                        </div>
                    </div>
                </div>

            </div>
        </asp:Panel>

        <%--GMFM-88 RESUMEN DE PUNTUACION--%>
        <asp:Panel runat="server" ID="PNGMFMRESUMENES" Visible="false">
            <div class="row-fluid">
                <div class="col-sm-12">
                    <div class="box box-color box-bordered green">
                        <div>
                            <div class="box-title">
                                <h3>
                                    <i class="icon-edit"></i>GMFM-88 RESUMEN DE PUNTUACION</h3>
                            </div>
                            <%--<div class="box-content nopadding">--%>
                            <div class='form-horizontal form-bordered'>
                                <div class="box-content nopadding">

                                    <table id="tbGMFM88RESUMENES" class="table table-bordered" data-page-length="100" lang="es-DO">
                                        <thead>
                                            <tr>
                                                <th>Dimension</th>
                                                <th style="text-align: right;">Total Dimension</th>
                                                <th style="text-align: right;">Total Dimensiones</th>
                                                <th style="text-align: right;">Puntuacion</th>
                                                <th style="text-align: center;">Area Objetivo</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <asp:Repeater ID="rpGMFM88RESUMENES" runat="server">
                                                <ItemTemplate>
                                                    <tr>
                                                        <td class="hidden-480"><strong><%# Eval("Dimension")%></strong></td>
                                                        <td class="hidden-480" style="text-align: right;"><%# Eval("TotalDimension")%></td>
                                                        <td class="hidden-480" style="text-align: right;"><%# Eval("TotalDimensiones")%></td>
                                                        <td class="hidden-480" style="text-align: right;"><%# Eval("PuntuacionObjetivo")%> %</td>
                                                        <td class="hidden-xs" style="text-align: center;">
                                                            <asp:CheckBox ID="ckpuntuacion" runat="server" Enabled="True" Checked='<%# Eval("puntuacion")%>' />
                                                        </td>
                                                    </tr>
                                                </ItemTemplate>
                                            </asp:Repeater>
                                        </tbody>
                                        <tfoot>
                                            <tr>
                                                <th style="color: darkblue; font-size: large">PUNTUACION TOTAL:</th>
                                                <th style="text-align: right; font-size: large">100</th>
                                                <th style="text-align: right; font-size: large"></th>
                                                <th style="text-align: right; font-size: large"></th>
                                            </tr>
                                        </tfoot>

                                        <script type="text/javascript">
                                            var totalpuntuacionObjetivo;
                                            var table = $('#tbGMFM88RESUMENES').DataTable({
                                                'initComplete': function (settings, json) {
                                                    //Total Dimension
                                                    this.api().columns('1').every(function () {
                                                        var column = this;

                                                        var sum = column
                                                            .data()
                                                            .reduce(function (a, b) {
                                                                a = parseInt(a, 10.00);
                                                                if (isNaN(a)) { a = 0; }

                                                                b = parseInt(b, 10.00);
                                                                if (isNaN(b)) { b = 0; }

                                                                return a + b;
                                                            });

                                                        $(column.footer()).html(sum);
                                                    });

                                                    //Total Dimensiones
                                                    this.api().columns('2').every(function () {
                                                        var column = this;

                                                        var sum = column
                                                            .data()
                                                            .reduce(function (a, b) {
                                                                a = parseInt(a, 10.00);
                                                                if (isNaN(a)) { a = 0; }

                                                                b = parseInt(b, 10.00);
                                                                if (isNaN(b)) { b = 0; }

                                                                return a + b;
                                                            });

                                                        $(column.footer()).html(sum);
                                                    });

                                                    //Puntuacion Objetivo
                                                    this.api().columns('3').every(function () {
                                                        var column = this;

                                                        var sum = column
                                                            .data()
                                                            .reduce(function (a, b) {
                                                                a = parseFloat(a, 10.00);
                                                                if (isNaN(a)) { a = 0; }

                                                                b = parseFloat(b, 10.00);
                                                                if (isNaN(b)) { b = 0; }
                                                                totalpuntuacionObjetivo = a + b;
                                                                return a + b;
                                                            });

                                                        $(column.footer()).html(sum.toFixed(2));

                                                    });

                                                    //CANTIDAD DE REGISTROS
                                                    this.api().columns('0').every(function () {
                                                        var column = this;

                                                        var sum = column
                                                            .data()
                                                            .reduce(function (a, b) {
                                                                a = parseInt(a, 10);
                                                                if (isNaN(a)) { a = 1; }

                                                                b = parseInt(b, 10);
                                                                if (isNaN(b)) { b = 1; }

                                                                return a + b;
                                                            });
                                                        //alert(sum);
                                                        //alert(totalpuntuacionObjetivo.toFixed(2));
                                                        $(column.footer()).html('PUNTUACION TOTAL: ' + (totalpuntuacionObjetivo / sum).toFixed(2) + " %");
                                                        //$(column.footer()).html(parseFloat(getElementsByTagName('th')[3].innerHTML));
                                                    });

                                                }
                                            });
                                            table.destroy();
                                        </script>
                                    </table>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </asp:Panel>

        <%--EVALUACION CON ASISTENCIA/ORTESIS USANDO EL GMFM-88 --%>
        <asp:Panel runat="server" ID="pndataasistenciaortesis" Visible="false">
            <%--DATOS DE LA EVALUACION--%>
            <div class="row-fluid">
                <div class="col-sm-12">
                    <div class="box box-color box-bordered green">
                        <div>
                            <div class="box-title">
                                <h3>
                                    <i class="icon-edit"></i>GMFM-88 RESUMEN DE PUNTUACION USANDO AYUDAS/ORTESIS</h3>
                                <div class="actions">
                                    <a href="#" class="btn btn-mini content-slideUp"><i class="icon-angle-down"></i>
                                    </a>
                                </div>
                            </div>
                            <div class='form-horizontal form-bordered'>
                                <div class="box-content nopadding">
                                    <table id="tbevaluacionAsistenciaOrtesis" class="table table-bordered" data-page-length="100" lang="es-DO">
                                        <thead>
                                            <tr>
                                                <%-- <th>Grupo</th>--%>
                                                <th>Actividad</th>
                                                <%--<th style="text-align: right;">Total Dimension OCULTO</th>--%>
                                                <th style="text-align: right;">Total Dimension</th>
                                                <th style="text-align: right;">Total Dimensiones</th>
                                                <th style="text-align: right;">Puntuacion</th>
                                                <th style="width: 1%; text-align: center;">Area Objetivo</th>
                                                <th style="width: 1%; text-align: center; display: none;">Codigo</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <asp:Repeater ID="rpevaluacionAsistenciaOrtesis" runat="server">
                                                <ItemTemplate>
                                                    <tr>
                                                        <td class="hidden-480"><strong><%# Eval("DESCRIPCION")%></strong></td>
                                                        <td class="hidden-480" style="text-align: right;">
                                                            <script type="text/javascript">
                                                                var objdimension;
                                                                var objdvalor;
                                                                if (isNaN(objdimension)) { objdimension = 0; }
                                                               <%-- if (isNaN(<%# Eval("dimension")%>)) { objdvalor = 0; }
                                                                else
                                                                { objdvalor = <%# Eval("dimension")%>; }--%>

                                                                objdvalor = <%# Eval("dimension")%>; 
                                                                objdimension = objdimension + parseInt(objdvalor);
                                                                //alert(objdimension.valueOf());
                                                            </script>
                                                            <asp:TextBox ID="txtdimensionOrtesis" CssClass="input-mini" runat="server" Text='<%# Eval("dimension")%>' placeholder="Digite Aqui" class="form-control" Style="text-align: right;">></asp:TextBox>
                                                        </td>
                                                        <td class="hidden-480" style="text-align: right;">
                                                            <%# Eval("valor")%>
                                                        </td>
                                                        <td class="hidden-480" style="text-align: right;"><%# Eval("PuntuacionObjetivo")%>%</td>
                                                        <td class="hidden-xs" style="text-align: center;">
                                                            <asp:CheckBox ID="ckpuntuacion" runat="server" Enabled="True" Checked='<%# Eval("puntuacion")%>' />
                                                        </td>
                                                        <td class="hidden-480" style="display: none;">
                                                            <asp:Label ID="lblcodigo" runat="server" Text='<%# Eval("Codigo")%>'></asp:Label></td>
                                                    </tr>
                                                </ItemTemplate>
                                            </asp:Repeater>
                                        </tbody>
                                        <tfoot>
                                            <tr>
                                                <th style="color: darkblue; font-size: large">PUNTUACION TOTAL:</th>
                                                <th style="text-align: right; font-size: large"></th>
                                                <th style="text-align: right; font-size: large"></th>
                                                <th style="text-align: right; font-size: large"></th>
                                                <th style="text-align: right; font-size: large"></th>
                                            </tr>
                                        </tfoot>

                                        <script type="text/javascript">
                                                                var totalpuntuacionObjetivoOrtesis;
                                                                var tableOrtesis = $('#tbevaluacionAsistenciaOrtesis').DataTable({
                                                                    'initComplete': function (settings, json) {
                                                                        //Total Dimension 
                                                                        this.api().columns('1').every(function () {
                                                                            var column1 = this;

                                                                            //var sum1 = column1
                                                                            //    .data()
                                                                            //    .reduce(function (a, b) {
                                                                            //        a = parseInt(a, 10);
                                                                            //        if (isNaN(a)) { a = 0; }

                                                                            //        b = parseInt(b, 10);
                                                                            //        if (isNaN(b)) { b = 0; }

                                                                            //        return a + b;
                                                                            //    });
                                                                            //totaldimensiones = sum1
                                                                            //alert(objdimension.valueOf());
                                                                            if (typeof objdimension !== 'undefined') {
                                                                                $(column1.footer()).html(objdimension.valueOf());
                                                                            }
                                                                        });

                                                                        //Total Dimensiones
                                                                        this.api().columns('2').every(function () {
                                                                            var column = this;

                                                                            var sum = column
                                                                                .data()
                                                                                .reduce(function (a, b) {
                                                                                    a = parseInt(a, 10.00);
                                                                                    if (isNaN(a)) { a = 0; }

                                                                                    b = parseInt(b, 10.00);
                                                                                    if (isNaN(b)) { b = 0; }
                                                                                    totaldimensionesOrtesis = a + b;
                                                                                    return a + b;
                                                                                });

                                                                            $(column.footer()).html(sum);
                                                                            //tableOrtesis.column(2).visible(false); 
                                                                        });

                                                                        //Puntuacion Objetivo
                                                                        this.api().columns('3').every(function () {
                                                                            var column = this;

                                                                            var sum = column
                                                                                .data()
                                                                                .reduce(function (a, b) {
                                                                                    a = parseFloat(a, 10.00);
                                                                                    if (isNaN(a)) { a = 0; }

                                                                                    b = parseFloat(b, 10.00);
                                                                                    if (isNaN(b)) { b = 0; }
                                                                                    totalpuntuacionObjetivoOrtesis = a + b;

                                                                                    return a + b;
                                                                                });

                                                                            $(column.footer()).html(sum.toFixed(2));
                                                                        });

                                                                        //CANTIDAD DE REGISTROS
                                                                        this.api().columns('0').every(function () {
                                                                            var column = this;

                                                                            var sum = column
                                                                                .data()
                                                                                .reduce(function (a, b) {
                                                                                    a = parseInt(a, 10);
                                                                                    if (isNaN(a)) { a = 1; }

                                                                                    b = parseInt(b, 10);
                                                                                    if (isNaN(b)) { b = 1; }

                                                                                    return a + b;
                                                                                });
                                                                            $(column.footer()).html('PUNTUACION TOTAL: ' + (totalpuntuacionObjetivoOrtesis / sum).toFixed(2) + " %");

                                                                        });

                                                                    }
                                                                });
                                                                tableOrtesis.destroy();
                                        </script>
                                    </table>
                                </div>

                            </div>
                        </div>
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
        </asp:Panel>

        <%--GMFM-88 RESUMEN DE PUNTUACION USANDO AYUDAS/ORTESIS--%>
        <%--<asp:Panel runat="server" ID="PNGMFMAYUDASORTESIS" Visible="false">
            <div class="row-fluid">
                <div class="col-sm-12">
                    <div class="box box-color box-bordered green">
                        <div>
                            <div class="box-title">
                                <h3>
                                    <i class="icon-edit"></i>GMFM-88 RESUMEN DE PUNTUACION USANDO AYUDA/ORTESIS</h3>
                            </div> 
                            <div class='form-horizontal form-bordered'>
                                <div class="box-content nopadding">

                                    <table id="tbGMFMAYUDASORTESIS" class="table table-bordered" data-page-length="100" lang="es-DO">
                                        <thead>
                                            <tr>
                                                <th>Dimension</th>
                                                <th style="text-align: right;">Total Dimension</th>
                                                <th style="text-align: right;">Total Dimensiones</th>
                                                <th style="text-align: right;">Puntuacion Objetivo</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <asp:Repeater ID="rpGMFMAYUDASORTESIS" runat="server">
                                                <ItemTemplate>
                                                    <tr>
                                                        <td class="hidden-480"><strong><%# Eval("Dimension")%></strong></td>
                                                        <td class="hidden-480" style="text-align: right;"><%# Eval("TotalDimension")%></td>
                                                        <td class="hidden-480" style="text-align: right;"><%# Eval("TotalDimensiones")%></td>
                                                        <td class="hidden-480" style="text-align: right;"><%# Eval("PuntuacionObjetivo")%></td>
                                                    </tr>
                                                </ItemTemplate>
                                            </asp:Repeater>
                                        </tbody>
                                        <tfoot>
                                            <tr>
                                                <th style="color: darkblue; font-size: large">PUNTUACION TOTAL:</th>
                                                <th style="text-align: right; font-size: large"></th>
                                                <th style="text-align: right; font-size: large"></th>
                                                <th style="text-align: right; font-size: large"></th>
                                            </tr>
                                        </tfoot>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </asp:Panel>--%>
    </div>

</asp:Content>

