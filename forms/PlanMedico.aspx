<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PlanMedico.aspx.cs" Inherits="CAID_V2.forms.PlanMedico" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
	<!-- Apple devices fullscreen -->
	<meta name="apple-mobile-web-app-capable" content="yes" />
	<!-- Apple devices fullscreen -->
	<meta names="apple-mobile-web-app-status-bar-style" content="black-translucent" />
    <title>Plan Medico</title>
    <link href="../css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="../css/bootstrap-responsive.css" rel="stylesheet" type="text/css" />
    <link href="../css/bootstrap-responsive.min.css" rel="stylesheet" type="text/css" />
    <link href="../css/style.css" rel="stylesheet" type="text/css" />
    <link href="../css/themes.css" rel="stylesheet" type="text/css" />
    <script src="../js/bootstrap.min.js" type="text/javascript"></script>
    <script src="../js/bootstrap.js" type="text/javascript"></script>
    <script language="javascript" type="text/javascript">
// <![CDATA[

        function btnSave_onclick() {

        }

// ]]>
    </script>
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
            <div class="span13">
                <div style="text-align: left; margin: auto; padding-left: 0%;">
                    <h5 class="control-list">
                        Equipos Mecanicos
                    </h5>
                    <div class="controls-row" style="text-align: left; margin: auto; text-align: center;">
                        <asp:CheckBoxList ID="ckEquiposMecanicos" CellPadding="5" Font-Size="XX-Small" CellSpacing="5"
                            RepeatColumns="7" RepeatDirection="Horizontal" TextAlign="Right" runat="server">
                        </asp:CheckBoxList>
                    </div>
                    <button type="submit" id="btnSave" runat="server" class="btn btn-blue" onserverclick="_Save">
                        <i class="icon-save"></i>&nbsp Guardar Equipos</button>
                    <asp:TextBox ID="TxtPacienteRowguid" runat="server" Visible="False"  ></asp:TextBox>
                    <asp:TextBox ID="txtespecialidad" runat="server"  Visible="False"  ></asp:TextBox>
                    <asp:TextBox ID="TxtTerapistaID" runat="server"  Visible="False"  ></asp:TextBox>
                    <asp:TextBox ID="TxtObjectivoID" runat="server"  Visible="False"  ></asp:TextBox>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
