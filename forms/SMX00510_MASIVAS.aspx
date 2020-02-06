<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true"
    CodeBehind="SMX00510_MASIVAS.aspx.cs" Inherits="CAID_V2.forms.SMX00510_MASIVAS" %>

<%--Consulta General --%>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">
    <link href="../css/checkboxcustom.css" rel="stylesheet" />
    <asp:HiddenField ID="HiddenField1" runat="server" />
    <asp:HiddenField ID="PacienteID" runat="server" Value="0" />
    <asp:HiddenField ID="MedicoID" runat="server" Value="0" />
    <asp:HiddenField ID="TerapistaID" runat="server" Value="0" />
    <asp:HiddenField ID="EnfermeraID" runat="server" Value="0" />
    <asp:HiddenField ID="OrigenID" runat="server" Value="0" />
    <asp:HiddenField ID="txtEnfID" runat="server" Value="0" />
    <asp:HiddenField ID="xGUID" runat="server" />
    <asp:HiddenField ID="xActividadGUID" runat="server" />
    <asp:Panel runat="server" ID="pnlConsulta">
        <div class="box-content nopadding">
            <div class="row-fluid">
                <div class="span12">
                    <div class="box box-bordered">
                        <div class="box-title">
                            <h3>
                                <i class="icon-edit"></i>Confirmación de Citas Masivas</h3>
                        </div>
                        <div class="row-fluid">
                            <div class="box-content nopadding">
                                <div class='form-horizontal form-bordered'>
                                    <!-- Fecha Inicio -->
                                    <div class="control-group">
                                        <label for="txtFecha1" class="control-label">
                                            Desde</label>
                                        <div class="controls">
                                            <input runat="server" name="txtFecha1" id="txtFecha1" class="input-medium datepick"
                                                data-date-autoclose="True" data-rule-required="true" placeholder="mm/dd/aaaa">
                                        </div>
                                    </div>
                                    <!-- Fecha Final -->
                                    <div class="control-group">
                                        <label for="txtFecha2" class="control-label">
                                            Hasta</label>
                                        <div class="controls">
                                            <input runat="server" name="txtFecha2" id="txtFecha2" class="input-medium datepick"
                                                data-date-autoclose="True" data-rule-required="true" placeholder="mm/dd/aaaa">
                                        </div>
                                    </div>
                                    <%-- Observación de Confirmacion de Cita--%>
                                    <div class="control-group">
                                        <label for="txtdatosllamada" class="control-label" style="color: Red">
                                            Comentarios</label>
                                        <div class="controls">
                                            <textarea runat="server" name="txtdatosllamada1" id="txtdatosllamada1" class="input-block-level" placeholder="Especifique algun comentario"></textarea>
                                        </div>
                                    </div>
                                    <%-- cmbMedico Filtro--%>
                                    <div class="control-group">
                                        <div class="controls">
                                            <button id="btnShow" runat="server" onserverclick="_Show" class="btn btn-primary">
                                                <i class="icon-search"></i>&nbsp Buscar</button>
                                            <button id="btnConfirmar" runat="server" onserverclick="_Confirmar" class="btn btn-blue">
                                                <i class="icon-search"></i>&nbsp Confirmar</button>
                                            <button type="button" id="btnCancel" runat="server" onserverclick="_Clean" class="btn">
                                                <i class="icon-undo"></i>&nbsp Limpiar</button>
                                        </div>
                                    </div>



                                    <div class="control-group">
                                        <div class="box-content nopadding">
                                            <table class="table table-bordered dataTable dataTable-scroll-x dataTable-tools">
                                                <thead>
                                                    <tr>
                                                        <th>Seleccione</th>
                                                        <th style="width: 1%;">Cita No.</th>
                                                        <th>Pacientes</th>
                                                        <th>Terapeuta</th>
                                                        <th>Especialidad</th>
                                                        <th class="hidden-480">Fecha</th>
                                                        <th class="hidden-480">Horario</th>
                                                        <th class="hidden-480">Estatus</th>
                                                        <th hidden>Acciones</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <asp:Repeater ID="rpData" runat="server">
                                                        <ItemTemplate>
                                                            <tr>
                                                                <th>
                                                                    <label class="container">
                                                                        <input type="checkbox" runat="server" id="ckmarca" checked="checked">
                                                                        <span class="checkmark"></span>
                                                                    </label>
                                                                    <%-- <asp:TextBox ID="textnombre" Text='<%# Eval("FULLNAME")%>' runat="server"></asp:TextBox>--%>
                                                                </th>
                                                                <th>
                                                                    <%# Eval("NUMERO")%>
                                                                </th>
                                                                <td>
                                                                    <%# Eval("FULLNAME")%> 
                                                                </td>
                                                                <td>
                                                                    <%# Eval("TERAPISTANOMBRE")%>
                                                                </td>
                                                                <td>
                                                                    <%# Eval("ESPECIALIDAD")%>
                                                                </td>
                                                                <td class="hidden-480">
                                                                    <%# Convert.ToDateTime(Eval("FECHAINI")).ToString("dd-MM-yyyy") %>
                                                                </td>
                                                                <td class="hidden-480">
                                                                    <%# Convert.ToDateTime(Eval("HORAINI")).ToString("hh:mm tt") %>&nbsp-&nbsp<%# Convert.ToDateTime(Eval("HORAFIN")).ToString("hh:mm tt")%>
                                                                </td>
                                                                <td>
                                                                    <%# Eval("CITAESTADO")%>
                                                                </td>
                                                                <td hidden>
                                                                    <input runat="server" name="textROWGUID" id="textROWGUID" class="input-medium"
                                                                        data-date-autoclose="True" data-rule-required="true" value='<%# Eval("ROWGUID")%>' disabled="disabled">

                                                                    <%--    <asp:LinkButton ID="btnEdit" CssClass="btn btn-blue" runat="server" Text="Actualizar Estado"
                                                                        CommandArgument='<%# Eval("ROWGUID")%>' CommandName="Edit" OnClick="_Select"></asp:LinkButton>
                                                                    &nbsp<%# Eval("MODALPARTICIPANTES")%>--%>
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
    </asp:Panel>
    <%--Edición de Registros --%>
   <%-- <asp:Panel runat="server" ID="pnlData">
        <div class="box-content nopadding">
            <div>
                <p>
                    <button type="button" id="btnSave" runat="server" onserverclick="_Save" class="btn btn-green">
                        <i class="icon-save"></i>&nbsp Guardar</button>
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
                            <i class="icon-edit"></i>Actualización Estatus de la Cita</h3>
                    </div>
                    <div class="row-fluid">
                        <div class="box-content nopadding">
                            <div class='form-horizontal form-bordered'>
                                <!-- Estatus -->
                                <div class="control-group">
                                    <label for="cmbEstatus" class="control-label" style="color: Red">
                                        Condición</label>
                                    <div class="controls">
                                        <select runat="server" id="cmbEstatus" name="cmbEstatus" class='select2-me input-block-level'
                                            data-rule-required="true">
                                            <option value="">-- SELECCIONE --</option>
                                            <option value="0">PROGRAMADA</option>
                                            <option value="1">CONFIRMAR</option>
                                            <option value="2">CANCELAR</option>
                                        </select>
                                        <br />
                                        <asp:RequiredFieldValidator ControlToValidate="cmbEstatus" Display="Dynamic" ErrorMessage="Requerido!"
                                            ID="valcmbEstatus" runat="server" SetFocusOnError="True" ValidationGroup="pnlData" />
                                    </div>
                                </div> 
                                <div class="control-group">
                                    <label for="txtdatosllamada" class="control-label" style="color: Red">
                                        Comentarios</label>
                                    <div class="controls">
                                        <textarea runat="server" name="txtdatosllamada" id="txtdatosllamada" class="input-block-level"></textarea>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="row-fluid">
            <div class="span12">
                <div class="box box-bordered">
                    <div class="box-title">
                        <h3>
                            <i class="icon-edit"></i>Detalles</h3>
                    </div>
                    <div class="row-fluid">
                        <div class="box-content nopadding">
                            <div class='form-horizontal form-bordered'> 
                                <div class="control-group">
                                    <label for="cmbPaciente" class="control-label">
                                        Paciente</label>
                                    <div class="controls">
                                        <select runat="server" id="cmbPaciente" name="cmbPaciente" class='select2-me input-block-level'
                                            data-rule-required="true" disabled="disabled">
                                            <option value="">-- SELECCIONE --</option>
                                        </select>
                                        <br />
                                        <asp:RequiredFieldValidator ControlToValidate="cmbPaciente" Display="Dynamic" ErrorMessage="Requerido!"
                                            ID="RequiredFieldValidator1" runat="server" SetFocusOnError="True" ValidationGroup="pnlData" />
                                    </div>
                                </div>
                                <!-- Fecha Inicio -->
                                <div class="control-group">
                                    <label for="txtFechaIni" class="control-label">
                                        Fecha Inicio</label>
                                    <div class="controls">
                                        <input runat="server" name="txtFechaIni" id="txtFechaIni" class="input-medium datepick"
                                            data-date-autoclose="True" data-rule-required="true" placeholder="mm/dd/aaaa"
                                            disabled="disabled">
                                        <br />
                                        <asp:RequiredFieldValidator ControlToValidate="txtFechaIni" Display="Dynamic" ErrorMessage="Requerido!"
                                            ID="RequiredFieldValidator2" runat="server" SetFocusOnError="True" ValidationGroup="pnlData" />
                                    </div>
                                </div> 
                                <div class="control-group">
                                    <label for="cmbOrigenTratamiento" class="control-label">
                                        Origen Tratamiento</label>
                                    <div class="controls">
                                        <select runat="server" id="cmbOrigenTratamiento" name="cmbOrigenTratamiento" class='select2-me input-block-level'
                                            data-rule-required="true" disabled="disabled">
                                            <option value="">-- SELECCIONE --</option>
                                        </select>
                                        <br />
                                        <asp:RequiredFieldValidator ControlToValidate="cmbOrigenTratamiento" Display="Dynamic"
                                            ErrorMessage="Requerido!" ID="RequiredFieldValidator3" runat="server" SetFocusOnError="True"
                                            ValidationGroup="pnlData" />
                                    </div>
                                </div> 
                                <div class="control-group">
                                    <label for="cmbTerapista" class="control-label">
                                        Terapista</label>
                                    <div class="controls">
                                        <select runat="server" id="cmbTerapista" name="cmbTerapista" class='select2-me input-block-level'
                                            data-rule-required="true" disabled="disabled">
                                            <option value="">-- SELECCIONE --</option>
                                        </select>
                                        <br />
                                        <asp:RequiredFieldValidator ControlToValidate="cmbTerapista" Display="Dynamic" ErrorMessage="Requerido!"
                                            ID="RequiredFieldValidator5" runat="server" SetFocusOnError="True" ValidationGroup="pnlData" />
                                    </div>
                                </div> 
                                <div class="control-group">
                                    <label for="cmbMedico" class="control-label">
                                        Médico</label>
                                    <div class="controls">
                                        <select runat="server" id="cmbMedico" name="cmbMedico" class='select2-me input-block-level'
                                            data-rule-required="true" disabled="disabled">
                                            <option value="">-- SELECCIONE --</option>
                                        </select>
                                    </div>
                                </div> 
                                <div class="control-group">
                                    <label for="cmbEnfermera" class="control-label">
                                        Enfermera</label>
                                    <div class="controls">
                                        <select runat="server" id="cmbEnfermera" name="cmbEnfermera" class='select2-me input-block-level'
                                            data-rule-required="true" disabled="disabled">
                                            <option value="">-- SELECCIONE --</option>
                                        </select>
                                    </div>
                                </div> 
                                <div class="control-group">
                                    <label for="cmbHorario" class="control-label">
                                        Horario</label>
                                    <div class="controls">
                                        <select runat="server" id="cmbHorario" name="cmbHorario" class='select2-me input-block-level'
                                            data-rule-required="true" disabled="disabled">
                                            <option value="">-- SELECCIONE --</option>
                                        </select>
                                        <br />
                                        <asp:RequiredFieldValidator ControlToValidate="cmbHorario" Display="Dynamic" ErrorMessage="Requerido!"
                                            ID="cmbHorario1" runat="server" SetFocusOnError="True" ValidationGroup="pnlData" />
                                    </div>
                                </div> 
                                <div class="control-group">
                                    <label for="txtObservacion" class="control-label">
                                        Observación</label>
                                    <div class="controls">
                                        <textarea runat="server" name="txtObservacion" id="txtObservacion" class="input-block-level"></textarea>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </asp:Panel>--%>
    <script src="../js/notify.js" type="text/javascript"></script>
    <script src="../js/notify.min.js" type="text/javascript"></script>
    <script type="text/javascript">
        function notify(MSG, tipo) {
            $.notify(MSG, tipo);
        }
    </script>
</asp:Content>
