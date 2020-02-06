<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true"
    CodeBehind="PacientesPorEstatusEVDPediatria.cs" Inherits="CAID_V2.forms.PacientesPorEstatusEVDPediatria" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">
    <asp:HiddenField ID="xGUID" runat="server" />
    <%-- Consulta General --%>
    <asp:Panel runat="server" ID="pnlConsulta">
        <div class="box box-color box-bordered">
            <div class="box-title">
                <h3>
                    <i class="icon-calendar"></i>ESTATUS DE PACIENTES (PEDIATRIA y EVD)</h3>
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
                            <a href="http://caidsiges01:8000/INDEX_T.ASPX" class="btn btn-default" data-dismiss="modal"><i class="icon-arrow-left"></i>Regresar</a>

                        </div>
                    </div>
                    <div class="control-group">
                        <div class="box-content nopadding">
                            <table class="table table-bordered dataTable dataTable-scroll-x dataTable-tools">
                                <thead>
                                    <tr>
                                        <th>Nombres y Apellidos</th>
                                        <th>No. Record</th>
                                        <th>Centro</th>
                                        <th>Pre-Diagnóstico</th>
                                        <th>Estatus Pediatria</th>
                                        <th>Estatus EVD</th>

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
                                                    <%# Eval("ROWSGXID")%>
                                                </td>
                                                <td>
                                                    <%# Eval("PREDIAGNOSTICO")%>
                                                </td>
                                                <td>
                                                    <%# Eval("ESTATUSPEDIATRIADESCRIPCION")%>
                                                </td>
                                                <td>
                                                    <%# Eval("ESTATUSEVDDESCRIPCION")%>
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
                            <i class="icon-edit"></i>Cambio Estatus de Pacientes</h3>
                    </div>
                    <div class="row-fluid">
                        <div class="box-content nopadding">
                            <div class='form-horizontal form-bordered'>
                                <div class="control-group">
                                    <label for="cmbEstatus" class="control-label" style="color: Red">
                                        Estatus Pediatria</label>
                                    <div class="controls">
                                        <%--CssClass="select2-me input-block-level"--%>
                                        <asp:DropDownList ID="ddlESTATUSPEDIATRIA" runat="server"
                                            data-rule-required="true">
                                            <asp:ListItem Value="" Selected="True">-- SELECCIONE --</asp:ListItem>
                                            <asp:ListItem Value="P">PENDIENTE</asp:ListItem>
                                            <asp:ListItem Value="C">COMPLETADO</asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                </div>

                                <div class="control-group">
                                    <label for="cmbEstatus" class="control-label" style="color: Red">
                                        Estatus Evaluación y Diagnostico</label>
                                    <div class="controls">
                                        <asp:DropDownList ID="ddlESTATUSEVD" runat="server" CssClass="select2-me input-block-level"
                                            data-rule-required="true">
                                        </asp:DropDownList>
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
