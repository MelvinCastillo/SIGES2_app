﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true"
    CodeBehind="PlanTratamientoEXCEL.aspx.cs" Inherits="CAID_V2.forms.PlanTratamientoEXCEL" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">
    <asp:HiddenField ID="xGUID" runat="server" />
    <asp:HiddenField ID="xActividadGUID" runat="server" />
    <%--Consulta General --%>
    <asp:Panel runat="server" ID="pnlConsulta">
        <%-- <div class="box-content nopadding">
            <div>
                <p>
                    <button type="button" id="btnNew" runat="server" onserverclick="_New" class="btn btn-primary">
                        <i class="icon-plus-sign"></i>&nbsp Nuevo</button>
                    <button id="btnShow" runat="server" onserverclick="_Show" class="btn content-refresh btn-primary">
                        <i class="icon-refresh"></i>&nbsp Actualizar</button>
                </p>
            </div>
        </div>--%>
        <div class="row-fluid">
            <div class="span12">
                <div class="box  box-bordered">
                    <div class="box-title">
                        <h3>
                            <i class="icon-table"></i>PLAN DE TRATAMIENTO EXCEL
                        </h3>
                    </div>
                    <div class="box-content nopadding">
                        <div class='form-horizontal form-bordered'>
                            <%-- Paciente --%>
                            <div class="control-group">
                                <label for="txtNombre" class="control-label">
                                    Record No.</label>
                                <div class="controls">
                                    <input runat="server" type="text" name="txtRecord" id="txtRecord" class="input-medium">
                                    <button type="button" id="Button4" runat="server" onserverclick="_Search3" class="btn btn-blue"
                                        validationgroup="pnlSearch">
                                        <i class="icon-search"></i>
                                    </button>
                                </div>
                            </div>
                            <div class="control-group">
                                <label for="cmbPaciente2" class="control-label" style="color: Red">
                                    Paciente</label>
                                <div class="controls">
                                    <asp:DropDownList ID="cmbPaciente2" runat="server" CssClass="select2-me input-xxlarge"
                                        data-rule-required="false" AutoPostBack="false">
                                        <asp:ListItem Value="">-- SELECCIONE --</asp:ListItem>
                                    </asp:DropDownList>
                                    &nbsp 
                                                <%-- <asp:LinkButton ID="btnAcerptarAtencion" CssClass="btn btn-green" runat="server" Text="Aceptar"
                                                     OnClick="_VerDetallesPlan"> <i class="icon-ok"></i> &nbsp Ver Detalles</asp:LinkButton>--%>
                                    <button id="btnShow" runat="server" onserverclick="_Show" class="btn content-refresh btn-primary">
                                        <i class="icon-refresh"></i>&nbsp Ver Plan</button>
                                         <button type="button" id="Button5" runat="server" onserverclick="_BackMain" class="btn btn-green">
                            <i class="icon-arrow-left"></i>&nbsp Regresar</button>
                                </div>
                            </div>
                            <div class="control-group">
                                <table class="table table-hover table-nomargin table-bordered dataTable dataTable-scroll-x dataTable-grouping dataTable-tools" data-grouping="expandable">
                                    <thead runat="server">
                                        <tr>
                                            <th>Objetivo</th>
                                            <th>Actividad</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <asp:Repeater ID="rpDetalles" runat="server">
                                            <ItemTemplate>
                                                <tr>
                                                    <td>
                                                        <%# Eval("OBJETIVO")%>
                                                    </td>
                                                    <td>
                                                        <%# Eval("ACTIVIDAD")%>
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

    </asp:Panel>
    <%--Edición de Registros --%>
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
                            <i class="icon-edit"></i>Registro de Objetivos y Actividades</h3>
                    </div>
                    <div class="row-fluid">
                        <div class="box-content nopadding">
                            <div class='form-horizontal form-bordered'>
                                <%-- Paciente --%>
                                <div class="control-group">
                                    <label for="txtNombre" class="control-label">
                                        Record No.</label>
                                    <div class="controls">
                                        <input runat="server" type="text" name="txtRecordNo" id="txtRecordNo" class="input-medium">
                                        <button type="button" id="btnFilter2" runat="server" onserverclick="_Search2" class="btn btn-blue"
                                            validationgroup="pnlSearch">
                                            <i class="icon-search"></i>&nbsp Buscar Record</button>
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label for="cmbPaciente" class="control-label" style="color: Red">
                                        Paciente</label>
                                    <div class="controls">
                                        <select runat="server" id="cmbPaciente" name="cmbPaciente" class='select2-me input-block-level'
                                            data-rule-required="true">
                                            <option value="">-- SELECCIONE --</option>
                                        </select>
                                        <br />
                                        <asp:RequiredFieldValidator ControlToValidate="cmbPaciente" Display="Dynamic" ErrorMessage="Requerido!"
                                            ID="valcmbPaciente" runat="server" SetFocusOnError="True" ValidationGroup="pnlData" />
                                    </div>
                                </div>
                                <%-- Especialidad --%>
                                <div class="control-group">
                                    <label for="cmbPaciente" class="control-label" style="color: Red">
                                        Especialidad</label>
                                    <div class="controls">
                                        <select runat="server" id="cmbEspecialidad" name="cmbEspecialidad" class='select2-me input-block-level'
                                            data-rule-required="true">
                                            <option value="">-- SELECCIONE --</option>
                                        </select>
                                        <br />
                                        <asp:RequiredFieldValidator ControlToValidate="cmbPaciente" Display="Dynamic" ErrorMessage="Requerido!"
                                            ID="RequiredFieldValidator1" runat="server" SetFocusOnError="True" ValidationGroup="pnlData" />
                                    </div>
                                </div>
                                <%-- Descripción --%>
                                <div class="control-group">
                                    <label for="txtNombre" class="control-label" style="color: Red">
                                        Objetivo</label>
                                    <div class="controls">
                                        <input runat="server" name="txtNombre" id="txtNombre" type="text" class="input-xxlarge"
                                            data-rule-required="true">
                                        <br />
                                        <asp:RequiredFieldValidator ControlToValidate="txtNombre" Display="Dynamic" ErrorMessage="Requerido!"
                                            ID="valtxtNombre" runat="server" SetFocusOnError="True" ValidationGroup="pnlData" />
                                    </div>
                                </div>
                                <%-- Detalles --%>
                                <div class="control-group">
                                    <label for="txtDetalles" class="control-label" style="color: Red">
                                        Actividad</label>
                                    <div class="controls">
                                        <input runat="server" name="txtDetalles" id="txtDetalles" type="text" class="input-xxlarge"
                                            data-rule-required="true">
                                        <button type="button" id="btnSaveDetalles" runat="server" onserverclick="_SaveDetalles"
                                            class="btn btn-green" validationgroup="pnlDetalles">
                                            <i class="icon-arrow-down"></i>&nbsp
                                        </button>
                                        <br />
                                        <asp:RequiredFieldValidator ControlToValidate="txtDetalles" Display="Dynamic" ErrorMessage="Requerido!"
                                            ID="valtxtDetalles" runat="server" SetFocusOnError="True" ValidationGroup="pnlDetalles" />
                                        <div class="box  box-bordered">
                                            <div class="box-title">
                                                <h3></h3>
                                            </div>
                                            <div class="box-content nopadding">
                                                <table class="table table-bordered dataTable-scroll-x">
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
    </asp:Panel>
    <%--Actividades --%>
    <asp:Panel runat="server" ID="pnlActividad">
        <div class="box-content nopadding">
            <div>
                <p>
                    <button type="button" id="Button1" runat="server" onserverclick="_Save2" class="btn btn-green"
                        validationgroup="pnlData">
                        <i class="icon-save"></i>&nbsp Guardar</button>
                    <button type="button" id="Button2" runat="server" onserverclick="_Cancel2" class="btn">
                        <i class="icon-undo"></i>&nbsp Limpiar</button>
                    <button type="button" id="Button3" runat="server" onserverclick="_Back2" class="btn">
                        <i class="icon-arrow-left"></i>&nbsp Regresar</button>
                </p>
            </div>
        </div>
        <div class="row-fluid">
            <div class="span12">
                <div class="box box-bordered">
                    <div class="box-title">
                        <h3>
                            <i class="icon-edit"></i>Actualización Actividades</h3>
                    </div>
                    <div class="row-fluid">
                        <div class="box-content nopadding">
                            <div class='form-horizontal form-bordered'>
                                <%-- Activiadad --%>
                                <div class="control-group">
                                    <label for="cmbActividad" class="control-label" style="color: Red">
                                        Actividad</label>
                                    <div class="controls">
                                        <select runat="server" id="cmbActividad" name="cmbActividad" class='select2-me input-block-level'
                                            data-rule-required="true">
                                            <option value="">-- SELECCIONE --</option>
                                        </select>
                                        <br />
                                        <asp:RequiredFieldValidator ControlToValidate="cmbActividad" Display="Dynamic" ErrorMessage="Requerido!"
                                            ID="valcmbActividad" runat="server" SetFocusOnError="True" ValidationGroup="pnlData" />
                                    </div>
                                </div>
                                <%-- Descripción --%>
                                <div class="control-group">
                                    <label for="txtCompletado" class="control-label" style="color: Red">
                                        % Avance
                                    </label>
                                    <div class="controls">
                                        <input runat="server" name="txtCompletado" id="txtCompletado" type="text" class='spinner input-mini'
                                            data-rule-required="true">
                                        <br />
                                        <asp:RequiredFieldValidator ID="valtxtCompletado" ControlToValidate="txtCompletado"
                                            Display="Dynamic" ErrorMessage="Requerido!" runat="server" SetFocusOnError="True"
                                            ValidationGroup="pnlData" />
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
