<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true"
    CodeBehind="ActividadesIntervencionGrupalConsultaPX.cs" Inherits="CAID_V2.forms.ActividadesIntervencionGrupalConsultaPX" %>

<%--Consulta General --%>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">
    <!-- dataTables -->
    <%--<link href="../css/bootstrap.min2.css" rel="stylesheet" />
    <link rel="stylesheet" href="../css/plugins/datatable/TableTools.css" />
    <script src="../js/plugins/datatable/TableTools.min.js" type="text/javascript"></script>--%>
    <script src="../js/notify.js" type="text/javascript"></script>
    <script src="../js/notify.min.js" type="text/javascript"></script>
    <script type="text/javascript">
        function notify(MSG, tipo) {
            $.notify(MSG, tipo);
        }
    </script>
    <asp:HiddenField ID="HiddenField1" runat="server" />
    <asp:HiddenField ID="PacienteID" runat="server" Value="0" />
    <asp:HiddenField ID="MedicoID" runat="server" Value="0" />
    <asp:HiddenField ID="TerapistaID" runat="server" Value="0" />
    <asp:HiddenField ID="EnfermeraID" runat="server" Value="0" />
    <asp:HiddenField ID="OrigenID" runat="server" Value="0" />
    <asp:HiddenField ID="txtEnfID" runat="server" Value="0" />
    <asp:HiddenField ID="xGUID" runat="server" />
    <asp:HiddenField ID="xActividadGUID" runat="server" />
    <%--  Consulta General --%>
    <asp:Panel runat="server" ID="pnlData">
        <div class="row-fluid">
            <div class="box box-bordered">
                <div class="box-title">
                    <h3>
                        <i class="icon-edit"></i>Consulta de Actividades de Pacientes</h3>
                    <div class="actions">
                    </div>
                </div>
                <div class="row-fluid">
                    <div class="box-content nopadding">
                        <div class='form-horizontal form-bordered'>
                            <%-- PACIENTE --%>
                                <label for="CmbPaciente12" class="control-label col-sm-6" style="color: Black; text-align:right"><strong>&nbsp PACIENTE:</strong></label>                           
                                <div class="controls">
                                <asp:DropDownList ID="cmbPaciente" runat="server" CssClass="select2-me input-xxlarge"
                                    data-rule-required="true" AutoPostBack="false">
                                </asp:DropDownList>
                                <button type="button" id="btnFilter2" runat="server" onserverclick="_Show" class="btn btn-blue"
                                    validationgroup="pnlSearch">
                                    <i class="icon-search"></i>&nbsp Buscar</button>
                                    <button type="button" id="btnBack" runat="server" onserverclick="_Back" class="btn btn-green">
                            <i class="icon-arrow-left"></i>&nbsp Regresar</button>
                                     </div>
                                                    
                            </div>
                        </div>
                        <div class="box">
                            <div class="box-content nopadding">
                                <table class="table table-bordered dataTable dataTable-scroll-x dataTable-tools">
                                    <thead runat="server">
                                        <tr>
                                            <th class="hidden-150">Actividad</th>
                                            <th style="width: 10%;">Fecha</th>
                                            <th style="width: 1%;">Dia</th>
                                            <th class="hidden-150">Horario</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <asp:Repeater ID="rpDetalles" runat="server">
                                            <ItemTemplate>
                                                <tr>
                                                    <td>
                                                        <%# Eval("DESCRIPCION")%>
                                                    </td>
                                                    <td>
                                                        <%# Eval("FECHA")%>  
                                                    </td>
                                                    <td>
                                                        <%# Eval("DIA")%>  
                                                    </td>
                                                    <td>
                                                        <%# Eval("HORARIO")%>
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
</asp:Content>
