<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true"
    CodeBehind="SeguimientodeCasos.aspx.cs" Inherits="CAID_V2.forms.SeguimientodeCasos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">
    <asp:Panel runat="server" ID="pnlData">
        <script src="../js/notify.js" type="text/javascript"></script>
        <script src="../js/notify.min.js" type="text/javascript"></script>
        <div class="box box-bordered">
            <div class="box-title">
                <h3>
                    <i class="icon-edit"></i>Seguimiento de Casos</h3>
            </div>
            <div class="box-content nopadding">
                <div class='form-horizontal form-bordered'>
                    <!-- Tipo de Reporte -->
                    <div class="control-group">
                        <label for="CmbPaciente12" class="control-label" style="color: Red">
                            Paciente</label>
                        <div class="controls">
                            <asp:DropDownList ID="DPPaciente" runat="server" CssClass="select2-me input-block-level"
                                data-rule-required="true">
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ControlToValidate="DPPaciente" Display="Dynamic" ErrorMessage="Requerido!"
                                ID="DPPaciente1" runat="server" SetFocusOnError="True"
                                ValidationGroup="pnlData" ForeColor="Red" />
                        </div>
                    </div>
                    <div class="control-group">
                        <label for="txtFecha1" class="control-label" style="color: Red">
                            Acciones</label>
                        <div class="controls">
                            <button type="submit" id="BtnBuscarPX" runat="server" class="btn content-refresh btn-primary" onserverclick="_buscaseguimientos">
                                <i class="icon-search"></i>&nbsp Buscar</button>
                        </div>
                    </div>

                    <!-- VIA CONTACTO -->
                    <div class="control-group">
                        <label for="lblViaContacto" class="control-label" style="color: black">
                            Via Contacto</label>
                        <div class="controls">
                            <select runat="server" id="Cmbviacontacto" name="Cmbviacontacto" class='select2-me input-xlarge'
                                data-rule-required="true">
                                <option value="">-- SELECCIONE --</option>
                                <option value="PRESENCIAL">PRESENCIAL</option>
                                <option value="TELEFONICA">TELEFONICA</option>
                                <option value="CORREO">CORREO</option>
                            </select>
                            <br />
                            <asp:RequiredFieldValidator ControlToValidate="Cmbviacontacto" Display="Dynamic" ErrorMessage="Requerido!"
                                ID="ValCmbviacontacto" runat="server" SetFocusOnError="True" ValidationGroup="pnlData" />
                        </div>
                    </div>
                    <!-- MOTIVO -->
                    <div class="control-group">
                        <label for="lblMotivo" class="control-label" style="color: black">
                            Motivo</label>
                        <div class="controls">
                            <select runat="server" id="Cmbmotivo" name="Cmbmotivo" class='select2-me input-xlarge'
                                data-rule-required="true">
                                <option value="">-- SELECCIONE --</option>
                                <option value="CERTIFICACIONES Y CARTAS">CERTIFICACIONES Y CARTAS</option>
                                <option value="GESTIONES ESCOLARES">GESTIONES ESCOLARES</option>
                                <option value="SOLICITUD AYUDAS MÉDICAS">SOLICITUD AYUDAS MÉDICAS</option>
                                <option value="SOLICITUD CAMBIOS HORARIOS">SOLICITUD CAMBIOS HORARIOS</option>
                                <option value="REFERIMIENTO A OTROS SERVICIOS">REFERIMIENTO A OTROS SERVICIOS</option>
                                <option value="OTROS">OTROS</option>
                            </select>
                            <br />
                            <asp:RequiredFieldValidator ControlToValidate="Cmbmotivo" Display="Dynamic" ErrorMessage="Requerido!"
                                ID="valCmbmotivo" runat="server" SetFocusOnError="True" ValidationGroup="pnlData" />
                        </div>
                    </div>
                    <%-- Comentarios --%>
                    <div class="control-group">
                        <label for="txtcomentario" class="control-label">
                            Comentarios</label>
                        <div class="controls" style="text-align: center;">
                            <asp:TextBox ID="txtcomentario" runat="server" TextMode="MultiLine" Height="60px"
                                Wrap="true" placeholder="Detalles" CssClass="input-block-level" CausesValidation="True"></asp:TextBox>
                            <asp:RequiredFieldValidator ControlToValidate="txtcomentario" Display="Dynamic" ErrorMessage="Requerido!"
                                ID="RequiredFieldValidator1" runat="server" SetFocusOnError="True"
                                ValidationGroup="pnlData" ForeColor="Red" />
                        </div>
                    </div>
                    <div class="control-group">
                        <label for="lblacciones" class="control-label">
                            Acciones</label>
                        <div class="controls" style="text-align: left;">
                            <script type="text/javascript">
                                function notify(MSG, tipo) {
                                    $.notify(MSG, tipo); melvin
                                }

                            </script>
                            <script type="text/javascript">
                                function CloseWindow() { window.close(); }
                            </script>
                            <button type="submit" id="btnPrint" runat="server" class="btn btn-blue" onserverclick="_Save">
                                <i class="icon-ok"></i>&nbsp Guardar</button>
                            <%--  <a href='javascript:history.back(-2)' class="btn"><i class="icon-arrow-left">
                    </i>&nbsp Regresar</a>--%>
                            <button type="button" id="btnBack" onclick="history.go(-1);" class="btn">
                                <i class="icon-arrow-left"></i>&nbsp Regresar</button>
                        </div>
                    </div>
                    <div class="control-group">
                        <%--  <div class="box box-bordered">--%>
                        <div class="box-title">
                            <h3>
                                <i class="icon-edit"></i>Historico de Seguimiento</h3>
                        </div>
                        <div class="box-content nopadding">
                            <table  class="table table-bordered dataTable dataTable-scroll-x dataTable-tools">
                                <thead>
                                    <tr>
                                        <th>Via Contacto
                                        </th>
                                        <th class="hidden-450">Motivo
                                        </th>
                                        <th class="hidden-350">Agente Social
                                        </th>
                                        <th class="hidden-480">Fecha
                                        </th>
                                        <th class="hidden-480">Comentario
                                        </th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <asp:Repeater ID="rpData" runat="server">
                                        <ItemTemplate>
                                            <tr>
                                                <td>
                                                    <%# Eval("VIACONTACTO")%>
                                                </td>
                                                <td class="hidden-450">
                                                    <%# Eval("MOTIVO")%>
                                                </td>
                                                <td class="hidden-350">
                                                    <%# Eval("USUARIO")%>
                                                </td>
                                                <td class="hidden-480">
                                                    <%# Eval("ROWCDTE")%>
                                                </td>
                                                <td class="hidden-480">
                                                    <%# Eval("COMENTARIO")%>
                                                </td>
                                            </tr>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                </tbody>
                            </table>
                        </div>

                        
                        <%--</div>--%>
                    </div>
                </div>
            </div>
        </div>
    </asp:Panel>

</asp:Content>
