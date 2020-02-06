<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true"
    CodeBehind="PacientesPendientePruebas.aspx.cs" Inherits="CAID_V2.forms.PacientesPendientePruebas" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">
    <asp:Panel runat="server" ID="pnlData">
        <div class="box box-bordered">
            <%--Direcciones de Pacientes--%>
            <div id="pndetallado1" runat="server" class="control-group">
                <div class="box-title">
                    <h3>
                        <i class="icon-edit"></i>Pacientes Pendientes de Pruebas</h3>
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
                                <th class="hidden-350">RECORID</th>
                                <th class="hidden-480">NOMBRE</th>
                                <th class="hidden-480">ARS</th>
                                <th class="hidden-480">CATEGORIA</th>
                                <th class="hidden-480">ESTATUS</th>
                                <th class="hidden-480">EDAD</th>
                                <th class="hidden-480">Fec.Entrada</th>
                                <th class="hidden-480">Fec.Admisión</th>
                                <th class="hidden-480">Dias Ser Admitido</th>
                                <th class="hidden-480">Pruebas</th>
                                <th class="hidden-480">Estatus Pruebas</th>
                                
                            </tr>
                        </thead>
                        <tbody>
                            <asp:Repeater ID="rpdetallado" runat="server">
                                <ItemTemplate>
                                    <tr>
                                        <%-- <td><strong><%# Eval("NUMERO")%></strong></td>  --%>
                                        <td><%# Eval("RECORDID")%></td>
                                        <td><%# Eval("FULLNAME")%></td>
                                        <td><%# Eval("ARSDESCRIPCION")%></td>
                                        <td><%# Eval("CATEGORIADESC")%></td>
                                        <td><%# Eval("ESTATUSDESCRIPCION")%></td>
                                        <td><%# Eval("EDAD")%></td>
                                        <td><%#Convert.ToDateTime(Eval("ROWCDTE")).ToString("dd/MM/yyyy")%></td>
                                        <td><%#Convert.ToDateTime(Eval("Fechaadmision")).ToString("dd/MM/yyyy")%></td>
                                        <td><%# Eval("Dias_ParaserAdmitido")%></td>
                                        <td><%# Eval("PRUEBASPENDIENTES")%></td>
                                        <td><%# Eval("EstatusPruebasPendientes")%></td>
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
