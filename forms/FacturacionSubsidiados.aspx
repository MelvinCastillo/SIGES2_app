<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true"
    CodeBehind="FacturacionSubsidiados.aspx.cs" Inherits="CAID_V2.forms.FacturacionSubsidiados" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">
    <asp:Panel runat="server" ID="pnlData">
        <%--       <script src="../js/notify.js" type="text/javascript"></script>
        <script src="../js/notify.min.js" type="text/javascript"></script>--%>
        <div class="box box-bordered">
            <div class="box-title">
                <h3>
                    <i class="icon-edit"></i>Facturacion Pacientes Subsidiados</h3>
            </div>
            <div class="box-content nopadding">
                <div class='form-horizontal form-bordered'>

                    <!-- Fecha: Desde -->
                    <div class="control-group">
                        <label for="txtDesde" class="control-label" style="color: Red">
                            Desde</label>
                        <div class="controls">
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
                        </div>
                    </div>
                    <!-- Fecha: Hasta -->
                    <div class="control-group">
                        <label for="txtHasta" class="control-label" style="color: Red">
                            Hasta</label>
                        <div class="controls">
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
                        <label for="txtFecha1" class="control-label" style="color: Red">
                            Acciones</label>
                        <div class="controls">
                            <button type="submit" id="BtnBuscarPX" runat="server" class="btn content-refresh btn-primary" onserverclick="_busca">
                                <i class="icon-search"></i>&nbsp Buscar</button>
                           <%-- <button type="submit" id="BtnExportar" runat="server" class="btn content-refresh btn-primary" onserverclick="_exportar">
                                <i class="icon-export"></i>&nbsp Exportar</button>--%>
                            <button type="button" id="BtnBack" runat="server"
                                class="btn btn-primary" data-dismiss="modal" onserverclick="_BackMain">
                                <i class="icon-arrow-left"></i>&nbsp Regresar
                            </button>

                        </div>
                    </div>
                    <div class="control-group">
                        <%--  <div class="box box-bordered">--%>
                        <div class="box-title">
                            <h3>
                                <i class="icon-edit"></i>Facturacion Pacientes Subsidiados</h3>
                        </div>
                        <div class="box-content nopadding">
                            <table id="dtdiagnosticos" class="table table-bordered dataTable dataTable-scroll-x dataTable-tools dataTable-grouping">
                                <thead>
                                    <tr>
                                        <%--<th>Servicio</th>--%>
                                        <th>Categoria</th>
                                        <th>FACTURA</th>
                                        <th>RECORDID</th>
                                        <th>PACIENTE</th>
                                        <th>Cant. SERVICIO</th>
                                        <th>SUBSIDIADO</th>
                                        <th>PAGOPx</th>
                                        <th>TOTAL</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <asp:Repeater ID="rpData" runat="server">
                                        <ItemTemplate>
                                            <tr>
                                                <td><strong><%# Eval("Categoria")%></strong></td>
                                                <%--<td class="hidden-450"><%# Eval("NOMBREESPECIALISTA")%></td>--%>
                                                <td><%# Eval("FACTURA")%></td>
                                                <td><%# Eval("RECORDID")%></td>
                                                <td><%# Eval("PACIENTE")%></td>
                                                <td><%# Eval("CantSERVICIO")%></td>
                                                <td><%# Eval("SUBSIDIADO")%></td>
                                                <td><%# Eval("PAGOPx")%></td>
                                                <td><%# Eval("PAGOPx")%></td>
                                            </tr>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                </tbody>
                                <%--    <tbody>
                                    <asp:Repeater ID="rpData" runat="server" OnItemDataBound="rpData_ItemDataBound" >
                                        <HeaderTemplate>
                                            <tr>
                                                <asp:Repeater ID="Header1" runat="server">
                                                    <ItemTemplate>
                                                        <th align="left"><%# Container.DataItem %>
                                                        </th>
                                                    </ItemTemplate>
                                                </asp:Repeater>
                                            </tr>
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <tr>
                                                <asp:Repeater ID="Item1" runat="server">
                                                    <ItemTemplate>
                                                        <td><%# Container.DataItem %>
                                                        </td>
                                                    </ItemTemplate>
                                                </asp:Repeater>
                                            </tr>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                </tbody>--%>
                            </table>
                            <%--      <script type="text/javascript">
                                 var table = $(document).ready(function () {
                                     $('#dtdiagnosticos').DataTable({
                                         dom: 'Bfrtip',
                                         buttons: [
                                             {
                                                 extend: 'copyHtml5',
                                                 exportOptions: {
                                                     columns: [0, ':visible']
                                                 }
                                             },
                                             {
                                                 extend: 'excelHtml5',
                                                 exportOptions: {
                                                     columns: ':visible'
                                                 }
                                             },
                                             {
                                                 extend: 'pdfHtml5',
                                                 exportOptions: {
                                                     columns: [0, 1, 2, 5]
                                                 }
                                             },
                                             'colvis'
                                         ]
                                     });
                                 });
                                 table.destroy();
                            </script>--%>
                        </div>
                        <%--</div>--%>
                    </div>
                </div>
            </div>
        </div>
    </asp:Panel>

</asp:Content>
