<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true"
    CodeBehind="EvaluacionPsicologica.aspx.cs" Inherits="CenasiAPP.EvaluacionPsicologica" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">
    <div class="container-fluid" id="content">
        <link href="../css/bootstrap.min2.css" rel="stylesheet" />
        <%--        <link href="./css/StyleSheet1.css" rel="stylesheet" />
        <link href="./css/font-awesome.min2.css" rel="stylesheet" />--%>
        <%--<script src="../js/notify.js" type="text/javascript"></script>--%>
        <script src="../js/notify.min.js" type="text/javascript"></script>

        <script type="text/javascript">
            function notify(MSG, tipo) {
                $.notify(MSG, tipo);
            }

        </script>
        <script type="text/javascript">
            function scrollToDiv(control) {
                document.getElementById(control).scrollIntoView();
            }
        </script>
        <style>
            #toTop {
                position: fixed;
                bottom: 10px;
                right: 10px;
                cursor: pointer;
                display: none;
                background-color: dodgerblue;
                color: white;
            }
        </style>
        <script type="text/javascript">
            $(document).ready(function () {
                $('body').append('<div id="toTop" class="btn btn-info"><span class="glyphicon glyphicon-chevron-up"></span> Ir al Inicio</div>');
                $(window).scroll(function () {
                    if ($(this).scrollTop() != 0) {
                        $('#toTop').fadeIn();
                    } else {
                        $('#toTop').fadeOut();
                    }
                });
                $('#toTop').click(function () {
                    $("html, body").animate({ scrollTop: 0 }, 600);
                    return false;
                });
            });
        </script>


        <asp:Panel runat="server" ID="pnlData">
            <link href="../css/plugins/select2/select2.css" rel="stylesheet" />
            <script src="../js/plugins/select2/select2.min.js"></script>
            <div class="box box-bordered">
                <div class="box-title">
                    <h3>
                        <i class="icon-edit"></i>Evaluaciones Psicologicas</h3>
                </div>
                <div class="box-content nopadding">
                    <div class='form-horizontal form-bordered'>
                        <!-- Tipo de Reporte -->
                        <div class="control-group">
                            <label for="CmbPaciente12" class="control-label" style="color: Red">
                                Paciente</label>
                            <div class="controls">
                                <asp:DropDownList ID="DPPaciente" runat="server" CssClass="select2-me input-block-level"
                                    data-rule-required="true">
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ControlToValidate="DPPaciente" Display="Dynamic" ErrorMessage="Requerido!"
                                    ID="DPPaciente1" runat="server" SetFocusOnError="True"
                                    ValidationGroup="pnlData" ForeColor="Red" />
                            </div>
                        </div>
                        <div class="control-group">
                            <label for="txtFecha1" class="control-label" style="color: Red">
                                Acciones</label>
                            <div class="controls">
                                <button type="submit" id="BtnBuscarPX" runat="server" class="btn content-refresh btn-primary" onserverclick="_buscaseguimientos" validationgroup="pnlData">
                                    <i class="icon-search"></i>&nbsp Buscar</button>
                            </div>
                        </div>
                        <%--
                        <!-- Test de Rorschach	 -->
                        <div class="control-group">
                            <label for="lblViaContacto" class="control-label" style="color: black">
                                Test de Rorschach</label>
                            <div class="controls">
                                <select runat="server" id="Cmbviacontacto" name="Cmbviacontacto" class='select2-me input-xlarge'
                                    data-rule-required="true">
                                    <option value="">-- SELECCIONE --</option>
                                    <option value="PRESENCIAL">PRESENCIAL</option>
                                    <option value="TELEFONICA">TELEFONICA</option>
                                    <option value="CORREO">CORREO</option>
                                </select>
                                <br />
                                <asp:RequiredFieldValidator ControlToValidate="Cmbviacontacto" Display="Dynamic" ErrorMessage="Requerido!"
                                    ID="ValCmbviacontacto" runat="server" SetFocusOnError="True" ValidationGroup="pnlData" />
                            </div>
                        </div>
                        <!-- MOTIVO -->
                        <div class="control-group">
                            <label for="lblMotivo" class="control-label" style="color: black">
                                Motivo</label>
                            <div class="controls">
                                <select runat="server" id="Cmbmotivo" name="Cmbmotivo" class='select2-me input-xlarge'
                                    data-rule-required="true">
                                    <option value="">-- SELECCIONE --</option>
                                    <option value="CERTIFICACIONES Y CARTAS">CERTIFICACIONES Y CARTAS</option>
                                    <option value="GESTIONES ESCOLARES">GESTIONES ESCOLARES</option>
                                    <option value="SOLICITUD AYUDAS MÉDICAS">SOLICITUD AYUDAS MÉDICAS</option>
                                    <option value="SOLICITUD CAMBIOS HORARIOS">SOLICITUD CAMBIOS HORARIOS</option>
                                    <option value="REFERIMIENTO A OTROS SERVICIOS">REFERIMIENTO A OTROS SERVICIOS</option>
                                    <option value="OTROS">OTROS</option>
                                </select>
                                <br />
                                <asp:RequiredFieldValidator ControlToValidate="Cmbmotivo" Display="Dynamic" ErrorMessage="Requerido!"
                                    ID="valCmbmotivo" runat="server" SetFocusOnError="True" ValidationGroup="pnlData" />
                            </div>
                        </div> 
                        <div class="control-group">
                            <label for="txtcomentario" class="control-label">
                                Comentarios</label>
                            <div class="controls" style="text-align: center;">
                                <asp:TextBox ID="txtcomentario" runat="server" TextMode="MultiLine" Height="60px"
                                    Wrap="true" placeholder="Detalles" CssClass="input-block-level" CausesValidation="True"></asp:TextBox>
                                <asp:RequiredFieldValidator ControlToValidate="txtcomentario" Display="Dynamic" ErrorMessage="Requerido!"
                                    ID="RequiredFieldValidator1" runat="server" SetFocusOnError="True"
                                    ValidationGroup="pnlData" ForeColor="Red" />
                            </div>
                        </div>
                        <div class="control-group">
                            <label for="lblacciones" class="control-label">
                                Acciones</label>
                            <div class="controls" style="text-align: left;">
                                <script type="text/javascript">
                                    function notify(MSG, tipo) {
                                        $.notify(MSG, tipo); melvin
                                    }

                                </script>
                                <script type="text/javascript">
                                    function CloseWindow() { window.close(); }
                                </script>
                                <button type="submit" id="btnPrint" runat="server" class="btn btn-blue" onserverclick="_Save">
                                    <i class="icon-ok"></i>&nbsp Guardar</button>  
                            </div>
                        </div>--%>
                        <div class="control-group">
                            <div class="box box-bordered">
                                <div class="box-title">
                                    <h3>
                                        <i class="icon-edit"></i>Historico</h3>
                                </div>
                                <div class="box-content nopadding">
                                    <table class="table table-bordered dataTable dataTable-scroll-x dataTable-tools">
                                        <thead>
                                            <tr>
                                                <th>Via Contacto
                                                </th>
                                                <th class="hidden-450">Motivo
                                                </th>
                                                <th class="hidden-350">Agente Social
                                                </th>
                                                <th class="hidden-480">Fecha
                                                </th>
                                                <th class="hidden-480">Comentario
                                                </th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <asp:Repeater ID="rpData" runat="server">
                                                <ItemTemplate>
                                                    <tr>
                                                        <td>
                                                            <%# Eval("VIACONTACTO")%>
                                                        </td>
                                                        <td class="hidden-450">
                                                            <%# Eval("MOTIVO")%>
                                                        </td>
                                                        <td class="hidden-350">
                                                            <%# Eval("USUARIO")%>
                                                        </td>
                                                        <td class="hidden-480">
                                                            <%# Eval("ROWCDTE")%>
                                                        </td>
                                                        <td class="hidden-480">
                                                            <%# Eval("COMENTARIO")%>
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

        <asp:Panel runat="server" ID="pnlEdit">
            <%-- <link href="../calendarscript/css/bootstrap-datetimepicker.css" rel="stylesheet" />
        <script type="text/javascript" src="../calendarscript/js/jquery-2.1.1.min.js"></script>
        <script type="text/javascript" src="../calendarscript/js/bootstrap.min.js"></script>
        <script type="text/javascript" src="../calendarscript/js/moment-with-locales.js"></script>
        <script type="text/javascript" src="../calendarscript/js/bootstrap-datetimepicker.js"></script> 
            --%>
            <%-- DATOS PERSONALES--%>
            <div class="row">
                <div class="col-sm-12">
                    <div class="box box-color box-bordered">
                        <div class="box-title box-color">
                            <h3><i class="fa fa-list"></i>1. Datos Personales</h3>
                            <div class="actions">
                                <button type="button" id="tbnAdd" runat="server"
                                    class="btn btn-default" data-dismiss="modal" onserverclick="_Save">
                                    <i class="icon-plus-sign"></i>&nbsp Guardar</button>

                            </div>
                        </div>
                        <div>
                            <div class="box-content nopadding">
                                <div class='form-horizontal form-column form-bordered'>
                                    <div class="row">
                                        <%--DATOS PERSONALES DE LA MADRE--%>
                                        <div class="col-sm-6">
                                            <%-- 1- No. Expediente y Edad--%>
                                            <div class="control-group">
                                                <label for="lblExpedienteNo" class="control-label col-sm-2">Expediente:</label>
                                                <div class="controls">
                                                    <input type="text" name="txtExpedienteNo" id="txtExpedienteNo" placeholder="Digite Aqui" class="input-block-level" disabled runat="server">
                                                </div>
                                            </div>
                                            <%-- 1- Nombre del Paciente--%>
                                            <div class="control-group">
                                                <label for="lblnombrePaciente" class="control-label col-sm-2">
                                                    Nombre(s)</label>
                                                <div class="controls">
                                                    <input type="text" name="txtNombrePaciente" id="txtNombrePaciente" placeholder="Digite Aqui" class="input-block-level" disabled runat="server">
                                                </div>
                                            </div>
                                            <%-- 2- Apellido(s) del Paciente--%>
                                            <div class="control-group">
                                                <label for="lblnombrePaciente" class="control-label col-sm-2">
                                                    Apellido(s)</label>
                                                <div class="controls">
                                                    <input type="text" name="txtapellidosPaciente" id="txtapellidosPaciente" placeholder="Digite Aqui" class="input-block-level" disabled runat="server">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-sm-6">
                                            <%-- 1- Fecha nacimiento--%>
                                            <div class="control-group">
                                                <label for="lblfechaNacimiento" class="control-label col-sm-2">
                                                    Fecha Nacimiento</label>
                                                <div class="controls">
                                                    <input type="text" name="txtfechaNacimiento" id="txtfechaNacimiento" placeholder="Digite Aqui" class="input-block-level" disabled runat="server">
                                                </div>
                                            </div>
                                            <%-- 2-Edad--%>
                                            <div class="control-group">
                                                <label for="lblfechaNacimiento" class="control-label col-sm-2">
                                                    Edad</label>
                                                <div class="controls">
                                                    <input type="text" name="txtEdad" id="txtEdad" placeholder="Digite Aqui" class="input-block-level" disabled runat="server">
                                                </div>
                                            </div>
                                            <%-- 2-Edad--%>
                                            <div class="control-group">
                                                <label for="lblCeduladeIdentidad" class="control-label col-sm-2">
                                                    Cédula Identidad</label>
                                                <div class="controls">
                                                    <input type="text" name="txtCeduladeIdentidad" id="txtCeduladeIdentidad" placeholder="Digite Aqui" class="input-block-level" disabled runat="server">
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <%-- TEST--%>
            <div class="row">
                <div class="col-sm-12">
                    <div class="box box-color box-bordered">
                        <div class="box-title box-color">
                            <h3><i class="fa fa-list"></i>2. Test</h3>
                        </div>
                        <div>
                            <div class="box-content nopadding">
                                <div class='form-horizontal form-column form-bordered'>
                                    <div class="row">
                                        <div class="col-sm-3">
                                            <%-- 1-Test de Rorschach	--%>
                                            <div class="control-group">
                                                <label for="lblTestdeRorschach" class="control-label col-sm-2">Test de Rorschach:</label>
                                                <div class="controls">
                                                    <select runat="server" id="CmbTestdeRorschach" name="CmbTestdeRorschach" class='select2-me input-small'
                                                        data-rule-required="true">
                                                        <option value=""></option>
                                                        <option value="SI">SI</option>
                                                        <option value="NO">NO</option>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-sm-5">
                                            <%-- 2- Fecha de Realización--%>
                                            <div class="control-group">
                                                <label for="lblFechaTestdeRorschach" class="control-label col-lg-10">Fecha de Realización</label>
                                                <div class="controls col-sm-4">
                                                    <div class='input-group date' id='dtFechaTestdeRorschach' runat="server">
                                                        <input type='text' class="input-block-level" name="txtFechaTestdeRorschach" id="txtFechaTestdeRorschach" runat="server" data-rule-required="true" placeholder="dd/mm/aaaa" />
                                                        <span class="input-group-addon">
                                                            <span class="glyphicon glyphicon-calendar"></span>
                                                        </span>
                                                    </div>
                                                </div>
                                            </div>
                                            <script type="text/javascript">
                                                $(function () {
                                                    $('#MainContent_dtFechaTestdeRorschach').datetimepicker({
                                                        locale: 'es-DO',//,
                                                        format: 'DD/MM/YYYY'//,
                                                        //daysOfWeekDisabled: [0, 6],
                                                        //inline: true,
                                                        //sideBySide: true 
                                                    });
                                                });
                                            </script>
                                        </div>
                                        <div class="col-sm-4">
                                            <%-- 3- Psicólogo Examinador--%>
                                            <div class="control-group">
                                                <label for="lblPsicologoExaminadorTestRorschach" class="control-label col-sm-2">
                                                    Apellido(s)</label>
                                                <div class="controls">
                                                    <input type="text" name="txtPsicologoExaminadorTestRorschach" id="txtPsicologoExaminadorTestRorschach" placeholder="Digite Aqui" class="input-block-level" disabled runat="server">
                                                </div>
                                            </div>
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </asp:Panel>
    </div>
</asp:Content>
