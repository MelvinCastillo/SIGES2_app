<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PREVIEW.aspx.cs"
    Inherits="CAID_V2.forms.PREVIEW" %>

<%@ Register Assembly="CrystalDecisions.Web, Version=13.0.2000.0, Culture=neutral, PublicKeyToken=692fbea5521e1304"
    Namespace="CrystalDecisions.Web" TagPrefix="CR" %> 

<%--<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=10.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
    Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>--%>
<%--
<%@ Register Assembly="CrystalDecisions.Web, Version=13.0.2000.0, Culture=neutral, PublicKeyToken=692fbea5521e1304"
    Namespace="CrystalDecisions.Web" TagPrefix="CR" %>--%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Visor de Reportes</title>
    
<%--// <![CDATA[

        function btnSave_onclick() {

        }

// ]]>--%>
    <%--</script>--%>
</head>
<body>
    <form id="form1" runat="server">
    <div class="row-fluid">
        <div class="span12">
     <%--       <CR:CrystalReportViewer ID="CrystalReportViewer1" runat="server" AutoDataBind="true" />
            <CR:CrystalReportViewer ID="CrystalReportViewer2" runat="server" AutoDataBind="true" />
            <rsweb:ReportViewer ID="ReportViewer1" runat="server">
               
            </rsweb:ReportViewer>--%>
             <cr:crystalreportviewer ID="CrystalReportViewer1" runat="server" 
                AutoDataBind="true" />
        <%--    <CR:CrystalReportViewer ID="mainReportViewer" runat="server" AutoDataBind="true"
                HasCrystalLogo="False" HasDrilldownTabs="False" HasDrillUpButton="False" HasToggleGroupTreeButton="False"
                HasToggleParameterPanelButton="False" ToolPanelView="None" PrintMode="ActiveX" />--%>
        </div>
    </div>

    <div class="row-fluid">
        <div class="span12">
            <asp:Panel ID="MSGALERT" runat="server" Visible="false">
                <div class="wrapper orange">
                    <div class="box box-bordered red">
                        <div class="box-title">
                            <h3>
                                <i class="icon-bell"></i>Notificación
                            </h3>
                        </div>
                        <div class="box-content">
                            <br />
                            <p>
                                <asp:Label ID="lblMSG" runat="server" Text="NO EXISTEN DATOS PARA CARGAR EL REPORTE"></asp:Label>
                            </p>
                            <br />
                            <br />
                            <p>
                            </p>
                        </div>
                    </div>
     
                </div>
            </asp:Panel>
        </div>
    </div>
    </form>
</body>
</html>
