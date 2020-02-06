<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true"
    CodeBehind="EstadisticasGenerales.aspx.cs" Inherits="CAID_V2.forms.EstadisticasGenerales" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">
    <div class="box box-bordered">
        <div class="box-title">
            <h3>
                <i class="icon-edit"></i>Estadísticas Generales</h3>
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
                    </div>
                </div>
                <!-- Fecha: Hasta -->
                <div class="control-group">
                    <label for="txtHasta" class="control-label" style="color: Red">
                        Hasta</label>
                    <div class="controls">
                        <input runat="server" name="txtHasta" id="txtHasta" type="text" class="input-medium datepick"
                            data-rule-required="false" placeholder="mm/dd/aaaa">
                    </div>
                </div>
                <p></p>
                    <label for="txtHasta" class="control-label"></label>
                    <button type="submit" id="btnPrint" runat="server" onserverclick="_Show"  class="btn btn-blue" validationgroup="pnlData"> 
                        <i class="icon-ok"></i>&nbsp Aceptar</button>
                    <button type="button" id="Button1" runat="server"
                        class="btn btn-default" data-dismiss="modal" onserverclick="_BackMain">
                        <i class="icon-arrow-left"></i>&nbsp Regresar
                    </button> 
                 <p></p>
            </div>
        </div>
    </div>
    <asp:Panel runat="server" ID="pnlData">
        <div class="box box-bordered">
            <%--Direcciones de Pacientes--%>
            <div id="pndetallado1" runat="server" class="control-group">
                <%--<div class="box-title">
                    <h3>
                        <i class="icon-edit"></i>Estadisticas Generales</h3>
                    <div class="actions">
                        <button id="btnShow" runat="server" onserverclick="_Show" class="btn">
                            <i class="icon-search"></i>&nbsp Buscar</button>
                        <button type="button" id="Button3" runat="server"
                            class="btn btn-default" data-dismiss="modal" onserverclick="_BackMain">
                            <i class="icon-arrow-left"></i>&nbsp Regresar
                        </button>
                    </div>
                </div>--%>
                <div class="box-content nopadding">
                    <table class="table table-bordered dataTable dataTable-scroll-x dataTable-tools dataTable-grouping">
                        <thead>
                            <tr>
                                <%--<th class="hidden-480">#</th>--%>
                                <th class="hidden-480">CATEGORIA</th>
                                <th class="hidden-480">CATEGORIA</th>
                                <th class="hidden-480">DESCRIPCION</th>
                                <th class="hidden-480">CANTIDAD</th>
                            </tr>
                        </thead>
                        <tbody>
                            <asp:Repeater ID="rpdetallado" runat="server">
                                <ItemTemplate>
                                    <tr>
                                        <td><strong><%# Eval("ID")%> - <%# Eval("CATEGORIA")%> </strong></td>
                                        <td><%# Eval("TITULO")%></td>
                                        <td><%# Eval("DATO")%></td>
                                        <td><%# Eval("VALOR")%></td>
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
