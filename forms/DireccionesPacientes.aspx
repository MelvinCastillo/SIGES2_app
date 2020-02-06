<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true"
    CodeBehind="DireccionesPacientes.aspx.cs" Inherits="CAID_V2.forms.DireccionesPacientes" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">
    <asp:Panel runat="server" ID="pnlData">
        <div class="box box-bordered"> 
            <%--Direcciones de Pacientes--%>
            <div id="pndetallado1" runat="server" class="control-group"> 
                <div class="box-title">
                    <h3>
                        <i class="icon-edit"></i>Direcciones de Pacientes</h3>
                    <div class="actions">
                        <button id="btnShow" runat="server" onserverclick="_Show" class="btn">
                            <i class="icon-search"></i>&nbsp Buscar</button> 
                        <button type="button" id="Button3" runat="server"
                            class="btn btn-default" data-dismiss="modal" onserverclick="_BackMain">
                            <i class="icon-arrow-left"></i>&nbsp Regresar
                        </button>
                    </div>
                </div>
                <div class="box-content nopadding"> 
                    <table class="table table-bordered dataTable dataTable-scroll-x dataTable-tools">
                        <thead>
                            <tr> 
                                <%--<th class="hidden-480">#</th>--%>
                                <th class="hidden-350">NOMBRES</th>
                                <th class="hidden-480">RECORID</th>
                                <th class="hidden-480">PAIS</th>
                                <th class="hidden-480">PROVINCIA</th>
                                <th class="hidden-480">MUNICIPIO</th>
                                <th class="hidden-350">SECTOR</th>
                                <th class="hidden-480">PREDIAGNOSTICO</th>
                                <th class="hidden-350">CENTRO</th>
                            </tr>
                        </thead>
                        <tbody>
                            <asp:Repeater ID="rpdetallado" runat="server">
                                <ItemTemplate>
                                    <tr>
                                       <%-- <td><strong><%# Eval("NUMERO")%></strong></td>  --%>
                                        <td><%# Eval("FULLNAME")%></td>
                                        <td><%# Eval("RECORID")%></td>
                                        <td><%# Eval("PAISNOMBRE")%></td>
                                        <td><%# Eval("PROVINCIANOMBRE")%></td>
                                        <td><%# Eval("MUNICIPIONOMBRE")%></td>
                                        <td><%# Eval("SECTORNOMBRE")%></td>
                                        <td><%# Eval("PREDIAGNOSTICO")%></td>
                                        <td><%# Eval("ROWSGXID")%></td> 
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
