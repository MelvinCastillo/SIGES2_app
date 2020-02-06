<%--<%@ Page Title="" Language="C#" MasterPageFile="" AutoEventWireup="true"
    CodeBehind="ConsultaEvaluacionMultiDisciplinaria.cs" Inherits="CAID_V2.forms.ConsultaEvaluacionMultiDisciplinaria" %>--%>

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ConsultaIntervencionGrupal.aspx.cs"
    Inherits="CAID_V2.forms.ConsultaIntervencionGrupal" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Actividades por Pacientes</title>
    <link href="../css/bootstrap.min.css" rel="stylesheet" type="text/css" /> 
    <link rel="stylesheet" href="../css/style.css" />  
</head>
<body>
    <form id="form1" runat="server">
        <div class="container-fluid" id="content"> 
            <%--  Consulta General --%>
            <table class="table table-bordered dataTable-scroll-x">
                <thead>
                    <tr>
                        <th>No.
                        </th>
                        <th style="width: 9%;">Fecha
                        </th>
                        <th style="width: 20%;">Profesional
                        </th>
                        <th>Descripción
                        </th>
                        <%--<th>Acciones</th>--%>
                    </tr>
                </thead>
                <tbody>
                    <asp:Repeater ID="RPMultidisciplinaria" runat="server">
                        <ItemTemplate>
                            <tr>
                                <th>  <%# Eval("NUMERO")%> </th>
                                <td>
                                    <%# Eval("FECHA")%>
                                </td>
                                <td>  
                                    <%# Eval("TERAPEUTA")   %>
                                    <br />
                                    <%# Eval("ESPECIALIDAD")%>
                                </td>
                                <td>
                                    <%# Eval("DESCRIPCION")%>
                                </td>
                                <%--<td>
                                                                        <asp:LinkButton ID="btnFile" runat="server" CssClass="btn btn-primary" Text="Descargar"
                                                                            CommandArgument='<%# Eval("URL")%>' CommandName="View" OnClick="_Select"><i class="icon-circle-arrow-down"></i></asp:LinkButton>
                                                                    </td>--%>
                            </tr>
                        </ItemTemplate>
                    </asp:Repeater>
                </tbody>
            </table>
    </form>
</body>
</html>

