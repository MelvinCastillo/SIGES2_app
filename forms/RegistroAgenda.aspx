<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true"
    CodeBehind="RegistroAgenda.aspx.cs" Inherits="CAID.RegistroAgenda" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">
    <asp:HiddenField ID="xGUID" runat="server" />


    <%-- Resgistro de Actividades --%>  
    <asp:Panel runat="server" ID="pnlConsulta">
        <div class="box  box-bordered">
            <div class="box-title">
                <h3>Registro de Actividades</h3>
            </div>
            <div class="box-content nopadding">
                <div class='form-horizontal form-bordered'>
                    <!-- Busqueda -->
                    <div class="control-group">
                        <label for="txtFecha1" class="control-label" style="color: Red">
                            Buscar</label>
                        <div class="controls">
                            <input runat="server" name="txtBuscar" id="txtBuscar" type="text" class='input-block-level'
                                placeholder="Nombres, Apellidos, Número de Record" data-rule-required="true" />
                        </div>
                    </div>
                    <div class="control-group">
                        <label for="txtFecha1" class="control-label" style="color: Red">
                            Acciones</label>
                        <div class="controls">
                            <button type="button" id="btnNew" runat="server" onserverclick="_New" class="btn btn-primary">
                                <i class="icon-plus-sign"></i>&nbsp Nuevo</button>
                            <button id="btnShow" runat="server" onserverclick="_Show" class="btn content-refresh btn-primary">
                                <i class="icon-search"></i>&nbsp Buscar</button>
                            &nbsp
                          <button type="button" id="btnhome" runat="server" onserverclick="_BackCAID" class="btn btn-primary">
                              <i class="icon-arrow-left"></i>&nbsp Regresar</button>
                        </div>
                    </div>
                    <div class="control-group">
                        <div class="box-content nopadding">
                            <table id="tbheader" class="table table-bordered dataTable dataTable-scroll-x dataTable-tools">
                                <thead>
                                    <tr>
                                        <th>No.
                                        </th>
                                        <th>Tipo
                                        </th>
                                        <th>Descripcion Actividad
                                        </th>
                                        <th class="hidden-350">Inicio
                                        </th>
                                        <th class="hidden-350">Fin
                                        </th>
                                        <th class="hidden-480">Estado
                                        </th>
                                        <th class="hidden-480">Comentario
                                        </th>
                                        <th style="width: 1%;">Acciones
                                        </th>

                                    </tr>
                                </thead>
                                <tbody>
                                    <asp:Repeater ID="rpData" runat="server" OnItemDataBound="rpData_RowDataBound">
                                        <ItemTemplate>
                                            <tr>
                                                <td>
                                                    <%# Eval("num")%>
                                                </td>
                                                <td>
                                                    <%# Eval("DescTipo")%>
                                                </td>
                                                <td class="hidden-350">
                                                    <%# Eval("Asunto")%>
                                                </td>
                                                <td class="hidden-350">
                                                    <%# Eval("inicio")%>
                                                </td>
                                                <td class="hidden-480">
                                                    <%# Eval("fin")%>
                                                </td>
                                                <td class="hidden-480">
                                                    <%# Eval("Estatus")%>
                                                </td>
                                                <td class="hidden-480">
                                                    <%# Eval("Comentario")%>
                                                </td>
                                                <td class="hidden-480">
                                                    <asp:LinkButton ID="btnDelete" CssClass="btn btn-red" runat="server" Text="Descartar"
                                                        CommandArgument='<%# Eval("ID")%>' CommandName="Delete" OnClick="_Select"
                                                        OnClientClick="return confirm('¿Está seguro que desea descartar esta actividad?');"></asp:LinkButton>
                                                    <asp:LinkButton ID="btnAprobar" CssClass="btn btn-blue" runat="server" Text="Aprobar"
                                                        CommandArgument='<%# Eval("ID")%>' CommandName="Aprobar" OnClick="_Select"
                                                        OnClientClick="return confirm('¿Está seguro que desea aprobar esta actividad?');"></asp:LinkButton>
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
    </asp:Panel>
    <%--  Edición de Registros --%>
    <asp:Panel runat="server" ID="pnlData">
        <div class="box-content nopadding">
            <div>
                <p>
                    <button type="button" id="btnSave" runat="server" onserverclick="_Save" class="btn btn-green"
                        validationgroup="pnlData">
                        <i class="icon-save"></i>&nbsp Guardar</button>
                    <button type="button" id="btnCancel" runat="server" onserverclick="_Cancel" class="btn">
                        <i class="icon-undo"></i>&nbsp Limpiar</button>
                    <button type="button" id="btnBack" runat="server" onserverclick="_Back" class="btn">
                        <i class="icon-arrow-left"></i>&nbsp Regresar</button>
                </p>
            </div>
        </div>
        <div class="row-fluid">
            <div class="span12">
                <div class="box box-bordered">
                    <div class="box-title">
                        <h3>
                            <i class="icon-edit"></i>Registro de Agenda</h3>
                    </div>
                    <div class="row-fluid">
                        <div class="box-content nopadding">
                            <div class='form-horizontal form-bordered'>
                                <!-- Tipo Agenda -->
                                <div class="control-group">
                                    <label for="CmbTipo1" class="control-label" style="color: black">
                                        <strong>Tipo Actividad</strong></label>
                                    <div class="controls">
                                        <asp:DropDownList ID="CmbTipo" runat="server" CssClass="select2-me input-block-level"
                                            data-rule-required="true" AutoPostBack="True" OnSelectedIndexChanged="CmbTipo_SelectedIndexChanged">
                                        </asp:DropDownList>
                                        <br />
                                        <asp:RequiredFieldValidator ControlToValidate="CmbTipo" Display="Dynamic" ErrorMessage="Requerido!"
                                            ID="valCmbTipo" runat="server" SetFocusOnError="True" ValidationGroup="pnlData" />
                                    </div>
                                </div>
                                <!--Asunto-->
                                <div class="control-group">
                                    <label for="LblActividad" class="control-label" style="color: black">
                                        <strong>Descripcion de la Actividad</strong></label>
                                    <div class="controls">

                                        <input runat="server" name="TxtActividad" id="TxtActividad" type="text" class="input-xxlarge"
                                            placeholder="Especifique Breve descripcion de la actividad.." data-rule-required="true">
                                        <%--CssClass="select2-me input-block-level"--%>
                                         <asp:DropDownList ID="CmbTipoTemas" runat="server"  CssClass="select2-me input-block-level"
                                            data-rule-required="true" AutoPostBack="True" Visible="false">
                                        </asp:DropDownList>
                                        <br />
                                        <asp:RequiredFieldValidator ControlToValidate="TxtActividad" Display="Dynamic" ErrorMessage="Requerido!"
                                            ID="valTxtActividad" runat="server" SetFocusOnError="True" ValidationGroup="pnlData" />
                                    </div>
                                </div>
                                <!-- Fecha y Hora INICIO --> 
                                <script type="text/javascript" src="../calendarscript/js/language/es-DO.js"></script>
                                <link href="../calendarscript/css/bootstrap.css" rel="stylesheet" />
                                <link href="../calendarscript/css/font-awesome.min.css" rel="stylesheet" />
                                <link href="../calendarscript/css/prettify-1.0.css" rel="stylesheet" />
                                <%-- <link href="../calendarscript/css/base.css" rel="stylesheet" />--%>
                                <script type="text/javascript" src="calendarscript/js/respond.min.js"></script>
                                <link href="../calendarscript/css/bootstrap-datetimepicker.css" rel="stylesheet" />
                                <script type="text/javascript" src="../calendarscript/js/jquery-2.1.1.min.js"></script>
                                <script type="text/javascript" src="../calendarscript/js/bootstrap.min.js"></script>
                                <script type="text/javascript" src="../calendarscript/js/moment-with-locales.js"></script>
                                <script type="text/javascript" src="../calendarscript/js/bootstrap-datetimepicker.js"></script>
                                <div class="control-group">
                                    <label for="txtFechaInicio1" class="control-label" style="color: black">
                                        <strong>Fecha Inicio</strong></label>
                                    <div>
                                        <div class="controls">
                                            <%--<input runat="server" name="txtFechaInicio" id="txtFechaInicio" type="text" class="input-medium datepick"
                                            data-rule-required="true" placeholder="mm/dd/aaaa">--%>
                                            <%--<div class="row">--%>
                                            <div class='col-sm-3'>
                                                <%--    <div class="form-group">--%>
                                                <div class='input-group date' id='datetimepicker1' runat="server">
                                                    <input type='text' class="form-control" name="txtFechaInicio" id="txtFechaInicio" runat="server" data-rule-required="true" placeholder="DD/MM/YYYY" />
                                                    <span class="input-group-addon">
                                                        <span class="glyphicon glyphicon-calendar"></span>
                                                    </span>
                                                </div>
                                                <%--  </div>--%>
                                            </div>
                                            <%--<link href="../calendarscript/css/base.css" rel="stylesheet" />--%>
                                            <script type="text/javascript">
                                                $(function () {
                                                    $('#MainContent_datetimepicker1').datetimepicker({
                                                        locale: 'es-DO',//,
                                                        format: 'DD/MM/YYYY hh:mm A'//,
                                                        //daysOfWeekDisabled: [0, 6],
                                                        //inline: true,
                                                        //sideBySide: true

                                                    });
                                                });
                                            </script>
                                            <%-- </div>--%>
                                            <br />
                                            <asp:RequiredFieldValidator ControlToValidate="txtFechaInicio" Display="Dynamic" ErrorMessage="Requerido!"
                                                ID="valtxtFechaInicio" runat="server" SetFocusOnError="True" ValidationGroup="pnlData" />
                                        </div>
                                    </div>
                                </div>
                                <!--fecha y hora fin-->
                                <div class="control-group">
                                    <label for="txtFechafin1" class="control-label" style="color: black">
                                        <strong>Fecha Fin</strong></label>
                                    <div class="controls">
                                        <%--                                        <input runat="server" name="txtFechaFin" id="txtFechaFin" type="text" class="input-medium datepick"
                                            data-rule-required="true" placeholder="mm/dd/aaaa">--%>
                                        <div class='col-sm-3'>
                                            <%--    <div class="form-group">--%>
                                            <div class='input-group date' id='datetimepicker2' runat="server">
                                                <input type='text' class="form-control" name="txtFechaFin" id="txtFechaFin" runat="server" data-rule-required="true" placeholder="DD/MM/YYYY"  />
                                                <span class="input-group-addon">
                                                    <span class="glyphicon glyphicon-calendar"></span>
                                                </span>
                                            </div>
                                            <%--  </div>--%>
                                        </div>
                                        <br />
                                        <script type="text/javascript">
                                            $(function () {
                                                $('#MainContent_datetimepicker2').datetimepicker({
                                                    locale: 'es-DO',//,
                                                    format: 'DD/MM/YYYY hh:mm A'//,
                                                    //daysOfWeekDisabled: [0, 6],
                                                    // inline: true,
                                                    //sideBySide: true

                                                });
                                            });
                                        </script>
                                        <asp:RequiredFieldValidator ControlToValidate="txtFechaFin" Display="Dynamic" ErrorMessage="Requerido!"
                                            ID="valtxtFechaFin" runat="server" SetFocusOnError="True" ValidationGroup="pnlData" />
                                    </div>
                                </div>

                                <!-- Estatus -->
                                <div class="control-group">
                                    <label for="lblEstatus" class="control-label" style="color: black">
                                        <strong>Estado</strong></label>
                                    <div class="controls">
                                        <select runat="server" id="CmbEstatus" name="CmbEstatus" class='select2-me input-xlarge'
                                            data-rule-required="true">
                                            <option value="">-- SELECCIONE --</option>
                                            <option value="SOLICITADA">SOLICITADA</option>
                                            <option value="DESCARTADA">DESCARTADA</option>
                                            <option value="COMPLETADA">COMPLETADA</option>
                                        </select>
                                        <br />
                                        <asp:RequiredFieldValidator ControlToValidate="CmbEstatus" Display="Dynamic" ErrorMessage="Requerido!"
                                            ID="valCmbEstatus" runat="server" SetFocusOnError="True" ValidationGroup="pnlData" />
                                    </div>
                                </div>
                                <!-- Comentario -->
                                <div class="control-group">
                                    <label for="TxtComentario1" class="control-label" style="color: black">
                                        <strong>Comentario de la Actividad</strong></label>
                                    <div class="controls">
                                        <textarea runat="server" name="TxtComentario" id="TxtComentario" rows="5" class="input-block-level" data-rule-required="true" placeholder="..."></textarea>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </asp:Panel>

</asp:Content>
