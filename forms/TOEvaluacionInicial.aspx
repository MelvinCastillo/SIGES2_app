<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true"
    CodeBehind="TOEvaluacionInicial.aspx.cs" Inherits="CAID_V2.forms.TOEvaluacionInicial" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">
    <div class="container-fluid" id="content">
        <link href="../css/bootstrap.min2.css" rel="stylesheet" />
        <link href="../css/StyleSheet1.css" rel="stylesheet" />
        <link href="../css/font-awesome.min2.css" rel="stylesheet" />
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
        <%--HISTORIO--%>
        <asp:Panel runat="server" ID="pnlConsulta">
            <div class="row-fluid">
                <div class="col-sm-12">
                    <div class="box box-color box-bordered">
                        <div class="box-title">
                            <h3>
                                <i class="icon-reorder"></i>Historico de Evaluacion Inicial                                 
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
                                                    <th>Nombre Paciente
                                                    </th>
                                                    <th>Especialista
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
                                                                <%# Eval("FECHA")%>
                                                            </td>
                                                            <td>
                                                                <%# Eval("FULLNAME")%>
                                                            </td>
                                                            <td>
                                                                <%# Eval("NOMBRE_ESPECIALISTA")%>
                                                            </td>
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
        <!-- /top-link-block -->
        <asp:Panel runat="server" ID="pnlData" Visible="false">
            <%-- DATOS PERSONALES--%>
            <div class="row">
                <div class="col-sm-12">
                    <div class="box box-color box-bordered">
                        <div class="box-title box-color">
                            <h3><i class="fa fa-list"></i>1. Datos Personales</h3>
                            <div class="actions">
                                <button type="button" id="tbnAdd" runat="server" validationgroup="pnlEdit"
                                    class="btn btn-default" data-dismiss="modal" onserverclick="_Save">
                                    <i class="icon-plus-sign"></i>&nbsp Guardar</button>
                                <button type="button" id="btnregresar" runat="server" validationgroup="pnlEdit"
                                    class="btn btn-default" data-dismiss="modal" onserverclick="_Back">
                                    <i class="icon-arrow-left"></i>&nbsp Regresar</button>

                            </div>
                        </div>
                        <div>
                            <div class="box-content nopadding">
                                <div class='form-horizontal form-column form-bordered'>
                                    <div class="row">
                                        <%--Nombre del Paciente--%>
                                        <div class="col-sm-6">
                                            <%-- 1- Nombre del Paciente--%>
                                            <div class="control-group">
                                                <label for="lblnombrePaciente" class="control-label col-sm-2">
                                                    Paciente</label>
                                                <div class="controls">
                                                    <input type="text" name="txtNombrePaciente" id="txtNombrePaciente" placeholder="Digite Aqui" class="form-control" disabled runat="server">
                                                </div>
                                            </div>

                                        </div>
                                        <%--Diagnostico--%>
                                        <div class="col-sm-6">
                                            <%-- 1-Diagnostico--%>
                                            <div class="control-group">
                                                <label for="lblDiagnosticoPaciente" class="control-label col-sm-2">
                                                    Diagnostico</label>
                                                <div class="controls">
                                                    <input type="text" name="txtDiagnosticoPaciente" id="txtDiagnosticoPaciente" placeholder="Digite Aqui" class="form-control" disabled runat="server">
                                                </div>
                                            </div>
                                        </div>

                                    </div>
                                    <div class="row">
                                        <div class="col-sm-6">
                                            <%--No. Expediente--%>
                                            <div class="control-group">
                                                <label for="lblExpedienteNo" class="control-label col-sm-2">
                                                    Expediente:  
                                                </label>
                                                <div class="controls">
                                                    <input type="text" name="txtExpedienteNo" id="txtExpedienteNo" placeholder="Digite Aqui" class="form-control" disabled runat="server">
                                                </div>
                                            </div>
                                        </div>

                                        <div class="col-sm-6">
                                            <%--Edad--%>
                                            <div class="control-group">
                                                <label for="lbledad" class="control-label col-sm-2">
                                                    Edad: 
                                                </label>
                                                <div class="controls">
                                                    <input type="text" name="txtEdad" id="txtEdad" placeholder="Digite Aqui" class="form-control" disabled runat="server">
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-sm-6">
                                            <%--1-Historia familiar relevante--%>
                                            <div class="control-group">
                                                <label for="lblHistoriafamiliarrelevante" class="control-label col-sm-2">
                                                    Historia familiar relevante</label>
                                                <div class="controls">
                                                    <textarea runat="server" name="txtHistoriafamiliarrelevante" id="txtHistoriafamiliarrelevante" rows="4" class="input-block-level" data-rule-required="true" placeholder="Digite Aqui"></textarea>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-sm-6">
                                            <%--1-Historia medica--%>
                                            <div class="control-group">
                                                <label for="lblHistoriamedica" class="control-label col-sm-2">
                                                    Historia Médica</label>
                                                <div class="controls">
                                                    <textarea runat="server" name="txtHistoriamedica" id="txtHistoriamedica" rows="4" class="input-block-level" data-rule-required="true" placeholder="Digite Aqui"></textarea>
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
            <%--Formulario NUCLEO FAMILIAR--%>
            <div class="row">
                <div class="col-sm-12">
                    <div class="box box-color box-bordered">
                        <div class="box-title box-color">
                            <h3>
                                <i class="fa fa-list"></i>1.1 Nucleo Familiar </h3>
                        </div>

                        <div class="control-group">
                            <div class="tab-pane" id="tabNucleoFam2">
                                <div class="box-content nopadding">
                                    <table class="table table-bordered dataTable-scroll-x">
                                        <thead>
                                            <tr>
                                                <th>Nombre
                                                </th>
                                                <th>Afiliación
                                                </th>
                                                <th>Parentesco
                                                </th>
                                                <th>Edad
                                                </th>
                                                <th>Genero
                                                </th>
                                                <th>Escolaridad
                                                </th>
                                                <th>Ocupación
                                                </th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <asp:Repeater ID="rpNucleoFamiliar" runat="server">
                                                <ItemTemplate>
                                                    <tr>
                                                        <td>
                                                            <%# Eval("FULLNAME")%>
                                                        </td>
                                                        <td>
                                                            <%# Eval("FILIACIONNOMBRE")%>
                                                        </td>
                                                        <td>
                                                            <%# Eval("PARENTESCO")%>
                                                        </td>
                                                        <td>
                                                            <%# Eval("EDAD")%>
                                                        </td>
                                                        <td>
                                                            <%# Eval("SEXO")%>
                                                        </td>
                                                        <td>
                                                            <%# Eval("ESCOLARIDAD")%>
                                                        </td>
                                                        <td>
                                                            <%# Eval("OCUPACION")%>
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
            <%--Hermanos--%>
            <%-- <div class="row" style="visibility:hidden">
            <div class="col-sm-12">
                <div class="box box-color box-bordered">
                    <div class="box-title box-color">
                        <h3>
                            <i class="fa fa-list"></i>1.2 Hermanos</h3>
                    </div>
                    <div class="box-content nopadding">
                        <div class="row">
                            <div class="control-group"> 
                                <div class="container-fluid">
                                    <div class="control-group" id="pnHermanosDetalles">

                                        <div class="nopadding">
                                            <table class="table table-bordered">
                                                <thead runat="server">
                                                    <tr>
                                                        <th>Nombres y Apellidos</th>
                                                        <th>Edad</th>
                                                        <th class="hidden-350">Diagnostico</th>
                                                        <th class="hidden-350">Tipo Relacion</th>
                                                        
                                                    </tr>

                                                </thead>
                                                <tbody>
                                                    <asp:Repeater ID="rpDataHermanos" runat="server">
                                                        <ItemTemplate>
                                                            <tr>
                                                                <td>
                                                                    <%# Eval("Nombre")%>
                                                                </td>
                                                                <td>
                                                                    <%# Eval("Edad")%>
                                                                </td>
                                                                <td class="hidden-350">
                                                                    <%# Eval("Diagnostico")%>
                                                                </td>
                                                                <td class="hidden-350">
                                                                    <%# Eval("TipoRelacion")%>
                                                                </td>
                                                                
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
            </div>
        </div>--%>

            <%-- 2.	Observación Neuro-muscular--%>
            <div class="row">
                <div class="col-sm-12">
                    <div class="box box-color box-bordered">
                        <div class="box-title">
                            <h3>
                                <i class="fa fa-list"></i>2. Observación Neuro-muscular</h3>
                        </div>
                        <div>
                            <div class="box-content nopadding">
                                <div class='form-group'>
                                    <div class="row-fluid">
                                        <div class="col-sm-6">
                                            <div class="control-group">
                                                <label for="lblconductaeinteraccion" class="col-sm-6">
                                                    Alineación de los segmentos corporales</label>
                                                <div class="controls">
                                                    <asp:DropDownList ID="ddlAlineaciondelossegmentoscorporales" CssClass="col-sm-4" runat="server" data-rule-required="true" SelectedValue='<%# Eval("Alineacionsegmentoscorporales")%>'>
                                                        <asp:ListItem Value="">-- Seleccione --</asp:ListItem>
                                                        <asp:ListItem Value="SI">SI</asp:ListItem>
                                                        <asp:ListItem Value="NO">NO</asp:ListItem>
                                                        <asp:ListItem Value="N/A">N/A</asp:ListItem>
                                                    </asp:DropDownList>
                                                </div>
                                            </div>
                                            <div class="control-group">
                                                <label for="Relajación de los segmentos corporales" class="col-sm-6">
                                                    Relajación de los segmentos corporales</label>
                                                <div class="controls">
                                                    <asp:DropDownList ID="ddlRelajaciondelossegmentoscorporales" CssClass="col-sm-4" runat="server" data-rule-required="true" SelectedValue='<%# Eval("Relajacionsegmentoscorporales")%>'>
                                                        <asp:ListItem Value="">-- Seleccione --</asp:ListItem>
                                                        <asp:ListItem Value="SI">SI</asp:ListItem>
                                                        <asp:ListItem Value="NO">NO</asp:ListItem>
                                                        <asp:ListItem Value="N/A">N/A</asp:ListItem>
                                                    </asp:DropDownList>
                                                </div>
                                            </div>
                                            <div class="control-group">
                                                <label for="lblDominancia" class="col-sm-6">
                                                    Dominancia</label>
                                                <div class="controls">
                                                    <script type="text/javascript">
                                                        var options = $("#MainContent_ddlDominanciaNeuroMuscular option:selected");
                                                        var values = $.map(options, function (option) {
                                                            return option.text;
                                                        });
                                                    </script>
                                                    <div class="controls">
                                                        <select id="ddlDominanciaNeuroMuscular" multiple="true" runat="server" cssclass="select2-me input-block-level" class="chosen-select form-control">
                                                            <option value="">-- Seleccione --</option>
                                                            <option value="Manual_Derecho">Manual Derecho</option>
                                                            <option value="Manual_Izquierdo">Manual Izquierdo</option>
                                                            <option value="Podal_Derecho">Podal Derecho</option>
                                                            <option value="Podal_Izquierdo">Podal Izquierdo</option>
                                                            <option value="Visual_Derecho">Visual Derecho</option>
                                                            <option value="Visual_Izquierdo">Visual Izquierdo</option>
                                                            <option value="Auditivo_Derecho">Auditivo Derecho</option>
                                                            <option value="Auditivo_Izquierdo">Auditivo Izquierdo</option>
                                                        </select>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-sm-6">
                                            <div class="control-group">
                                                <label for="Tonicidad" class="col-sm-6">
                                                    Tonicidad</label>
                                                <div class="controls">
                                                    <asp:DropDownList ID="ddlTonicidad" CssClass="col-sm-4" runat="server" data-rule-required="true" SelectedValue='<%# Eval("Tonicidad")%>'>
                                                        <asp:ListItem Value="">-- Seleccione --</asp:ListItem>
                                                        <asp:ListItem Value="Normal">Normal</asp:ListItem>
                                                        <asp:ListItem Value="Hipotonía">Hipotonía</asp:ListItem>
                                                        <asp:ListItem Value="Espasticidad">Espasticidad</asp:ListItem>
                                                        <asp:ListItem Value="Hipertonía">Hipertonía</asp:ListItem>
                                                        <asp:ListItem Value="N/A">N/A</asp:ListItem>
                                                    </asp:DropDownList>
                                                </div>
                                            </div>
                                            <%--Rango Movimiento Articular--%>
                                            <div class="control-group">
                                                <label for="lblRangoMovimientoArticular" class="col-sm-6">
                                                    Rango Movimiento Articular:  
                                                </label>
                                                <div class="controls">
                                                    <input type="text" name="txtRangoMovimientoArticular" id="txtRangoMovimientoArticular" placeholder="Digite Aqui" runat="server">
                                                </div>
                                            </div>

                                        </div>
                                        <div class="col-sm-12">
                                            <div class="control-group">
                                                <label for="ComentarioNeuroMuscular" class="control-label col-sm-2">
                                                    Observaciones</label>
                                                <div class="controls">
                                                    <textarea runat="server" name="txtComentarioNeuroMuscular" id="txtComentarioNeuroMuscular" rows="4" class="input-block-level" data-rule-required="true" placeholder="Digite Aqui"></textarea>
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

            <%--3.	Patrones Posturales--%>
            <div class="row">
                <div class="col-lg-12">
                    <div class="box box-color box-bordered">
                        <div class="box-title">
                            <h3>
                                <i class="fa fa-list"></i>3. Patrones Posturales</h3>
                        </div>
                        <div>
                            <div class="box-content nopadding">
                                <div class="form-group">
                                    <div class="row-fluid">
                                        <div class="col-lg-12">
                                            <div class="col-sm-6">
                                                <div class="control-group">
                                                    <label for="Supina flexora" class="col-sm-6">
                                                        Supina flexora</label>
                                                    <div class="controls">
                                                        <asp:DropDownList ID="ddlSupinaflexora" CssClass="col-sm-4" runat="server" data-rule-required="true" SelectedValue='<%# Eval("Supinaflexora")%>'>
                                                            <asp:ListItem Value="">-- Seleccione --</asp:ListItem>
                                                            <asp:ListItem Value="0">No lo realiza</asp:ListItem>
                                                            <asp:ListItem Value="1">Con ayuda</asp:ListItem>
                                                            <asp:ListItem Value="2">Solo con dificultad</asp:ListItem>
                                                            <asp:ListItem Value="3">Independiente</asp:ListItem>
                                                            <asp:ListItem Value="4">N/A</asp:ListItem>
                                                        </asp:DropDownList>
                                                    </div>
                                                </div>

                                                <div class="control-group">
                                                    <label for="Rolado" class="col-sm-6">
                                                        Rolado</label>
                                                    <div class="controls">
                                                        <asp:DropDownList ID="ddlRolado" CssClass="col-sm-4" runat="server" data-rule-required="true" SelectedValue='<%# Eval("Rolado")%>'>
                                                            <asp:ListItem Value="">-- Seleccione --</asp:ListItem>
                                                            <asp:ListItem Value="0">No lo realiza</asp:ListItem>
                                                            <asp:ListItem Value="1">Con ayuda</asp:ListItem>
                                                            <asp:ListItem Value="2">Solo con dificultad</asp:ListItem>
                                                            <asp:ListItem Value="3">Independiente</asp:ListItem>
                                                            <asp:ListItem Value="4">N/A</asp:ListItem>
                                                        </asp:DropDownList>
                                                    </div>
                                                </div>
                                                <div class="control-group">
                                                    <label for="Pronaextensora" class="col-sm-6">
                                                        Prona extensora</label>
                                                    <div class="controls">
                                                        <asp:DropDownList ID="ddlPronaextensora" CssClass="col-sm-4" runat="server" data-rule-required="true" SelectedValue='<%# Eval("Pronaextensora")%>'>
                                                            <asp:ListItem Value="">-- Seleccione --</asp:ListItem>
                                                            <asp:ListItem Value="0">No lo realiza</asp:ListItem>
                                                            <asp:ListItem Value="1">Con ayuda</asp:ListItem>
                                                            <asp:ListItem Value="2">Solo con dificultad</asp:ListItem>
                                                            <asp:ListItem Value="3">Independiente</asp:ListItem>
                                                            <asp:ListItem Value="4">N/A</asp:ListItem>
                                                        </asp:DropDownList>
                                                    </div>
                                                </div>
                                                <div class="control-group">
                                                    <label for="Arrastre" class="col-sm-6">
                                                        Arrastre</label>
                                                    <div class="controls">
                                                        <asp:DropDownList ID="ddlArrastre" CssClass="col-sm-4" runat="server" data-rule-required="true" SelectedValue='<%# Eval("Arrastre")%>'>
                                                            <asp:ListItem Value="">-- Seleccione --</asp:ListItem>
                                                            <asp:ListItem Value="0">No lo realiza</asp:ListItem>
                                                            <asp:ListItem Value="1">Con ayuda</asp:ListItem>
                                                            <asp:ListItem Value="2">Solo con dificultad</asp:ListItem>
                                                            <asp:ListItem Value="3">Independiente</asp:ListItem>
                                                            <asp:ListItem Value="4">N/A</asp:ListItem>
                                                        </asp:DropDownList>
                                                    </div>
                                                </div>
                                                <div class="control-group">
                                                    <label for="Supina flexora" class="col-sm-6">
                                                        4 puntos</label>
                                                    <div class="controls">
                                                        <asp:DropDownList ID="ddlCuatro4puntos" CssClass="col-sm-4" runat="server" data-rule-required="true" SelectedValue='<%# Eval("Cuatro4puntos")%>'>
                                                            <asp:ListItem Value="">-- Seleccione --</asp:ListItem>
                                                            <asp:ListItem Value="0">No lo realiza</asp:ListItem>
                                                            <asp:ListItem Value="1">Con ayuda</asp:ListItem>
                                                            <asp:ListItem Value="2">Solo con dificultad</asp:ListItem>
                                                            <asp:ListItem Value="3">Independiente</asp:ListItem>
                                                            <asp:ListItem Value="4">N/A</asp:ListItem>
                                                        </asp:DropDownList>
                                                    </div>
                                                </div>
                                                <div class="control-group">
                                                    <label for="Gateo" class="col-sm-6">
                                                        Gateo</label>
                                                    <div class="controls">
                                                        <asp:DropDownList ID="ddlGateo" CssClass="col-sm-4" runat="server" data-rule-required="true" SelectedValue='<%# Eval("Gateo")%>'>
                                                            <asp:ListItem Value="">-- Seleccione --</asp:ListItem>
                                                            <asp:ListItem Value="0">No lo realiza</asp:ListItem>
                                                            <asp:ListItem Value="1">Con ayuda</asp:ListItem>
                                                            <asp:ListItem Value="2">Solo con dificultad</asp:ListItem>
                                                            <asp:ListItem Value="3">Independiente</asp:ListItem>
                                                            <asp:ListItem Value="4">N/A</asp:ListItem>
                                                        </asp:DropDownList>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-sm-6">
                                                <div class="control-group">
                                                    <label for="Supina flexora" class="col-sm-6">
                                                        Caminar</label>
                                                    <div class="controls">
                                                        <asp:DropDownList ID="ddlCaminar" CssClass="col-sm-4" runat="server" data-rule-required="true" SelectedValue='<%# Eval("Caminar")%>'>
                                                            <asp:ListItem Value="">-- Seleccione --</asp:ListItem>
                                                            <asp:ListItem Value="0">No lo realiza</asp:ListItem>
                                                            <asp:ListItem Value="1">Con ayuda</asp:ListItem>
                                                            <asp:ListItem Value="2">Solo con dificultad</asp:ListItem>
                                                            <asp:ListItem Value="3">Independiente</asp:ListItem>
                                                            <asp:ListItem Value="4">N/A</asp:ListItem>
                                                        </asp:DropDownList>
                                                    </div>
                                                </div>

                                                <div class="control-group">
                                                    <label for="Subir y  bajar Escaleras" class="col-sm-6">
                                                        Subir y bajar escaleras</label>
                                                    <div class="controls">
                                                        <asp:DropDownList ID="ddlSubirbajarescaleras" CssClass="col-sm-4" runat="server" data-rule-required="true" SelectedValue='<%# Eval("Subirbajarescaleras")%>'>
                                                            <asp:ListItem Value="">-- Seleccione --</asp:ListItem>
                                                            <asp:ListItem Value="0">No lo realiza</asp:ListItem>
                                                            <asp:ListItem Value="1">Con ayuda</asp:ListItem>
                                                            <asp:ListItem Value="2">Solo con dificultad</asp:ListItem>
                                                            <asp:ListItem Value="3">Independiente</asp:ListItem>
                                                            <asp:ListItem Value="4">N/A</asp:ListItem>
                                                        </asp:DropDownList>
                                                    </div>
                                                </div>


                                                <div class="control-group">
                                                    <label for="Saltar" class="col-sm-6">
                                                        Saltar</label>
                                                    <div class="controls">
                                                        <asp:DropDownList ID="ddlSaltar" CssClass="col-sm-4" runat="server" data-rule-required="true" SelectedValue='<%# Eval("Saltar")%>'>
                                                            <asp:ListItem Value="">-- Seleccione --</asp:ListItem>
                                                            <asp:ListItem Value="0">No lo realiza</asp:ListItem>
                                                            <asp:ListItem Value="1">Con ayuda</asp:ListItem>
                                                            <asp:ListItem Value="2">Solo con dificultad</asp:ListItem>
                                                            <asp:ListItem Value="3">Independiente</asp:ListItem>
                                                            <asp:ListItem Value="4">N/A</asp:ListItem>
                                                        </asp:DropDownList>
                                                    </div>
                                                </div>

                                                <div class="control-group">
                                                    <label for="Integracionmotora" class="col-sm-6">
                                                        Integración motora</label>
                                                    <div class="controls">
                                                        <asp:DropDownList ID="ddlIntegracionmotora" CssClass="col-sm-4" runat="server" data-rule-required="true" SelectedValue='<%# Eval("Integracionmotora")%>'>
                                                            <asp:ListItem Value="">-- Seleccione --</asp:ListItem>
                                                            <asp:ListItem Value="0">No lo realiza</asp:ListItem>
                                                            <asp:ListItem Value="1">Con ayuda</asp:ListItem>
                                                            <asp:ListItem Value="2">Solo con dificultad</asp:ListItem>
                                                            <asp:ListItem Value="3">Independiente</asp:ListItem>
                                                            <asp:ListItem Value="4">N/A</asp:ListItem>
                                                        </asp:DropDownList>
                                                    </div>
                                                </div>

                                                <div class="control-group">
                                                    <label for="Reacción de enderezamiento y equilibrio" class="col-sm-6">
                                                        Reacción de enderezamiento y equilibrio
                                                    </label>
                                                    <div class="controls">
                                                        <asp:DropDownList ID="ddlReaccionenderezamientoequilibrio" CssClass="col-sm-4" runat="server" data-rule-required="true" SelectedValue='<%# Eval("Reaccionenderezamientoequilibrio")%>'>
                                                            <asp:ListItem Value="">-- Seleccione --</asp:ListItem>
                                                            <asp:ListItem Value="0">No lo realiza</asp:ListItem>
                                                            <asp:ListItem Value="1">Con ayuda</asp:ListItem>
                                                            <asp:ListItem Value="2">Solo con dificultad</asp:ListItem>
                                                            <asp:ListItem Value="3">Independiente</asp:ListItem>
                                                            <asp:ListItem Value="4">N/A</asp:ListItem>
                                                        </asp:DropDownList>
                                                    </div>
                                                </div>

                                                <div class="control-group">
                                                    <label for="Posiciondecaballero" class="col-sm-6">
                                                        Posición de caballero</label>
                                                    <div class="controls">
                                                        <asp:DropDownList ID="ddlPosiciondecaballero" CssClass="col-sm-4" runat="server" data-rule-required="true" SelectedValue='<%# Eval("Posiciondecaballero")%>'>
                                                            <asp:ListItem Value="">-- Seleccione --</asp:ListItem>
                                                            <asp:ListItem Value="0">No lo realiza</asp:ListItem>
                                                            <asp:ListItem Value="1">Con ayuda</asp:ListItem>
                                                            <asp:ListItem Value="2">Solo con dificultad</asp:ListItem>
                                                            <asp:ListItem Value="3">Independiente</asp:ListItem>
                                                            <asp:ListItem Value="4">N/A</asp:ListItem>
                                                        </asp:DropDownList>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-sm-12">
                                                <div class="control-group">
                                                    <label for="Comentariopatronesposturales" class="control-label col-sm-2">
                                                        Observaciones</label>
                                                    <div class="controls">
                                                        <textarea runat="server" name="txtComentariopatronesposturales" id="txtComentariopatronesposturales" rows="4" class="input-block-level" data-rule-required="true" placeholder="Digite Aqui"></textarea>
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
            </div>
            <%--4.	Movimientos Oculares --%>
            <div class="row">
                <div class="col-sm-12">
                    <div class="box box-color box-bordered">
                        <div class="box-title">
                            <h3>
                                <i class="fa fa-list"></i>4. Movimientos Oculares</h3>
                        </div>
                        <div>
                            <div class="box-content nopadding">
                                <div class='form-group'>
                                    <div class="row-fluid">
                                        <div class="col-sm-6">
                                            <div class="control-group">
                                                <label for="Cruce de línea media" class="col-sm-6">
                                                    Fijacion y Contacto Visual</label>
                                                <div class="controls">
                                                    <asp:DropDownList ID="ddlCrucelineamedia" CssClass="col-sm-4" runat="server" data-rule-required="true" SelectedValue='<%# Eval("Crucelineamedia")%>'>
                                                        <asp:ListItem Value="">-- Seleccione --</asp:ListItem>
                                                        <asp:ListItem Value="SI">SI</asp:ListItem>
                                                        <asp:ListItem Value="NO ">NO</asp:ListItem>
                                                        <asp:ListItem Value="N/A">N/A</asp:ListItem>
                                                    </asp:DropDownList>
                                                </div>
                                            </div>
                                            <div class="control-group">
                                                <label for="Seguimiento ocular Derecho" class="col-sm-6">
                                                    Seguimiento ocular Derecho</label>
                                                <div class="controls">
                                                    <asp:DropDownList ID="ddlSeguimientoocularDerecho" CssClass="col-sm-4" runat="server" data-rule-required="true" SelectedValue='<%# Eval("Seguimientoocular")%>'>
                                                        <asp:ListItem Value="">-- Seleccione --</asp:ListItem>
                                                        <asp:ListItem Value="SI">SI</asp:ListItem>
                                                        <asp:ListItem Value="NO">NO</asp:ListItem>
                                                        <asp:ListItem Value="N/A">N/A</asp:ListItem>
                                                    </asp:DropDownList>
                                                </div>
                                            </div>
                                            <div class="control-group">
                                                <label for="Seguimiento ocular Izquierdo" class="col-sm-6">
                                                    Seguimiento ocular Izquierdo</label>
                                                <div class="controls">
                                                    <asp:DropDownList ID="ddlSeguimientoocularIzquierdo" CssClass="col-sm-4" runat="server" data-rule-required="true" SelectedValue='<%# Eval("Seguimientoocular")%>'>
                                                        <asp:ListItem Value="">-- Seleccione --</asp:ListItem>
                                                        <asp:ListItem Value="SI">SI</asp:ListItem>
                                                        <asp:ListItem Value="NO">NO</asp:ListItem>
                                                        <asp:ListItem Value="N/A">N/A</asp:ListItem>
                                                    </asp:DropDownList>
                                                </div>
                                            </div>

                                        </div>
                                        <div class="col-sm-6">
                                            <div class="control-group">
                                                <label for="ddlSeguimientoocularArriba" class="col-sm-6">
                                                    Seguimiento ocular Arriba</label>
                                                <div class="controls">
                                                    <asp:DropDownList ID="ddlSeguimientoocularArriba" CssClass="col-sm-4" runat="server" data-rule-required="true" SelectedValue='<%# Eval("Convergencia")%>'>
                                                        <asp:ListItem Value="">-- Seleccione --</asp:ListItem>
                                                        <asp:ListItem Value="SI">SI</asp:ListItem>
                                                        <asp:ListItem Value="NO">NO</asp:ListItem>
                                                        <asp:ListItem Value="N/A">N/A</asp:ListItem>
                                                    </asp:DropDownList>
                                                </div>
                                            </div>
                                            <div class="control-group">
                                                <label for="ddlSeguimientoocularAbajo" class="col-sm-6">
                                                    Seguimiento ocular Abajo</label>
                                                <div class="controls">
                                                    <asp:DropDownList ID="ddlSeguimientoocularAbajo" CssClass="col-sm-4" runat="server" data-rule-required="true" SelectedValue='<%# Eval("Convergencia")%>'>
                                                        <asp:ListItem Value="">-- Seleccione --</asp:ListItem>
                                                        <asp:ListItem Value="SI">SI</asp:ListItem>
                                                        <asp:ListItem Value="NO">NO</asp:ListItem>
                                                        <asp:ListItem Value="N/A">N/A</asp:ListItem>
                                                    </asp:DropDownList>
                                                </div>
                                            </div>
                                            <div class="control-group">
                                                <label for="Circular" class="col-sm-6">
                                                    Circular
                                                </label>
                                                <div class="controls">
                                                    <asp:DropDownList ID="ddlCircular" CssClass="col-sm-4" runat="server" data-rule-required="true" SelectedValue='<%# Eval("Focalizacion")%>'>
                                                        <asp:ListItem Value="">-- Seleccione --</asp:ListItem>
                                                        <asp:ListItem Value="Derecho">SI</asp:ListItem>
                                                        <asp:ListItem Value="Izquierdo ">NO</asp:ListItem>
                                                        <asp:ListItem Value="N/A">N/A</asp:ListItem>
                                                    </asp:DropDownList>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-sm-12">
                                            <div class="control-group">
                                                <label for="MovimientosOcularesObservacion" class="control-label col-sm-2">
                                                    Observaciones</label>
                                                <div class="controls">
                                                    <textarea runat="server" name="txtMovimientosOcularesObservacion" id="txtMovimientosOcularesObservacion" rows="4" class="input-block-level" data-rule-required="true" placeholder="Digite Aqui"></textarea>
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

            <%--5. Actividades diarias básica--%>
            <div class="row">
                <div class="col-lg-12">
                    <div class="box box-color box-bordered">
                        <div class="box-title">
                            <h3>
                                <i class="fa fa-list"></i>5. Actividades diarias básica</h3>
                        </div>
                        <div>
                            <div class="box-content nopadding">
                                <div class="form-group">
                                    <div class="row-fluid">
                                        <div class="col-lg-12">
                                            <div class="col-sm-6">
                                                <div class="control-group">
                                                    <label for="Come con los dedos" class="col-sm-6">
                                                        Come con los dedos</label>
                                                    <div class="controls">
                                                        <asp:DropDownList ID="ddlComeconlosdedos" CssClass="col-sm-4" runat="server" data-rule-required="true" SelectedValue='<%# Eval("Comeconlosdedos")%>'>
                                                            <asp:ListItem Value="">-- Seleccione --</asp:ListItem>
                                                            <asp:ListItem Value="0">No lo realiza</asp:ListItem>
                                                            <asp:ListItem Value="1">Con ayuda</asp:ListItem>
                                                            <asp:ListItem Value="2">Solo con dificultad</asp:ListItem>
                                                            <asp:ListItem Value="3">Independiente</asp:ListItem>
                                                            <asp:ListItem Value="4">N/A</asp:ListItem>
                                                        </asp:DropDownList>
                                                    </div>
                                                </div>

                                                <div class="control-group">
                                                    <label for="Puede usar tenedor" class="col-sm-6">
                                                        Puede usar tenedor</label>
                                                    <div class="controls">
                                                        <asp:DropDownList ID="ddlPuedeusartenedor" CssClass="col-sm-4" runat="server" data-rule-required="true" SelectedValue='<%# Eval("ddlPuedeusartenedor")%>'>
                                                            <asp:ListItem Value="">-- Seleccione --</asp:ListItem>
                                                            <asp:ListItem Value="0">No lo realiza</asp:ListItem>
                                                            <asp:ListItem Value="1">Con ayuda</asp:ListItem>
                                                            <asp:ListItem Value="2">Solo con dificultad</asp:ListItem>
                                                            <asp:ListItem Value="3">Independiente</asp:ListItem>
                                                            <asp:ListItem Value="4">N/A</asp:ListItem>
                                                        </asp:DropDownList>
                                                    </div>
                                                </div>
                                                <div class="control-group">
                                                    <label for="Puedeusarcuchara" class="col-sm-6">
                                                        Puede usar cuchara</label>
                                                    <div class="controls">
                                                        <asp:DropDownList ID="ddlPuedeusarcuchara" CssClass="col-sm-4" runat="server" data-rule-required="true" SelectedValue='<%# Eval("ddlPuedeusarcuchara")%>'>
                                                            <asp:ListItem Value="">-- Seleccione --</asp:ListItem>
                                                            <asp:ListItem Value="0">No lo realiza</asp:ListItem>
                                                            <asp:ListItem Value="1">Con ayuda</asp:ListItem>
                                                            <asp:ListItem Value="2">Solo con dificultad</asp:ListItem>
                                                            <asp:ListItem Value="3">Independiente</asp:ListItem>
                                                            <asp:ListItem Value="4">N/A</asp:ListItem>
                                                        </asp:DropDownList>
                                                    </div>
                                                </div>
                                                <div class="control-group">
                                                    <label for="Puede usar cuchillo" class="col-sm-6">
                                                        Puede usar cuchillo</label>
                                                    <div class="controls">
                                                        <asp:DropDownList ID="ddlPuedeusarcuchillo" CssClass="col-sm-4" runat="server" data-rule-required="true" SelectedValue='<%# Eval("Puedeusarcuchillo")%>'>
                                                            <asp:ListItem Value="">-- Seleccione --</asp:ListItem>
                                                            <asp:ListItem Value="0">No lo realiza</asp:ListItem>
                                                            <asp:ListItem Value="1">Con ayuda</asp:ListItem>
                                                            <asp:ListItem Value="2">Solo con dificultad</asp:ListItem>
                                                            <asp:ListItem Value="3">Independiente</asp:ListItem>
                                                            <asp:ListItem Value="4">N/A</asp:ListItem>
                                                        </asp:DropDownList>
                                                    </div>
                                                </div>
                                                <div class="control-group">
                                                    <label for="Bebe de un vaso" class="col-sm-6">
                                                        Bebe de un vaso</label>
                                                    <div class="controls">
                                                        <asp:DropDownList ID="ddlBebedeunvaso" CssClass="col-sm-4" runat="server" data-rule-required="true" SelectedValue='<%# Eval("Bebedeunvaso")%>'>
                                                            <asp:ListItem Value="">-- Seleccione --</asp:ListItem>
                                                            <asp:ListItem Value="0">No lo realiza</asp:ListItem>
                                                            <asp:ListItem Value="1">Con ayuda</asp:ListItem>
                                                            <asp:ListItem Value="2">Solo con dificultad</asp:ListItem>
                                                            <asp:ListItem Value="3">Independiente</asp:ListItem>
                                                            <asp:ListItem Value="4">N/A</asp:ListItem>
                                                        </asp:DropDownList>
                                                    </div>
                                                </div>
                                                <div class="control-group">
                                                    <label for="Se quita camiseta" class="col-sm-6">
                                                        Se quita camiseta</label>
                                                    <div class="controls">
                                                        <asp:DropDownList ID="ddlSequitacamiseta" CssClass="col-sm-4" runat="server" data-rule-required="true" SelectedValue='<%# Eval("Sequitacamiseta")%>'>
                                                            <asp:ListItem Value="">-- Seleccione --</asp:ListItem>
                                                            <asp:ListItem Value="0">No lo realiza</asp:ListItem>
                                                            <asp:ListItem Value="1">Con ayuda</asp:ListItem>
                                                            <asp:ListItem Value="2">Solo con dificultad</asp:ListItem>
                                                            <asp:ListItem Value="3">Independiente</asp:ListItem>
                                                            <asp:ListItem Value="4">N/A</asp:ListItem>
                                                        </asp:DropDownList>
                                                    </div>
                                                </div>
                                                <div class="control-group">
                                                    <label for="Se pone suéter" class="col-sm-6">
                                                        Se pone suéter</label>
                                                    <div class="controls">
                                                        <asp:DropDownList ID="ddlSeponesueter" CssClass="col-sm-4" runat="server" data-rule-required="true" SelectedValue='<%# Eval("Seponesueter")%>'>
                                                            <asp:ListItem Value="">-- Seleccione --</asp:ListItem>
                                                            <asp:ListItem Value="0">No lo realiza</asp:ListItem>
                                                            <asp:ListItem Value="1">Con ayuda</asp:ListItem>
                                                            <asp:ListItem Value="2">Solo con dificultad</asp:ListItem>
                                                            <asp:ListItem Value="3">Independiente</asp:ListItem>
                                                            <asp:ListItem Value="4">N/A</asp:ListItem>
                                                        </asp:DropDownList>
                                                    </div>
                                                </div>
                                                <div class="control-group">
                                                    <label for="Se quita suéter" class="col-sm-6">
                                                        Se quita suéter</label>
                                                    <div class="controls">
                                                        <asp:DropDownList ID="ddlSequitasueter" CssClass="col-sm-4" runat="server" data-rule-required="true" SelectedValue='<%# Eval("Sequitasueter")%>'>
                                                            <asp:ListItem Value="">-- Seleccione --</asp:ListItem>
                                                            <asp:ListItem Value="0">No lo realiza</asp:ListItem>
                                                            <asp:ListItem Value="1">Con ayuda</asp:ListItem>
                                                            <asp:ListItem Value="2">Solo con dificultad</asp:ListItem>
                                                            <asp:ListItem Value="3">Independiente</asp:ListItem>
                                                            <asp:ListItem Value="4">N/A</asp:ListItem>
                                                        </asp:DropDownList>
                                                    </div>
                                                </div>
                                                <div class="control-group">
                                                    <label for="Se pone pantalones" class="col-sm-6">
                                                        Se pone pantalones</label>
                                                    <div class="controls">
                                                        <asp:DropDownList ID="ddlSeponepantalones" CssClass="col-sm-4" runat="server" data-rule-required="true" SelectedValue='<%# Eval("Seponepantalones")%>'>
                                                            <asp:ListItem Value="">-- Seleccione --</asp:ListItem>
                                                            <asp:ListItem Value="0">No lo realiza</asp:ListItem>
                                                            <asp:ListItem Value="1">Con ayuda</asp:ListItem>
                                                            <asp:ListItem Value="2">Solo con dificultad</asp:ListItem>
                                                            <asp:ListItem Value="3">Independiente</asp:ListItem>
                                                            <asp:ListItem Value="4">N/A</asp:ListItem>
                                                        </asp:DropDownList>
                                                    </div>
                                                </div>
                                                <div class="control-group">
                                                    <label for="Se quita pantalones" class="col-sm-6">
                                                        Se quita pantalones</label>
                                                    <div class="controls">
                                                        <asp:DropDownList ID="ddlSequitapantalones" CssClass="col-sm-4" runat="server" data-rule-required="true" SelectedValue='<%# Eval("Sequitapantalones")%>'>
                                                            <asp:ListItem Value="">-- Seleccione --</asp:ListItem>
                                                            <asp:ListItem Value="0">No lo realiza</asp:ListItem>
                                                            <asp:ListItem Value="1">Con ayuda</asp:ListItem>
                                                            <asp:ListItem Value="2">Solo con dificultad</asp:ListItem>
                                                            <asp:ListItem Value="3">Independiente</asp:ListItem>
                                                            <asp:ListItem Value="4">N/A</asp:ListItem>
                                                        </asp:DropDownList>
                                                    </div>
                                                </div>
                                                <div class="control-group">
                                                    <label for="Gorra" class="col-sm-6">
                                                        Gorra</label>
                                                    <div class="controls">
                                                        <asp:DropDownList ID="ddlGorra" CssClass="col-sm-4" runat="server" data-rule-required="true" SelectedValue='<%# Eval("Gorra")%>'>
                                                            <asp:ListItem Value="">-- Seleccione --</asp:ListItem>
                                                            <asp:ListItem Value="0">No lo realiza</asp:ListItem>
                                                            <asp:ListItem Value="1">Con ayuda</asp:ListItem>
                                                            <asp:ListItem Value="2">Solo con dificultad</asp:ListItem>
                                                            <asp:ListItem Value="3">Independiente</asp:ListItem>
                                                            <asp:ListItem Value="4">N/A</asp:ListItem>
                                                        </asp:DropDownList>
                                                    </div>
                                                </div>
                                                <div class="control-group">
                                                    <label for="Pantaloncillos Panti" class="col-sm-6">
                                                        Pantaloncillos/ Panti</label>
                                                    <div class="controls">
                                                        <asp:DropDownList ID="ddlPantaloncillosPanti" CssClass="col-sm-4" runat="server" data-rule-required="true" SelectedValue='<%# Eval("PantaloncillosPanti")%>'>
                                                            <asp:ListItem Value="">-- Seleccione --</asp:ListItem>
                                                            <asp:ListItem Value="0">No lo realiza</asp:ListItem>
                                                            <asp:ListItem Value="1">Con ayuda</asp:ListItem>
                                                            <asp:ListItem Value="2">Solo con dificultad</asp:ListItem>
                                                            <asp:ListItem Value="3">Independiente</asp:ListItem>
                                                            <asp:ListItem Value="4">N/A</asp:ListItem>
                                                        </asp:DropDownList>
                                                    </div>
                                                </div>
                                                <div class="control-group">
                                                    <label for="Medias" class="col-sm-6">
                                                        Medias</label>
                                                    <div class="controls">
                                                        <asp:DropDownList ID="ddlMedias" CssClass="col-sm-4" runat="server" data-rule-required="true" SelectedValue='<%# Eval("Medias")%>'>
                                                            <asp:ListItem Value="">-- Seleccione --</asp:ListItem>
                                                            <asp:ListItem Value="0">No lo realiza</asp:ListItem>
                                                            <asp:ListItem Value="1">Con ayuda</asp:ListItem>
                                                            <asp:ListItem Value="2">Solo con dificultad</asp:ListItem>
                                                            <asp:ListItem Value="3">Independiente</asp:ListItem>
                                                            <asp:ListItem Value="4">N/A</asp:ListItem>
                                                        </asp:DropDownList>
                                                    </div>
                                                </div>
                                                <div class="control-group">
                                                    <label for="Botones, zipper" class="col-sm-6">
                                                        Botones, zipper</label>
                                                    <div class="controls">
                                                        <asp:DropDownList ID="ddlBotoneszipper" CssClass="col-sm-4" runat="server" data-rule-required="true" SelectedValue='<%# Eval("Botoneszipper")%>'>
                                                            <asp:ListItem Value="">-- Seleccione --</asp:ListItem>
                                                            <asp:ListItem Value="0">No lo realiza</asp:ListItem>
                                                            <asp:ListItem Value="1">Con ayuda</asp:ListItem>
                                                            <asp:ListItem Value="2">Solo con dificultad</asp:ListItem>
                                                            <asp:ListItem Value="3">Independiente</asp:ListItem>
                                                            <asp:ListItem Value="4">N/A</asp:ListItem>
                                                        </asp:DropDownList>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-sm-6">
                                                <div class="control-group">
                                                    <label for="Se ata los cordones" class="col-sm-6">
                                                        Se ata los cordones</label>
                                                    <div class="controls">
                                                        <asp:DropDownList ID="ddlSeataloscordones" CssClass="col-sm-4" runat="server" data-rule-required="true" SelectedValue='<%# Eval("Seataloscordones")%>'>
                                                            <asp:ListItem Value="">-- Seleccione --</asp:ListItem>
                                                            <asp:ListItem Value="0">No lo realiza</asp:ListItem>
                                                            <asp:ListItem Value="1">Con ayuda</asp:ListItem>
                                                            <asp:ListItem Value="2">Solo con dificultad</asp:ListItem>
                                                            <asp:ListItem Value="3">Independiente</asp:ListItem>
                                                            <asp:ListItem Value="4">N/A</asp:ListItem>
                                                        </asp:DropDownList>
                                                    </div>
                                                </div>

                                                <div class="control-group">
                                                    <label for="Se pone  y quita el cinturón" class="col-sm-6">
                                                        Se pone  y quita el cinturón</label>
                                                    <div class="controls">
                                                        <asp:DropDownList ID="ddlSeponeyquitaelcinturon" CssClass="col-sm-4" runat="server" data-rule-required="true" SelectedValue='<%# Eval("Seponeyquitaelcinturon")%>'>
                                                            <asp:ListItem Value="">-- Seleccione --</asp:ListItem>
                                                            <asp:ListItem Value="0">No lo realiza</asp:ListItem>
                                                            <asp:ListItem Value="1">Con ayuda</asp:ListItem>
                                                            <asp:ListItem Value="2">Solo con dificultad</asp:ListItem>
                                                            <asp:ListItem Value="3">Independiente</asp:ListItem>
                                                            <asp:ListItem Value="4">N/A</asp:ListItem>
                                                        </asp:DropDownList>
                                                    </div>
                                                </div>


                                                <div class="control-group">
                                                    <label for="Se pone los zapatos" class="col-sm-6">
                                                        Se pone los zapatos</label>
                                                    <div class="controls">
                                                        <asp:DropDownList ID="ddlSeponeloszapatos" CssClass="col-sm-4" runat="server" data-rule-required="true" SelectedValue='<%# Eval("Usarelojdemano")%>'>
                                                            <asp:ListItem Value="">-- Seleccione --</asp:ListItem>
                                                            <asp:ListItem Value="0">No lo realiza</asp:ListItem>
                                                            <asp:ListItem Value="1">Con ayuda</asp:ListItem>
                                                            <asp:ListItem Value="2">Solo con dificultad</asp:ListItem>
                                                            <asp:ListItem Value="3">Independiente</asp:ListItem>
                                                            <asp:ListItem Value="4">N/A</asp:ListItem>
                                                        </asp:DropDownList>
                                                    </div>
                                                </div>

                                                <div class="control-group">
                                                    <label for="Se coloca sobre el inodoro" class="col-sm-6">
                                                        Se coloca sobre el inodoro</label>
                                                    <div class="controls">
                                                        <asp:DropDownList ID="ddlSecolocasobreelinodoro" CssClass="col-sm-4" runat="server" data-rule-required="true" SelectedValue='<%# Eval("ddlSecolocasobreelinodoro")%>'>
                                                            <asp:ListItem Value="">-- Seleccione --</asp:ListItem>
                                                            <asp:ListItem Value="0">No lo realiza</asp:ListItem>
                                                            <asp:ListItem Value="1">Con ayuda</asp:ListItem>
                                                            <asp:ListItem Value="2">Solo con dificultad</asp:ListItem>
                                                            <asp:ListItem Value="3">Independiente</asp:ListItem>
                                                            <asp:ListItem Value="4">N/A</asp:ListItem>
                                                        </asp:DropDownList>
                                                    </div>
                                                </div>

                                                <div class="control-group">
                                                    <label for="Utiliza el papel higiénico" class="col-sm-6">
                                                        Utiliza el papel higiénico
                                                    </label>
                                                    <div class="controls">
                                                        <asp:DropDownList ID="ddlUtilizaelpapelhigienico" CssClass="col-sm-4" runat="server" data-rule-required="true" SelectedValue='<%# Eval("Utilizaelpapelhigienico")%>'>
                                                            <asp:ListItem Value="">-- Seleccione --</asp:ListItem>
                                                            <asp:ListItem Value="0">No lo realiza</asp:ListItem>
                                                            <asp:ListItem Value="1">Con ayuda</asp:ListItem>
                                                            <asp:ListItem Value="2">Solo con dificultad</asp:ListItem>
                                                            <asp:ListItem Value="3">Independiente</asp:ListItem>
                                                            <asp:ListItem Value="4">N/A</asp:ListItem>
                                                        </asp:DropDownList>
                                                    </div>
                                                </div>

                                                <div class="control-group">
                                                    <label for="Descarga el inodoro" class="col-sm-6">
                                                        Descarga el inodoro</label>
                                                    <div class="controls">
                                                        <asp:DropDownList ID="ddlDescargaelinodoro" CssClass="col-sm-4" runat="server" data-rule-required="true" SelectedValue='<%# Eval("Descargaelinodoro")%>'>
                                                            <asp:ListItem Value="">-- Seleccione --</asp:ListItem>
                                                            <asp:ListItem Value="0">No lo realiza</asp:ListItem>
                                                            <asp:ListItem Value="1">Con ayuda</asp:ListItem>
                                                            <asp:ListItem Value="2">Solo con dificultad</asp:ListItem>
                                                            <asp:ListItem Value="3">Independiente</asp:ListItem>
                                                            <asp:ListItem Value="4">N/A</asp:ListItem>
                                                        </asp:DropDownList>
                                                    </div>
                                                </div>
                                                <div class="control-group">
                                                    <label for="Utiliza ayudas técnicas" class="col-sm-6">
                                                        Utiliza ayudas técnicas</label>
                                                    <div class="controls">
                                                        <asp:DropDownList ID="ddlUtilizaayudastecnicas" CssClass="col-sm-4" runat="server" data-rule-required="true" SelectedValue='<%# Eval("Utilizaayudastecnicas")%>'>
                                                            <asp:ListItem Value="">-- Seleccione --</asp:ListItem>
                                                            <asp:ListItem Value="0">No lo realiza</asp:ListItem>
                                                            <asp:ListItem Value="1">Con ayuda</asp:ListItem>
                                                            <asp:ListItem Value="2">Solo con dificultad</asp:ListItem>
                                                            <asp:ListItem Value="3">Independiente</asp:ListItem>
                                                            <asp:ListItem Value="4">N/A</asp:ListItem>
                                                        </asp:DropDownList>
                                                    </div>
                                                </div>
                                                <%-- <div class="control-group">
                                                    <label for="Sube y baja escaleras" class="col-sm-6">
                                                        Sube y baja escaleras</label>
                                                    <div class="controls">
                                                        <asp:DropDownList ID="ddlSubeybajaescaleras" CssClass="col-sm-4" runat="server" data-rule-required="true" SelectedValue='<%# Eval("Subeybajaescaleras")%>'>
                                                            <asp:ListItem Value="">-- Seleccione --</asp:ListItem>
                                                            <asp:ListItem Value="0">No lo realiza</asp:ListItem>
                                                            <asp:ListItem Value="1">Con ayuda</asp:ListItem>
                                                            <asp:ListItem Value="2">Solo con dificultad</asp:ListItem>
                                                            <asp:ListItem Value="3">Independiente</asp:ListItem>
                                                            <asp:ListItem Value="4">N/A</asp:ListItem>
                                                        </asp:DropDownList>
                                                    </div>
                                                </div>--%>
                                                <div class="control-group">
                                                    <label for="Se lava las manos" class="col-sm-6">
                                                        Se lava las manos</label>
                                                    <div class="controls">
                                                        <asp:DropDownList ID="ddlSelavalasmanos" CssClass="col-sm-4" runat="server" data-rule-required="true" SelectedValue='<%# Eval("Selavalasmanos")%>'>
                                                            <asp:ListItem Value="">-- Seleccione --</asp:ListItem>
                                                            <asp:ListItem Value="0">No lo realiza</asp:ListItem>
                                                            <asp:ListItem Value="1">Con ayuda</asp:ListItem>
                                                            <asp:ListItem Value="2">Solo con dificultad</asp:ListItem>
                                                            <asp:ListItem Value="3">Independiente</asp:ListItem>
                                                            <asp:ListItem Value="4">N/A</asp:ListItem>
                                                        </asp:DropDownList>
                                                    </div>
                                                </div>
                                                <div class="control-group">
                                                    <label for="Se seca las manos" class="col-sm-6">
                                                        Se seca las manos</label>
                                                    <div class="controls">
                                                        <asp:DropDownList ID="ddlSesecalasmanos" CssClass="col-sm-4" runat="server" data-rule-required="true" SelectedValue='<%# Eval("Sesecalasmanos")%>'>
                                                            <asp:ListItem Value="">-- Seleccione --</asp:ListItem>
                                                            <asp:ListItem Value="0">No lo realiza</asp:ListItem>
                                                            <asp:ListItem Value="1">Con ayuda</asp:ListItem>
                                                            <asp:ListItem Value="2">Solo con dificultad</asp:ListItem>
                                                            <asp:ListItem Value="3">Independiente</asp:ListItem>
                                                            <asp:ListItem Value="4">N/A</asp:ListItem>
                                                        </asp:DropDownList>
                                                    </div>
                                                </div>
                                                <div class="control-group">
                                                    <label for="Se cepilla el pelo" class="col-sm-6">
                                                        Se cepilla el pelo</label>
                                                    <div class="controls">
                                                        <asp:DropDownList ID="ddlSecepillaelpelo" CssClass="col-sm-4" runat="server" data-rule-required="true" SelectedValue='<%# Eval("Secepillaelpelo")%>'>
                                                            <asp:ListItem Value="">-- Seleccione --</asp:ListItem>
                                                            <asp:ListItem Value="0">No lo realiza</asp:ListItem>
                                                            <asp:ListItem Value="1">Con ayuda</asp:ListItem>
                                                            <asp:ListItem Value="2">Solo con dificultad</asp:ListItem>
                                                            <asp:ListItem Value="3">Independiente</asp:ListItem>
                                                            <asp:ListItem Value="4">N/A</asp:ListItem>
                                                        </asp:DropDownList>
                                                    </div>
                                                </div>
                                                <div class="control-group">
                                                    <label for="Se lava los dientes" class="col-sm-6">
                                                        Se lava los dientes</label>
                                                    <div class="controls">
                                                        <asp:DropDownList ID="ddlSelavalosdientes" CssClass="col-sm-4" runat="server" data-rule-required="true" SelectedValue='<%# Eval("Selavalosdientes")%>'>
                                                            <asp:ListItem Value="">-- Seleccione --</asp:ListItem>
                                                            <asp:ListItem Value="0">No lo realiza</asp:ListItem>
                                                            <asp:ListItem Value="1">Con ayuda</asp:ListItem>
                                                            <asp:ListItem Value="2">Solo con dificultad</asp:ListItem>
                                                            <asp:ListItem Value="3">Independiente</asp:ListItem>
                                                            <asp:ListItem Value="4">N/A</asp:ListItem>
                                                        </asp:DropDownList>
                                                    </div>
                                                </div>
                                                <div class="control-group">
                                                    <label for="Se lava la cara" class="col-sm-6">
                                                        Se lava la cara</label>
                                                    <div class="controls">
                                                        <asp:DropDownList ID="ddlSelavalacara" CssClass="col-sm-4" runat="server" data-rule-required="true" SelectedValue='<%# Eval("Selavalacara")%>'>
                                                            <asp:ListItem Value="">-- Seleccione --</asp:ListItem>
                                                            <asp:ListItem Value="0">No lo realiza</asp:ListItem>
                                                            <asp:ListItem Value="1">Con ayuda</asp:ListItem>
                                                            <asp:ListItem Value="2">Solo con dificultad</asp:ListItem>
                                                            <asp:ListItem Value="3">Independiente</asp:ListItem>
                                                            <asp:ListItem Value="4">N/A</asp:ListItem>
                                                        </asp:DropDownList>
                                                    </div>
                                                </div>
                                                <div class="control-group">
                                                    <label for="otro" class="col-sm-6">
                                                        otro</label>
                                                    <div class="controls">
                                                        <asp:DropDownList ID="ddlotroActividadesDiarias" CssClass="col-sm-4" runat="server" data-rule-required="true" SelectedValue='<%# Eval("otroActividadesDiarias")%>'>
                                                            <asp:ListItem Value="">-- Seleccione --</asp:ListItem>
                                                            <asp:ListItem Value="0">No lo realiza</asp:ListItem>
                                                            <asp:ListItem Value="1">Con ayuda</asp:ListItem>
                                                            <asp:ListItem Value="2">Solo con dificultad</asp:ListItem>
                                                            <asp:ListItem Value="3">Independiente</asp:ListItem>
                                                            <asp:ListItem Value="4">N/A</asp:ListItem>
                                                        </asp:DropDownList>
                                                    </div>
                                                </div>

                                            </div>
                                            <div class="col-sm-12">
                                                <div class="control-group">
                                                    <label for="ComentarioNeuroMuscular" class="control-label col-sm-2">
                                                        Observaciones</label>
                                                    <div class="controls">
                                                        <textarea runat="server" name="txtComentarioActividadesdiarias" id="txtComentarioActividadesdiarias" rows="4" class="input-block-level" data-rule-required="true" placeholder="Digite Aqui"></textarea>
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
            </div>

            <%--6. Estudios y aprendizaje--%>
            <div class="row">
                <div class="col-lg-12">
                    <div class="box box-color box-bordered">
                        <div class="box-title">
                            <h3>
                                <i class="fa fa-list"></i>6. Estudios y aprendizaje</h3>
                        </div>
                        <div>
                            <div class="box-content nopadding">
                                <div class="form-group">
                                    <div class="row-fluid">
                                        <div class="col-lg-12">
                                            <div class="col-sm-6">
                                                <div class="control-group">
                                                    <label for="Reconocimiento de figura" class="col-sm-6">
                                                        Reconocimiento de figura</label>
                                                    <div class="controls">
                                                        <asp:DropDownList ID="ddlReconocimientodefigura" CssClass="col-sm-4" runat="server" data-rule-required="true" SelectedValue='<%# Eval("Reconocimientodefigura")%>'>
                                                            <asp:ListItem Value="">-- Seleccione --</asp:ListItem>
                                                            <asp:ListItem Value="0">No lo realiza</asp:ListItem>
                                                            <asp:ListItem Value="1">Con ayuda</asp:ListItem>
                                                            <asp:ListItem Value="2">Solo con dificultad</asp:ListItem>
                                                            <asp:ListItem Value="3">Independiente</asp:ListItem>
                                                            <asp:ListItem Value="4">N/A</asp:ListItem>
                                                        </asp:DropDownList>
                                                    </div>
                                                </div>

                                                <div class="control-group">
                                                    <label for="Copia de figura" class="col-sm-6">
                                                        Copia de figura</label>
                                                    <div class="controls">
                                                        <asp:DropDownList ID="ddlCopiadefigura" CssClass="col-sm-4" runat="server" data-rule-required="true" SelectedValue='<%# Eval("Copiadefigura")%>'>
                                                            <asp:ListItem Value="">-- Seleccione --</asp:ListItem>
                                                            <asp:ListItem Value="0">No lo realiza</asp:ListItem>
                                                            <asp:ListItem Value="1">Con ayuda</asp:ListItem>
                                                            <asp:ListItem Value="2">Solo con dificultad</asp:ListItem>
                                                            <asp:ListItem Value="3">Independiente</asp:ListItem>
                                                            <asp:ListItem Value="4">N/A</asp:ListItem>
                                                        </asp:DropDownList>
                                                    </div>
                                                </div>
                                                <div class="control-group">
                                                    <label for="Trazado de líneas" class="col-sm-6">
                                                        Trazado de líneas</label>
                                                    <div class="controls">
                                                        <asp:DropDownList ID="ddlTrazadodelineas" CssClass="col-sm-4" runat="server" data-rule-required="true" SelectedValue='<%# Eval("Trazadodelineas")%>'>
                                                            <asp:ListItem Value="">-- Seleccione --</asp:ListItem>
                                                            <asp:ListItem Value="0">No lo realiza</asp:ListItem>
                                                            <asp:ListItem Value="1">Con ayuda</asp:ListItem>
                                                            <asp:ListItem Value="2">Solo con dificultad</asp:ListItem>
                                                            <asp:ListItem Value="3">Independiente</asp:ListItem>
                                                            <asp:ListItem Value="4">N/A</asp:ListItem>
                                                        </asp:DropDownList>
                                                    </div>
                                                </div>
                                                <div class="control-group">
                                                    <label for="Recorta" class="col-sm-6">
                                                        Recorta</label>
                                                    <div class="controls">
                                                        <asp:DropDownList ID="ddlRecorta" CssClass="col-sm-4" runat="server" data-rule-required="true" SelectedValue='<%# Eval("Recorta")%>'>
                                                            <asp:ListItem Value="">-- Seleccione --</asp:ListItem>
                                                            <asp:ListItem Value="0">No lo realiza</asp:ListItem>
                                                            <asp:ListItem Value="1">Con ayuda</asp:ListItem>
                                                            <asp:ListItem Value="2">Solo con dificultad</asp:ListItem>
                                                            <asp:ListItem Value="3">Independiente</asp:ListItem>
                                                            <asp:ListItem Value="4">N/A</asp:ListItem>
                                                        </asp:DropDownList>
                                                    </div>
                                                </div>
                                                <%-- <div class="control-group">
                                                    <label for="Matematicas" class="col-sm-6">
                                                        Matematicas</label>
                                                    <div class="controls">
                                                        <asp:DropDownList ID="ddlMatematicas" CssClass="col-sm-4" runat="server" data-rule-required="true" SelectedValue='<%# Eval("Matematicas")%>'>
                                                            <asp:ListItem Value="">-- Seleccione --</asp:ListItem>
                                                            <asp:ListItem Value="0">No lo realiza</asp:ListItem>
                                                            <asp:ListItem Value="1">Con ayuda</asp:ListItem>
                                                            <asp:ListItem Value="2">Solo con dificultad</asp:ListItem>
                                                            <asp:ListItem Value="3">Independiente</asp:ListItem>
                                                            <asp:ListItem Value="4">N/A</asp:ListItem>
                                                        </asp:DropDownList>
                                                    </div>
                                                </div>--%>

                                                <div class="control-group">
                                                    <label for="Escolarizado" class="col-sm-6">
                                                        Escolarizado</label>
                                                    <div class="controls">
                                                        <asp:DropDownList ID="ddlEscolarizado" CssClass="col-sm-4" runat="server" data-rule-required="true" SelectedValue='<%# Eval("Escolarizado")%>'>
                                                            <asp:ListItem Value="">-- Seleccione --</asp:ListItem>
                                                            <asp:ListItem Value="SI">SI</asp:ListItem>
                                                            <asp:ListItem Value="NO">NO</asp:ListItem>

                                                        </asp:DropDownList>
                                                    </div>
                                                </div>
                                                <%-- Nombrel del Colegio--%>
                                                <div class="control-group">
                                                    <label for="Nombrel del Colegio" class="col-sm-6">
                                                        Nombrel del Colegio:  
                                                    </label>
                                                    <div class="controls">
                                                        <input type="text" name="txtNombredelColegio" id="txtNombredelColegio" placeholder="Digite Aqui" runat="server">
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-sm-6">
                                                <div class="control-group">
                                                    <label for="Escribir, leer" class="col-sm-6">
                                                        Escribir, leer</label>
                                                    <div class="controls">
                                                        <asp:DropDownList ID="ddlEscribirleer" CssClass="col-sm-4" runat="server" data-rule-required="true" SelectedValue='<%# Eval("Escribirleer")%>'>
                                                            <asp:ListItem Value="">-- Seleccione --</asp:ListItem>
                                                            <asp:ListItem Value="0">No lo realiza</asp:ListItem>
                                                            <asp:ListItem Value="1">Con ayuda</asp:ListItem>
                                                            <asp:ListItem Value="2">Solo con dificultad</asp:ListItem>
                                                            <asp:ListItem Value="3">Independiente</asp:ListItem>
                                                            <asp:ListItem Value="4">N/A</asp:ListItem>
                                                        </asp:DropDownList>
                                                    </div>
                                                </div>

                                                <div class="control-group">
                                                    <label for="Manipulación de objetivos" class="col-sm-6">
                                                        Manipulación de objetivos</label>
                                                    <div class="controls">
                                                        <asp:DropDownList ID="ddlManipulaciondeobjetivos" CssClass="col-sm-4" runat="server" data-rule-required="true" SelectedValue='<%# Eval("Manipulaciondeobjetivos")%>'>
                                                            <asp:ListItem Value="">-- Seleccione --</asp:ListItem>
                                                            <asp:ListItem Value="0">No lo realiza</asp:ListItem>
                                                            <asp:ListItem Value="1">Con ayuda</asp:ListItem>
                                                            <asp:ListItem Value="2">Solo con dificultad</asp:ListItem>
                                                            <asp:ListItem Value="3">Independiente</asp:ListItem>
                                                            <asp:ListItem Value="4">N/A</asp:ListItem>
                                                        </asp:DropDownList>
                                                    </div>
                                                </div>


                                                <div class="control-group">
                                                    <label for="Cruce  de línea media" class="col-sm-6">
                                                        Cruce  de línea media</label>
                                                    <div class="controls">
                                                        <asp:DropDownList ID="ddlCrucedelineamedia" CssClass="col-sm-4" runat="server" data-rule-required="true" SelectedValue='<%# Eval("Crucedelineamedia")%>'>
                                                            <asp:ListItem Value="">-- Seleccione --</asp:ListItem>
                                                            <asp:ListItem Value="0">No lo realiza</asp:ListItem>
                                                            <asp:ListItem Value="1">Con ayuda</asp:ListItem>
                                                            <asp:ListItem Value="2">Solo con dificultad</asp:ListItem>
                                                            <asp:ListItem Value="3">Independiente</asp:ListItem>
                                                            <asp:ListItem Value="4">N/A</asp:ListItem>
                                                        </asp:DropDownList>
                                                    </div>
                                                </div>

                                                <div class="control-group">
                                                    <label for="Dominancia" class="col-sm-6">
                                                        Dominancia</label>
                                                    <div class="controls">
                                                        <asp:DropDownList ID="ddlDominancia" CssClass="col-sm-4" runat="server" data-rule-required="true" SelectedValue='<%# Eval("Dominancia")%>'>
                                                            <asp:ListItem Value="">-- Seleccione --</asp:ListItem>
                                                            <asp:ListItem Value="0">No lo realiza</asp:ListItem>
                                                            <asp:ListItem Value="1">Con ayuda</asp:ListItem>
                                                            <asp:ListItem Value="2">Solo con dificultad</asp:ListItem>
                                                            <asp:ListItem Value="3">Independiente</asp:ListItem>
                                                            <asp:ListItem Value="4">N/A</asp:ListItem>
                                                        </asp:DropDownList>
                                                    </div>
                                                </div>

                                                <div class="control-group">
                                                    <label for="Utilización de computadora" class="col-sm-6">
                                                        Utilización de computadora
                                                    </label>
                                                    <div class="controls">
                                                        <asp:DropDownList ID="ddlUtilizacióndecomputadora" CssClass="col-sm-4" runat="server" data-rule-required="true" SelectedValue='<%# Eval("Utilizacióndecomputadora")%>'>
                                                            <asp:ListItem Value="">-- Seleccione --</asp:ListItem>
                                                            <asp:ListItem Value="0">No lo realiza</asp:ListItem>
                                                            <asp:ListItem Value="1">Con ayuda</asp:ListItem>
                                                            <asp:ListItem Value="2">Solo con dificultad</asp:ListItem>
                                                            <asp:ListItem Value="3">Independiente</asp:ListItem>
                                                            <asp:ListItem Value="4">N/A</asp:ListItem>
                                                        </asp:DropDownList>
                                                    </div>
                                                </div>
                                                <%-- NivelEscolar--%>
                                                <div class="control-group">
                                                    <label for="NivelEscolar" class="col-sm-6">
                                                        Nivel/Curso:  
                                                    </label>
                                                    <div class="controls">
                                                        <input type="text" name="txtNivelEscolar" id="txtNivelEscolar" placeholder="Digite Aqui" runat="server">
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-sm-12">
                                                <div class="control-group">
                                                    <label for="ComentarioEstudiosyaprendizaje" class="control-label col-sm-2">
                                                        Observaciones</label>
                                                    <div class="controls">
                                                        <textarea runat="server" name="txtComentarioEstudiosyaprendizaje" id="txtComentarioEstudiosyaprendizaje" rows="4" class="input-block-level" data-rule-required="true" placeholder="Digite Aqui"></textarea>
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
            </div>

            <%--7. Juegos, tiempo libre y participación social--%>
            <div class="row">
                <div class="col-lg-12">
                    <div class="box box-color box-bordered">
                        <div class="box-title">
                            <h3>
                                <i class="fa fa-list"></i>7. Juegos, tiempo libre y participación social</h3>
                        </div>
                        <div>
                            <div class="box-content nopadding">
                                <div class="form-group">
                                    <div class="row-fluid">
                                        <div class="col-lg-12">
                                            <div class="col-sm-6">
                                                <div class="control-group">
                                                    <label for="Independencia en el juego" class="col-sm-6">
                                                        Independencia en el juego</label>
                                                    <div class="controls">
                                                        <textarea runat="server" name="txtIndependenciaeneljuego" id="txtIndependenciaeneljuego" rows="2" class="input-block-level" data-rule-required="true" placeholder="Digite Aqui"></textarea>
                                                    </div>
                                                </div>

                                                <div class="control-group">
                                                    <label for="Preferencia de los juegos" class="col-sm-6">
                                                        Preferencia de los juegos</label>
                                                    <div class="controls">
                                                        <textarea runat="server" name="txtPreferenciadelosjuegos" id="txtPreferenciadelosjuegos" rows="2" class="input-block-level" data-rule-required="true" placeholder="Digite Aqui"></textarea>

                                                    </div>
                                                </div>
                                                <div class="control-group">
                                                    <label for="Juegos didacticos" class="col-sm-6">
                                                        Juegos didácticos</label>
                                                    <div class="controls">
                                                        <textarea runat="server" name="txtJuegosdidacticos" id="txtJuegosdidacticos" rows="2" class="input-block-level" data-rule-required="true" placeholder="Digite Aqui"></textarea>

                                                    </div>
                                                </div>
                                                <div class="control-group">
                                                    <label for="A que juega con los padres" class="col-sm-6">
                                                        A que juega con los padres</label>
                                                    <div class="controls">
                                                        <textarea runat="server" name="txtAquejuegaconlospadres" id="txtAquejuegaconlospadres" rows="2" class="input-block-level" data-rule-required="true" placeholder="Digite Aqui"></textarea>

                                                    </div>
                                                </div>
                                                <div class="control-group">
                                                    <label for="A donde salen a jugar" class="col-sm-6">
                                                        A donde salen a jugar</label>
                                                    <div class="controls">
                                                        <textarea runat="server" name="txtAdondesalenajugar" id="txtAdondesalenajugar" rows="2" class="input-block-level" data-rule-required="true" placeholder="Digite Aqui"></textarea>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-sm-6">
                                                <div class="control-group">
                                                    <label for="Interacción con los hermanos" class="col-sm-6">
                                                        Interacción con los hermanos</label>
                                                    <div class="controls">
                                                        <textarea runat="server" name="txtInteraccionconloshermanos" id="txtInteraccionconloshermanos" rows="2" class="input-block-level" data-rule-required="true" placeholder="Digite Aqui"></textarea>
                                                    </div>
                                                </div>

                                                <div class="control-group">
                                                    <label for="Participación en eventos familiares" class="col-sm-6">
                                                        Participación en eventos familiares</label>
                                                    <div class="controls">
                                                        <textarea runat="server" name="txtParticipacioneneventosfamiliares" id="txtParticipacioneneventosfamiliares" rows="2" class="input-block-level" data-rule-required="true" placeholder="Digite Aqui"></textarea>

                                                    </div>
                                                </div>
                                                <div class="control-group">
                                                    <label for="Actividades fuera del hogar" class="col-sm-6">
                                                        Actividades fuera del hogar</label>
                                                    <div class="controls">
                                                        <textarea runat="server" name="txtActividadesfueradelhogar" id="txtActividadesfueradelhogar" rows="2" class="input-block-level" data-rule-required="true" placeholder="Digite Aqui"></textarea>

                                                    </div>
                                                </div>
                                                <div class="control-group">
                                                    <label for="Juego con amigos" class="col-sm-6">
                                                        Juego con amigos</label>
                                                    <div class="controls">
                                                        <textarea runat="server" name="txtJuegoconamigos" id="txtJuegoconamigos" rows="2" class="input-block-level" data-rule-required="true" placeholder="Digite Aqui"></textarea>

                                                    </div>
                                                </div>
                                                <div class="control-group">
                                                    <label for="Otros " class="col-sm-6">
                                                        Otros</label>
                                                    <div class="controls">
                                                        <textarea runat="server" name="txtOtrosjuegos" id="txtOtrosjuegos" rows="2" class="input-block-level" data-rule-required="true" placeholder="Digite Aqui"></textarea>
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
            </div>

            <%--8. Impresión del procesamiento sensorials--%>
            <div class="row">
                <div class="col-lg-12">
                    <div class="box box-color box-bordered">
                        <div class="box-title">
                            <h3>
                                <i class="fa fa-list"></i>8. Impresión del procesamiento sensorial</h3>
                        </div>
                        <div>
                            <div class="box-content nopadding">
                                <div class="form-group">
                                    <div class="row-fluid">
                                        <div class="col-lg-12">
                                            <div class="col-sm-6">
                                                <div class="control-group">
                                                    <label for="Dispraxia" class="col-sm-6">
                                                        Dispraxia</label>
                                                    <div class="controls">
                                                        <asp:DropDownList ID="ddlDispraxia" CssClass="col-sm-4" runat="server" data-rule-required="true" SelectedValue='<%# Eval("Supinaflexora")%>'>
                                                            <asp:ListItem Value="">-- Seleccione --</asp:ListItem>
                                                            <asp:ListItem Value="SI">SI</asp:ListItem>
                                                            <asp:ListItem Value="NO">NO</asp:ListItem>
                                                        </asp:DropDownList>
                                                    </div>
                                                </div>
                                                <%--Comentario Dispraxia--%>
                                                <div class="control-group">
                                                    <label for="lblComentarioDispraxia" class="col-sm-6">
                                                        Comentario Dispraxia:  
                                                    </label>
                                                    <div class="controls">
                                                        <%--<input type="text" name="txtComentarioDispraxia" id="txtComentarioDispraxia" placeholder="Digite Aqui" runat="server">--%>
                                                        <textarea runat="server" name="txtComentarioDispraxia" id="txtComentarioDispraxia" rows="2" class="input-block-level" data-rule-required="true" placeholder="Digite Aqui"></textarea>

                                                    </div>
                                                </div>

                                                <div class="control-group">
                                                    <label for="Rolado" class="col-sm-6">
                                                        Postural/Ocular
                                                    </label>
                                                    <div class="controls">
                                                        <asp:DropDownList ID="ddlPosturalOcular" CssClass="col-sm-4" runat="server" data-rule-required="true" SelectedValue='<%# Eval("Rolado")%>'>
                                                            <asp:ListItem Value="">-- Seleccione --</asp:ListItem>
                                                            <asp:ListItem Value="SI">SI</asp:ListItem>
                                                            <asp:ListItem Value="NO">NO</asp:ListItem>
                                                        </asp:DropDownList>
                                                    </div>
                                                </div>
                                                <%--Comentario Postural/Ocular--%>
                                                <div class="control-group">
                                                    <label for="lblComentarioPosturalOcular" class="col-sm-6">
                                                        Comentario Postural/Ocular:  
                                                    </label>
                                                    <div class="controls">
                                                        <%--<input type="text" name="txtComentarioPosturalOcular" id="txtComentarioPosturalOcular" placeholder="Digite Aqui" runat="server">--%>
                                                        <textarea runat="server" name="txtComentarioPosturalOcular" id="txtComentarioPosturalOcular" rows="2" class="input-block-level" data-rule-required="true" placeholder="Digite Aqui"></textarea>

                                                    </div>
                                                </div>


                                            </div>
                                            <div class="col-sm-6">
                                                <%--<div class="control-group">
                                                    <label for="Modulacion Hipo" class="col-sm-6">
                                                        Modulación Hipo</label>
                                                    <div class="controls">
                                                        <asp:DropDownList ID="ddlModulacionHipo" CssClass="col-sm-4" runat="server" data-rule-required="true" SelectedValue='<%# Eval("Arrastre")%>'>
                                                            <asp:ListItem Value="">-- Seleccione --</asp:ListItem>
                                                            <asp:ListItem Value="SI">SI</asp:ListItem>
                                                            <asp:ListItem Value="NO">NO</asp:ListItem>
                                                        </asp:DropDownList>
                                                    </div>
                                                </div>--%>
                                                <%-- <div class="control-group">
                                                    <label for="ModulacionBuscador" class="col-sm-6">
                                                        Modulación Buscador</label>
                                                    <div class="controls">
                                                        <asp:DropDownList ID="ddlModulacionBuscador" CssClass="col-sm-4" runat="server" data-rule-required="true" SelectedValue='<%# Eval("Cuatro4puntos")%>'>
                                                            <asp:ListItem Value="">-- Seleccione --</asp:ListItem>
                                                            <asp:ListItem Value="SI">SI</asp:ListItem>
                                                            <asp:ListItem Value="NO">NO</asp:ListItem>
                                                        </asp:DropDownList>
                                                    </div>
                                                </div>--%>
                                                <div class="control-group">
                                                    <label for="Modulacion" class="col-sm-6">
                                                        Modulación</label>
                                                    <div class="controls">
                                                        <asp:DropDownList ID="ddlModulacion" CssClass="col-sm-4" runat="server" data-rule-required="true" SelectedValue='<%# Eval("Pronaextensora")%>'>
                                                            <asp:ListItem Value="">-- Seleccione --</asp:ListItem>
                                                            <asp:ListItem Value="Hiper">Hiper</asp:ListItem>
                                                            <asp:ListItem Value="Hipo">Hipo</asp:ListItem>
                                                            <asp:ListItem Value="Buscador">Buscador</asp:ListItem>
                                                        </asp:DropDownList>
                                                    </div>
                                                </div>
                                                <%--Comentario Modulacion--%>
                                                <div class="control-group">
                                                    <label for="lblComentarioModulacion" class="col-sm-6">
                                                        Comentario Modulación:  
                                                    </label>
                                                    <div class="controls">
                                                        <%--<input type="text" name="txtComentarioModulacion" id="txtComentarioModulacion" placeholder="Digite Aqui" runat="server">--%>
                                                        <textarea runat="server" name="txtComentarioModulacion" id="txtComentarioModulacion" rows="2" class="input-block-level" data-rule-required="true" placeholder="Digite Aqui"></textarea>
                                                    </div>
                                                </div>
                                                <div class="control-group">
                                                    <label for="Discriminacion" class="col-sm-6">
                                                        Discriminación</label>
                                                    <div class="controls">
                                                        <asp:DropDownList ID="ddlDiscriminacion" CssClass="col-sm-4" runat="server" data-rule-required="true" SelectedValue='<%# Eval("Cuatro4puntos")%>'>
                                                            <asp:ListItem Value="">-- Seleccione --</asp:ListItem>
                                                            <asp:ListItem Value="Visual">Visual</asp:ListItem>
                                                            <asp:ListItem Value="Tactil">Tactil</asp:ListItem>
                                                            <asp:ListItem Value="Vesticular">Vesticular</asp:ListItem>
                                                            <asp:ListItem Value="Propioceptivo">Propioceptivo</asp:ListItem>
                                                            <asp:ListItem Value="Auditivo">Auditivo</asp:ListItem>
                                                            <asp:ListItem Value="Gustativo">Gustativo</asp:ListItem>
                                                        </asp:DropDownList>
                                                    </div>
                                                </div>
                                                <%--Comentario Discriminacion--%>
                                                <div class="control-group">
                                                    <label for="lblComentarioDiscriminacion" class="col-sm-6">
                                                        Comentario Discriminacion:  
                                                    </label>
                                                    <div class="controls">
                                                        <%--<input type="text" name="txtComentarioDiscriminacion" id="txtComentarioDiscriminacion" placeholder="Digite Aqui" runat="server">--%>
                                                        <textarea runat="server" name="txtComentarioDiscriminacion" id="txtComentarioDiscriminacion" rows="2" class="input-block-level" data-rule-required="true" placeholder="Digite Aqui"></textarea>
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
            </div>

            <%--9.	Conclusiones en conjunto con los padres --%>
            <div class="row">
                <div class="col-lg-12">
                    <div class="box box-color box-bordered">
                        <div class="box-title">
                            <h3>
                                <i class="fa fa-list"></i>9. Conclusiones en conjunto con los padres </h3>
                        </div>
                        <div>
                            <div class="box-content nopadding">
                                <div class="form-group">
                                    <div class="row-fluid">
                                        <div class="col-lg-12">
                                            <div class="col-sm-6">
                                                <div class="control-group">
                                                    <label for="Cuáles son las habilidades y dificultades" class="col-sm-6">
                                                        Cuáles son las habilidades y dificultades</label>
                                                    <div class="controls">
                                                        <textarea runat="server" name="txtCualessonlashabilidadesydificultades" id="txtCualessonlashabilidadesydificultades" rows="2" class="input-block-level" data-rule-required="true" placeholder="Digite Aqui"></textarea>
                                                    </div>
                                                </div>
                                                <div class="control-group">
                                                    <label for="Que preocupa a los padres" class="col-sm-6">
                                                        Que preocupa a los padres</label>
                                                    <div class="controls">
                                                        <textarea runat="server" name="txtQuepreocupaalospadres" id="txtQuepreocupaalospadres" rows="2" class="input-block-level" data-rule-required="true" placeholder="Digite Aqui"></textarea>

                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-sm-6">
                                                <div class="control-group">
                                                    <label for="Expectativas y metas" class="col-sm-6">
                                                        Expectativas y metas</label>
                                                    <div class="controls">
                                                        <textarea runat="server" name="txtExpectativasymetas" id="txtExpectativasymetas" rows="2" class="input-block-level" data-rule-required="true" placeholder="Digite Aqui"></textarea>
                                                    </div>
                                                </div>
                                                <div class="control-group">
                                                    <label for="Definicion de los socios del proceso de tratamiento" class="col-sm-6">
                                                        Definicion de los socios del proceso de tratamiento</label>
                                                    <div class="controls">
                                                        <textarea runat="server" name="txtDefinicionsociosproceso" id="txtDefinicionsociosproceso" rows="2" class="input-block-level" data-rule-required="true" placeholder="Digite Aqui"></textarea>

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
            </div>

            <%--10.	Conclusiones del Terapeuta Ocupacional  --%>
            <div class="row">
                <div class="col-lg-12">
                    <div class="box box-color box-bordered">
                        <div class="box-title">
                            <h3>
                                <i class="fa fa-list"></i>10. Conclusiones del Terapeuta Ocupacional </h3>
                        </div>
                        <div>
                            <div class="box-content nopadding">
                                <div class="form-group">
                                    <div class="row-fluid">
                                        <div class="col-lg-12">
                                            <div class="col-sm-6">
                                                <div class="control-group">
                                                    <label for="Impresiones" class="col-sm-6">
                                                        Impresiones</label>
                                                    <div class="controls">
                                                        <textarea runat="server" name="txtImpresiones" id="txtImpresiones" rows="2" class="input-block-level" data-rule-required="true" placeholder="Digite Aqui"></textarea>
                                                    </div>
                                                </div>
                                                <div class="control-group">
                                                    <label for="Habilidades" class="col-sm-6">
                                                        Habilidades</label>
                                                    <div class="controls">
                                                        <textarea runat="server" name="txtHabilidades" id="txtHabilidades" rows="2" class="input-block-level" data-rule-required="true" placeholder="Digite Aqui"></textarea>

                                                    </div>
                                                </div>
                                                <div class="control-group">
                                                    <label for="Dificultades" class="col-sm-6">
                                                        Dificultades</label>
                                                    <div class="controls">
                                                        <textarea runat="server" name="txtDificultades" id="txtDificultades" rows="2" class="input-block-level" data-rule-required="true" placeholder="Digite Aqui"></textarea>

                                                    </div>
                                                </div>
                                                                                                <div class="control-group">
                                                    <label for="Otras evaluaciones requeridas" class="col-sm-6">
                                                        Otras evaluaciones requeridas</label>
                                                    <div class="controls">
                                                        <textarea runat="server" name="txtOtrasevaluacionesrequeridas" id="txtOtrasevaluacionesrequeridas" rows="2" class="input-block-level" data-rule-required="true" placeholder="Digite Aqui"></textarea>

                                                    </div>
                                                </div>
                                                <div class="control-group">
                                                    <label for="Referimiento necesario" class="col-sm-6">
                                                        Referimiento necesario</label>
                                                    <div class="controls">
                                                        <textarea runat="server" name="txtReferimientonecesario" id="txtReferimientonecesario" rows="2" class="input-block-level" data-rule-required="true" placeholder="Digite Aqui"></textarea>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-sm-6">
                                                <div class="control-group">
                                                    <label for="Objetivos" class="col-sm-6">
                                                        Objetivos</label>
                                                    <div class="controls">
                                                        <textarea runat="server" name="txtObjetivos" id="txtObjetivos" rows="20" class="input-block-level" data-rule-required="true" placeholder="Digite Aqui"></textarea>
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
            </div>
               <%--Programa de intervención en Terapia Ocupacional NUEVO.--%>
            <div class="row">
                <div class="col-lg-12">
                    <div class="box box-color box-bordered">
                        <div class="box-title">
                            <h3>
                                <i class="fa fa-list"></i>Programa de intervención en Terapia Ocupacional. - Sesiones Individualizadas:</h3>
                        </div>
                        <div>
                            <div class="box-content nopadding">
                                <div class="form-horizontal form-column form-bordered">
                                    <div class="row">
                                        <%--  <div class="col-sm-12">--%>
                                        <div class="col-sm-6">
                                            <div class="control-group">
                                                <label for="SesionesIndividualizadas" class="col-sm-6">
                                                    <strong>DESCRIPCIONES</strong>
                                                </label>
                                                <label for="SesionesIndividualizadas">
                                                    <strong>PLAN CUATRIMESTRAL</strong>
                                                </label>
                                                <%--                                                    <div class="controls">
                                                        
                                                    </div>--%>
                                            </div>
                                            <div class="control-group">
                                                <label for="SesionesIndividualizadas" class="col-sm-6">
                                                    Terapia Activa</label>
                                                <div class="checkbox checkbox-primary  col-lg-1">
                                                    <asp:CheckBoxList ID="ckPlanCuatrimestralTerapiaActiva" CellPadding="10" Font-Size="X-Small" CellSpacing="5"
                                                        RepeatColumns="2" RepeatDirection="Horizontal" TextAlign="Right" runat="server">
                                                        <asp:ListItem Value="."></asp:ListItem>
                                                    </asp:CheckBoxList>

                                                </div>
                                            </div>

                                            <div class="control-group">
                                                <label for="ProgramadetalleresenAVDPadres" class="col-sm-6">
                                                    Entrenamiento para padres de T. O
                                                </label>
                                                <div class="checkbox checkbox-primary  col-lg-1">
                                                    <asp:CheckBoxList ID="ckPlanCuatrimestralEntrenaPadres" CellPadding="10" Font-Size="X-Small" CellSpacing="5"
                                                        RepeatColumns="2" RepeatDirection="Horizontal" TextAlign="Right" runat="server">
                                                        <asp:ListItem Value="."></asp:ListItem>
                                                    </asp:CheckBoxList>
                                                </div>
                                            </div>
                                            <div class="control-group">
                                                <label for="Grupo de niños con habilidades y destrezas" class="col-sm-6">
                                                    Terapia Acuática 
                                                </label>
                                                <div class="checkbox checkbox-primary  col-lg-1">
                                                    <asp:CheckBoxList ID="ckPlanCuatrimestralTerapiaAcuatica" CellPadding="10" Font-Size="X-Small" CellSpacing="5"
                                                        RepeatColumns="2" RepeatDirection="Horizontal" TextAlign="Right" runat="server">
                                                        <asp:ListItem Value="."></asp:ListItem>
                                                    </asp:CheckBoxList>
                                                </div>
                                            </div>
                                            <div class="control-group">
                                                <label for="Grupo de niños con habilidades y destrezas" class="col-sm-6">
                                                    Programa de Visita Domiciliaria y/o Escolar
                                                </label>
                                                <div class="checkbox checkbox-primary col-lg-1">
                                                    <asp:CheckBoxList ID="ckPlanCuatrimestralVisitaDomiciliaria" CellPadding="10" Font-Size="X-Small" CellSpacing="5"
                                                        RepeatColumns="2" RepeatDirection="Horizontal" TextAlign="Right" runat="server">
                                                        <asp:ListItem Value="."></asp:ListItem>
                                                    </asp:CheckBoxList>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-sm-6">
                                            <div class="control-group">
                                                <label for="SesionesIndividualizadas">
                                                    <strong>PLAN MIXTO</strong>
                                                </label>
                                                <%--<div class="controls">
                                                        <label for="SesionesIndividualizadas"   class="col-sm-6"  >
                                                          
                                                        </label>
                                                    </div>
                                                    <div class="controls">
                                                        
                                                    </div>--%>
                                            </div>
                                            <div class="control-group">
                                                <div class="checkbox checkbox-primary col-lg-1">
                                                    <asp:CheckBoxList ID="ckPlanMixtoTerapiaActiva" CellPadding="10" Font-Size="X-Small" CellSpacing="5"
                                                        RepeatColumns="2" RepeatDirection="Horizontal" TextAlign="Right" runat="server">
                                                        <asp:ListItem Value="."></asp:ListItem>
                                                    </asp:CheckBoxList>
                                                </div>
                                            </div>
                                            <div class="control-group">
                                                <div class="checkbox checkbox-primary col-lg-10">
                                                    <asp:CheckBoxList ID="ckPlanMixtoEntrenaPadres" CellPadding="10" Font-Size="X-Small" CellSpacing="5"
                                                        RepeatColumns="2" RepeatDirection="Horizontal" TextAlign="Right" runat="server">
                                                        <asp:ListItem Value="."></asp:ListItem>
                                                    </asp:CheckBoxList>
                                                </div>
                                            </div>
                                            <div class="control-group">
                                                <div class="checkbox checkbox-primary col-lg-10">
                                                    <asp:CheckBoxList ID="ckPlanMixtoTerapiaAcuatica" CellPadding="10" Font-Size="X-Small" CellSpacing="5"
                                                        RepeatColumns="2" RepeatDirection="Horizontal" TextAlign="Right" runat="server">
                                                        <asp:ListItem Value="."></asp:ListItem>
                                                    </asp:CheckBoxList>
                                                </div>
                                            </div>
                                            <div class="control-group">
                                                <div class="checkbox checkbox-primary col-lg-10">
                                                    <asp:CheckBoxList ID="ckPlanMixtoVisitaDomiciliaria" CellPadding="10" Font-Size="X-Small" CellSpacing="5"
                                                        RepeatColumns="2" RepeatDirection="Horizontal" TextAlign="Right" runat="server">
                                                        <asp:ListItem Value="."></asp:ListItem>
                                                    </asp:CheckBoxList>
                                                </div>
                                            </div>
                                        </div>
                                        <%-- </div>--%>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="box-content nopadding">
                        <div class="box-title">
                            <h3>
                                <i class="fa fa-list"></i>PEF:</h3>
                        </div>
                        <div class="row">
                            <div class="col-sm-6">
                                <div class="control-group">
                                    <label for="Grupo de niños con habilidades y destrezas" class="col-sm-6">
                                        PEF: 
                                    </label>
                                    <div class="control-group">
                                    <div class="checkbox checkbox-primary col-lg-1"> 
                                       <%-- <div class="checkbox checkbox-primary col-lg-1">--%>
                                            <asp:CheckBoxList ID="ckpef" CellPadding="10" Font-Size="X-Small" CellSpacing="5"
                                                RepeatColumns="2" RepeatDirection="Horizontal" TextAlign="Right" runat="server">
                                                <asp:ListItem Value="."></asp:ListItem>
                                            </asp:CheckBoxList>
                                      <%--  </div>--%>
                                    </div>
                                         </div>
                                </div>

                            </div>
                        </div>
                            </div>

                    </div>
                </div>
            </div>
            <%--Programa de intervención en Terapia Ocupacional.--%>
            <div class="row" style="visibility:hidden">
                <div class="col-lg-12">
                    <div class="box box-color box-bordered">
                        <div class="box-title">
                            <h3>
                                <i class="fa fa-list"></i>Programa de intervención en Terapia Ocupacional.</h3>
                        </div>
                        <div>
                            <div class="box-content nopadding">
                                <div class="form-group">
                                    <div class="row-fluid">
                                        <div class="col-lg-12">
                                            <div class="col-sm-6">
                                                <div class="control-group">
                                                    <label for="SesionesIndividualizadas" class="col-sm-6">
                                                        Sesiones Individualizadas</label>
                                                    <div class="controls">
                                                        <asp:DropDownList ID="ddlSesionesIndividualizadas" CssClass="col-sm-4" runat="server" data-rule-required="true" SelectedValue='<%# Eval("Reconocimientodefigura")%>'>
                                                            <asp:ListItem Value="">-- Seleccione --</asp:ListItem>
                                                            <asp:ListItem Value="Hidroterapia">Hidroterapia</asp:ListItem>
                                                            <asp:ListItem Value="Multisensorial">Multisensorial</asp:ListItem>
                                                            <asp:ListItem Value="Terapia Ocupacional 1">Terapia Ocupacional 1</asp:ListItem>
                                                            <asp:ListItem Value="Terapia Ocupacional 2">Terapia Ocupacional 2</asp:ListItem>
                                                            <asp:ListItem Value="Parque">Parque</asp:ListItem>
                                                            <asp:ListItem Value="Sala de Tecnología">Sala de Tecnología</asp:ListItem>
                                                            <asp:ListItem Value="Otros">Otros</asp:ListItem>
                                                            <asp:ListItem Value="N/A">N/A</asp:ListItem>
                                                        </asp:DropDownList>
                                                    </div>
                                                </div>

                                                <div class="control-group">
                                                    <label for="ProgramadetalleresenAVDPadres" class="col-sm-6">
                                                        Programa de talleres en AVD. (Padres)
                                                    </label>
                                                    <div class="controls">
                                                        <asp:DropDownList ID="ddlProgramadetalleresenAVDPadres" CssClass="col-sm-4" runat="server" data-rule-required="true" SelectedValue='<%# Eval("Copiadefigura")%>'>
                                                            <asp:ListItem Value="">-- Seleccione --</asp:ListItem>
                                                            <asp:ListItem Value="SI">SI</asp:ListItem>
                                                            <asp:ListItem Value="NO">NO</asp:ListItem>
                                                        </asp:DropDownList>
                                                    </div>
                                                </div>
                                                <div class="control-group">
                                                    <label for="Grupo de niños con habilidades y destrezas" class="col-sm-6">
                                                        Grupo de niños con habilidades y destrezas
                                                    </label>
                                                    <div class="controls">
                                                        <asp:DropDownList ID="ddlGrupodeninosconhabilidadesydestrezas" CssClass="col-sm-4" runat="server" data-rule-required="true" SelectedValue='<%# Eval("Trazadodelineas")%>'>
                                                            <asp:ListItem Value="">-- Seleccione --</asp:ListItem>
                                                            <asp:ListItem Value="SI">SI</asp:ListItem>
                                                            <asp:ListItem Value="NO">NO</asp:ListItem>
                                                        </asp:DropDownList>
                                                    </div>
                                                </div>


                                            </div>
                                            <div class="col-sm-6">
                                                <div class="control-group">
                                                    <label for="Charlas Generales" class="col-sm-6">
                                                        Charlas Generales
                                                    </label>
                                                    <div class="controls">
                                                        <asp:DropDownList ID="ddlCharlasGenerales" CssClass="col-sm-4" runat="server" data-rule-required="true" SelectedValue='<%# Eval("Recorta")%>'>
                                                            <asp:ListItem Value="">-- Seleccione --</asp:ListItem>
                                                            <asp:ListItem Value="SI">SI</asp:ListItem>
                                                            <asp:ListItem Value="NO">NO</asp:ListItem>
                                                        </asp:DropDownList>
                                                    </div>
                                                </div>
                                                <div class="control-group">
                                                    <label for="Programa de visitas domiciliaria o escolar para adaptacion de ambiente" class="col-sm-6">
                                                        Programa de visitas domiciliaria o escolar para adaptación de ambiente</label>
                                                    <div class="controls">
                                                        <asp:DropDownList ID="ddlProgramadevisitasdomiciliaria" CssClass="col-sm-4" runat="server" data-rule-required="true" SelectedValue='<%# Eval("Matematicas")%>'>
                                                            <asp:ListItem Value="">-- Seleccione --</asp:ListItem>
                                                            <asp:ListItem Value="0">No lo realiza</asp:ListItem>
                                                            <asp:ListItem Value="1">Con ayuda</asp:ListItem>
                                                            <asp:ListItem Value="2">Solo con dificultad</asp:ListItem>
                                                            <asp:ListItem Value="3">Independiente</asp:ListItem>
                                                            <asp:ListItem Value="4">N/A</asp:ListItem>
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
            </div>

         
        </asp:Panel>
    </div>

</asp:Content>

