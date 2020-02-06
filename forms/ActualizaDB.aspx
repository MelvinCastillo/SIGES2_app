<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ActualizaDB.aspx.cs" Inherits="CAID_V2.forms.ActualizaDB" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Actualizacion de Informacion</title>
    <link href="../css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <%--<link rel="stylesheet" href="../css/bootstrap.min.css" />--%>
    <link rel="stylesheet" href="../css/bootstrap-responsive.min.css" />
    <link rel="stylesheet" href="../css/style.css" />
    <link rel="stylesheet" href="../css/plugins/datepicker/datepicker.css" />

    <script src="../js/bootstrap.min.js" type="text/javascript"></script>
    <script src="../js/bootstrap.js" type="text/javascript"></script>
    <script src="../js/jquery.min.js" type="text/javascript"></script>
    <script src="../js/jquery.min.js" type="text/javascript"></script>
    <script src="../js/bootstrap.min.js" type="text/javascript"></script>
    <script src="../js/notify.js" type="text/javascript"></script>
    <script src="../js/notify.min.js" type="text/javascript"></script>
    <script src="../js/plugins/daterangepicker/moment.min.js" type="text/javascript"></script>

    <!-- Datepicker -->
    <script src="../js/plugins/datepicker/bootstrap-datepicker.js" type="text/javascript"></script>
    <script type="text/javascript">
        function notify(MSG, tipo) {
            $.notify(MSG, tipo);
        }

    </script>
</head>
<body>
    <form id="form1" runat="server">
        <script type="text/javascript">
            function CloseWindow() {
                window.close();
                return false;
            }
        </script>

        <script type="text/javascript">
            function myff1() {

                window.close();
                return false;
            }
        </script>

        <script type="text/javascript">   

            function pageLoad() {
                Sys.WebForms.PageRequestManager.getInstance().add_endRequest(endRequestHandler);
            }
        </script>


        <div id="ModalActualizaAlta" role="dialog">
            <div class="modal-content">
                <%-- <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title">Modal Header</h4>
                    </div>--%>
                <%--ACTUALIZA DE ALTA CITAS--%>
                <div class="modal-body" id="DivDEALTAPACIENTE" visible="false" runat="server">
                    <h4>
                        <asp:Label ID="lblmensaje" runat="server" Text="Cambio de Estatus a DE ALTA o CANCELADA"></asp:Label></h4>
                    <div class="col-sm-6">
                        <%-- 1- Cambio Estatus--%>
                        <div class="control-group">
                            <label for="lblestatus" class="control-label col-sm-2">
                                Estatus:</label>
                            <div class="controls">
                                <asp:DropDownList ID="ddlestatusCitas" CssClass="input-medium" runat="server">
                                    <asp:ListItem Value="-1" Text="-- Seleccione --">--SELECCIONE--</asp:ListItem>
                                    <asp:ListItem Value="2" Text="Cancelada">Cancelada</asp:ListItem>
                                    <asp:ListItem Value="6" Text="De Alta">De Alta</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </div>
                    </div>
                    <div class="row-fluid">
                        <table id="tbfechas" style="width: 100%; display: none" runat="server">
                            <tr>
                                <th>
                                    <label for="txtDesde" class="control-label" style="text-align: left">Desde</label></th>
                                <th>
                                    <label for="txtHasta" class="control-label" style="text-align: left">Hasta</label></th>
                            </tr>
                            <tr>
                                <td>
                                    <input runat="server" name="txtDesde" id="txtDesde" type="text" class="input-medium datepick"
                                        data-rule-required="false" placeholder="mm/dd/aaaa" autocomplete="off" /></td>
                                <%--  <asp:RequiredFieldValidator ControlToValidate="txtDesde" Display="Dynamic" ErrorMessage="Requerido!"
                                    ID="txtDesde1" runat="server" SetFocusOnError="True" ValidationGroup="pnlData" />--%>
                                <td>
                                    <input runat="server" name="txtHasta" id="txtHasta" type="text" class="input-medium datepick"
                                        data-rule-required="false" placeholder="mm/dd/aaaa" autocomplete="off" /></td>
                            </tr>
                        </table>
                        <script type="text/javascript">
                            $(function () {
                                // ctl00_MainContent_txthorallegada
                                $('#txtDesde').datepicker({
                                    toggleActive: false,
                                    format: "mm/dd/yyyy",
                                    todayHighlight: true,
                                    // calendarWeeks: true ,
                                    language: "es",
                                    todayBtn: "linked",
                                    showOnFocus: true,
                                    autoclose: true

                                });
                            });
                        </script>
                        <script type="text/javascript">
                            $(function () {
                                // ctl00_MainContent_txthorallegada
                                $('#txtHasta').datepicker({
                                    toggleActive: false,
                                    format: "mm/dd/yyyy",
                                    todayHighlight: true,
                                    // calendarWeeks: true ,
                                    language: "es",
                                    todayBtn: "linked",
                                    showOnFocus: true,
                                    autoclose: true
                                    //disabledDates: [
                                    //    moment("12/25/2013"),
                                    //    new Date(2013, 11 - 1, 21),
                                    //    "11/22/2013 00:53"
                                    //]

                                });
                            });

                        </script>
                    </div>
                    <div class="col-sm-6">
                        <div class="control-group">
                            <label for="lblhacequetiempo" class="control-label col-sm-2">
                                Comentarios:</label>
                            <div class="controls">
                                <textarea runat="server" name="txtcomentariocita" id="txtcomentariocita" rows="5" class="input-block-level" data-rule-required="true" placeholder="Digite Aqui"></textarea>
                            </div>
                            <div class="controls">
                                <div class="actions">
                                    <%--<button type="button" data-toggle="modal" class="btn btn-primary" id="btnCambiarEstatus" onclick="_ActualizaTratamiento">Guardar</button>--%>
                                    <button type="button" id="Button1" runat="server" class="btn btn-primary" data-dismiss="modal" onserverclick="_Save">
                                        <i class="icon-plus-sign"></i>&nbsp Guardar</button>
                                    <button type="button" id="Button2" runat="server" class="btn btn-danger" data-dismiss="modal"  onclick="self.close()"> <%--onserverclick="_Close"--%>
                                        <i class="icon-remove"></i>&nbsp Cerrar</button>
                                    <%--<asp:LinkButton ID="btnclose" CssClass="btn btn-danger" runat="server" Text="Cerrar" OnClick="_Close"> <i class="icon-remove"></i>&nbsp Cerrar </asp:LinkButton>--%>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <%--CREA DE ALTA PACIENTE SERVICIO--%>
                <div class="modal-body" id="DivDEALTASERVICIO" visible="false" runat="server">
                    <h4>
                        <asp:Label ID="lblaltaservicio" runat="server" Text="DE ALTA SERVICIO"></asp:Label></h4>
                    <div class="col-sm-6">
                        <div class="control-group">
                            <label for="lblComentarioaltaservicio" class="control-label col-sm-2">
                                Comentarios:</label>
                            <div class="controls">
                                <textarea runat="server" name="txtcomentarioaltaservicio" id="txtcomentarioaltaservicio" rows="8" class="input-block-level" data-rule-required="true" placeholder="Digite Aqui"></textarea>
                            </div>
                            <div class="controls">
                                <div class="actions">
                                    <%--<button type="button" data-toggle="modal" class="btn btn-primary" id="btnCambiarEstatus" onclick="_ActualizaTratamiento">Guardar</button>--%>
                                    <button type="button" id="BtnSaveAltaServicio" runat="server" class="btn btn-primary" data-dismiss="modal" onserverclick="_SaveALTASERVICIO">
                                        <i class="icon-plus-sign"></i>&nbsp Guardar</button>
                                    <button type="button" id="Button4" runat="server" class="btn btn-danger" data-dismiss="modal" onserverclick="_Close">
                                        <i class="icon-remove"></i>&nbsp Cerrar</button>
                                    <%--<asp:LinkButton ID="btnclose" CssClass="btn btn-danger" runat="server" Text="Cerrar" OnClick="_Close"> <i class="icon-remove"></i>&nbsp Cerrar </asp:LinkButton>--%>
                                </div>
                            </div>
                        </div>
                    </div>

                    <%--                        <div class="modal-footer">
                            <asp:LinkButton ID="btnclose1" CssClass="btn btn-red" runat="server" Text="Cerrar" OnClick="_Close"></asp:LinkButton>

                        </div>--%>
                </div>
                <%--ACTUALIZA TRATAMIENTO--%>
                <div class="modal-body" id="DivActulizaTratamiento" visible="false" runat="server">
                    <h4>
                        <asp:Label ID="Label1" runat="server" Text="Cambia Estatus Tratamiento"></asp:Label></h4>
                    <%--<div class="modal-footer">--%>
                    <div class="box-content nopadding">
                        <div class='form-horizontal form-column form-bordered'>
                            <div class="row">
                                <div class="col-sm-6">
                                    <%-- 1- Cambio Estatus--%>
                                    <div class="control-group">
                                        <label for="lblestatus" class="control-label col-sm-2">
                                            Estatus:</label>
                                        <div class="controls">
                                            <asp:DropDownList ID="ddlestatus" CssClass="input-medium" runat="server">
                                                <asp:ListItem Value="0">-- Seleccione --</asp:ListItem>
                                                <asp:ListItem Value="S">Suspendido</asp:ListItem>
                                                <asp:ListItem Value="A">Activo</asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                        <div class="controls">
                                            <div class="actions">
                                                <%--<button type="button" data-toggle="modal" class="btn btn-primary" id="btnCambiarEstatus" onclick="_ActualizaTratamiento">Guardar</button>--%>
                                                <button type="button" id="btnCambiarEstatus" runat="server" class="btn btn-primary" data-dismiss="modal" onserverclick="_ActualizaTratamiento">
                                                    <i class="icon-plus-sign"></i>&nbsp Guardar</button>
                                                <button type="button" id="btncerrar" runat="server" class="btn btn-danger" data-dismiss="modal" onserverclick="_Close">
                                                    <i class="icon-remove"></i>&nbsp Cerrar</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <%--CREA COMENTARIO DEL PACIENTE--%>
                <div class="modal-body" id="DivNotasPx" visible="false" runat="server">
                    <h4>
                        <asp:Label ID="lblnotaspx" runat="server" Text="Notas Paciente"></asp:Label></h4>
                    <div class="col-sm-6">
                        <div class="control-group">
                            <label for="lblnotaspx" class="control-label col-sm-2">
                                Notas:</label>
                            <div class="controls">
                                <textarea runat="server" name="txtnotaspx" id="txtnotaspx" rows="8" class="input-block-level" data-rule-required="true" placeholder="Digite Aqui"></textarea>
                            </div>
                            <div class="controls">
                                <div class="actions">
                                    <button type="button" id="btnNotasPx" runat="server" class="btn btn-primary" data-dismiss="modal" onserverclick="_SaveNotasPX">
                                        <i class="icon-plus-sign"></i>&nbsp Guardar</button>
                                    <button type="button" id="BtncerrarNotas" runat="server" class="btn btn-danger" data-dismiss="modal" onserverclick="_Close">
                                        <i class="icon-remove"></i>&nbsp Cerrar</button>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>


            </div>
            <%--MODIFICA NUCLEO FAMILIAR DEL PACIENTE--%>
            <div id="DivNucleoFamiliar" visible="false" runat="server">

                <div class="modal-header">
                    <div class="box">
                        <div class="box-title">
                            <h3>
                                <i class="icon-reorder"></i>Núcleo Familiar
                            </h3>
                            <%-- <ul class="tabs">
                                            <li class="active"><a href="#tabNucleoFam1" data-toggle="tab">Registro</a> </li> 
                                        </ul>--%>
                        </div>
                    </div>
                </div>
                <div>
                    <div class='form-horizontal'>
                        <div class="tab-content padding tab-content-inline tab-content-bottom">
                            <div class="tab-pane active" id="tabNucleoFam1">
                                <div class="box-content">
                                    <div class="control-group">
                                        <label for="cmbNFParentesco" class="control-label" style="color: Red">
                                            Parentesco</label>
                                        <div class="controls">
                                            <select runat="server" id="cmbNFParentesco" name="cmbNFParentesco" class='select2-me input-block-level'
                                                data-rule-required="true">
                                            </select>
                                        </div>
                                    </div>
                                    <div class="control-group">
                                        <label for="txtNFCedula" class="control-label">
                                            Identificación</label>
                                        <div class="controls">
                                            <input runat="server" type="text" name="txtNFCedula" id="txtNFCedula" class="input-medium"
                                                placeholder="No. Cédula">
                                            <input runat="server" type="text" name="txtNFPasaporte" id="txtNFPasaporte" class="input-medium"
                                                placeholder="No. Pasaporte">
                                        </div>
                                    </div>
                                    <div class="control-group">
                                        <label for="txtNFNombre1" class="control-label">
                                            Nombres</label>
                                        <div class="controls">
                                            <input runat="server" type="text" name="txtNFNombre1" id="txtNFNombre1" class="input-medium"
                                                placeholder="Primer Nombre">
                                            <input runat="server" type="text" name="txtNFNombre2" id="txtNFNombre2" class="input-medium"
                                                placeholder="Segundo Nombre">
                                        </div>
                                    </div>
                                    <div class="control-group">
                                        <label for="txtNFApellido1" class="control-label">
                                            Apellidos</label>
                                        <div class="controls">
                                            <input runat="server" type="text" name="txtNFApellido1" id="txtNFApellido1" class="input-medium"
                                                placeholder="Primer Apellido">
                                            <input runat="server" type="text" name="txtNFApellido2" id="txtNFApellido2" class="input-medium"
                                                placeholder="Segundo Apellido">
                                        </div>
                                    </div>
                                    <!-- Fecha Nacimiento -->
                                    <script type="text/javascript">
                                        $(function () {
                                            // ctl00_MainContent_txthorallegada
                                            $('#txtNFFechaNace').datepicker({
                                                toggleActive: false,
                                                format: "mm/dd/yyyy",
                                                todayHighlight: true,
                                                // calendarWeeks: true ,
                                                language: "es",
                                                todayBtn: "linked",
                                                showOnFocus: true,
                                                autoclose: true

                                            });
                                        });
                                    </script>

                                    <div class="control-group">
                                        <label for="txtNFFechaNace" class="control-label" style="color: Red">
                                            Fecha de Nacimiento</label>
                                        <div class="controls">
                                            <input runat="server" name="txtNFFechaNace" id="txtNFFechaNace" type="text" class="input-medium datepick"
                                                data-rule-required="true" placeholder="mm/dd/aaaa">
                                            <%--<span class="help-block">mm/dd/aaaa</span>--%>
                                        </div>
                                    </div>
                                    <div class="control-group">
                                        <label for="cmbNFEscolaridad" class="control-label" style="color: Red">
                                            Grado Escolaridad</label>
                                        <div class="controls">
                                            <select runat="server" id="cmbNFEscolaridad" name="cmbNFEscolaridad" class='select2-me input-block-level'
                                                data-rule-required="true">
                                            </select>
                                        </div>
                                    </div>
                                    <div class="control-group">
                                        <label for="cmbNFEstadoCivil" class="control-label" style="color: Red">
                                            Estado Civil</label>
                                        <div class="controls">
                                            <select runat="server" id="cmbNFEstadoCivil" name="cmbNFEstadoCivil" class='select2-me input-block-level'
                                                data-rule-required="true">
                                            </select>
                                        </div>
                                    </div>
                                    <div class="control-group">
                                        <label for="cmbNFTrabaja" class="control-label" style="color: Red">
                                            Trabaja Actualmente</label>
                                        <div class="controls">
                                            <select runat="server" id="cmbNFTrabaja" name="cmbNFTrabaja" class='select2-me input-block-level'
                                                data-rule-required="true">
                                                <option value="">-- SELECCIONE ---</option>
                                                <option value="SI">SI</option>
                                                <option value="NO">NO</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="control-group">
                                        <label for="cmbNFRangoSalarial" class="control-label" style="color: Red">
                                            Rango Salarial</label>
                                        <div class="controls">
                                            <select runat="server" id="cmbNFRangoSalarial" name="cmbNFRangoSalarial" class='select2-me input-block-level'
                                                data-rule-required="true">
                                            </select>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="modal-footer">
                    <%--<asp:Button ID="Button6" runat="server" Text="Button open" OnClientClick="return myff()" onclick="_SavePAX00001" />--%>
                    <button id="Button3" runat="server" onserverclick="_SavePAX00001" class="btn btn-green">
                        <i class="icon-save"></i>&nbsp Guardar</button>
                    <button id="Button5" runat="server" class="btn" onclick="self.close()">
                        <%-- onserverclick="_CloseModal"--%>
                        <i class="icon-undo"></i>&nbsp Cerrar</button>
                </div>

            </div>

        </div>

    </form>
</body>
</html>
