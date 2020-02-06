<%--<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RegistroCitas.aspx.cs" Inherits="CAID_V2.forms.RegistroCitas" %>--%>

<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true"
    CodeBehind="RegistroCitas.aspx.cs" Inherits="CAID_V2.forms.RegistroCitas" %>

<%--Consulta General --%>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <div class="container" style="left: 0; top:-20; position: absolute;">
        <%--      <h2>REGISTRO DE CITAS</h2>
        <br>--%>
        <!-- Nav pills -->
        <ul class="nav nav-pills" role="tablist">
            <li class="nav-item">
                <a class="nav-link active" data-toggle="pill" href="#CIndividual">Programación Citas</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" data-toggle="pill" href="#CRecurrentes">Recurrentes</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" data-toggle="pill" href="#CGrupales">Grupales</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" data-toggle="pill" href="#CRutaBasica">Ruta Básica</a>
            </li>
            <li  class="nav-item" style="margin-left: auto; margin-right: inherit;  background-color:#4273a3; font-size:13px !important; font-family:sans-serif; "   >
                <strong>
                    <a href='http://caidsiges01:8000/index.aspx' class="nav-link" style="color:white;"><i class="icon-arrow-left"></i>&nbsp  REGRESAR SIGES</a>
                </strong>
            </li>
        </ul>
        <!-- Tab panes -->
        <div class="tab-content">
            <div id="CIndividual" class="tab-pane active">
                <div style="width: 1300px; height: 1450px; position: relative; overflow: hidden; align-content: center;">
                    <iframe src="http://caidsiges01:8000/SMX00500.aspx" style="top: -220px; left: -200px; position: absolute" width="1450px" height="1450px" scrolling="no" frameborder="1"></iframe>
                </div>
            </div>
            <div id="CRecurrentes" class="tab-pane fade">
                <div style="width: 1300px; height: 1450px; position: relative; overflow: hidden; align-content: center;">
                    <iframe src="http://caidsiges01:8000/SMX00501.aspx" style="top: -220px; left: -200px; position: absolute" width="1450px" height="1450px" scrolling="no" frameborder="1"></iframe>
                </div>
            </div>
            <div id="CGrupales" class="tab-pane fade">
                <div style="width: 1300px; height: 1450px; position: relative; overflow: hidden; align-content: center;">
                    <iframe src="http://caidsiges01:8000/SMX00503.aspx" style="top: -220px; left: -200px; position: absolute" width="1450px" height="1450px" scrolling="no" frameborder="1"></iframe>
                </div>
            </div>
            <div id="CRutaBasica" class="tab-pane fade">
                <div style="width: 1300px; height: 1450px; position: relative; overflow: hidden; align-content: center;">
                    <iframe src="http://caidsiges01:8000/SMX00502.aspx" style="top: -220px; left: -200px; position: absolute" width="1450px" height="1450px" scrolling="no" frameborder="1"></iframe>
                </div>
            </div>
        </div>
    </div>

</asp:Content>
