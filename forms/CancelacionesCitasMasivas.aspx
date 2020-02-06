<%@ Page Title="CANCELACIONES MASIVAS" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="CancelacionesCitasMasivas.aspx.cs" Inherits="CAID_V2.forms.CancelacionesCitasMasivas" %>

<%--<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site1.Master" CodeBehind="CancelacionesCitasMasivas.aspx.cs" Inherits="CAID_V2.forms.CancelacionesCitasMasivas" %>--%>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">
    <asp:HiddenField ID="PacienteID" runat="server" Value="0" />
    <asp:HiddenField ID="MedicoID" runat="server" Value="0" />
    <asp:HiddenField ID="TerapistaID" runat="server" Value="0" />
    <asp:HiddenField ID="EnfermeraID" runat="server" Value="0" />
    <asp:HiddenField ID="OrigenID" runat="server" Value="0" />
    <asp:HiddenField ID="txtEnfID" runat="server" Value="0" />
    <asp:HiddenField ID="xGUID" runat="server" />
    <asp:HiddenField ID="xActividadGUID" runat="server" />
    <asp:Panel runat="server" ID="pnlData">
        <div class="row-fluid">
            <div class="box box-bordered">
                <div class="box-title">
                    <h3>
                        <i class="icon-edit"></i>Cancelación Masiva de Citas Recurrentes</h3>
                    <div class="actions">
                        <button type="button" id="btnSave" runat="server" onserverclick="_Save" class="btn"
                            value="0" validationgroup="pnlData">
                            <i class="icon-save"></i>&nbsp Guardar</button>
                        <%--                        <button type="button" id="btnEditar" runat="server" onserverclick="_Editar" class="btn"
                            value="0" validationgroup="pnlData">
                        <i class="icon-edit"></i>&nbsp Actualizar</button>--%>
                        <button type="button" id="btnCancel" runat="server" onserverclick="_Cancel" class="btn">
                            <i class="icon-undo"></i>&nbsp Limpiar</button>
                        <button type="button" id="btnBack" runat="server" onserverclick="_Back2" class="btn">
                            <i class="icon-arrow-left"></i>&nbsp Regresar</button>
                    </div>
                </div>
                <div class="row-fluid">
                    <div class="box-content nopadding">
                        <div class='form-horizontal form-bordered'>
                            <%-- cmb Origen Tratamiento o Servicio --%>
                            <div class="control-group">
                                <label for="cmbOrigenTratamiento" class="control-label" style="color: Red">
                                    Servicio</label>
                                <div class="controls">
                                    <asp:DropDownList ID="cmbOrigenTratamiento" runat="server" CssClass="select2-me input-block-level"
                                        data-rule-required="true" AutoPostBack="True" OnSelectedIndexChanged="cmbOrigenTratamiento_SelectedIndexChanged">
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ControlToValidate="cmbOrigenTratamiento" Display="Dynamic"
                                        ErrorMessage="Requerido!" ID="RequiredFieldValidator3" runat="server" SetFocusOnError="True"
                                        ValidationGroup="pnlData" ForeColor="Red" />
                                </div>
                            </div>
                            <%-- cmbTerapista --%>
                            <div class="control-group">
                                <label for="cmbTerapista" class="control-label" style="color: Red">
                                    Especialista</label>
                                <div class="controls">
                                    <asp:DropDownList ID="cmbTerapista" runat="server" CssClass="select2-me input-block-level"
                                        data-rule-required="true" AutoPostBack="True">
                                        <%--OnSelectedIndexChanged="cmbTerapista_SelectedIndexChanged"--%>
                                    </asp:DropDownList>
                                <%--    <asp:RequiredFieldValidator ControlToValidate="cmbTerapista" Display="Dynamic" ErrorMessage="Requerido!"
                                        ID="RequiredFieldValidator5" runat="server" SetFocusOnError="True" ValidationGroup="pnlData" />--%>
                                </div>
                            </div>
                            <!-- Rango de Fecha -->
                            <script type="text/javascript" src="../calendarscript/js/language/es-DO.js"></script>
                            <link href="../calendarscript/css/bootstrap.css" rel="stylesheet" />
                            <link href="../calendarscript/css/font-awesome.min.css" rel="stylesheet" />
                            <link href="../calendarscript/css/prettify-1.0.css" rel="stylesheet" />
                            <%--<link href="../calendarscript/css/base.css" rel="stylesheet" />--%>
                            <script type="text/javascript" src="../calendarscript/js/respond.min.js"></script>
                            <link href="../calendarscript/css/bootstrap-datetimepicker.css" rel="stylesheet" />
                            <script type="text/javascript" src="../calendarscript/js/jquery-2.1.1.min.js"></script>
                            <script type="text/javascript" src="../calendarscript/js/bootstrap.min.js"></script>
                            <script type="text/javascript" src="../calendarscript/js/moment-with-locales.js"></script>
                            <script type="text/javascript" src="../calendarscript/js/bootstrap-datetimepicker.js"></script>
                            <div class="control-group">
                                <div class="control-group">
                                    <label for="txtFechaIni" class="control-label" style="color: Red">
                                        Rango de Fecha</label>
                                    <div class="controls">
                                        <div class='col-sm-3'>
                                            <div class='input-group date' id='datetimepicker0' runat="server">
                                                <input type='text' runat="server" name="txtFechaIni" id="txtFechaIni" class="form-control"
                                                    data-date-autoclose="True" placeholder="DD/MM/YYYY" data-date-format="DD/MM/YYYY">
                                                <span class="input-group-addon">
                                                    <span class="glyphicon glyphicon-calendar"></span>
                                                </span>
                                                <asp:RequiredFieldValidator ControlToValidate="txtFechaIni" Display="Dynamic" ErrorMessage="Requerido!"
                                                    ID="valtxtFechaIni" runat="server" SetFocusOnError="True" ValidationGroup="pnlData" ForeColor="Red" />

                                            </div>
                                        </div>
                                        <div class='col-sm-3'>
                                            <div class='input-group date' id='datetimepicker1' runat="server">
                                                <input runat="server" name="txtFechaFin" id="txtFechaFin" class="form-control"
                                                    data-date-autoclose="True" placeholder="DD/MM/YYYY" data-date-format="DD/MM/YYYY">
                                                <span class="input-group-addon">
                                                    <span class="glyphicon glyphicon-calendar"></span>
                                                </span>
                                                <asp:RequiredFieldValidator ControlToValidate="txtFechaFin" Display="Dynamic" ErrorMessage="Requerido!"
                                                    ID="valtxtFechaFin" runat="server" SetFocusOnError="True" ValidationGroup="pnlData" ForeColor="Red" />
                                            </div>
                                        </div>
                                    </div>
                                    <%--Hora--%>
                                    <div class="control-group">
                                        <label for="cmbHorario" class="control-label" style="color: Red">
                                            Rango de Horario</label>
                                        <div class="controls">
                                            <div class='col-sm-3'>
                                                <div class='input-group date' id='datetimepicker2' runat="server">
                                                    <input type='text' class="form-control" name="txtHoraIni" id="txtHoraIni" runat="server" data-rule-required="true" placeholder="HH:MM AM/PM" />
                                                    <span class="input-group-addon">
                                                        <span class="glyphicon glyphicon-calendar"></span>
                                                    </span>
                                                </div>
                                            </div>
                                            <div class='col-sm-3'>
                                                <div class='input-group date' id='datetimepicker3' runat="server">
                                                    <input type='text' class="form-control" name="txtHoraFin" id="txtHoraFin" runat="server" data-rule-required="true" placeholder="HH:MM AM/PM" />
                                                    <span class="input-group-addon" id="btnHoraFin">
                                                        <span class="glyphicon glyphicon-calendar"></span>
                                                    </span>
                                                </div>
                                            </div>
                                        </div>
                                        <div>
                                        </div>

                                        <script type="text/javascript">
                                            $(function () {
                                                $('#MainContent_txtHoraIni').datetimepicker({
                                                    locale: 'es-DO',//,
                                                    format: 'hh:mm A'//,
                                                    //daysOfWeekDisabled: [0, 6],
                                                    // inline: true,
                                                    //sideBySide: true

                                                });
                                            });
                                            $(function () {
                                                $('#MainContent_txtHoraFin').datetimepicker({
                                                    locale: 'es-DO',//,
                                                    format: 'hh:mm A'//,
                                                    //daysOfWeekDisabled: [0, 6],
                                                    // inline: true,
                                                    //sideBySide: true 
                                                });
                                            });
                                            $(function () {
                                                $('#MainContent_txtFechaIni').datetimepicker({
                                                    locale: 'es-DO',//,
                                                    format: 'DD/MM/YYYY'//,
                                                    //daysOfWeekDisabled: [0, 6],
                                                    // inline: true,
                                                    //sideBySide: true 
                                                });
                                            });
                                            $(function () {
                                                $('#MainContent_txtFechaFin').datetimepicker({
                                                    locale: 'es-DO',//,
                                                    format: 'DD/MM/YYYY'//,
                                                    //daysOfWeekDisabled: [0, 6],
                                                    // inline: true,
                                                    //sideBySide: true 
                                                });
                                            });
                                        </script>
                                    </div>
                                    <%-- Observación --%>
                                    <div class="control-group">
                                        <label for="txtObservacion" class="control-label" style="color: Red">
                                            Observación</label>
                                        <div class="controls">
                                            <asp:TextBox ID="txtObservacion" runat="server" TextMode="MultiLine" Height="100px"
                                                class="input-block-level"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script src="../js/notify.js" type="text/javascript"></script>
        <script src="../js/notify.min.js" type="text/javascript"></script>
        <script type="text/javascript">
                                            function notify(MSG, tipo) {
                                                $.notify(MSG, tipo);
                                            }
        </script>
    </asp:Panel>
</asp:Content>
