<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true"
    CodeBehind="EvaluacionInicialABLLS.aspx.cs" Inherits="CAID_V2.forms.EvaluacionInicialABLLS" %>

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
                                <i class="icon-reorder"></i>Historico de la Evaluación Inicial ABLLS                                 
                            </h3> 
                                <div class="actions">
                                    <button type="button" id="btnadd" runat="server"
                                    class="btn btn-default" data-dismiss="modal" onserverclick="_Nuevo">
                                    <i class="icon-plus-sign"></i>&nbsp Nuevo</button>
                                    <button type="button" id="btnregresar" runat="server" validationgroup="pnlEdit"
                                        class="btn btn-default" data-dismiss="modal" onserverclick="_BackMain">
                                        <%----%>
                                        <i class="icon-arrow-left"></i>&nbsp Regresar</button>
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

        <%-- formulario principal --%>
        <%-- DATOS PERSONALES--%>
        <asp:Panel runat="server" ID="pnlData" Visible="false">
            <div class="row-fluid">
                <asp:Repeater ID="RPPAXHEADER" runat="server">
                    <ItemTemplate>
                        <%# Eval("HTML")%>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
            <%--DATOS DE LAS Actividades de aprendizaje de la vida diaria--%>
            <div class="row-fluid" id="pndetalleevaluacion" runat="server">
                <%--DATOS DE LAS Entrevista Inicial a Padres --%>
                <div class="row-fluid" id="Div1" runat="server">
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
                                                            <input runat="server" name="txtNivelAcademico" id="txtNivelAcademico" rows="1" class="input-block-level" data-rule-required="true" placeholder="Digite Aqui">
                                                        </div>
                                                    </div>
                                                    <%--2-CI:--%>
                                                    <div class="control-group">
                                                        <label for="lblNivelAcademico" class="control-label col-sm-2">
                                                            CI</label>
                                                        <div class="controls">
                                                            <input runat="server" name="txtCI" id="txtCI" rows="1" class="input-block-level" data-rule-required="true" placeholder="Digite Aqui">
                                                        </div>
                                                    </div>
                                                    <%--3-OTRAS CONDICIONES MÉDICAS:  --%>
                                                    <div class="control-group">
                                                        <label for="lblNivelAcademico" class="control-label col-sm-2">
                                                            OTRAS CONDICIONES</label>
                                                        <div class="controls">
                                                            <input runat="server" name="txtOTRASCONDICIONESMEDICAS" id="txtOTRASCONDICIONESMEDICAS" rows="1" class="input-block-level" data-rule-required="true" placeholder="OTRAS CONDICIONES MÉDICAS">
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-sm-6">
                                                    <%--1-Centro educativo --%>
                                                    <div class="control-group">
                                                        <label for="lblCentroeducativo" class="control-label col-sm-2">
                                                            Centro educativo</label>
                                                        <div class="controls">
                                                            <input runat="server" name="txtCentroeducativo " id="txtCentroeducativo" rows="1" class="input-block-level" data-rule-required="true" placeholder="Digite Aqui">
                                                        </div>
                                                    </div>
                                                    <%--2-OTRAS PRUEBAS ESTANDARIZADAS: --%>
                                                    <div class="control-group">
                                                        <label for="lblNivelAcademico" class="control-label col-sm-2">
                                                            OTRAS PRUEBAS</label>
                                                        <div class="controls">
                                                            <input runat="server" name="txtOTRASPRUEBASESTANDARIZADAS" id="txtOTRASPRUEBASESTANDARIZADAS" rows="1" class="input-block-level" data-rule-required="true" placeholder="OTRAS PRUEBAS ESTANDARIZADAS">
                                                        </div>
                                                    </div>
                                                    <%--3-CONDUCTAS OBSERVADAS DURANTE LA PRUEBA:   --%>
                                                    <div class="control-group">
                                                        <label for="lblNivelAcademico" class="control-label col-sm-2">
                                                            CONDUCTAS OBSERVADAS</label>
                                                        <div class="controls">
                                                            <textarea runat="server" name="txtCONDUCTASOBSERVADASDURANTEPRUEBA" id="txtCONDUCTASOBSERVADASDURANTEPRUEBA" rows="2" class="input-block-level" data-rule-required="true" placeholder="CONDUCTAS OBSERVADAS DURANTE LA PRUEBA"> </textarea>
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

                <div class="box box-color box-bordered">
                    <div>
                        <div class="box-title">
                            <h3>
                                <i class="icon-edit"></i>Evaluación Inicial ABLLS</h3>
                        </div>
                        <div class="box-content nopadding">
                            <div class='form-horizontal form-bordered'>
                                <table id="tbevaluacion" class="table table-bordered dataTable dataTable-grouping" data-page-length="100" lang="es-DO">
                                    <thead>
                                        <tr> 
                                            <th>Actividad</th>
                                            <th>AREA/Actividad</th>
                                            <th>Si/No</th>
                                            <th>Descripción del Criterio</th>
                                             <th>Criterio</th>
                                            <th>Observación</th>
                                            <th style="display: none;"></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <asp:Repeater ID="rpevaluacion" runat="server">
                                            <ItemTemplate>
                                                <td class="hidden-480"><strong><%# Eval("TITULO")%></strong></td>
                                                <td class="hidden-480"><%# Eval("Actividad")%></td>
                                                <td class="hidden-480">
                                                    <asp:DropDownList ID="ddlDATO" CssClass="input-small" runat="server" SelectedValue='<%# Eval("DATO")%>'>
                                                        <asp:ListItem Value="">N/A</asp:ListItem>
                                                        <asp:ListItem Value="SI">SI</asp:ListItem>
                                                        <asp:ListItem Value="NO">NO</asp:ListItem>
                                                    </asp:DropDownList>
                                                </td>
                                                <td class="hidden-480"><%# Eval("CRITERIO")%></td>
                                                 <td class="hidden-480">
                                                    <asp:DropDownList ID="ddlCRITERIODATO" CssClass="input-small" runat="server" SelectedValue='<%# Eval("Criteriodato")%>'>
                                                        <asp:ListItem Value="">N/A</asp:ListItem>
                                                        <asp:ListItem Value="1">1</asp:ListItem>
                                                        <asp:ListItem Value="2">2</asp:ListItem>
                                                        <asp:ListItem Value="3">3</asp:ListItem>
                                                        <asp:ListItem Value="4">4</asp:ListItem>
                                                    </asp:DropDownList>
                                                </td>
                                                <td class="hidden-480">
                                                    <asp:TextBox ID="txtObservacion" CssClass="input-xlarge" Text='<%# Eval("OBSERVACION")%>' runat="server" placeholder="Digite Aqui" class="form-control" Style="text-align: left;"></asp:TextBox>
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
        </asp:Panel>

    </div>


</asp:Content>

