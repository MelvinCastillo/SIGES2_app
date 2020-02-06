<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true"
    CodeBehind="EstadisticasIGrupal.aspx.cs" Inherits="CAID_V2.forms.EstadisticasIGrupal" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">
    <asp:Panel runat="server" ID="pnlData">
        <div class="box box-bordered">
            <div class="box-title">
                <h3>
                    <i class="icon-edit"></i>Estadísticas - Servicio de Intervención Grupal</h3>
            </div>
            <div class="box-content nopadding">
                <div class='form-horizontal form-bordered'>
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
                        </div>
                    </div>
                    <div class="control-group">
                        <label for="CmbEspecialidad" class="control-label" style="color: Red">
                        </label>
                        <div class="controls">
                            <button type="submit" id="btnPrint" runat="server" class="btn btn-blue" onserverclick="_Show">
                                <i class="icon-ok"></i>&nbsp Aceptar</button>
                            <%--<a href='javascript:history.go(-1)' class="btn"><i class="icon-arrow-left"></i>&nbsp
                        Cancelar</a>
                            --%>
                             <button type="submit" id="btnCancelar" runat="server" class="btn" onserverclick="_Back">
                                <i class="icon-arrow-left"></i>&nbsp Cancelar</button>
                        </div>
                    </div>
                </div>
            </div>
            <%--REPORTE RESUMIDO--%>
            <div id="pnresumen" runat="server" class="control-group"> 
                <div class="box-title">
                    <%--<h3>
                        <i class="icon-edit"></i>Resumido</h3>--%>
                </div>
                <div class="box-content nopadding">
                    <table class="table table-bordered dataTable dataTable-scroll-x dataTable-tools">
                        <thead>
                            <tr> 
                                <th>No.</th> 
                                <th>Día</th> 
                                <th>Número de participantes a.m.</th>
                                <th>Número de participantes p.m.</th>
                                <th>Total de Participantes</th> 
                                <th>Total de sesiones realizadas A.M.</th> 
                                <th>Total de sesiones realizadas P.M.</th> 
                                <th>Total de sesiones realizadas</th> 
                            </tr>
                        </thead>
                        <tbody>
                            <asp:Repeater ID="rpresumido" runat="server">
                                <ItemTemplate>
                                    <tr>
                                        <td><%# Eval("NUMDIA")%></td>
                                        <td><%# Eval("DIADESCRIPCION")%></td>
                                        <td><%# Eval("AM")%></td>
                                        <td><%# Eval("PM")%></td>
                                        <td><%# Eval("TOTALDIARIO")%></td> 
                                        <td><%# Eval("CANT_ACTIVIDAD_AM")%></td>
                                        <td><%# Eval("CANT_ACTIVIDAD_PM")%></td>
                                        <td><%# Eval("TOTAL_ACTIVIDAD")%></td>
                                    </tr>
                                </ItemTemplate>
                            </asp:Repeater>
                        </tbody>
                    </table>
                </div> 
            </div> 
        </div>
    </asp:Panel>

</asp:Content>
