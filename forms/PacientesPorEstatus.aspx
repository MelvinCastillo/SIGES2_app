<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true"
    CodeBehind="PacientesPorEstatus.cs" Inherits="CAID_V2.forms.PacientesPorEstatus" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">
    <asp:HiddenField ID="xGUID" runat="server" />
    <%-- Consulta General --%>
    <asp:Panel runat="server" ID="pnlConsulta">
        <div class="box box-color box-bordered">
            <div class="box-title">
                <h3>
                    <i class="icon-calendar"></i>ESTATUS GENERAL DE PACIENTES</h3>
            </div>
            <div class="box-content nopadding">
                <div class='form-horizontal form-bordered'>
                    <!-- Fecha Inicio -->
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
                            <button type="button" id="btnShow" runat="server" onserverclick="_Show" class="btn btn-primary">
                                <i class="icon-search"></i>&nbsp Buscar</button>
                            &nbsp
                            <button type="button" id="btnNew" runat="server" onserverclick="_New" class="btn btn-primary">
                                <i class="icon-plus-sign"></i>&nbsp Nuevo</button>
                            <button type="button" id="btnregresar" runat="server" validationgroup="pnlEdit"
                                class="btn btn-default" data-dismiss="modal" onserverclick="_Back2">
                                <i class="icon-arrow-left"></i>&nbsp Regresar</button>

                        </div>
                    </div>
                    <div class="control-group">
                        <div class="box-content nopadding">
                            <table class="table table-bordered dataTable dataTable-scroll-x dataTable-tools">
                                <thead>
                                    <tr>
                                        <th>Nombres y Apellidos
                                        </th>
                                        <th>No. Record
                                        </th>
                                        <th>Pre-Diagnóstico
                                        </th>
                                        <th>Estatus
                                        </th>
                                        <th>Fecha Registro
                                        </th>
                                        <th>ARS
                                        </th>
                                        <th>Fecha Nacimiento
                                        </th>
                                        <th>Edad
                                        </th>
                                        <th>Provincia
                                        </th>
                                        <th>Pruebas Pendientes
                                        </th> 
                                        <th>Pruebas
                                        </th>

                                    </tr>
                                </thead>
                                <tbody>
                                    <asp:Repeater ID="rpData" runat="server">
                                        <ItemTemplate>
                                            <tr>
                                                <td>
                                                    <asp:LinkButton ID="btnEdit" runat="server" Text='<%# Eval("FULLNAME")%>' CommandArgument='<%# Eval("ROWGUID")%>'
                                                        CommandName="Edit" OnClick="_Select"></asp:LinkButton>
                                                </td>
                                                <td>
                                                    <%# Eval("RECORDIDSTR")%>
                                                </td>
                                                <td>
                                                    <%# Eval("PREDIAGNOSTICO")%>
                                                </td>
                                                <td>
                                                    <%# Eval("ESTATUSNOMBRE")%>
                                                </td>
                                                <td>
                                                    <%# Eval("ROWCDTE")%>
                                                </td>
                                                <td>
                                                    <%# Eval("ARSNOMBRE")%>
                                                </td>
                                                   <td>
                                                    <%# Eval("FECHANACIMIENTO")%>
                                                </td>
                                                    <td>
                                                    <%# Eval("EdadMeses")%>
                                                </td>
                                                 <td>
                                                    <%# Eval("NOMBREPROVINCIA")%>
                                                </td>
                                                <td>
                                                    <%# Eval("ESTATUSPRUEBASPENDIENTES")%>
                                                </td> 
                                                <td>
                                                    <%# Eval("DetalledePruebas")%>
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
                            <i class="icon-edit"></i>Cambio de Agente Social</h3>
                    </div>
                    <div class="row-fluid">
                        <div class="box-content nopadding">
                            <div class='form-horizontal form-bordered'>
                                <div class="control-group">
                                    <label for="cmbAgenteSocial" class="control-label" style="color: Red">
                                        Agente Social</label>
                                    <div class="controls">
                                        <asp:DropDownList ID="cmbAgenteSocial" runat="server" CssClass="select2-me input-block-level"
                                            data-rule-required="true">
                                        </asp:DropDownList>

                                        <asp:RequiredFieldValidator ControlToValidate="cmbAgenteSocial" Display="Dynamic" ErrorMessage="Requerido!"
                                            ID="valcmbAgenteSocial" runat="server" SetFocusOnError="True" ValidationGroup="pnlData" />
                                    </div>
                                </div>
                                <!-- txtMotivoEstatus -->
                                <%--<div class="control-group">
                                    <label for="txtMotivoEstatus" class="control-label" style="color: Red">
                                        Motivo Cambio</label>
                                    <div class="controls">
                                        <textarea runat="server" name="txtMotivoEstatus" id="txtMotivoEstatus" rows="5" class="input-block-level"></textarea>

                                    </div>
                                </div>--%>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </asp:Panel>
</asp:Content>
