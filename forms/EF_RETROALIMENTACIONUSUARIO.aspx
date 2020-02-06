<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true"
    CodeBehind="EF_RETROALIMENTACIONUSUARIO.aspx.cs" Inherits="CAID_V2.forms.EF_RETROALIMENTACIONUSUARIO" %>

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
        <asp:Panel runat="server" ID="pnlConsulta" Visible="True">
            <div class="row-fluid">
                <div class="col-sm-12">
                    <div class="box box-color box-bordered">
                        <div class="box-title">
                            <h3>
                                <i class="icon-reorder"></i>Retroalimentación de usuarios
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
                                                    <th>Evaluador
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
                                                                <%# Eval("NOMBRE_ESPECIALISTA")%>
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

        <%-- DATOS Retroalimentación --%>
        <asp:Panel runat="server" ID="pnlData" Visible="false">
            <div class="row-fluid">
                <div class="col-sm-12">
                    <div class="box box-color box-bordered">
                        <div class="box-title  box-color">
                            <h3><i class="fa fa-list"></i>Retroalimentación de usuarios</h3>
                            <div class="actions">
                                <button type="button" id="tbnAdd" runat="server"
                                    class="btn btn-default" data-dismiss="modal" onserverclick="_Save">
                                    <%----%>
                                    <i class="icon-plus-sign"></i>&nbsp Guardar</button>
                                <button type="button" id="btnregresar" runat="server" validationgroup="pnlEdit"
                                    class="btn btn-default" data-dismiss="modal" onserverclick="_BackMain1">
                                    <%----%>
                                    <i class="icon-arrow-left"></i>&nbsp Regresar</button>

                            </div>
                        </div>
                    </div>
                    <div class="box box-color box-bordered">
                        <div class="box-title box-color">
                            <h3><i class="fa fa-list"></i>Datos Personales</h3>

                        </div>
                        <div>
                            <div class="box-content nopadding">
                                <div class='form-horizontal form-column form-bordered'>
                                    <div class="row">
                                        <%-- DATOS PERSONALES DEL PACIENTE--%>
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
                                            <%-- 1- Nombre del Paciente--%>
                                            <div class="control-group">
                                                <label for="lblnombrePaciente" class="control-label col-sm-2">
                                                    Nombre del Niño</label>
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
                                            <%-- 4- Sexo--%>
                                            <div class="control-group">
                                                <label for="lblSexo" class="control-label col-sm-2">
                                                    Sexo</label>
                                                <div class="controls">
                                                    <input type="text" name="txtSexo" id="txtSexo"
                                                        placeholder="Digite Aqui" runat="server" disabled>
                                                </div>
                                            </div>
                                             <%-- 5- PRIORIZADOISCUSIONCASO--%>
                                            <div class="control-group">
                                                <label for="lblPRIORIZADOISCUSIONCASO" class="control-label col-sm-2">
                                                    PRIORIZADO EN DISCUSIÓN DE CASO</label>
                                                <div class="controls">
                                                     <asp:DropDownList ID="ddlPRIORIZADOISCUSIONCASO" CssClass="input-medium" runat="server">
                                                        <asp:ListItem Value="">-- Seleccione --</asp:ListItem>
                                                        <asp:ListItem Value="SI">SI</asp:ListItem>
                                                        <asp:ListItem Value="NO">NO</asp:ListItem>
                                                    </asp:DropDownList>
                                                </div>
                                            </div>
                                            <%-- 6- Nivel Economico--%>
                                            <%--<div class="control-group">
                                                <label for="lblNivelEconomico" class="control-label col-sm-2">
                                                    Nivel Economico</label>
                                                <div class="controls">
                                                    <input type="text" name="txtNivelEconomico" id="txtNivelEconomico"
                                                        placeholder="" runat="server" disabled>
                                                </div>
                                            </div>--%>
                                        </div>
                                        <div class="col-sm-6">

                                            <%-- 7- Direccion Actual--%>
                                            <div class="control-group">
                                                <label for="lblnombrepadre" class="control-label col-sm-6">
                                                    Direccion actual</label>
                                                <div class="controls">
                                                    <input type="text" name="txtdireccionactual" id="txtdireccionactual"
                                                        placeholder="Digite Aqui" runat="server" class="form-control" disabled>
                                                </div>
                                            </div>
                                            <%-- 8- Escolarizado--%>
                                            <%--<div class="control-group">
                                                <label for="lblEscolarizado" class="control-label col-sm-6">
                                                    Escolarizado</label>
                                                <div class="controls">
                                                    <asp:DropDownList ID="ddlEscolarizado" CssClass="input-medium" runat="server">
                                                        <asp:ListItem Value="">-- Seleccione --</asp:ListItem>
                                                        <asp:ListItem Value="SI">SI</asp:ListItem>
                                                        <asp:ListItem Value="NO">NO</asp:ListItem>
                                                    </asp:DropDownList>
                                                </div>
                                            </div>--%>
                                            <%-- 9- Tipo de Escuelas--%>
                                            <%-- <div class="control-group">
                                                <label for="lblTipoEscuelas" class="control-label col-sm-6">
                                                    Tipo de Escuela</label>
                                                <div class="controls">
                                                    <asp:DropDownList ID="ddlTipoEscuela" CssClass="input-medium" runat="server">
                                                        <asp:ListItem Value="">-- Seleccione --</asp:ListItem>
                                                        <asp:ListItem Value="Guarderia">Guarderia</asp:ListItem>
                                                        <asp:ListItem Value="Especial">Especial</asp:ListItem>
                                                        <asp:ListItem Value="Regular">Regular</asp:ListItem>
                                                    </asp:DropDownList>
                                                </div>
                                            </div>--%>
                                            <%-- 7- Cuidador Principal--%>
                                            <div class="control-group">
                                                <label for="lblCuidadoPrincipal" class="control-label col-sm-6">
                                                    Cuidador Principal</label>
                                                <div class="controls">
                                                    <input type="text" name="txtcuidadoprincipal" id="txtcuidadoprincipal"
                                                        placeholder="Digite Aqui" runat="server" class="form-control" disabled>
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

                                            <%-- 5- Con Quien Reside--%>
                                            <div class="control-group">
                                                <label for="lblConQuienReside" class="control-label col-sm-2">
                                                    Con Quien Reside el Niño?</label>
                                                <div class="controls">
                                                    <input type="text" name="txtConQuienReside" id="txtConQuienReside"
                                                        placeholder="Digite Aqui" runat="server" class="form-control" disabled>
                                                </div>
                                            </div>
                                            <%-- 4- Fecha evaluacion--%>
                                            <div class="control-group">
                                                <label for="lblfechaevaluacion" class="control-label col-sm-2">
                                                    Fecha evaluación</label>
                                                <div class="controls">
                                                    <input type="text" name="txtfechaevaluacion" id="txtfechaevaluacion" placeholder="Digite Aqui" class="form-control" disabled runat="server">
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <%--DATOS Objetivos trabajados durante las sesiones--%>
                        <div class="row-fluid">
                            <div class="span12">
                                <div class="box box-color box-bordered">
                                    <div class="box-title box-color">
                                        <h3>
                                            <i class="icon-reorder"></i>
                                            Objetivos trabajados durante las sesiones
                                        </h3>
                                    </div>
                                    <div class="box-content nopadding">
                                        <div class='form-horizontal form-striped'>
                                            <%--Tipo--%>
                                            <div class="control-group">
                                                <label for="cmbTipoOBJ" class="control-label">
                                                    <strong>Área</strong></label>
                                                <div class="controls">
                                                    <asp:DropDownList ID="cmbTipoOBJ" runat="server" CssClass="select2-me input-block-level"
                                                        data-rule-required="true" AutoPostBack="True" OnSelectedIndexChanged="_FillObj">
                                                    </asp:DropDownList>

                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="box-content nopadding">

                                        <div class="row">
                                            <div class="col-sm-6">
                                                <div class="control-group">
                                                    <div class="span12">
                                                        <div class="box box-color box-bordered">
                                                            <div class="box-title">
                                                                <h3>Objetivos</h3>
                                                            </div>
                                                            <div class="box-content nopadding"> 
                                                                <table class="dataTable dataTable-scroll-x dataTable-tools">
                                                                    <thead>
                                                                        <tr>

                                                                            <th class="hidden-1024">Objetivos
                                                                            </th>

                                                                            <th style="width: 1%;">Acciones
                                                                            </th>
                                                                        </tr>
                                                                    </thead>
                                                                    <tbody>


                                                                        <asp:Repeater ID="rpActividades" runat="server">
                                                                            <ItemTemplate>
                                                                                <tr>
                                                                                    <td>
                                                                                        <%# Eval("NOMBRE")%>
                                                                                    </td>

                                                                                    <td>
                                                                                        <asp:LinkButton ID="bntSave" CssClass="btn btn-green" runat="server" CommandArgument='<%# Eval("ROWGUID")%>' CommandName='<%# Eval("NOMBRE")%>' OnClick="_SaveObjetivos"> 
                                                                                                
                                                                                                <i class="icon-ok"></i>
                                                                                        </asp:LinkButton>

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
                                            <div class="col-sm-6">
                                                <div class="control-group">
                                                    <div class="span12">
                                                        <div class="box box-color box-bordered green">
                                                            <div class="box-title">
                                                                <h3>Objetivos Agregados</h3>
                                                            </div>
                                                            <div class="box-content nopadding">
                                                                <table class="dataTable dataTable-scroll-x dataTable-tools">
                                                                    <thead>
                                                                        <tr>

                                                                            <th class="hidden-1024">Objetivos
                                                                            </th>
                                                                            <th style="width: 1%;">Acciones
                                                                            </th>
                                                                        </tr>
                                                                    </thead>
                                                                    <tbody>
                                                                        <asp:Repeater ID="rpAsignadas" runat="server">
                                                                            <ItemTemplate>
                                                                                <tr>
                                                                                    <td>
                                                                                        <%# Eval("NOMBRE")%> 
                                                                                    </td>

                                                                                    <td>
                                                                                        <asp:LinkButton ID="btnDelete" CssClass="btn btn-red" runat="server" CommandArgument='<%# Eval("ROWGUID")%>' OnClick="_DeleteObjetivos">  
                                                                    <i class="icon-remove"></i>
                                                                                        </asp:LinkButton>
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
                            </div>
                        </div>
                    </div>
                </div>

            </div>
    </div>
    <%--DATOS DE LA RETROALIMENTACION--%>
    <div class="col-sm-12">
        <div class="box box-color box-bordered">
            <div class="box-title box-color">
                <h3><i class="icon-edit"></i>Datos de la Retroalimentación</h3>
            </div>
            <div>
                <div class="box-content nopadding">
                    <div class='form-vertical form-column form-bordered'>
                      <div class="box box-color box-bordered">
                <div class="box box-color box-bordered">
                    <div>
                        <%--<div class="box-title  box-color">
                            <h3><i class="icon-edit"></i>Entrevista Inicial a Padres</h3>
                        </div>--%>
                        <div class="box-content nopadding">
                            <div class='form-horizontal form-column form-bordered'>
                                <table id="tbevaluacion" class="table table-bordered dataTable dataTable-grouping" data-page-length="100" lang="es-DO">
                                    <thead>
                                        <tr>
                                            <th>Descripcion</th>
                                            <th>Descripcion</th>
                                            <th>Puntuación</th> 
                                            <th style="display: none;"></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <asp:Repeater ID="rpevaluacion" runat="server">
                                            <ItemTemplate>
                                                <td class="hidden-480"><strong><%# Eval("TITULO")%></strong></td>
                                                <td class="hidden-480"><%# Eval("Actividad")%></td>
                                                <td class="hidden-480">
                                                    <asp:DropDownList ID="ddlDATO" CssClass="input-medium" runat="server" SelectedValue='<%# Eval("DATO")%>'>
                                                        <asp:ListItem Value="">-- Seleccione --</asp:ListItem> 
                                                        <asp:ListItem Value="SI">SI</asp:ListItem>
                                                        <asp:ListItem Value="NO">NO</asp:ListItem>
                                                    </asp:DropDownList>
                                                </td> 
                                                <td class="hidden-480" style="display: none;">
                                                    <asp:Label ID="lblCODIGO" runat="server" Text='<%# Eval("CODIGO")%>'></asp:Label></td>
                                                </tr>
                                            </ItemTemplate>
                                        </asp:Repeater>
                                    </tbody>
                                </table>
                                <%--           <script type="text/javascript" class="init">

                                    $(document).ready(function () {
                                        $('#tbevaluacion').DataTable({
                                            "paging": false,
                                            "ordering": false,
                                            "info": false
                                        });
                                    });

                                </script>--%>
                                <script type="text/javascript">

                                    $.extend(true, $.fn.dataTable.defaults, {
                                        // "searching": false,
                                        // "ordering": false,
                                        "paging": false
                                    });

                                    $(document).ready(function () {
                                        $('#tbevaluacion').DataTable();
                                    });
                                </script>

                            </div>
                        </div>
                    </div>
                </div>
            </div>

<%--MELVIN--%>
<div class="col-sm-12">
                                <%-- Pregunta 12--%>
                                <%--<div class="control-group">
                                    <label for="lblCualesmayorespreocupaciones">
                                        ¿Entiende que esta terapia debe permanecer como servicio prioritario?  
                                    </label>
                                    <div class="controls">
                                        <textarea runat="server" name="txtentiendeterapia" id="txtentiendeterapia" rows="2" class="input-block-level" data-rule-required="true" placeholder="Digite Aqui"></textarea>
                                    </div>
                                </div>--%>
                                <%-- Pregunta 13--%>
                                <div class="control-group">
                                    <label for="lblComosecomunica">
                                        Observaciones o recomendaciones para la familia y el/la usuario/a:</label>
                                    <div class="controls">
                                        <textarea runat="server" name="txtRecomendaciones" id="txtRecomendaciones" rows="6" class="input-block-level" data-rule-required="true" placeholder="Digite Aqui"></textarea>
                                    </div>
                                </div>
                                <%-- Pregunta 14--%>
                                <%--<div class="control-group">
                                    <label for="lblQueactividadesrealiza">
                                        Referimientos  que surgieron durante este proceso.</label>
                                    <div class="controls">
                                        <textarea runat="server" name="txtReferimientos" id="txtReferimientos" rows="2" class="input-block-level" data-rule-required="true" placeholder="Digite Aqui"></textarea>
                                    </div>
                                </div>--%>
                            </div>
                    </div>
                </div>
            </div>

        </div>
    </div>

    </asp:Panel>

    </div>

</asp:Content>

