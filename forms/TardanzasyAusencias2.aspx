<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true"
    CodeBehind="TardanzasyAusencias2.aspx.cs" Inherits="CAID.TardanzasyAusencias2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">
  
    <%--<script type="text/javascript">
                        function notify(MSG, tipo) {
                            $.notify({
                                icon: 'https://randomuser.me/api/portraits/med/men/77.jpg',
                                title: 'Byron Morgan',
                                message: 'Momentum reduce child mortality effectiveness incubation empowerment connect.'
                            }, {
                                    type: 'minimalist',
                                    delay: 5000,
                                    icon_type: 'image',
                                    template: '<div data-notify="container" class="col-xs-11 col-sm-3 alert alert-{0}" role="alert">' +
                                    '<img data-notify="icon" class="img-circle pull-left">' +
                                    '<span data-notify="title">{1}</span>' +
                                    '<span data-notify="message">{2}</span>' +
                                    '</div>'
                                });

                    </script>--%>
    <asp:HiddenField ID="xGUID" runat="server" />
    <%-- Consulta General --%>
    <asp:Panel runat="server" ID="pnlConsulta">
        <div class="box  box-bordered">
            <div class="box-title">
                <h3>Tardanzas y Ausencias</h3>
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
                            <button id="btnShow" runat="server" onserverclick="_Show" class="btn content-refresh btn-primary">
                                <i class="icon-search"></i>&nbsp Buscar</button>
                            &nbsp
                            <button type="button" id="btnNew" runat="server" onserverclick="_New" class="btn btn-primary">
                                <i class="icon-plus-sign"></i>&nbsp Nuevo</button>
                            &nbsp
                            <button type="button" id="btnRegresar" runat="server" onclick="window.location.href='http://caidsiges01:8000/index.aspx'" class="btn btn-primary">
                                <i class="icon-arrow-left"></i>&nbsp Regresar</button>
                        </div>
                    </div>
                    <div class="box  box-bordered">
                        <div class="box-content nopadding">
                            <%--table table-bordered dataTable dataTable-scroll-x dataTable-tools dataTable-grouping--%>
                            <table class="table table-bordered  dataTable dataTable-scroll-x dataTable-tools">

                                <thead>
                                    <tr>
                                        <th style="width: 1%;">No.</th>
                                        <th style="width: 1%;">Record #</th>
                                        <th style="width: 20%;">Nombres y Apellidos</th>
                                        <th style="width: 1%;">Tipo</th>
                                        <th style="width: 1%;">Es Justificada</th>
                                        <th style="width: 12%;">Fecha Cita</th>
                                        <th style="width: 15%;">Servicio</th>
                                        <th style="width: 1%;">Quien Llamo</th>
                                        <th class="hidden-150">Motivo</th>
                                        <th style="width: 1%;">Acciones</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <asp:Repeater ID="rpData" runat="server">
                                        <ItemTemplate>
                                            <tr>
                                                <td><%# Eval("Num")%></td> 
                                                </td>
                                                <td><%# Eval("RECORDIDSTR")%></td>
                                                <td>
                                                    <asp:LinkButton ID="btnEdit" runat="server" Text='<%# Eval("FULLNAME")%>'></asp:LinkButton>
                                                    <%--CommandArgument='<%# Eval("ROWGUID")%>'  CommandName="Edit" OnClick="_Select"--%>
                                                </td>
                                                <td><%# Eval("Tipo")%></td>
                                                <td><%# Eval("EsJustificada")%></td>
                                                <td><%# Eval("Fecha")%></td>
                                                <td><%# Eval("Servicio")%></td>
                                                <td><%# Eval("QuienLlamo")%></td>
                                                <td><%# Eval("MotivoDispensa")%></td>
                                                <td>
                                                    <asp:LinkButton ID="btnDelete" CssClass="btn btn-red" runat="server" Text="Eliminar"
                                                        CommandArgument='<%# Eval("ROWGUID")%>' CommandName="Delete" OnClick="_Select"
                                                        OnClientClick="return confirm('¿Está seguro que desea eliminar este registro?');"></asp:LinkButton>
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
                            <i class="icon-edit"></i>Registro de Tardanzas y Ausencias</h3>
                    </div>
                    <div class="row-fluid">
                        <div class="box-content nopadding">
                            <div class='form-horizontal form-bordered'>
                                <!-- Paciente -->
                                <div class="control-group">
                                    <label for="CmbPaciente" class="control-label" style="color: black">
                                        <strong>Paciente</strong></label>
                                    <div class="controls">
                                        <asp:DropDownList ID="CmbPaciente" runat="server" class='input-block-level select2-me input-xlarge' 
                                            data-rule-required="true" AutoPostBack="True">
                                        </asp:DropDownList>
                                        <br />
                                        <asp:RequiredFieldValidator ControlToValidate="CmbPaciente" Display="Dynamic" ErrorMessage="Requerido!"
                                            ID="valcmbPaciente" runat="server" SetFocusOnError="True" ValidationGroup="pnlData" />
                                    </div>
                                </div>
                                <!-- Tipo -->
                                <div class="control-group">
                                    <label for="CmbTipo" class="control-label" style="color: black">
                                        <strong>Tipo</strong></label>
                                    <div class="controls">
                                        <select runat="server" id="CmbTipo" name="CmbTipo" class='select2-me input-xlarge'
                                            data-rule-required="true">
                                            <option value="">-- SELECCIONE --</option>
                                            <option value="TARDANZA">TARDANZA</option>
                                            <option value="AUSENCIA">AUSENCIA</option>
                                        </select>
                                        <br />
                                        <asp:RequiredFieldValidator ControlToValidate="CmbTipo" Display="Dynamic" ErrorMessage="Requerido!"
                                            ID="valCmbTipo1" runat="server" SetFocusOnError="True" ValidationGroup="pnlData" />
                                    </div>
                                </div>
                                <!-- Es Justificada -->
                                <div class="control-group">
                                    <label for="lblEsJustificada" class="control-label" style="color: black">
                                        <strong>Es Justificada</strong></label>
                                    <div class="controls">
                                        <select runat="server" id="CmbEsJustificada" name="CmbEsJustificada" class='select2-me input-xlarge'
                                            data-rule-required="true">
                                            <option value="">-- SELECCIONE --</option>
                                            <option value="SI">SI</option>
                                            <option value="NO">NO</option>
                                        </select>
                                        <br />
                                        <asp:RequiredFieldValidator ControlToValidate="CmbTipo" Display="Dynamic" ErrorMessage="Requerido!"
                                            ID="valCmbEsJustificada" runat="server" SetFocusOnError="True" ValidationGroup="pnlData" />
                                    </div>
                                </div>
                                <!-- servicio -->
                                <div class="control-group">
                                    <label for="lblservicio" class="control-label" style="color: black">
                                        <strong>Servicio</strong></label>
                                    <div class="controls">
                                        <asp:DropDownList ID="dpservicio" runat="server" CssClass="select2-me input-block-level"
                                            data-rule-required="true" AutoPostBack="True">
                                        </asp:DropDownList>
                                        <br />
                                        <asp:RequiredFieldValidator ControlToValidate="dpservicio" Display="Dynamic" ErrorMessage="Requerido!"
                                            ID="valdpservicio" runat="server" SetFocusOnError="True" ValidationGroup="pnlData" />
                                    </div>
                                </div>
                                <!-- Fecha y Hora -->
                                <%--<link rel="stylesheet" type="../css/bootstrap-datetimepicker.css" />
    <link rel="stylesheet" type="../css/bootstrap-datetimepicker.min.cs" />
     <script src="../js/bootstrap-datetimepicker.js"></script>
     <script src="../js/bootstrap-datetimepicker.min.js"></script>
                                  <script type="text/javascript">
                                      $(function () {
                                          //
                                          // $('#ctl00_MainContent_txtfechanacimiento').datepicker({
                                          $('#txtFecha').datepicker({
                                              toggleActive: false,
                                              format: "dd/mm/yyyy",
                                              todayHighlight: true,
                                              // calendarWeeks: true ,
                                              language: "es",
                                              todayBtn: "linked",
                                              showOnFocus: true,
                                              autoclose: true 
                                          });
                                      });
                                            
                                        </script>--%>
                                <script type="text/javascript" src="../calendarscript/js/language/es-DO.js"></script>
                                <link href="../calendarscript/css/bootstrap.css" rel="stylesheet" />
                                <link href="../calendarscript/css/font-awesome.min.css" rel="stylesheet" />
                                <link href="../calendarscript/css/prettify-1.0.css" rel="stylesheet" />
                                <script type="text/javascript" src="calendarscript/js/respond.min.js"></script>
                                <link href="../calendarscript/css/bootstrap-datetimepicker.css" rel="stylesheet" />
                                <script type="text/javascript" src="../calendarscript/js/jquery-2.1.1.min.js"></script>
                                <script type="text/javascript" src="../calendarscript/js/bootstrap.min.js"></script>
                                <script type="text/javascript" src="../calendarscript/js/moment-with-locales.js"></script>
                                <script type="text/javascript" src="../calendarscript/js/bootstrap-datetimepicker.js"></script> 
                                <div class="control-group">
                                    <label for="txtFecha" class="control-label" style="color: black">
                                        <strong>Fecha Cita</strong></label>
                                    <div class="controls">
                                        <div class='col-sm-3'>
                                            <div class='input-group date' id='txtFecha1' runat="server">
                                                <input runat="server" name="txtFecha" id="txtFecha" type="text" class="form-control"
                                                    data-rule-required="true" placeholder="dd/mm/aaaa">
                                                <span class="input-group-addon">
                                                    <span class="glyphicon glyphicon-calendar"></span>
                                                </span>
                                            </div>
                                            <br />
                                            <asp:RequiredFieldValidator ControlToValidate="txtFecha" Display="Dynamic" ErrorMessage="Requerido!"
                                                ID="valtxtFecha" runat="server" SetFocusOnError="True" ValidationGroup="pnlData" />
                                        </div>
                                        <script type="text/javascript">
                                            $(function () {
                                                $('#MainContent_txtFecha1').datetimepicker({
                                                    locale: 'es-DO',//,
                                                    format: 'DD/MM/YYYY hh:mm A'//,
                                                    //daysOfWeekDisabled: [0, 6],
                                                    //inline: true,
                                                    //sideBySide: true

                                                });
                                            });
                                        </script>
                                    </div>
                                </div>


                                <!-- Quien Llamo -->
                                <div class="control-group">
                                    <label for="TxtQuienLlamo" class="control-label" style="color: black">
                                        <strong>Quien Llamo</strong></label>
                                    <div class="controls">

                                        <input runat="server" name="TxtQuienLlamo" id="TxtQuienLlamo" type="text" class="input-xlarge"
                                            placeholder="..." data-rule-required="true">
                                        <br />
                                        <asp:RequiredFieldValidator ControlToValidate="TxtQuienLlamo" Display="Dynamic" ErrorMessage="Requerido!"
                                            ID="valTxtQuienLlamo" runat="server" SetFocusOnError="True" ValidationGroup="pnlData" />
                                    </div>
                                </div>
                                <!-- Motivo -->
                                <div class="control-group">
                                    <label for="TxtMotivo1" class="control-label" style="color: black">
                                        <strong>Motivo Dispensa</strong></label>
                                    <div class="controls">
                                        <textarea runat="server" name="TxtMotivo" id="TxtMotivo" rows="5" class="input-block-level" data-rule-required="true" placeholder="..."></textarea>
                                        <br />
                                        <%-- <asp:RequiredFieldValidator ControlToValidate="TxtMotivo" Display="Dynamic" ErrorMessage="Requerido!"
                                            ID="valTxtMotivo" runat="server" SetFocusOnError="True" ValidationGroup="pnlData" />--%>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
                           
    </asp:Panel>

    <link href="../css/select2me/select2.min.css" rel="stylesheet" />
    <script src="../js/select2me/select2.min.js"></script>
    <script src="../js/notify.js" type="text/javascript"></script>
    <script src="../js/notify.min.js" type="text/javascript"></script>
    <script type="text/javascript">
        function notify(MSG, tipo) {
            $.notify(MSG, tipo);
            $.no
        }
    </script>
</asp:Content>
