﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true"
    CodeBehind="ActividadesVidaDiaria.aspx.cs" Inherits="CAID_V2.forms.ActividadesVidaDiaria" %>

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
                                <i class="icon-reorder"></i>Historico de Actividades de aprendizaje de la vida diaria                                 
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
                <div class="col-sm-12">
                    <div class="box box-color box-bordered">
                        <div>
                            <div class="box-title">
                                <h3>
                                    <i class="icon-edit"></i>Actividades de aprendizaje de la vida diaria</h3>
                                <div class="actions">

                                    <%--<a href="#" class="btn btn-mini content-refresh"><i class="icon-refresh"></i></a>--%>
                                    <div class="actions">
                                        <button type="button" id="tbnAdd" runat="server"
                                            class="btn btn-default" data-dismiss="modal" onserverclick="_Save">
                                            <%----%>
                                            <i class="icon-plus-sign"></i>&nbsp Guardar</button>
                                        <button type="button" id="btnregresar" runat="server" validationgroup="pnlEdit"
                                            class="btn btn-default" data-dismiss="modal" onserverclick="_Back">
                                            <%----%>
                                            <i class="icon-arrow-left"></i>&nbsp Regresar</button>
                                        <a href="#" class="btn btn-mini content-slideUp"><i class="icon-angle-down"></i></a>
                                    </div>

                                </div>
                            </div>

                            <div class='form-horizontal form-bordered'>

                                <table id="tbevaluacion" class="table table-bordered dataTable dataTable-grouping" data-page-length="100" lang="es-DO">
                                    <thead>
                                        <tr>
                                            <th>Habilidad</th>
                                            <th>Habilidad</th>
                                            <th>Puntuación</th>
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
                                                    <asp:DropDownList ID="ddlDATO" CssClass="input-medium" runat="server" SelectedValue='<%# Eval("DATO")%>'>
                                                        <asp:ListItem Value="">-- Seleccione --</asp:ListItem>
                                                        <asp:ListItem Value="+">+ Independiente</asp:ListItem>
                                                        <asp:ListItem Value="AF">AF: Ayuda Física</asp:ListItem>
                                                        <asp:ListItem Value="AP">AP: Ayuda Posicional</asp:ListItem>
                                                        <asp:ListItem Value="AG">AG: Ayuda Gestual</asp:ListItem>
                                                        <asp:ListItem Value="AV">AV: Ayuda Verbal</asp:ListItem>
                                                        <asp:ListItem Value="NH">No lo hace</asp:ListItem>
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
                                        "paging" : false
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

