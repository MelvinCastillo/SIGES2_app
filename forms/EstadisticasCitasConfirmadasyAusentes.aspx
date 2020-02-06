<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true"
    CodeBehind="EstadisticasCitasConfirmadasyAusentes.aspx.cs" Inherits="CAID_V2.forms.EstadisticasCitasConfirmadasyAusentes" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">
    <asp:Panel runat="server" ID="pnlData">
        <div class="box box-bordered">
            <div class="box-title">
                <h3>
                    <i class="icon-edit"></i>Consulta de Citas - Confirmadas y Ausentes</h3>
            </div>
            <div class="box-content nopadding">
                <div class='form-horizontal form-bordered'>
                     <!-- Tipo Reporte -->
                    <div class="control-group">
                        <label for="cmbtipo" class="control-label" style="color: Red">
                            TipoReporte</label>
                        <div class="controls">
                            <asp:DropDownList ID="ddtiporeporte" runat="server" CssClass="select2-me input-block-level"
                                data-rule-required="true">
                                <asp:ListItem Value="R">Resumido</asp:ListItem>
                                <asp:ListItem Value="D">Detallado</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>
                    <!-- Especialidad -->
                    <div class="control-group">
                        <label for="CmbEspecialidad" class="control-label" style="color: Red">
                            Servicio</label>
                        <div class="controls">
                            <asp:DropDownList ID="ddespecialidad" runat="server" CssClass="select2-me input-block-level"
                                data-rule-required="true">
                            </asp:DropDownList>
                        </div>
                    </div>

                    <!-- Periodo -->
                    <div class="control-group">
                        <label for="txtDesde" class="control-label" style="color: Red">
                            Periodo</label>
                        <div class="controls">
                            <!-- Fecha: desde -->
                            <input runat="server" name="txtDesde" id="txtDesde" type="text" class="input-medium datepick"
                                data-rule-required="false" placeholder="mm/dd/aaaa">
                            <script type="text/javascript">
                                $(function () {
                                    // ctl00_MainContent_txthorallegada
                                    $('#txtDesde').datepicker({
                                        toggleActive: false,
                                        format: "dd/mm/yyyy",
                                        todayHighlight: true,
                                        // calendarWeeks: true ,
                                        language: "es",
                                        todayBtn: "linked",
                                        showOnFocus: true,
                                        autoclose: true
                                        //disabledDates: [
                                        //    moment("12/25/2013"),
                                        //    new Date(2013, 11 - 1, 21),
                                        //    "11/22/2013 00:53"
                                        //]

                                    });
                                });
                            </script>
                            <asp:RequiredFieldValidator ControlToValidate="txtDesde" Display="Dynamic" ErrorMessage="Requerido!"
                                ID="txtDesde1" runat="server" SetFocusOnError="True" ValidationGroup="pnlData" />
                            <!-- Fecha: Hasta -->
                            <input runat="server" name="txtHasta" id="txtHasta" type="text" class="input-medium datepick"
                                data-rule-required="false" placeholder="mm/dd/aaaa">
                            <script type="text/javascript">
                                $(function () {
                                    // ctl00_MainContent_txthorallegada
                                    $('#txtHasta').datepicker({
                                        toggleActive: false,
                                        format: "dd/mm/yyyy",
                                        todayHighlight: true,
                                        // calendarWeeks: true ,
                                        language: "es",
                                        todayBtn: "linked",
                                        showOnFocus: true,
                                        autoclose: true
                                        //disabledDates: [
                                        //    moment("12/25/2013"),
                                        //    new Date(2013, 11 - 1, 21),
                                        //    "11/22/2013 00:53"
                                        //]

                                    });
                                });
                                function btnPrint_onclick() {

                                }

                            </script>
                            <%--<asp:RequiredFieldValidator ControlToValidate="txtHasta" Display="Dynamic" ErrorMessage="Requerido!"
                            ID="txtHasta1" runat="server" SetFocusOnError="True" ValidationGroup="pnlData" />--%>
                        </div>
                    </div>
                    <div class="control-group">
                        <label for="CmbEspecialidad" class="control-label" style="color: Red">
                        </label>
                        <div class="controls">
                            <button type="submit" id="btnPrint" runat="server" class="btn btn-blue" onserverclick="_Show">
                                <i class="icon-ok"></i>&nbsp Aceptar</button>
                            <%--<a href='javascript:history.go(-1)' class="btn btn"><i class="icon-arrow-left">
                            </i>&nbspCancelar</a>--%>
                             <button type="button" id="Button1" runat="server"
                                    class="btn btn-default" data-dismiss="modal" onserverclick="_BackMain">
                                    <i class="icon-arrow-left"></i>&nbsp Regresar
                                </button>
                        </div>
                    </div>
                </div>
            </div>
            <%--REPORTE RESUMIDO--%>
            <div id="pnresumen" runat="server" class="control-group">
                <%--  <div class="box box-bordered">--%>
                <div class="box-title">
                    <h3>
                        <i class="icon-edit"></i>Resumido</h3>
                </div>
                <div class="box-content nopadding">
                    <table class="table table-bordered dataTable dataTable-scroll-x dataTable-tools dataTable-grouping">
                        <thead>
                            <tr>
                                <th>Servicio</th>
                                <th>Especialista</th>
<%--                                <th>ASISTIO</th>
                                <th>PROGRAMADA</th>
                                <th>CONFIRMADA</th>
                                <th>CANCELADA</th>
                                <th>AUSENTE</th>
                                <th>MEDICO EVOLUCIONO</th>
                                <th>NO REALIZADA</th>
                                <th>DE ALTA</th>--%>
                                <th>Cantidad</th>
                            </tr>
                        </thead>
                        <tbody>
                            <asp:Repeater ID="rpresumido" runat="server">
                                <ItemTemplate>
                                    <tr>
                                        <td> <strong> <%# Eval("NOMBREESPECIALIDAD")%> </td>
                                        <td> <%# Eval("NOMBREESPECIALISTA")%></td>
<%--                                        <td><%# Eval("ASISTIO")%></td>
                                        <td><%# Eval("PROGRAMADA")%></td>
                                        <td><%# Eval("CONFIRMADA")%></td> 
                                        <td><%# Eval("CANCELADA")%></td>
                                        <td><%# Eval("AUSENTE")%></td>
                                        <td><%# Eval("MEDICOEVOLUCIONO")%></td>
                                        <td><%# Eval("NOREALIZADA")%></td>
                                        <td><%# Eval("DEALTA")%></td>--%>
                                        <td><%# Eval("CANTIDAD")%></td>
                                    </tr>
                                </ItemTemplate>
                            </asp:Repeater>
                        </tbody>
                    </table>
                </div>
                <%--</div>--%>
            </div>
             <%--REPORTE DETALLADO--%>
            <div id="pndetallado1" runat="server" class="control-group">
                <%--  <div class="box box-bordered">--%>
                <div class="box-title">
                    <h3>
                        <i class="icon-edit"></i>Detallado</h3>
                </div>
                <div class="box-content nopadding">
                    <table class="table table-bordered dataTable dataTable-scroll-x dataTable-tools dataTable-grouping">
                        <thead>
                            <tr>
                                <th>Servicio</th>
                                <%--<th class="hidden-450">Especialista</th> --%>
                                <th class="hidden-480">PACIENTE</th>
                                <th class="hidden-350">FECHA</th>
                                <th class="hidden-480">TIPO</th>
                                <th class="hidden-480">DESDE</th>
                                <th class="hidden-480">HASTA</th>
                               <th class="hidden-350">Justificada</th> 
                                <th class="hidden-480">Motivo</th>
                            </tr>
                        </thead>
                        <tbody>
                            <asp:Repeater ID="rpdetallado" runat="server">
                                <ItemTemplate>
                                    <tr>
                                        <td> <strong> <%# Eval("NOMBREESPECIALIDAD")%> -   <%# Eval("NOMBREESPECIALISTA")%></strong></td>
                                        <%--<td class="hidden-450"><%# Eval("NOMBREESPECIALISTA")%></td>--%>
                                        <td class="hidden-480"><%# Eval("PACIENTE")%></td> 
                                        <td class="hidden-480"><%# Eval("FECHA")%></td>   
                                        <td class="hidden-480"><%# Eval("TIPO")%></td>  
                                        <td class="hidden-480"><%# Eval("DESDE")%></td> 
                                        <td class="hidden-480"><%# Eval("HASTA")%></td> 
                                        <td class="hidden-350"><%# Eval("EsJustificada")%></td>
                                        <td class="hidden-350"><%# Eval("MotivoDispensa")%></td> 

                                    </tr>
                                </ItemTemplate>
                            </asp:Repeater>
                        </tbody>
                    </table>
                </div>
                <%--</div>--%>
            </div>
        </div>
    </asp:Panel>

</asp:Content>
