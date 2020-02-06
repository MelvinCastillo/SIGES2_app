<%--<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true"  CodeBehind="DiagnosticoDefinitivo.aspx.cs" Inherits="CAID_V2.forms.DiagnosticoDefinitivo" %>--%>

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DiagnosticoDefinitivo.aspx.cs" Inherits="CAID_V2.forms.DiagnosticoDefinitivo" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8">
    <meta http-equiv="refresh" content="10800;url=http://caidsiges01:8000/index.aspx" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <!-- Apple devices fullscreen -->
    <meta name="apple-mobile-web-app-capable" content="yes" />
    <!-- Apple devices fullscreen -->
    <meta name="apple-mobile-web-app-status-bar-style" content="black-translucent" />
    <meta name="keywords" content="jQuery,Bootstrap,Calendar,HTML,CSS,JavaScript,responsive,month,week,year,day">
    <title></title>

</head>
<body>
    <%--onload="document.getElementById('<%= UpdateProgress1.ClientID %>').style.display = 'block'"--%>
    <form id="form1" runat="server">
        <%--      <div>
            <asp:ScriptManager ID="ScriptManager2" runat="server">
            </asp:ScriptManager>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                <ContentTemplate>
                    <asp:Timer ID="timer1" runat="server" Interval="300" OnTick="timer1_Tick"></asp:Timer> 
                </ContentTemplate>
            </asp:UpdatePanel>
            </div>
                  <asp:UpdateProgress ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID="UpdatePanel1">
                <ProgressTemplate>
                      <div class="control-group" style="color: black;text-align:center" >
                            <label for="lblloading" class="control-label" >
                                <strong>Cargando espere un momento, por favor...........</strong></label> 
                     <progress max="100" value="60">
                        <strong>Progress: 60% done.</strong>
                    </progress> 
                   <asp:Image ID="UpdateImage" runat="server"
                ImageUrl="~/img/loading1.gif" Width="10%" />
                </ProgressTemplate>
            </asp:UpdateProgress>
        --%>
        <asp:Panel runat="server" ID="pnlData">
            <link rel="stylesheet" href="../css/bootstrap.min.css">
            <!-- select2 -->
            <link rel="stylesheet" href="../css/plugins/select2/select2.css">
            <link rel="stylesheet" href="../css/themes.css">
            <script src="../js/jquery.min.js"></script>
            <script src="../js/plugins/chosen/chosen.jquery.min.js"></script>
            <!-- select2 -->
            <script src="../js/plugins/select2/select2.min.js"></script>
            <script src="../js/plugins/daterangepicker/moment.min.js"></script>
            <script src="../js/eakroko.min.js"></script>
            <!-- Theme scripts -->
            <script src="../js/application.min.js"></script>

            <div class="box box-bordered">
                <div class="box-content nopadding">
                    <div class='form-horizontal form-bordered'>

                        <!-- Diagnostico 1 -->
                        <div class="control-group">
                            <label for="lblViaContacto" class="control-label" style="color: black">
                                Diagnostico 1</label>
                            <div class="controls">
                                <asp:DropDownList ID="CmbDiagnostico1" runat="server" CssClass="select2-me input-xxlarge"
                                    data-rule-required="true">
                                </asp:DropDownList>

                            </div>
                        </div>
                        <!-- Diagnostico 2 -->
                        <div class="control-group">
                            <label for="lblMotivo" class="control-label" style="color: black">
                                Diagnostico 2</label>
                            <div class="controls">
                                <asp:DropDownList ID="CmbDiagnostico2" runat="server" CssClass="select2-me input-xxlarge"
                                    data-rule-required="true">
                                </asp:DropDownList>
                            </div>
                        </div>
                        <div class="control-group">
                            <label for="txtDiagnosticoOtros" class="control-label">Diagnostico Otros</label>
                            <div class="controls" style="text-align: center;">
                                <asp:TextBox ID="txtDiagnosticoOtros" runat="server" TextMode="MultiLine" Height="30px"
                                    Wrap="true" placeholder="Diagnostico Otros" CssClass="input-block-level"></asp:TextBox>
                            </div>
                        </div>
                        <div class="control-group">
                            <label for="lblacciones" class="control-label"></label>
                            <div class="controls" style="text-align: left;">
                                <button type="submit" id="btnPrint" runat="server" class="btn btn-green" onserverclick="_Save">
                                    <i class="icon-arrow-down"></i>&nbsp Agregar</button>
                            </div>
                        </div>
                        <div class="control-group" style="visibility: hidden">
                            <label for="CmbPaciente12" class="control-label" style="color: Red">
                                Paciente</label>
                            <div class="controls">
                                <input type="text" name="txtNombrePaciente" id="txtNombrePaciente" placeholder="Digite Aqui" class='input-block-level' disabled runat="server" cssclass="input-xxlarge">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </asp:Panel>
        <!-- jQuery -->
        <script src="../js/jquery.min.js"></script>
        <script src="../js/notify.js" type="text/javascript"></script>
        <script src="../js/notify.min.js" type="text/javascript"></script>
        <script type="text/javascript">
            function notify(MSG, tipo) {
                $.notify(MSG, tipo);
            }
        </script>

    </form>
</body>
</html>

