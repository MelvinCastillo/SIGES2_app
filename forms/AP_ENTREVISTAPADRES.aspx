<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true"
    CodeBehind="AP_ENTREVISTAPADRES.aspx.cs" Inherits="CAID_V2.forms.AP_ENTREVISTAPADRES" %>

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
                background-color: dodgerblue;
                color: white;
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
                                <i class="icon-reorder"></i>Entrevista Inicial a Padres                                
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
        <%-- DATOS PERSONALES--%>
        <asp:Panel runat="server" ID="pnlData" Visible="false">
            <div class="row-fluid">
                <asp:Repeater ID="RPPAXHEADER" runat="server">
                    <ItemTemplate>
                        <%# Eval("HTML")%>
                    </ItemTemplate>
                </asp:Repeater>
            </div>

            <%--DATOS DE LAS Entrevista Inicial a Padres --%>
            <div class="row-fluid" id="pndetalleevaluacion" runat="server">
                <%-- DATOS PERSONALES--%>
                <div class="row">
                    <div class="col-sm-12">
                        <div class="box box-color box-bordered">
                            <div class="box-title box-color">
                                <h3><i class="fa fa-list"></i>1. Datos Personales</h3>
                                <div class="actions">
                                    <button type="button" id="Button2" runat="server" validationgroup="pnlEdit"
                                        class="btn btn-default" data-dismiss="modal" onserverclick="_Save">
                                        <i class="icon-plus-sign"></i>&nbsp Guardar</button>
                                    <button type="button" id="Button3" runat="server" validationgroup="pnlEdit"
                                        class="btn btn-default" data-dismiss="modal" onserverclick="_Back">
                                        <i class="icon-arrow-left"></i>&nbsp Regresar</button>

                                </div>
                            </div>
                            <div>
                                <div class="box-content nopadding">
                                    <div class='form-horizontal form-column form-bordered'>
                                        <div class="row">
                                            <div class="col-sm-6">
                                                <%--1-Nivel Académico:--%>
                                                <div class="control-group">
                                                    <label for="lblNivelAcademico" class="control-label col-sm-2">
                                                        Nivel Académico:</label>
                                                    <div class="controls">
                                                        <textarea runat="server" name="txtNivelAcademico" id="txtNivelAcademico" rows="1" class="input-block-level" data-rule-required="true" disabled placeholder="Digite Aqui"></textarea>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-sm-6">
                                                <%--2-Centro educativo --%>
                                                <div class="control-group">
                                                    <label for="lblCentroeducativo" class="control-label col-sm-2">
                                                        Centro educativo</label>
                                                    <div class="controls">
                                                        <textarea runat="server" name="txtCentroeducativo " id="txtCentroeducativo" rows="1" class="input-block-level" data-rule-required="true" disabled placeholder="Digite Aqui"></textarea>
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
            </div>
            <%-- I. Información General--%>
            <div class="row">
                <div class="col-sm-12">
                    <div class="box box-color box-bordered">
                        <div class="box-title box-color">
                            <h3><i class="fa fa-list"></i>2.Información General</h3>
                        </div>
                        <div>
                            <div class="box-content nopadding">
                                <div class='form-horizontal form-column form-bordered'>
                                    <div class="row">
                                        <div class="col-sm-6">
                                            <%-- Personas en Sesión --%>
                                            <div class="control-group">
                                                <label class="control-label" style="font-size: small;">
                                                    Personas en Sesión</label>
                                                <div class="controls">
                                                    <select runat="server" id="cmbPersonaSesion" name="cmbPersonaSesion" class='select2-me input-xlarge'>
                                                        <option value="">-- SELECCIONE --</option>
                                                        <option value="Abuela Materna">Abuela Materna</option>
                                                        <option value="Abuelo Materno">Abuelo Materno</option>
                                                        <option value="Abuela Paterna">Abuela Paterna</option>
                                                        <option value="Abuelo Paterno">Abuelo Paterno</option>
                                                        <option value="Ambos Padres">Ambos Padres</option>
                                                        <option value="Hermanos">Hermanos</option>
                                                        <option value="Familiar">Familiar</option>
                                                        <option value="Madre">Madre</option>
                                                        <option value="Maestra acompañante">Maestra acompañante</option>
                                                        <option value="Nana">Nana</option>
                                                        <option value="Padre">Padre</option>
                                                        <option value="Tío/a">Tío/a</option>
                                                        <option value="Tutor/a">Tutor/a</option>
                                                        <option value="Otros">Otros</option>
                                                    </select>
                                                    &nbsp
                                    <input runat="server" name="txtPersonaSesionNombre" id="txtPersonaSesionNombre" type="text" class="input-xxlarge">
                                                </div>
                                            </div>
                                            <%--1-Dificultades del niño/a--%>
                                            <div class="control-group">
                                                <label for="lblNivelAcademico" class="control-label col-sm-2">
                                                    Dificultades del niño/a</label>
                                                <div class="controls">
                                                    <textarea runat="server" name="txtDificultadesdelnino" id="txtDificultadesdelnino" rows="1" class="input-block-level" data-rule-required="true" placeholder="Digite Aqui"></textarea>
                                                </div>
                                            </div>
                                            <%--2-¿En qué curso está actualmente?--%>
                                            <div class="control-group">
                                                <label for="lblNivelAcademico" class="control-label col-sm-2">
                                                    ¿En qué curso está actualmente?</label>
                                                <div class="controls">
                                                    <textarea runat="server" name="txtCursoactualmente" id="txtCursoactualmente" rows="1" class="input-block-level" data-rule-required="true" placeholder="Digite Aqui"></textarea>
                                                </div>
                                            </div>
                                            <%--3-¿Por qué? (Si difiere el curso con la edad)--%>
                                            <div class="control-group">
                                                <label for="lblNivelAcademico" class="control-label col-sm-2">
                                                    ¿Por qué? (Si difiere el curso con la edad)</label>
                                                <div class="controls">
                                                    <textarea runat="server" name="txtPorqueDifiereCurso" id="txtPorqueDifiereCurso" rows="1" class="input-block-level" data-rule-required="true" placeholder="Digite Aqui"></textarea>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-sm-6">
                                            <%--1-Año en que entró a un centro educativo --%>
                                            <div class="control-group">
                                                <label for="lblCentroeducativo" class="control-label col-sm-2">
                                                    Año en que entró a un centro educativo</label>
                                                <div class="controls">
                                                    <textarea runat="server" name="txtAnioEntroCentroEducativo" id="txtAnioEntroCentroEducativo" rows="1" class="input-block-level" data-rule-required="true" placeholder="Digite Aqui"></textarea>
                                                </div>
                                            </div>
                                            <%--2-Atención/ Terapia previa  --%>
                                            <div class="control-group">
                                                <label for="lblCentroeducativo" class="control-label col-sm-2">
                                                    Atención/ Terapia previa</label>
                                                <div class="controls">
                                                    <textarea runat="server" name="txtAtencionTerapiaprevia" id="txtAtencionTerapiaprevia" rows="1" class="input-block-level" data-rule-required="true" placeholder="Digite Aqui"></textarea>
                                                </div>
                                            </div>
                                            <%--3-Expectativas de los padres --%>
                                            <div class="control-group">
                                                <label for="lblCentroeducativo" class="control-label col-sm-2">
                                                    Expectativas de los padres</label>
                                                <div class="controls">
                                                    <textarea runat="server" name="txtExpectativasdelospadres" id="txtExpectativasdelospadres" rows="1" class="input-block-level" data-rule-required="true" placeholder="Digite Aqui"></textarea>
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
            <%--  Informaciones: II.	Habilidades, III.	Autonomía e Independencia, VII.	Familia / Manejo de la disciplina  --%>
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
                                            <th>Observación</th>
                                            <th></th>
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
                                                        <asp:ListItem Value="Siempre">Siempre</asp:ListItem>
                                                        <asp:ListItem Value="A veces">A veces</asp:ListItem>
                                                        <asp:ListItem Value="Rara vez">Rara vez</asp:ListItem>
                                                        <asp:ListItem Value="Nunca">Nunca</asp:ListItem>
                                                        <asp:ListItem Value="SI">SI</asp:ListItem>
                                                        <asp:ListItem Value="NO">NO</asp:ListItem>
                                                    </asp:DropDownList>
                                                </td>
                                                <td class="hidden-480">
                                                    <asp:TextBox ID="txtObservacion" CssClass="input-xxlarge" Text='<%# Eval("OBSERVACION")%>' runat="server" placeholder="Digite Aqui" class="form-control" Style="text-align: left;"></asp:TextBox>
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
            <%-- IV.	Comunicación y relación --%>
            <div class="row">
                <div class="col-sm-12">
                    <div class="box box-color box-bordered">
                        <div class="box-title box-color">
                            <h3><i class="fa fa-list"></i>IV. Comunicación y Relación </h3>
                        </div>
                        <div>
                            <div class="box-content nopadding">
                                <div class='form-horizontal form-column form-bordered'>
                                    <div class="row">
                                        <div class="col-sm-6">
                                            <%--1-Habilidades sociales (relación con sus compañeros y adultos)--%>
                                            <div class="control-group">
                                                <label for="lblNivelAcademico" class="control-label col-sm-2">
                                                    Habilidades sociales</label>
                                                <div class="controls">
                                                    <textarea runat="server" name="txtHabilidadessociales" id="txtHabilidadessociales" rows="4" class="input-block-level" data-rule-required="true" placeholder="Habilidades sociales (relación con sus compañeros y adultos)"></textarea>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-sm-6">
                                            <%--1--	¿Cómo se comunica su hijo?  --%>
                                            <div class="control-group">
                                                <label for="lblCentroeducativo" class="control-label col-sm-2">
                                                    ¿Cómo se comunica su hijo?
                                                </label>
                                                <div class="controls">
                                                    <textarea runat="server" name="txtComosecomunicasuhijo" id="txtComosecomunicasuhijo" rows="4" class="input-block-level" data-rule-required="true" placeholder="¿Cómo se comunica su hijo? "></textarea>
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

            <%-- V. Rutinas --%>
            <div class="row">
                <div class="col-sm-12">
                    <div class="box box-color box-bordered">
                        <div class="box-title box-color">
                            <h3><i class="fa fa-list"></i>V. Rutinas</h3>
                        </div>
                        <div>
                            <div class="box-content nopadding">
                                <div class='form-horizontal form-column form-bordered'>
                                    <div class="row">
                                        <div class="col-sm-6">
                                            <%--1--	Sueño--%>
                                            <div class="control-group">
                                                <label for="lblNivelAcademico" class="control-label col-sm-2">
                                                    Sueño</label>
                                                <div class="controls">
                                                    <div>
                                                        <label><strong>Horario &nbsp&nbsp&nbsp&nbsp</strong></label>
                                                        <input runat="server" type="text" name="txtSuenoHorario" id="txtSuenoHorario" class="input-medium">
                                                    </div>
                                                    <div>
                                                        <label><strong>Pesadillas</strong> </label>
                                                        <input runat="server" type="text" name="txtSuenoPesadillas" id="txtSuenoPesadillas" class="input-medium">
                                                    </div>
                                                </div>
                                            </div>
                                            <%--2- Responsabilidades    --%>
                                            <div class="control-group">
                                                <label for="lblCentroeducativo" class="control-label col-sm-2">
                                                    Responsabilidades  
                                                </label>
                                                <div class="controls">
                                                    <textarea runat="server" name="txtResponsabilidades" id="txtResponsabilidades" rows="4" class="input-block-level" data-rule-required="true" placeholder="Digite Aqui"></textarea>
                                                </div>
                                            </div>
                                            <%--3- Aceptación a texturas nuevas --%>
                                            <div class="control-group">
                                                <label for="lblCentroeducativo" class="control-label col-sm-2">
                                                    Aceptación a texturas nuevas   
                                                </label>
                                                <div class="controls">
                                                    <textarea runat="server" name="txtAceptacionatexturasnuevas" id="txtAceptacionatexturasnuevas" rows="4" class="input-block-level" data-rule-required="true" placeholder="Digite Aqui"></textarea>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-sm-6">
                                            <%--1--	Alimentación  --%>
                                            <div class="control-group">
                                                <label for="lblCentroeducativo" class="control-label col-sm-2">
                                                    Alimentación 
                                                </label>
                                                <div class="controls">
                                                    <textarea runat="server" name="txtAlimentacion" id="txtAlimentacion" rows="4" class="input-block-level" data-rule-required="true" placeholder="Digite Aqui"></textarea>
                                                </div>
                                            </div>
                                            <%--2-Aceptación a cambios y exploración de lugares nuevos   --%>
                                            <div class="control-group">
                                                <label for="lblCentroeducativo" class="control-label col-sm-2">
                                                    Aceptación a cambios
                                                </label>
                                                <div class="controls">
                                                    <textarea runat="server" name="txtAceptacionacambios" id="txtAceptacionacambios" rows="4" class="input-block-level" data-rule-required="true" placeholder="Aceptación a cambios y exploración de lugares nuevos"></textarea>
                                                </div>
                                            </div>
                                            <%--3-Aceptación a ensuciarse  --%>
                                            <div class="control-group">
                                                <label for="lblCentroeducativo" class="control-label col-sm-2">
                                                    Aceptación a ensuciarse   
                                                </label>
                                                <div class="controls">
                                                    <textarea runat="server" name="txtAceptacionaensuciarse" id="txtAceptacionaensuciarse" rows="4" class="input-block-level" data-rule-required="true" placeholder="Digite Aqui"></textarea>
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

            <%--VI.	Juego --%>
            <div class="row">
                <div class="col-sm-12">
                    <div class="box box-color box-bordered">
                        <div class="box-title box-color">
                            <h3><i class="fa fa-list"></i>VI. Juego</h3>
                        </div>
                        <div>
                            <div class="box-content nopadding">
                                <div class='form-horizontal form-bordered'>
                                    <div class="row">
                                        <div class="col-sm-6">
                                            <%--1--	¿Cómo se entretiene? --%>
                                            <div class="control-group">
                                                <label class="control-label col-sm-12">¿Cómo se entretiene?</label>
                                                <div class="controls">
                                                    <label>Televisión </label>
                                                    <asp:DropDownList ID="ddlComoseentretieneTelevision" CssClass="input-small" runat="server">
                                                        <asp:ListItem Value="">N/A</asp:ListItem>
                                                        <asp:ListItem Value="SI">SI</asp:ListItem>
                                                        <asp:ListItem Value="NO">NO</asp:ListItem>
                                                    </asp:DropDownList>
                                                    </br>
                                                    <label>Pelota &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</label>
                                                    <asp:DropDownList ID="ddlComoseentretienePelota" CssClass="input-small" runat="server">
                                                        <asp:ListItem Value="">N/A</asp:ListItem>
                                                        <asp:ListItem Value="SI">SI</asp:ListItem>
                                                        <asp:ListItem Value="NO">NO</asp:ListItem>
                                                    </asp:DropDownList>
                                                    </br>
                                                    <label>Juguetes &nbsp</label>
                                                    <asp:DropDownList ID="ddlComoseentretieneJuguetes" CssClass="input-small" runat="server">
                                                        <asp:ListItem Value="">N/A</asp:ListItem>
                                                        <asp:ListItem Value="SI">SI</asp:ListItem>
                                                        <asp:ListItem Value="NO">NO</asp:ListItem>
                                                    </asp:DropDownList>
                                                    </br>
                                                    <label>Observar Objetos</label>
                                                    <asp:DropDownList ID="ddlComoseentretieneObservarobjetos" CssClass="input-small" runat="server">
                                                        <asp:ListItem Value="">N/A</asp:ListItem>
                                                        <asp:ListItem Value="SI">SI</asp:ListItem>
                                                        <asp:ListItem Value="NO">NO</asp:ListItem>
                                                    </asp:DropDownList>
                                                    </br>
                                                    <label>Otros&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</label>
                                                    <asp:DropDownList ID="ddlComoseentretieneOtros" CssClass="input-small" runat="server">
                                                        <asp:ListItem Value="">N/A</asp:ListItem>
                                                        <asp:ListItem Value="SI">SI</asp:ListItem>
                                                        <asp:ListItem Value="NO">NO</asp:ListItem>
                                                    </asp:DropDownList>
                                                </div>
                                            </div>
                                            <%--2--	Aire libre (¿Qué juega?)   --%>
                                            <div class="control-group">
                                                <label for="lblCentroeducativo" class="control-label col-sm-2">
                                                    Aire libre (¿Qué juega?) 
                                                </label>
                                                <div class="controls">
                                                    <textarea runat="server" name="txtComoseentretieneAireLibre" id="txtComoseentretieneAireLibre" rows="4" class="input-block-level" data-rule-required="true" placeholder="Digite Aqui"></textarea>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-sm-6">
                                            <%--1-- ¿Suele jugar solo o acompañado? --%>
                                            <div class="control-group">
                                                <label for="lblCentroeducativo" class="control-label col-sm-2">
                                                    ¿Suele jugar solo o acompañado?
                                                </label>
                                                <div class="controls">
                                                    <textarea runat="server" name="txtSuelejugarsolooacompanado" id="txtSuelejugarsolooacompanado" rows="4" class="input-block-level" data-rule-required="true" placeholder="Digite Aqui"></textarea>
                                                </div>
                                            </div>
                                            <%--2- Actividades extracurriculares  --%>
                                            <div class="control-group">
                                                <label for="lblCentroeducativo" class="control-label col-sm-2">
                                                    Actividades extracurriculares
                                                </label>
                                                <div class="controls">
                                                    <textarea runat="server" name="txtActividadesextracurriculares" id="txtActividadesextracurriculares" rows="4" class="input-block-level" data-rule-required="true" placeholder="Digite Aqui"></textarea>
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

            <%--VII. Familia / Manejo de la disciplina  --%>
            <div class="row">
                <div class="col-sm-12">
                    <div class="box box-color box-bordered">
                        <div class="box-title box-color">
                            <h3><i class="fa fa-list"></i>VII. Familia / Manejo de la disciplina  </h3>
                        </div>
                        <div>
                            <div class="box-content nopadding">
                                <div class='form-horizontal form-bordered'>
                                    <div class="row">
                                        <div class="col-sm-6">
                                            <%--1-- Reacción del adulto ante las conductas que les preocupan  --%>
                                            <div class="control-group">
                                                <label class="control-label col-sm-12">Reacción del adulto</label>
                                                <div class="controls">
                                                    <textarea runat="server" name="txtReacciondeladulto" id="txtReacciondeladulto" rows="4" class="input-block-level" data-rule-required="true" placeholder="Reacción del adulto ante las conductas que les preocupan"></textarea>
                                                </div>
                                            </div>
                                            <%--2-- Menú de reforzadores   --%>
                                            <div class="control-group">
                                                <label for="lblCentroeducativo" class="control-label col-sm-2">
                                                    Menú de reforzadores  
                                                </label>
                                                <div class="controls">
                                                    <label>Comestibles</label>
                                                    <textarea runat="server" name="txtComestibles" id="txtComestibles" rows="1" class="input-block-level" data-rule-required="true" placeholder="Digite Aqui"></textarea>
                                                    <label>Materiales</label>
                                                    <textarea runat="server" name="txtMateriales" id="txtMateriales" rows="1" class="input-block-level" data-rule-required="true" placeholder="Digite Aqui"></textarea>
                                                </div>
                                            </div>


                                        </div>
                                        <div class="col-sm-6">
                                            <%--1-- -	Consecuencias que aplican --%>
                                            <div class="control-group">
                                                <label for="lblCentroeducativo" class="control-label col-sm-2">
                                                    Consecuencias que aplican
                                                </label>
                                                <div class="controls">
                                                    <textarea runat="server" name="txtConsecuenciasqueaplican" id="txtConsecuenciasqueaplican" rows="4" class="input-block-level" data-rule-required="true" placeholder="Digite Aqui"></textarea>
                                                </div>
                                            </div>
                                            <div class="control-group">
                                                <label class="control-label col-sm-2">Afectivo / sociales </label>
                                                <div class="controls">
                                                    <textarea runat="server" name="txtAfectivosociales" id="txtAfectivosociales" rows="1" class="input-block-level" data-rule-required="true" placeholder="Digite Aqui"></textarea>
                                                </div>
                                            </div>
                                            <div class="control-group">
                                                <label class="control-label col-sm-2">Otros</label>
                                                <div class="controls">
                                                    <textarea runat="server" name="txtOtrosReforzadores" id="txtOtrosReforzadores" rows="1" class="input-block-level" data-rule-required="true" placeholder="Digite Aqui"></textarea>
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

            <%--VIII.	Escuela --%>
            <div class="row">
                <div class="col-sm-12">
                    <div class="box box-color box-bordered">
                        <div class="box-title box-color">
                            <h3><i class="fa fa-list"></i>VIII.	Escuela</h3>
                        </div>
                        <div>
                            <div class="box-content nopadding">
                                <div class='form-horizontal form-bordered'>
                                    <div class="row">
                                        <div class="col-sm-6">
                                            <%--1-- Relación de los padres con la escuela   --%>
                                            <div class="control-group">
                                                <label class="control-label col-sm-12">Relación de los padres con la escuela </label>
                                                <div class="controls">
                                                    <textarea runat="server" name="txtRelacionpadresescuela" id="txtRelacionpadresescuela" rows="4" class="input-block-level" data-rule-required="true" placeholder="Digite Aqui"></textarea>
                                                </div>
                                            </div>
                                            <%--2-- -	Relación del niño con la maestra    --%>
                                            <div class="control-group">
                                                <label for="lblCentroeducativo" class="control-label col-sm-2">
                                                    Relación del niño con la maestra 
                                                </label>
                                                <div class="controls">
                                                    <textarea runat="server" name="txtRelacionninomaestra" id="txtRelacionninomaestra" rows="4" class="input-block-level" data-rule-required="true" placeholder="Digite Aqui"></textarea>
                                                </div>
                                            </div>
                                            <%--3--	Relación del niño con sus compañeros  --%>
                                            <div class="control-group">
                                                <label for="lblCentroeducativo" class="control-label col-sm-2">
                                                    Relación del niño con sus compañeros 
                                                </label>
                                                <div class="controls">
                                                    <textarea runat="server" name="txtRelacionninocompaneros" id="txtRelacionninocompaneros" rows="4" class="input-block-level" data-rule-required="true" placeholder="Digite Aqui"></textarea>
                                                </div>
                                            </div>

                                        </div>
                                        <div class="col-sm-6">

                                            <%--1--- Responsabilidades dentro del aula   --%>
                                            <div class="control-group">
                                                <label for="lblCentroeducativo" class="control-label col-sm-2">
                                                    Responsabilidades dentro del aula  
                                                </label>
                                                <div class="controls">
                                                    <textarea runat="server" name="txtResponsabilidadesdentroaula" id="txtResponsabilidadesdentroaula" rows="4" class="input-block-level" data-rule-required="true" placeholder="Digite Aqui"></textarea>
                                                </div>
                                            </div>
                                            <div class="control-group">
                                                <label class="control-label col-sm-2">Comportamiento en la escuela </label>
                                                <div class="controls">
                                                    <textarea runat="server" name="txtComportamientoescuela" id="txtComportamientoescuela" rows="4" class="input-block-level" data-rule-required="true" placeholder="Digite Aqui"></textarea>
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

