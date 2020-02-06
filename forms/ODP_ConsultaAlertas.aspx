<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true"
    CodeBehind="ODP_ConsultaAlertas.aspx.cs" Inherits="CAID_V2.forms.ODP_ConsultaAlertas" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">
    <asp:Panel runat="server" ID="pnlData">
        <link href="../css/bootstrap.min2.css" rel="stylesheet" /> 
        <div class="box box-bordered">
            <div class="box-content nopadding">
                <div class='form-horizontal form-bordered'>
                    <div class="box-title">
                        <h3>
                            <i class="icon-edit"></i>Alertas Odontologicas</h3>
                        <div class="actions">
                            <button type="button" id="btnregresar" runat="server" validationgroup="pnlEdit"
                                class="btn btn-warning" data-dismiss="modal" onserverclick="_Back">
                                <i class="icon-arrow-left"></i>&nbsp Regresar</button>
                        </div>
                    </div>
                    <div class="box-content nopadding">
                        <table class="table table-bordered dataTable dataTable-scroll-x dataTable-tools">
                            <thead>
                                <tr> 
                                    <th class="hidden-450">Paciente
                                    </th>
                                    <th class="hidden-350">Tipo Alerta
                                    </th>
                                    <th class="hidden-480">Fecha
                                    </th>
                                </tr>
                            </thead>
                            <tbody>
                                <asp:Repeater ID="rpData" runat="server">
                                    <ItemTemplate>
                                        <tr>
                                            <td>
                                                <%# Eval("Fullname")%>
                                            </td>
                                            <td class="hidden-450">
                                                <%# Eval("DescripcionAlerta")%>
                                            </td>
                                            <td class="hidden-350">
                                                <%# Eval("fecha")%>
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
    </asp:Panel>

</asp:Content>
