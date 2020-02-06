<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="ResumenEstadisticos.aspx.cs" Inherits="CAID_V2.forms.ResumenEstadisticos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">


<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap-theme.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.37/css/bootstrap-datetimepicker.min.css" />
...
<script src="https://code.jquery.com/jquery-1.9.1.js"></script>
<script src="https://code.jquery.com/ui/1.9.1/jquery-ui.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.10.6/moment.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.37/js/bootstrap-datetimepicker.min.js"></script>

    
    <link rel="stylesheet" href="/css/formgraficos.css">
    <script type="text/javascript">
    <%--function getLocalidad() {

        return '<%=@Session["CURRENTUSR_SGXID"].ToString()%>';
    }--%>
</script>

    <%--    FILTROS--%>
    <div class="row-fluid">
        <%-- <div class="span12">--%>
        <div class="box" id="divfiltros">
            <div class="box-title">
                <%-- <h3><i class="icon-edit"></i><strong>DASHBOARD CAID</strong></h3>--%>
                <div class="span4">
                    <ul class="nav nav-tabs">
                        <li class="active"><a data-toggle="tab" href="#TABPACIENTES"><i class="icon-edit"></i><strong>PACIENTES</strong></a></li>
                        <li><a data-toggle="tab" href="#TABCITAS"><i class="icon-edit"></i><strong>CITAS</strong></a></li>
                        <%--    <li><a data-toggle="tab" href="#menu2">Menu 2</a></li>
                                <li><a data-toggle="tab" href="#menu3">Menu 3</a></li>--%>
                    </ul>
                </div>

                <div id="divfechas" class="span8">
                    <div class="actions" id="divfechas1">
                        <!-- Fecha Inicio -->
                        <label for="txtFechaIni">Rango Fecha:</label>
                        <input runat="server" name="txtFechaIni" id="txtFechaIni" class="input-medium datepick" autocomplete="off"
                            data-date-autoclose="True" data-rule-required="true" placeholder="FECHA INICIO">
                        <asp:RequiredFieldValidator ControlToValidate="txtFechaIni" Display="Dynamic" ErrorMessage="Requerido!"
                            ID="RequiredFieldValidator2" runat="server" SetFocusOnError="True" ValidationGroup="pnlData" />
                        <input runat="server" name="txtFechaFinal" id="txtFechaFinal" class="input-medium datepick"
                            data-date-autoclose="True" data-rule-required="true" placeholder="FECHA FINAL" autocomplete="off">
                        <asp:RequiredFieldValidator ControlToValidate="txtFechaFinal" Display="Dynamic" ErrorMessage="Requerido!"
                            ID="RequiredFieldValidator1" runat="server" SetFocusOnError="True" ValidationGroup="divfiltros" />
                        <button type="button" id="btnPrint" runat="server" class="btn content-refresh btn-primary" onserverclick="_BuscarPacientes">
                            <i class="icon-search"></i>&nbsp Buscar</button>
                        <button type="button" id="btnBack" runat="server" class="btn content-refresh btn-primary">
                            <i class="icon-arrow-left"></i>&nbsp Regresar</button>
                        <%--                        <button type="button" id="btnBack" runat="server" class="btn content-refresh btn-primary"> 
                            <i class="icon-arrow-left"></i>&nbsp</button> --%>
                    </div>
                </div>

            </div>
        </div>
        <%--    Graficos--%>
        <div class="tab-content">
            <div id="TABPACIENTES" class="tab-pane fade in active">
                <asp:Panel ID="pnlPACIENTES" runat="server">
                <div class="row-fluid">
                    <div class="span6">
                        <div class="box">
                            <div class="box-title">
                                <h3>
                                    <i class="icon-bar-chart"></i>Distribución Pacientes por Género
                                </h3>
                                <div class="actions">
                                    <a href="#" class="btn btn-mini content-refresh"><i class="icon-refresh"></i></a>
                                    <a href="#" class="btn btn-mini content-slideUp"><i class="icon-angle-down"></i>
                                    </a>
                                </div>
                            </div>
                            <div>
                                <div id="dashboard-grph-genero">
                                    <asp:Chart ID="chartDistribucionGenero" runat="server" Height="400px" Width="800px">
                                        <ChartAreas>
                                            <asp:ChartArea Name="ChartArea1">
                                            </asp:ChartArea>
                                        </ChartAreas>
                                    </asp:Chart>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="span6">
                        <div class="box">
                            <div class="box-title">
                                <h3>
                                    <i class="icon-bar-chart"></i>Rango Edad Pacientes
                                </h3>
                                <div class="actions">
                                    <a href="#" class="btn btn-mini content-refresh"><i class="icon-refresh"></i></a>
                                    <a href="#" class="btn btn-mini content-slideUp"><i class="icon-angle-down"></i>
                                    </a>
                                </div>
                            </div>
                            <%--<div class="box-content">--%>
                            <div id="dashboard-grph-rangoedad">
                                <asp:Chart ID="chartRangoEdades" runat="server" Height="400px" Width="800px" Compression="100">
                                    <ChartAreas>
                                        <asp:ChartArea Name="ChartArea1">
                                        </asp:ChartArea>
                                    </ChartAreas>
                                </asp:Chart>
                            </div>
                            <%-- </div>--%>
                        </div>
                    </div>
                </div>

                <div class="row-fluid">
                    <div class="span6">
                        <div class="box">
                            <div class="box-title">
                                <h3>
                                    <i class="icon-bar-chart"></i>Status Pacientes
                                </h3>
                                <div class="actions">
                                    <a href="#" class="btn btn-mini content-refresh"><i class="icon-refresh"></i></a>
                                    <a href="#" class="btn btn-mini content-slideUp"><i class="icon-angle-down"></i>
                                    </a>
                                </div>
                            </div>
                            <%-- <div class="box-content">--%>
                            <div id="dashboard-grph-statuspacientes">
                                <asp:Chart ID="chartEstatus" runat="server" Height="400px" Width="800px">
                                    <ChartAreas>
                                        <asp:ChartArea Name="ChartArea1">
                                        </asp:ChartArea>
                                    </ChartAreas>
                                </asp:Chart>
                            </div>
                            <%--  </div>--%>
                        </div>
                    </div>
                    <div class="span6">
                        <div class="box">
                            <div class="box-title">
                                <h3>
                                    <i class="icon-bar-chart"></i>Clasificación Socioeconómica pacientes
                                </h3>
                                <div class="actions">
                                    <a href="#" class="btn btn-mini content-refresh" runat="server"><i class="icon-refresh"></i></a>
                                    <a href="#" class="btn btn-mini content-slideUp"><i class="icon-angle-down"></i></a>
                                </div>
                            </div>
                            <%--     <div class="box-content">--%>
                            <div id="dashboard-grph-categorias">
                                <asp:Chart ID="chartClaseSociales" runat="server" Height="400px" Width="800px">
                                </asp:Chart>
                            </div>
                            <%--  </div>--%>
                        </div>
                    </div>
                </div>
                         </asp:Panel>
            </div>
            <div id="TABCITAS" class="tab-pane fade">
                <asp:Panel ID="pnlCITAS" runat="server">
                    EN CONSTRUCCION
                </asp:Panel>
            </div>
        </div>

    </div>
</asp:Content>
