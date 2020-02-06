<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true"
    CodeBehind="WebForm2.aspx.cs" Inherits="CAID_V2.forms.Estadisticas" %>


<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
<script type="text/javascript">
    function getLocalidad() {

        return '<%=@Session["CURRENTUSR_SGXID"].ToString()%>';
    }
</script>
    <asp:HiddenField ID="data_genero" runat="server" ClientIDMode="Static" />
    <asp:HiddenField ID="data_em" runat="server" ClientIDMode="Static" />
    <asp:HiddenField ID="data_pa" runat="server" ClientIDMode="Static" />
    <%--<div class="row-fluid">
        <div class="span6">
            <div class="box">
                <div class="box-title">
                    <h3>
                        <i class="icon-bar-chart"></i>Género
                    </h3>
                    <div class="actions">
                        <a href="#" class="btn btn-mini content-refresh"><i class="icon-refresh"></i></a>
                        <a href="#" class="btn btn-mini content-slideUp"><i class="icon-angle-down"></i>
                        </a>
                    </div>
                </div>
                <div class="box-content">
                    <div id="GENERO-pie-chart" class='flot'>
                    </div>
                </div>
            </div>
        </div>
        <div class="span6">
            <div class="box">
                <div class="box-title">
                    <h3>
                        <i class="icon-bar-chart"></i>Edades
                    </h3>
                    <div class="actions">
                        <a href="#" class="btn btn-mini content-refresh"><i class="icon-refresh"></i></a>
                        <a href="#" class="btn btn-mini content-slideUp"><i class="icon-angle-down"></i>
                        </a>
                    </div>
                </div>
                <div class="box-content">
                    <div id="EDADES-pie-chart" class='flot'>
                    </div>
                </div>
            </div>
        </div>
    </div>--%>
    <%--    Graficos--%>
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
                <div class="box-content">
                    <div id="dashboard-grph-genero" class='flot'>
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
                <div class="box-content">
                    <div id="dashboard-grph-rangoedad" class='flot'>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="row-fluid">
        <div class="span12">
            <div class="box">
                <div class="box-title">
                    <h3>
                        <i class="icon-bar-chart"></i>Diagnóstico Pacientes Recibidos
                    </h3>
                    <div class="actions">
                        <a href="#" class="btn btn-mini content-refresh"><i class="icon-refresh"></i></a>
                        <a href="#" class="btn btn-mini content-slideUp"><i class="icon-angle-down"></i>
                        </a>
                    </div>
                </div>
                <div class="box-content">
                    <div id="dashboard-grph-diagnosticos" class='flot'>
                    </div>
                </div>
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
                <div class="box-content">
                    <div id="dashboard-grph-statuspacientes" class='flot'>
                    </div>
                </div>
            </div>
        </div>
        <div class="span6">
            <div class="box">
                <div class="box-title">
                    <h3>
                        <i class="icon-bar-chart"></i>Clasificación Socioeconómica pacientes
                    </h3>
                    <div class="actions">
                        <a href="#" class="btn btn-mini content-refresh"><i class="icon-refresh"></i></a>
                        <a href="#" class="btn btn-mini content-slideUp"><i class="icon-angle-down"></i>
                        </a>
                    </div>
                </div>
                <div class="box-content">
                    <div id="dashboard-grph-categorias" class='flot'>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <%--Calendario--%>
    <%--<div class="row-fluid">
        <div class="span12">
            <div class="box">
                <div class="box-title">
                    <h3>
                        <i class="icon-calendar"></i>Programacion Mensual</h3>
                </div>
                <div class="box-content nopadding">
                    <div class="calendar">
                    </div>
                </div>
            </div>
        </div>
    </div>--%>
</asp:Content>
