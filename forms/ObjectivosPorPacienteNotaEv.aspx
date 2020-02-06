<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ObjectivosPorPacienteNotaEv.aspx.cs"
    Inherits="CAID_V2.forms.ObjectivosPorPacienteNotaEv" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <!-- Apple devices fullscreen -->
    <meta name="apple-mobile-web-app-capable" content="yes" />
    <!-- Apple devices fullscreen -->
    <meta names="apple-mobile-web-app-status-bar-style" content="black-translucent" />
    <title>Seleccionar multiples objectivos en notas de evolucion</title>
    <link href="../css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="../css/bootstrap-responsive.css" rel="stylesheet" type="text/css" />
    <link href="../css/bootstrap-responsive.min.css" rel="stylesheet" type="text/css" />
    <link href="../css/style.css" rel="stylesheet" type="text/css" />
    <link href="../css/themes.css" rel="stylesheet" type="text/css" />
    <link href="../css/checkbox.css" rel="stylesheet" type="text/css" />
    <link href="../css/font-awesome.min.css" rel="stylesheet" type="text/css" />
    <link href="../css/plugins/icheck/all.css" rel="stylesheet" type="text/css" />
    <script src="../js/bootstrap.min.js" type="text/javascript"></script>
    <script src="../js/bootstrap.js" type="text/javascript"></script>
       <script src="../js/plugins/icheck/jquery.icheck.min.js" type="text/javascript"></script>
    <script language="javascript" type="text/javascript"> 

// <![CDATA[

        function btnSave_onclick() {

        }

// ]]>
    </script>
    <style>
        input:unchecked
        {
            height: 25px;
            width: 25px;
            color: Aqua;
        }
    </style>
    <style type="text/css">
        input:checked
        {
           font-weight: bold;
            height: 25px;
            width: 25px;
        }
    </style>
      <style>
            input[type="checkbox"] {
                font-weight: bold;
                height: 20px;
                width: 20px;
                vertical-align: middle;
            }
        </style>
</head>
<body>
    <form id="form1" runat="server">
    <div class="control-group">
        <%--<div class="span13">--%>
        <div style="text-align: left; margin: auto; padding-left: 0%;">
            <%--                    <h5 class="control-list">
                        Seleccione Objectivos
                    </h5>--%>

            <div class="controls-row" style="text-align: left; margin: auto; text-align: center;">
                <asp:CheckBoxList ID="ckobjectivosPorPaciente" CellPadding="3" Font-Size="X-Small" CellSpacing="3"
                    RepeatColumns="5" RepeatDirection="Horizontal" TextAlign="Right" runat="server">
                </asp:CheckBoxList>
            </div>
                  <%--  <script  type="text/jscript" src="../js/zepto.js"></script>
        <%-- <script src="../js/custom.js"></script>--%>
        <script  type="text/jscript" src="../js/icheck.js"></script>
        <script  type="text/jscript" src="../js/custom.min.js"></script> 

                                <%--<script type="text/jscript">
                                    $('#ckobjectivosPorPaciente').iCheck();
                    </script>--%>
<%--            <div class="checkbox" id="botones" runat="server">
                <label style="font-size: 1.5em">
                    <input type="checkbox" value="" checked />
                    <span class="cr"><i class="cr-icon fa fa-check"></i></span>Bigger
                </label>
            </div>--%>
            <button type="submit" id="btnSave" runat="server" class="btn btn-blue" visible="True"
                onserverclick="_Save">
                <i class="icon-save"></i>&nbsp Guardar Objectivos</button>
            <asp:TextBox ID="TxtPacienteRowguid" runat="server" Visible="False"></asp:TextBox>
            <asp:TextBox ID="txtespecialidad" runat="server" Visible="False"></asp:TextBox>
            <asp:TextBox ID="TxtTerapistaID" runat="server" Visible="False"></asp:TextBox>
            <asp:TextBox ID="TxtObjectivoID" runat="server" Visible="False"></asp:TextBox>
        </div>
        <%-- </div>--%>
    </div>
    </form>
</body>
</html>
