<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true"
    CodeBehind="EvaluacionOdontoPediatria.aspx.cs" Inherits="CAID_V2.forms.EvaluacionOdontoPediatria" ValidateRequest="false" %>


<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">
    <asp:HiddenField ID="xGUID" runat="server" />
    <asp:HiddenField ID="xNombreArchivo" runat="server" />
    <asp:HiddenField ID="txturlodontograma" runat="server" />

    <%-- <asp:UpdatePanel ID="UpdatePanel11" runat="server" UpdateMode="Conditional">
        <ContentTemplate>--%>
    <%--   <asp:Button ID="submitUrlOdontogram" OnClick="urlOdontograma_Click" OnClientClick="onGetURLOdontograma();" runat="server" Text="Submit"></asp:Button>--%>
    <%--  </ContentTemplate>
    </asp:UpdatePanel>--%>


    <div class="container-fluid" id="content">
        <asp:HiddenField ID="txturlodontograma2" runat="server" />
        <link href="../css/bootstrap.min2.css" rel="stylesheet" />
        <link href="../css/StyleSheet1.css" rel="stylesheet" />
        <link href="/css/font-awesome.min2.css" rel="stylesheet" />
        <link href="../css/plugins/datatable/datatables11015.min.css" rel="stylesheet" />
        <script src="../js/plugins/datatable/datatables11015.min.js"></script>
        <script src="../js/language/es-DO.js"></script>
        <script src="../js/canvasjs.min.js"></script>
        <script src="../js/notify.js" type="text/javascript"></script>
        <script src="../js/notify.min.js" type="text/javascript"></script>
        <script type="text/javascript" src="../calendarscript/js/language/es-DO.js"></script>
        <link href="/calendarscript/css/bootstrap.css" rel="stylesheet" />
        <link href="/calendarscript/css/font-awesome.min.css" rel="stylesheet" />
        <link href="/calendarscript/css/prettify-1.0.css" rel="stylesheet" />
        <script type="text/javascript" src="/calendarscript/js/respond.min.js"></script>
        <link href="/calendarscript/css/bootstrap-datetimepicker.css" rel="stylesheet" />
        <%--<script type="text/javascript" src="/calendarscript/js/jquery-2.1.1.min.js"></script>--%>
        <script type="text/javascript" src="/calendarscript/js/bootstrap.min.js"></script>
        <script type="text/javascript" src="/calendarscript/js/moment-with-locales.js"></script>
        <script type="text/javascript" src="/calendarscript/js/bootstrap-datetimepicker.js"></script>
        <%--<link href="../calendarscript/css/base.css" rel="stylesheet" />--%>
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
            }
        </style>
        <script type="text/javascript">
            $(document).ready(function () {
                $('body').append('<div id="toTop" class="btn btn-info"><span class="glyphicon glyphicon-arrow-up"></span> Ir al Inicio</div>');

                $(window).scroll(function () {
                    if ($(this).scrollTop() != 0) {
                        $('#toTop').fadeIn();
                    } else {
                        $('#toTop').fadeOut();
                    }
                });
                $('#toTop').click(function () {
                    $("html, body").animate({ scrollTop: 0 }, 300);
                    return false;
                });
            });
        </script>

        <asp:ScriptManager ID="SMPlanTratamiento" runat="server" EnablePartialRendering="true">
        </asp:ScriptManager>
        <%--<script type="text/javascript">
            Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);
            function EndRequestHandler(sender, args) {
                if (args.get_error() != undefined) {
                    args.set_errorHandled(true);

                }
            }
        </script>--%>

        <%-- 1-DATOS PERSONALES--%>
        <div class="row-fluid">
            <asp:Repeater ID="RPPAXHEADER" runat="server">
                <ItemTemplate>
                    <%# Eval("HTML")%>
                </ItemTemplate>
            </asp:Repeater>
        </div>

        <%--3-HISTORIA CLINICA--%>
        <asp:Panel runat="server" ID="PnHistoria">
            <div class="row-fluid">
                <div class="col-sm-12">
                    <div class="box box-color box-bordered">
                        <div class="box-title">
                            <h3><i class="icon-edit"></i>Historia</h3>
                            <div class="actions">
                                <asp:UpdatePanel ID="UpdatePanel10" runat="server" UpdateMode="Conditional">
                                    <ContentTemplate>
                                        <button type="button" id="tbnAdd" runat="server"
                                            class="btn btn-warning" onserverclick="_SaveMaestro">
                                            <i class="icon-plus-sign"></i>&nbsp Guardar</button>
                                        <button type="button" id="btnregresar" runat="server" validationgroup="pnlEdit"
                                            class="btn btn-warning" data-dismiss="modal" onserverclick="_Back">
                                            <i class="icon-arrow-left"></i>&nbsp Regresar</button>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </div>
                        </div>
                        <%--  <div>--%>
                        <div class="box-content nopadding">
                            <div class='form-horizontal form-column form-bordered'>
                                <div class="row">
                                    <div class="col-sm-6">
                                        <%-- 2- Impresión diagnostica --%>
                                        <div class="control-group">
                                            <%--<label for="lblImpresiondiagnostica" class="control-label col-sm-2">
                                                Impresión diagnostica</label>--%>
                                            <%--<script type="text/javascript">
                                                var options = $("#MainContent_ddlImpresiondiagnostica option:selected");
                                                var values = $.map(options, function (option) {
                                                    return option.text;
                                                });
                                            </script>--%>
                                            <div class="control-group">
                                                <label id="lblImpresiondiagnostica" for="lblImpresiondiagnostica" class="control-label col-sm-2" runat="server">
                                                    Impresión diagnostica</label>
                                                <div class="controls">
                                                    <%--      <select id="ddlImpresiondiagnostica" runat="server" multiple="true" cssclass="select2-me input-block-level" data-rule-required="true" class="chosen-select form-control">
                                                    </select>
                                                    --%>
                                                    <input type="text" name="ddlImpresiondiagnostica" id="ddlImpresiondiagnostica" placeholder="Digite Aqui" class="form-control" runat="server">
                                                </div>
                                            </div>

                                        </div>
                                    </div>
                                    <div class="col-sm-6">
                                        <%-- 3.	Modalidad de atención odontológica--%>
                                        <div class="control-group">
                                            <label id="lblModalidaddeatencionodontologica" for="lblModalidaddeatencionodontologica" class="control-label col-sm-6" runat="server">
                                                Modalidad Atención:  
                                            </label>
                                            <div class="controls">
                                                <asp:DropDownList ID="ddlModalidadAtencion" CssClass="input-xlarge" runat="server">
                                                    <asp:ListItem Value="0">-- Seleccione --</asp:ListItem>
                                                    <asp:ListItem Value="Sillón">Sillón</asp:ListItem>
                                                    <asp:ListItem Value="Restricción física">Restricción física</asp:ListItem>
                                                    <asp:ListItem Value="Trabajo a Cuatro Manos">Trabajo a Cuatro Manos</asp:ListItem>
                                                    <asp:ListItem>Sedación</asp:ListItem>
                                                    <asp:ListItem>Anestesia General</asp:ListItem>
                                                </asp:DropDownList>
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

        <%--4-GRUPO FAMILIAR--%>
        <asp:Panel runat="server" ID="pngrupofamiliar">
            <div class="row-fluid">
                <div class="control-group">
                    <div class="col-sm-12">
                        <div class="box box-color box-bordered">
                            <div class="box-title">
                                <h3><i class="icon-edit"></i>Grupo Familiar</h3>
                            </div>
                            <div class="box-content nopadding">
                                <div class='form-horizontal form-column form-bordered'>
                                    <div class="row">
                                        <div class="col-sm-6">
                                            <div class="control-group">
                                                <label id="lblgrupofamiliar" class="control-label col-sm-2" runat="server">Grupo Familiar?:</label>
                                                <div class="controls">
                                                    <%-- <div class="col-lg-12">--%>
                                                    <asp:DropDownList ID="ddlGrupoFamiliar" runat="server" CssClass="input-xlarge"
                                                        data-rule-required="true">
                                                        <asp:ListItem Value="0">-- SELECCIONE --</asp:ListItem>
                                                        <asp:ListItem Value="Nuclear (ambos padres)">Nuclear (ambos padres)</asp:ListItem>
                                                        <asp:ListItem Value="Madre/ padre/ tutor">Madre/ padre/ tutor </asp:ListItem>
                                                    </asp:DropDownList>
                                                    <%-- </div>--%>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-sm-6">
                                            <div class="control-group">
                                                <label class="control-label col-sm-2">Comentarios?:</label>
                                                <div class="controls">
                                                    <div class="col-lg-12">
                                                        <input type="text" name="txtComentariosGrupoFamiliar" id="txtComentariosGrupoFamiliar" placeholder="Digite Aqui" class="form-control" runat="server">
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <asp:UpdatePanel ID="UpdatePanel4" runat="server" UpdateMode="Conditional">
                                        <ContentTemplate>
                                            <div class="control-group" id="pnHermanosDetalles">
                                                <%--DETALLE DE HERMANOS--%>
                                                <div class="col-sm-12">
                                                    <h4><strong>DATOS GENERALES DE HERMANOS:</strong></h4>
                                                </div>
                                                <div class="nopadding">
                                                    <table class="table table-bordered">
                                                        <thead runat="server">
                                                            <tr>
                                                                <th>Nombres y Apellidos</th>
                                                                <th>Edad</th>
                                                                <th>Meses/Años</th>
                                                                <th class="hidden-350">Acciones</th>
                                                            </tr>
                                                            <tr>
                                                                <th>
                                                                    <input type="text" name="txtnombreHermano" id="txtnombreHermano" placeholder="Digite Aqui" class="form-control" runat="server"></th>
                                                                <asp:RequiredFieldValidator ControlToValidate="txtnombreHermano" Display="Dynamic" ErrorMessage="Requerido!"
                                                                    ID="txtnombreHermano1" runat="server" SetFocusOnError="True" ValidationGroup="pnHermanosDetalles" />
                                                                <th>
                                                                    <input type="text" name="TxtEdadHermano" id="TxtEdadHermano" placeholder="Digite Aqui" class="form-control" runat="server"></th>
                                                                <th>
                                                                    <asp:DropDownList ID="DdlTipoEdad" CssClass="input-xlarge" runat="server">
                                                                        <asp:ListItem Value="">-- Seleccione --</asp:ListItem>
                                                                        <asp:ListItem Value="Meses">Meses</asp:ListItem>
                                                                        <asp:ListItem Value="Años">Años</asp:ListItem>
                                                                    </asp:DropDownList>
                                                                </th>
                                                                <th align="left">
                                                                    <div class="actions">
                                                                        <button type="button" id="btnAgregarHermano1" runat="server" validationgroup="pnlEdit"
                                                                            commandargument='<%# Eval("ROWGUID")%>' class="btn btn-primary" data-dismiss="modal" onserverclick="_SaveDetallesHermanos">
                                                                            <i class="icon-plus-sign"></i>&nbsp Añadir</button>
                                                                    </div>
                                                                </th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                            <asp:Repeater ID="RPDATAHERMANOS" runat="server">
                                                                <ItemTemplate>
                                                                    <tr>
                                                                        <td class="hidden-350">
                                                                            <%# Eval("Nombre")%>
                                                                        </td>
                                                                        <td class="hidden-350">
                                                                            <%# Eval("Edad")%>
                                                                        </td>
                                                                        <td class="hidden-350">
                                                                            <%# Eval("TipoEdad")%>
                                                                        </td>
                                                                        <td class="hidden-350">
                                                                            <p align="left">
                                                                                <%-- <div class="actions">--%>
                                                                                <asp:LinkButton ID="btnDelete" CssClass="btn btn-red" runat="server" Text="Eliminar"
                                                                                    CommandArgument='<%# Eval("Secuencia")%>'
                                                                                    OnClientClick="return confirm('¿Está seguro que desea eliminar este registro?');" CommandName="DeleteDetHermanos" OnClick="_DELETEHERMANOS"><i class="icon-remove-sign">&nbsp Eliminar</i></asp:LinkButton>
                                                                                <%--   </div>--%>
                                                                            </div>
                                                                        </td>
                                                                    </tr>
                                                                </ItemTemplate>
                                                            </asp:Repeater>
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </asp:Panel>

        <%--5-ANTECEDENTES MEDICOS GENERALES y 6.	Medicinas que toma --%>
        <asp:Panel runat="server" ID="pnantecedentesmedicosgenerales">
            <asp:UpdatePanel ID="UpdatePanel5" runat="server" UpdateMode="Conditional">
                <ContentTemplate>
                    <div class="row-fluid">
                        <div class="col-sm-12">
                            <div class="box box-color box-bordered">
                                <div class="box-content nopadding">
                                    <div class="box-title">
                                        <h3><i class="icon-edit"></i>ANTECEDENTES MEDICOS GENERALES</h3>
                                    </div>
                                    <div class="control-group">
                                        <script type="text/javascript">
                                            var options = $("#MainContent_txtantecedentesmedicosgenerales option:selected");
                                            var values = $.map(options, function (option) {
                                                return option.text;
                                            });
                                        </script>
                                        <%-- <div class="controls">--%>
                                        <%--<textarea runat="server" name="txtantecedentesmedicosgenerales" id="txtantecedentesmedicosgenerales" rows="4" class="input-block-level" data-rule-required="true" placeholder="Digite Aqui"></textarea>
                                        --%><%--  </div>--%>
                                        <select id="txtantecedentesmedicosgenerales" runat="server" multiple="true" cssclass="select2-me input-block-level" data-rule-required="true" class="chosen-select form-control">
                                        </select>
                                    </div>
                                    <div class="control-group">
                                         <label for="lblantecedentesmedicosgeneralesotros" class="control-label col-sm-6">
                                            Otros:</label>
                                        <div class="controls">
                                            <asp:TextBox ID="txtantecedentesmedicosgeneralesotros" Text='<%# Eval("AtencedentesMedicosGeneralesotros")%>' runat="server" placeholder="Digite Aqui" class="form-control"></asp:TextBox>
                                        </div>
                                         </div>

                                    <%--1-Medicinas que Toma--%>
                                    <div class="box-title">
                                        <h3><i class="icon-edit"></i>MEDICINAS QUE TOMA</h3>
                                    </div>
                                    <div class="control-group" id="pnMedicinasToma">
                                        <div class="nopadding">
                                            <table class="table table-bordered">
                                                <thead runat="server">
                                                    <tr>
                                                        <th>Fecha</th>
                                                        <th>Nombre</th>
                                                        <th>Posologia</th>
                                                        <th>Dosis</th>
                                                        <th class="hidden-350">Acciones</th>
                                                    </tr>
                                                    <tr>
                                                        <th></th>
                                                        <th>
                                                            <input type="text" name="txtnombreMedicina" id="txtnombreMedicina" placeholder="Digite Aqui" class="form-control" runat="server"></th>
                                                        <asp:RequiredFieldValidator ControlToValidate="txtnombreMedicina" Display="Dynamic" ErrorMessage="Requerido!"
                                                            ID="RequiredFieldValidator1" runat="server" SetFocusOnError="True" ValidationGroup="pnMedicinasToma" />
                                                        <th>
                                                            <input type="text" name="txtposologia" id="txtposologia" placeholder="Digite Aqui" class="form-control" runat="server"></th>
                                                        <asp:RequiredFieldValidator ControlToValidate="txtposologia" Display="Dynamic" ErrorMessage="Requerido!"
                                                            ID="RequiredFieldValidator2" runat="server" SetFocusOnError="True" ValidationGroup="pnMedicinasToma" />
                                                        <th>
                                                            <input type="text" name="txtdosis" id="txtdosis" placeholder="Digite Aqui" class="form-control" runat="server"></th>
                                                        <asp:RequiredFieldValidator ControlToValidate="txtdosis" Display="Dynamic" ErrorMessage="Requerido!"
                                                            ID="RequiredFieldValidator3" runat="server" SetFocusOnError="True" ValidationGroup="pnMedicinasToma" />


                                                        <th class="hidden-350">
                                                            <div class="actions">
                                                                <button type="button" id="btnGuardarMedicinaToma" runat="server" validationgroup="pnlEdit"
                                                                    commandargument='<%# Eval("ROWGUID")%>' class="btn btn-primary" data-dismiss="modal" onserverclick="_SaveMedicinaQueToma">
                                                                    <i class="icon-plus-sign"></i>&nbsp Añadir</button>
                                                            </div>
                                                        </th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <asp:Repeater ID="RPMEDICINATOMA" runat="server">
                                                        <ItemTemplate>
                                                            <tr>
                                                                <td><%# Eval("Rowcdte")%></td>
                                                                <td><%# Eval("Nombre")%></td>
                                                                <td><%# Eval("Posologia")%></td>
                                                                <td class="hidden-350"><%# Eval("Dosis")%></td>
                                                                <td class="hidden-350">
                                                                    <p align="left">
                                                                        <asp:LinkButton ID="btnDeleteMedicinaQuetoma" CssClass="btn btn-red" runat="server" Text="Eliminar"
                                                                            CommandArgument='<%# Eval("Secuencia")%>'
                                                                            OnClientClick="return confirm('¿Está seguro que desea eliminar este registro?');" CommandName="DeleteMedicinaQuetoma" OnClick="_DELETEMedicinaQueToma"><i class="icon-remove-sign">&nbsp Eliminar</i></asp:LinkButton>
                                                                    </div> 
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
                </ContentTemplate>
            </asp:UpdatePanel>
        </asp:Panel>

        <%--7-Primer Año de Vida--%>
        <asp:Panel runat="server" ID="Panel2">
            <div class="row-fluid">
                <div class="col-sm-12">
                    <div class="box box-color box-bordered">
                        <div class="box-title box-color">
                            <h3><i class="icon-edit"></i>PRIMER AÑO DE VIDA</h3>
                        </div>
                        <div>
                            <div class="box-content nopadding">
                                <div class='form-horizontal form-column form-bordered'>
                                    <div class="row">
                                        <div class="col-sm-6">
                                            <%-- 1- Embarazo--%>
                                            <div class="control-group">
                                                <label for="lblembarazo" class="control-label col-sm-2">
                                                    Embarazo:</label>
                                                <div class="controls">
                                                    <asp:DropDownList ID="ddlembarazo" CssClass="input-medium" runat="server">
                                                        <asp:ListItem Value="">-- Seleccione --</asp:ListItem>
                                                        <asp:ListItem Value="Alguna Complicacion">Alguna Complicación</asp:ListItem>
                                                        <asp:ListItem Value="De Término">De Término</asp:ListItem>
                                                        <asp:ListItem Value="Uso Progesterona">Uso Progesterona</asp:ListItem>
                                                        <asp:ListItem Value="Prematuro">Prematuro</asp:ListItem>
                                                    </asp:DropDownList>
                                                    <br>
                                                    <label>Otros:</label>
                                                    <input type="text" name="txtEmbarazoOtros" id="txtEmbarazoOtros" placeholder="Digite Aqui" class="form-control" runat="server">
                                                </div>
                                            </div>
                                            <%-- 2- Lactancia--%>
                                            <div class="control-group">
                                                <label for="lbllactancia" class="control-label col-sm-2">
                                                    Lactancia
                                                </label>
                                                <div class="controls">
                                                    <asp:DropDownList ID="ddlLactancia" CssClass="input-medium" runat="server">
                                                        <asp:ListItem Value="">-- Seleccione --</asp:ListItem>
                                                        <asp:ListItem Value="SI">SI</asp:ListItem>
                                                        <asp:ListItem Value="NO">NO</asp:ListItem>
                                                    </asp:DropDownList>
                                                    <br>
                                                    <label>Otros:</label>
                                                    <input type="text" name="txtLactanciaOtros" id="txtLactanciaOtros" placeholder="Digite Aqui" class="form-control" runat="server">
                                                </div>
                                            </div>
                                            <%-- 3- Chupete  --%>
                                            <div class="control-group">
                                                <label for="lblChupete" class="control-label col-sm-2">
                                                    Chupete</label>
                                                <div class="controls">

                                                    <asp:DropDownList ID="ddlChupete" CssClass="input-medium" runat="server">
                                                        <asp:ListItem Value="">-- Seleccione --</asp:ListItem>
                                                        <asp:ListItem Value="Uso">Uso</asp:ListItem>
                                                        <asp:ListItem Value="Sin Nada">Sin Nada</asp:ListItem>
                                                        <asp:ListItem Value="Con Algo">Con Algo</asp:ListItem>
                                                    </asp:DropDownList>
                                                    <br>
                                                    <label>Otros:</label>
                                                    <input type="text" name="txtChupeteOtros" id="txtChupeteOtros" placeholder="Digite Aqui" class="form-control" runat="server">
                                                </div>
                                            </div>

                                        </div>
                                        <div class="col-sm-6">
                                            <%-- 1- Nacimiento--%>
                                            <div class="control-group">
                                                <label for="lblnacimiento" class="control-label col-sm-2">
                                                    Nacimiento:</label>
                                                <div class="controls">
                                                    <asp:DropDownList ID="ddlNacimiento" CssClass="input-medium" runat="server">
                                                        <asp:ListItem Value="">-- Seleccione --</asp:ListItem>
                                                        <asp:ListItem Value="Cesárea">Cesárea</asp:ListItem>
                                                        <asp:ListItem Value="Vaginal">Vaginal</asp:ListItem>
                                                    </asp:DropDownList>
                                                </div>
                                            </div>
                                            <%-- 2-Salida del primer diente  --%>
                                            <div class="control-group">
                                                <label for="lblPrimerDiente" class="control-label col-sm-2">
                                                    Salida del Primer Diente</label>
                                                <div class="controls">
                                                    <asp:DropDownList ID="ddlPrimerDiente" CssClass="input-medium" runat="server">
                                                        <asp:ListItem Value="">-- Seleccione --</asp:ListItem>
                                                        <asp:ListItem Value="Menor de 6 Meses">Menor de 6 Meses</asp:ListItem>
                                                        <asp:ListItem Value="Mayor de 6 Meses">Mayor de 6 Meses</asp:ListItem>
                                                        <asp:ListItem Value="1 Año o Mas">1 Año o Mas</asp:ListItem>
                                                    </asp:DropDownList>
                                                </div>
                                            </div>
                                            <%-- 3- Biberon--%>
                                            <div class="control-group">
                                                <label for="lblBiberon" class="control-label col-sm-6">
                                                    Biberón:</label>
                                                <div class="controls">
                                                    <input type="text" name="txtbiberon" id="txtbiberon" class="form-control" runat="server">
                                                </div>
                                            </div>
                                            <%-- 4- Lenguaje --%>
                                            <div class="control-group">
                                                <label for="lblLenguaje" class="control-label col-sm-2">
                                                    Lenguaje:</label>
                                                <div class="controls">
                                                    <asp:DropDownList ID="ddlLenguaje" CssClass="input-medium" runat="server">
                                                        <asp:ListItem Value="">-- Seleccione --</asp:ListItem>
                                                        <asp:ListItem Value="Cuando Inicio">Cuando Inicio</asp:ListItem>
                                                        <asp:ListItem Value="Bisílabos">Bisílabos</asp:ListItem>
                                                    </asp:DropDownList>
                                                    <br>
                                                    <label>Comentario:</label>
                                                    <input type="text" name="txtLenguajeOtros" id="txtLenguajeOtros" placeholder="Digite Aqui" class="form-control" runat="server">
                                                </div>
                                            </div>
                                            <%-- 5- Marcha independiente --%>
                                            <div class="control-group">
                                                <label for="lblMarchaindependiente " class="control-label col-sm-2">
                                                    Marcha Independiente:</label>
                                                <div class="controls">
                                                    <input type="text" name="txtMarchaindependiente" id="txtMarchaindependiente" placeholder="Digite Aqui" class="form-control" runat="server">
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

        <%--8 Alteraciones del sueño  y  9.	Antecedentes odontológicos --%>
        <asp:Panel runat="server" ID="pnAteracionesSuenoyAtencedentesOdontologico">
            <div class="row-fluid">
                <div class="col-sm-12">
                    <div class="box box-color box-bordered">
                        <div class="box-title box-color">
                            <h3><i class="icon-edit"></i>ALTERACIONES DEL SUEÑO y ANTECEDENTES ODONTOLÓGICOS</h3>
                        </div>
                        <div class="box-content nopadding">
                            <div class='form-horizontal form-column form-bordered'>
                                <div class="row">
                                    <div class="col-sm-12">
                                        <%-- 1- ALTERACIONES DEL SUEÑO  --%>
                                        <div class="control-group">
                                            <label for="lblSueNo" class="control-label col-sm-2">
                                                Sueño</label>
                                            <div class="controls">
                                                <asp:DropDownList ID="ddlAlteracionesSueno" CssClass="input-medium" runat="server">
                                                    <asp:ListItem Value="">-- Seleccione --</asp:ListItem>
                                                    <asp:ListItem Value="Inquieto">Inquieto</asp:ListItem>
                                                    <asp:ListItem Value="Ronca">Ronca</asp:ListItem>
                                                    <asp:ListItem Value="Sueño Profundo">Sueño Profundo</asp:ListItem>
                                                </asp:DropDownList>
                                            </div>
                                        </div>

                                    </div>
                                    <div class="col-sm-12">
                                        <div class="box box-color box-bordered">
                                            <div class="box-title box-color">
                                                <h3><i class="icon-edit"></i>Antecedentes odontológicos:</h3>
                                            </div>
                                        </div>
                                        <div class="control-group">
                                            <div class="col-sm-6">
                                                <%-- 1- Experiencia Previa  --%>
                                                <div class="control-group">
                                                    <label for="lblExperienciaPrevia" class="control-label col-sm-2">
                                                        Experiencia Previa</label>
                                                    <div class="controls">
                                                        <asp:DropDownList ID="ddlExperienciaPrevia" CssClass="input-medium" runat="server">
                                                            <asp:ListItem Value="">-- Seleccione --</asp:ListItem>
                                                            <asp:ListItem Value="SI">SI</asp:ListItem>
                                                            <asp:ListItem Value="NO">NO</asp:ListItem>
                                                        </asp:DropDownList>

                                                        <br>
                                                        <label>Otros:</label>
                                                        <input type="text" name="txtExperienciaPreviaOtros" id="txtExperienciaPreviaOtros" placeholder="Digite Aqui" class="form-control" runat="server">
                                                    </div>
                                                </div>
                                                <%-- 2- Comportamiento --%>
                                                <div class="control-group">
                                                    <label for="lblcomportamiento" class="control-label col-sm-2">
                                                        Comportamiento</label>
                                                    <div class="controls">
                                                        <asp:DropDownList ID="ddlComportamiento" CssClass="input-medium" runat="server">
                                                            <asp:ListItem Value="">-- Seleccione --</asp:ListItem>
                                                            <asp:ListItem Value="Bueno">Bueno</asp:ListItem>
                                                            <asp:ListItem Value="Malo">Regular</asp:ListItem>
                                                            <asp:ListItem Value="Malo">Malo</asp:ListItem>
                                                        </asp:DropDownList>

                                                        <br>
                                                        <label>Otros:</label>
                                                        <input type="text" name="txtComportamientoOtros" id="txtComportamientoOtros" placeholder="Digite Aqui" class="form-control" runat="server">
                                                    </div>
                                                </div>
                                                <%-- 3- Evaluación Clinica --%>
                                                <div class="control-group">
                                                    <label for="lblEvaluacionClinica" class="control-label col-sm-2">
                                                        Evaluación Clinica</label>
                                                    <div class="controls">
                                                        <asp:DropDownList ID="ddlevaluacionclinica" CssClass="input-block-level" runat="server">
                                                        </asp:DropDownList>
                                                        <br>
                                                        <label>Otros:</label>
                                                        <input type="text" name="txtEvaluacionClinicaOtros" id="txtEvaluacionClinicaOtros" placeholder="Digite Aqui" class="form-control" runat="server">
                                                    </div>
                                                </div>
                                                <%-- 4- Riesgo cariogénico  --%>
                                                <div class="control-group">
                                                    <label for="lblRiesgocariogénico" class="control-label col-sm-2">
                                                        Riesgo Cariogénico</label>
                                                    <div class="controls">
                                                        <asp:DropDownList ID="ddlRiesgocariogenico" CssClass="input-medium" runat="server">
                                                            <asp:ListItem Value="">-- Seleccione --</asp:ListItem>
                                                            <asp:ListItem Value="Alto">Alto</asp:ListItem>
                                                            <asp:ListItem Value="Moderado">Moderado</asp:ListItem>
                                                            <asp:ListItem Value="Bajo">Bajo</asp:ListItem>
                                                        </asp:DropDownList>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-sm-6">
                                                <%-- 1- Ultima Fecha  --%>
                                                <div class="control-group">
                                                    <label for="lblUltimaFecha" class="control-label col-sm-2">
                                                        Ultima Fecha Se le realizo</label>
                                                    <div class="controls">
                                                        <input type='text' class="input-medium datepick" name="txtultimafecharealizo" id="txtultimafecharealizo" runat="server" data-rule-required="true" placeholder="dd/mm/aaaa" />
                                                        <script type="text/javascript">
                                                            $(function () {
                                                                $('#MainContent_txtultimafecharealizo').datepicker({
                                                                    toggleActive: true,
                                                                    format: "mm/dd/yyyy",
                                                                    todayHighlight: true,
                                                                    // calendarWeeks: true ,
                                                                    language: "es-DO",
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
                                                </div>
                                                <%--2- Trauma dental --%>
                                                <div class="control-group">
                                                    <label for="lblTraumaDental" class="control-label col-sm-2">
                                                        Trauma Dental</label>
                                                    <div class="controls">
                                                        <asp:DropDownList ID="ddlTraumadental" CssClass="input-block-level" runat="server">
                                                        </asp:DropDownList>
                                                        <br>
                                                        <label>Como, Cuando y Dónde:</label>
                                                        <textarea runat="server" name="txtTraumadentalComoCuandoyDonde" id="txtTraumadentalComoCuandoyDonde" rows="4" class="input-block-level" data-rule-required="true" placeholder="Digite Aqui"></textarea>

                                                    </div>
                                                </div>
                                                <%--2- Trauma Tejidos Blandos --%>
                                                <div class="control-group">
                                                    <label for="lblTraumaDental" class="control-label col-sm-2">
                                                        Trauma Tejidos Blandos</label>
                                                    <div class="controls">
                                                        <asp:DropDownList ID="ddlTraumaTejidosBlandos" CssClass="input-block-level" runat="server">
                                                        </asp:DropDownList>
                                                    </div>
                                                </div>
                                                <%-- 3- Índice de O’leary  --%>
                                                <div class="control-group">
                                                    <label for="lblindicedeOleary" class="control-label col-sm-2">Índice de O’leary</label>
                                                    <div class="controls">
                                                        <input type="text" name="txtIndiceOleary" id="txtIndiceOleary" placeholder="Digite Aqui" class="form-control" runat="server">
                                                    </div>
                                                </div>
                                                <%-- 4- Cronología de la erupción   --%>
                                                <div class="control-group">
                                                    <label for="lbCronologiaerupcion" class="control-label col-sm-2">
                                                        Cronología de la Erupción</label>
                                                    <div class="controls">
                                                        <asp:DropDownList ID="ddlCronologiaerupcion" CssClass="input-medium" runat="server">
                                                            <asp:ListItem Value="">-- Seleccione --</asp:ListItem>
                                                            <asp:ListItem Value="Lenta">Bueno</asp:ListItem>
                                                            <asp:ListItem Value="Adelantada">Regular</asp:ListItem>
                                                            <asp:ListItem Value="Normal">Malo</asp:ListItem>
                                                        </asp:DropDownList>
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
            </div>
        </asp:Panel>

        <%--10. Historia de la Dieta --%>
        <asp:Panel runat="server" ID="pnhistoriadieta">
            <div class="row-fluid">
                <div class="col-sm-12">
                    <div class="box box-color box-bordered">
                        <div class="box-title box-color">
                            <h3><i class="icon-edit"></i>Historia de la Dieta</h3>
                        </div>
                        <div class="box-content nopadding">
                            <div class='form-horizontal form-column form-bordered'>
                                <div class="row">
                                    <div class="col-sm-12">
                                        <div class="control-group">
                                            <div class="col-sm-6">
                                                <%-- 1- a.	Alimentación actual  --%>
                                                <div class="control-group">
                                                    <label for="lblAlimentacionactual" class="control-label col-sm-2">
                                                        Alimentación Actual</label>
                                                    <div class="controls">
                                                        <script type="text/javascript">
                                                            var options = $("#MainContent_ddlAlimentacionactual option:selected");
                                                            var values = $.map(options, function (option) {
                                                                return option.text;
                                                            });
                                                        </script>
                                                        <select id="ddlAlimentacionactual" multiple="true" runat="server" cssclass="select2-me input-block-level" class="chosen-select form-control">
                                                            <option value="">-- Seleccione --</option>
                                                            <option value="Leche">Leche</option>
                                                            <option value="Jugos">Jugos</option>
                                                            <option value="Frutas">Frutas</option>
                                                            <option value="Cereal">Cereal</option>
                                                            <option value="Carnes">Carnes</option>
                                                            <option value="Vegetales">Vegetales</option>
                                                            <option value="Harinas">Harinas</option>

                                                        </select>
                                                    </div>
                                                </div>

                                                <%--2- Observaciones Historia Dieta --%>
                                                <div class="control-group">
                                                    <label for="lblObservaciones" class="control-label col-sm-2">
                                                        Observaciones
                                                    </label>
                                                    <div class="controls">
                                                        <textarea runat="server" name="txtObservacionesHistoriaDieta" id="txtObservacionesHistoriaDieta" rows="4" class="input-block-level" data-rule-required="true" placeholder="Digite Aqui"></textarea>
                                                    </div>
                                                </div>

                                                <%-- 3-Dificultad para deglutir líquidos --%>
                                                <div class="control-group">
                                                    <label for="lblDificultaddeglutirliquidos" class="control-label col-sm-2">
                                                        Dificultad para deglutir líquidos</label>
                                                    <div class="controls">
                                                        <asp:DropDownList ID="ddlDificultaddeglutirliquidos" CssClass="input-medium" runat="server">
                                                            <asp:ListItem Value="">-- Seleccione --</asp:ListItem>
                                                            <asp:ListItem Value="SI">SI</asp:ListItem>
                                                            <asp:ListItem Value="NO">NO</asp:ListItem>
                                                        </asp:DropDownList>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-sm-6">
                                                <%-- 1- Azucar  --%>
                                                <div class="control-group">
                                                    <label for="lblAzucar" class="control-label col-sm-2">
                                                        Azucar</label>
                                                    <div class="controls">
                                                        <asp:DropDownList ID="ddlazucar" CssClass="input-medium" runat="server">
                                                            <asp:ListItem Value="">-- Seleccione --</asp:ListItem>
                                                            <asp:ListItem Value="SI">SI</asp:ListItem>
                                                            <asp:ListItem Value="NO">NO</asp:ListItem>
                                                        </asp:DropDownList>
                                                        <br>
                                                        <label>Otros:</label>
                                                        <input type="text" name="txtazucarOtros" id="txtazucarOtros" placeholder="Digite Aqui" class="form-control" runat="server">
                                                    </div>
                                                </div>

                                                <%-- 2-Dificultad para deglutir solidos --%>
                                                <div class="control-group">
                                                    <label for="lblDificultaddeglutirsolidos" class="control-label col-sm-2">
                                                        Dificultad para deglutir Solidos</label>
                                                    <div class="controls">
                                                        <asp:DropDownList ID="ddlDificultaddeglutirsolidos" CssClass="input-medium" runat="server">
                                                            <asp:ListItem Value="">-- Seleccione --</asp:ListItem>
                                                            <asp:ListItem Value="SI">SI</asp:ListItem>
                                                            <asp:ListItem Value="NO">NO</asp:ListItem>
                                                        </asp:DropDownList>
                                                    </div>
                                                </div>
                                                <%--3-Inmunizaciones Completas  --%>
                                                <div class="control-group">
                                                    <label for="lblInmunizacionesCompletas" class="control-label col-sm-2">
                                                        Inmunizaciones Completas</label>
                                                    <div class="controls">
                                                        <asp:DropDownList ID="ddlInmunizacionesCompletas" CssClass="input-medium" runat="server">
                                                            <asp:ListItem Value="">-- Seleccione --</asp:ListItem>
                                                            <asp:ListItem Value="SI">SI</asp:ListItem>
                                                            <asp:ListItem Value="NO">NO</asp:ListItem>
                                                        </asp:DropDownList>
                                                        <br>
                                                        <label>Otros:</label>
                                                        <input type="text" name="txtInmunizacionesCompletasOtros" id="txtInmunizacionesCompletasOtros" placeholder="Digite Aqui" class="form-control" runat="server">
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
            </div>
        </asp:Panel>

        <%--12.	Higiene Bucal--%>
        <asp:Panel runat="server" ID="pnHigieneBucal">
            <div class="row-fluid">
                <div class="col-sm-12">
                    <div class="box box-color box-bordered">
                        <div class="box-title box-color">
                            <h3><i class="icon-edit"></i>Higiene Bucal</h3>
                        </div>
                        <div class="box-content nopadding">
                            <div class='form-horizontal form-column form-bordered'>
                                <div class="row">
                                    <div class="col-sm-12">
                                        <div class="control-group">
                                            <div class="col-sm-6">
                                                <%-- 1- Frecuencia del cepillado   --%>
                                                <div class="control-group">
                                                    <label for="lblFrecuenciadelcepillado " class="control-label col-sm-2">
                                                        Frecuencia del Cepillado
                                                    </label>
                                                    <div class="controls">
                                                        <div class="checkbox checkbox-primary col-lg-10">
                                                            <asp:CheckBoxList ID="ckfrecuenciacepillado" RepeatColumns="1" RepeatDirection="Horizontal" TextAlign="Right" runat="server">
                                                                <asp:ListItem Value="Matutina">Matutina</asp:ListItem>
                                                                <asp:ListItem Value="Vespertina">Vespertina</asp:ListItem>
                                                                <asp:ListItem Value="Noctura">Noctura</asp:ListItem>
                                                            </asp:CheckBoxList>
                                                        </div>
                                                    </div>
                                                </div>

                                                <%--2- Como hace el Cepillado --%>
                                                <div class="control-group">
                                                    <label for="lblComohaceelCepillado" class="control-label col-sm-2">
                                                        Como hace el Cepillado?
                                                    </label>
                                                    <div class="controls">
                                                        <asp:DropDownList ID="ddlcomohacecepillado" CssClass="input-medium" runat="server">
                                                            <asp:ListItem Value="">-- Seleccione --</asp:ListItem>
                                                            <asp:ListItem Value="Solo">Solo</asp:ListItem>
                                                            <asp:ListItem Value="Ayuda de adulto">Ayuda de adulto</asp:ListItem>
                                                            <asp:ListItem Value="Un adulto">Un adulto</asp:ListItem>
                                                        </asp:DropDownList>
                                                    </div>
                                                </div>

                                                <%-- 3-Pasta dental  --%>
                                                <div class="control-group">
                                                    <label for="lblPastadental" class="control-label col-sm-2">
                                                        Pasta Dental</label>
                                                    <div class="controls">
                                                        <input type="text" name="txtPastadental" id="txtPastadental" placeholder="Digite Aqui" class="form-control" runat="server">
                                                    </div>
                                                </div>
                                                <%-- 4- Colutorio --%>
                                                <div class="control-group">
                                                    <label for="lblColutorio" class="control-label col-sm-2">
                                                        Colutorio</label>
                                                    <div class="controls">
                                                        <asp:DropDownList ID="ddlColutorio" CssClass="input-medium" runat="server">
                                                            <asp:ListItem Value="">-- Seleccione --</asp:ListItem>
                                                            <asp:ListItem Value="SI">SI</asp:ListItem>
                                                            <asp:ListItem Value="NO">NO</asp:ListItem>
                                                        </asp:DropDownList>
                                                        <br>
                                                        <label>Cual es:</label>
                                                        <input type="text" name="txtColutorioCual" id="txtColutorioCual" placeholder="Digite Aqui" class="form-control" runat="server">
                                                    </div>
                                                </div>
                                                <%--13. HABITTOS BUCALES--%>
                                                <div class="control-group">
                                                    <label for="lblHabitosbucales" class="control-label col-sm-2">
                                                        Hábitos bucales</label>
                                                    <div class="controls">
                                                        <div class="checkbox checkbox-primary col-lg-10">
                                                            <asp:CheckBoxList ID="ckHabitosbucales" RepeatColumns="2" RepeatDirection="Horizontal" TextAlign="Right" runat="server">
                                                            </asp:CheckBoxList>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-sm-6">
                                                <%-- 1- Suplemento Fluorado--%>
                                                <div class="control-group">
                                                    <label for="lblSuplementoFluorado" class="control-label col-sm-2">
                                                        Suplemento Fluorado</label>
                                                    <div class="controls">
                                                        <asp:DropDownList ID="ddlSuplementoFluorado" CssClass="input-medium" runat="server">
                                                            <asp:ListItem Value="">-- Seleccione --</asp:ListItem>
                                                            <asp:ListItem Value="SI">SI</asp:ListItem>
                                                            <asp:ListItem Value="NO">NO</asp:ListItem>
                                                        </asp:DropDownList>
                                                        <br>
                                                        <label>Otros:</label>
                                                        <input type="text" name="txtSuplementoFluoradoCual" id="txtSuplementoFluoradoCual" placeholder="Digite Aqui" class="form-control" runat="server">
                                                    </div>
                                                </div>

                                                <%-- 2-Seda dental  --%>
                                                <div class="control-group">
                                                    <label for="lblSedadental" class="control-label col-sm-2">
                                                        Seda Dental</label>
                                                    <div class="controls">
                                                        <asp:DropDownList ID="ddlSedadental" CssClass="input-medium" runat="server">
                                                            <asp:ListItem Value="">-- Seleccione --</asp:ListItem>
                                                            <asp:ListItem Value="SI">SI</asp:ListItem>
                                                            <asp:ListItem Value="NO">NO</asp:ListItem>
                                                        </asp:DropDownList>
                                                        <br>
                                                        <label>Otros:</label>
                                                        <input type="text" name="txtSedadentalotros" id="txtSedadentalotros" placeholder="Digite Aqui" class="form-control" runat="server">
                                                    </div>
                                                </div>
                                                <%--3- Momentos de azúcar al día  --%>
                                                <div class="control-group">
                                                    <label for="lblMomentosdeazucaraldia" class="control-label col-sm-2">
                                                        Momentos azúcar al día</label>
                                                    <div class="controls">
                                                        <input type="text" name="txtMomentosazucaraldía" id="txtMomentosazucaraldía" placeholder="Digite Aqui" class="form-control" runat="server">
                                                    </div>
                                                </div>
                                                <%-- HABITTOS BUCALES otros--%>
                                                <div class="control-group">
                                                    <label for="lblHabitosbucales" class="control-label col-sm-2">
                                                        Habitos Bucales Otros</label>
                                                    <div class="controls">
                                                        <input type="text" name="txtHabitosbucalesOtros" id="txtHabitosbucalesOtros" placeholder="Digite Aqui" class="form-control" runat="server">
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
            </div>
        </asp:Panel>

        <%--14.	Odontograma--%>
        <div id="pnodontofinal" class="row">
            <textarea runat="server" name="txturlodontograma1" id="txturlodontograma1" rows="0" placeholder="" hidden="hidden"></textarea>
            <%--<asp:TextBox ID="txturlodontograma1" runat="server"></asp:TextBox>--%>
            <%-- <link href="http://localhost:12503/css/odontograma/2-col-portfolio.css" rel="stylesheet" />
            <link href="http://localhost:12503/css/odontograma/base.css" rel="stylesheet" />
            <link href="http://localhost:12503/css/odontograma/bootstrap-theme.css" rel="stylesheet" />
            <link href="http://localhost:12503/css/odontograma/bootstrap-theme.min.css" rel="stylesheet" />--%>
            <%--<script src="../js/odontograma/jquery-1.10.2.min.js"></script>--%>

            <link href="http://caidsiges01:8082/css/odontograma/2-col-portfolio.css" rel="stylesheet" />
            <link href="http://caidsiges01:8082/css/odontograma/base.css" rel="stylesheet" />
            <link href="http://caidsiges01:8082/css/odontograma/bootstrap-theme.css" rel="stylesheet" />
            <link href="http://caidsiges01:8082/css/odontograma/bootstrap-theme.min.css" rel="stylesheet" />

            <%--<link href="http://caidsiges01:8082/css/odontograma/bootstrap.css" rel="stylesheet" />
            <link href="http://caidsiges01:8082/css/odontograma/bootstrap.min.css" rel="stylesheet" /> --%>
            <asp:UpdatePanel ID="UpdatePanel9" runat="server" UpdateMode="Conditional">
                <ContentTemplate>
                    <script type="text/javascript">
                                                            function onGetURLOdontograma() {
                                                                document.getElementById('<%= txturlodontograma1.ClientID %>').value = document.getElementById("MainContent_pnodontogramaBody").innerHTML;
                                                                //break;
                                                                //alert(document.getElementById("MainContent_pnodontograma").innerHTML);
                                                            }
                    </script>

                    <asp:Panel runat="server" ID="pnodontograma">
                        <%--<form runat="server">--%>
                        <div class="row-fluid" id="pnodontogramacache" visible="true" runat="server">
                            <div class="col-sm-12">
                                <div class="box box-color box-bordered">
                                    <div class="box-title box-color">
                                        <h3><i class="icon-edit"></i>Odontograma</h3>
                                        <div class="actions">

                                            <button type="button" id="Button1" runat="server"
                                                class="btn btn-warning" onserverclick="_NuevoOdontograma" validationgroup="pnodontogramacache">
                                                <i class="icon-plus-sign"></i>&nbspNuevo</button>

                                            <asp:Button ID="Button3" OnClick="urlOdontograma_Click" OnClientClick="onGetURLOdontograma();" runat="server" class="btn btn-warning" data-dismiss="modal" Text="Actualizar" ValidationGroup="pnodontogramacache"></asp:Button>

                                        </div>
                                    </div>
                                    <div class="box-content nopadding">
                                        <div class="row">
                                            <div class="container">
                                                <div class="panel-body" id="pnodontogramaBody" runat="server" visible="true">
                                                    <div class="row">
                                                        <div class="col-md-7 col-md-offset-3">
                                                            <div id="controls" class="panel panel-default">
                                                                <div class="panel-body" align="center">
                                                                    <div class="btn-group" data-toggle="buttons">
                                                                        <label id="fractura" class="btn btn-brown">
                                                                            <input type="radio" name="options" id="option1" autocomplete="off" checked>Carie</label>
                                                                        <label id="restauracion" class="btn btn-primary">
                                                                            <input type="radio" name="options" id="option2" autocomplete="off">Obturación</label>
                                                                        <label id="extraccion" class="btn btn-grey-4">
                                                                            <input id="option3" autocomplete="off" name="options" type="radio"> Extracción </input>
                                                                        </label>
                                                                        <label id="extraer" class="btn btn-red">
                                                                            <input type="radio" name="options" id="option4" autocomplete="off">
                                                                            A Extraer 
                                                                        </label>

                                                                        <label id="Radiografia" class="btn btn-satgreen">
                                                                            <input autocomplete="off" name="options" type="radio">Radiografia</input></label>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div id="tr" class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
                                                        </div>
                                                        <div id="tl" class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
                                                        </div>
                                                        <div id="tlr" class="col-xs-6 col-sm-6 col-md-6 col-lg-6 text-right">
                                                        </div>
                                                        <div id="tll" class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
                                                        </div>
                                                    </div>
                                                    <div class="row" runat="server">
                                                        <div id="blr" class="col-xs-6 col-sm-6 col-md-6 col-lg-6 text-right">
                                                        </div>
                                                        <div id="bll" class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
                                                        </div>
                                                        <div id="br" class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
                                                        </div>
                                                        <div id="bl" class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                                            <div class="panel panel-default">
                                                                <div class="panel-body">
                                                                    <div class="col-xs-4 col-sm-4 col-md-4 col-lg-4 text-left">
                                                                        <div style="height: 20px; width: 20px; display: inline-block;" class="click-brown"></div>
                                                                        = Carie
                                                          <br>
                                                                        <div style="height: 5px; width: 20px; display: inline-block;"></div>
                                                                    </div>
                                                                    <div class="col-xs-4 col-sm-4 col-md-4 col-lg-4 text-center">
                                                                        <div style="height: 20px; width: 20px; display: inline-block;" class="click-blue"></div>
                                                                        = Obturación
                                                            <br>
                                                                        <div style="height: 20px; width: 20px; display: inline-block;" class="click-green"></div>
                                                                        = Radiografia 
                                                                    </div>
                                                                    <div class="col-xs-4 col-sm-4 col-md-4 col-lg-4 text-right">
                                                                        <span style="display: inline:block;">Pieza Extraída</span> =
                                                             <img style="display: inline:block;" src="/img/extraccion.png">
                                                                        <br>
                                                                        <span style="display: inline:block;">Para Extraer</span> =
                                                             <img style="display: inline:block;" src="/img/paraextraer.png">
                                                                        <br>
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
                            </div>
                        </div>

                    </asp:Panel>
                    <div class="row-fluid" id="Div3" visible="true" runat="server">
                        <div class="col-sm-12">
                            <div class="box box-color box-bordered">
                                <div class="box-content nopadding" id="pnodontogramadb" runat="server">
                                    <div class="row-fluid">
                                        <asp:Repeater ID="RPODONTOGRAMA" runat="server">
                                            <ItemTemplate>
                                                <%# Eval("OdontogramaURL")%>
                                            </ItemTemplate>
                                        </asp:Repeater>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <script type="text/javascript">

                                                            function replaceAll(find, replace, str) {
                                                                return str.replace(new RegExp(find, 'g'), replace);
                                                            }
                        //if (document.getElementById('<%= txturlodontograma1.ClientID %>').value = "") {
                        if (document.getElementById('<%= txturlodontograma1.ClientID %>').value == "") {

                                                                    <%--alert(document.getElementById('<%= txturlodontograma1.ClientID %>').value);--%>
                            function createOdontogram() {
                                var htmlLecheLeft = "",
                                    htmlLecheRight = "",
                                    htmlLeft = "",
                                    htmlRight = "",
                                    a = 1;
                                for (var i = 9 - 1; i >= 1; i--) {
                                    //Dientes Definitivos Cuandrante Derecho (Superior/Inferior)
                                    htmlRight += '<div data-name="value" id="dienteindex' + i + '" class="diente">' +
                                        '<span style="margin-left: 45px; margin-bottom:5px; display: inline-block !important; border-radius: 10px !important;" class="label label-info">index' + i + '</span>' +
                                        '<div id="tindex' + i + '" class="cuadro click">' +
                                        '</div>' +
                                        '<div id="lindex' + i + '" class="cuadro izquierdo click">' +
                                        '</div>' +
                                        '<div id="bindex' + i + '" class="cuadro debajo click">' +
                                        '</div>' +
                                        '<div id="rindex' + i + '" class="cuadro derecha click click">' +
                                        '</div>' +
                                        '<div id="cindex' + i + '" class="centro click">' +
                                        '</div>' +
                                        '</div>';
                                    //Dientes Definitivos Cuandrante Izquierdo (Superior/Inferior)
                                    htmlLeft += '<div id="dienteindex' + a + '" class="diente">' +
                                        '<span style="margin-left: 45px; margin-bottom:5px; display: inline-block !important; border-radius: 10px !important;" class="label label-info">index' + a + '</span>' +
                                        '<div id="tindex' + a + '" class="cuadro click">' +
                                        '</div>' +
                                        '<div id="lindex' + a + '" class="cuadro izquierdo click">' +
                                        '</div>' +
                                        '<div id="bindex' + a + '" class="cuadro debajo click">' +
                                        '</div>' +
                                        '<div id="rindex' + a + '" class="cuadro derecha click click">' +
                                        '</div>' +
                                        '<div id="cindex' + a + '" class="centro click">' +
                                        '</div>' +
                                        '</div>';
                                    if (i <= 5) {
                                        //Dientes Temporales Cuandrante Derecho (Superior/Inferior)
                                        htmlLecheRight += '<div id="dienteLindex' + i + '" style="left: -25%;" class="diente-leche">' +
                                            '<span style="margin-left: 45px; margin-bottom:5px; display: inline-block !important; border-radius: 10px !important;" class="label label-primary">index' + i + '</span>' +
                                            '<div id="tlecheindex' + i + '" class="cuadro-leche top-leche click">' +
                                            '</div>' +
                                            '<div id="llecheindex' + i + '" class="cuadro-leche izquierdo-leche click">' +
                                            '</div>' +
                                            '<div id="blecheindex' + i + '" class="cuadro-leche debajo-leche click">' +
                                            '</div>' +
                                            '<div id="rlecheindex' + i + '" class="cuadro-leche derecha-leche click click">' +
                                            '</div>' +
                                            '<div id="clecheindex' + i + '" class="centro-leche click">' + // este es 
                                            '</div>' +
                                            '</div>';
                                    }
                                    if (a < 6) {
                                        //Dientes Temporales Cuandrante Izquierdo (Superior/Inferior)
                                        htmlLecheLeft += '<div id="dienteLindex' + a + '" class="diente-leche">' +
                                            '<span style="margin-left: 45px; margin-bottom:5px; display: inline-block !important; border-radius: 10px !important;" class="label label-primary">index' + a + '</span>' +
                                            '<div id="tlecheindex' + a + '" class="cuadro-leche top-leche click">' +
                                            '</div>' +
                                            '<div id="llecheindex' + a + '" class="cuadro-leche izquierdo-leche click">' +
                                            '</div>' +
                                            '<div id="blecheindex' + a + '" class="cuadro-leche debajo-leche click">' +
                                            '</div>' +
                                            '<div id="rlecheindex' + a + '" class="cuadro-leche derecha-leche click click">' +
                                            '</div>' +
                                            '<div id="clecheindex' + a + '" class="centro-leche click">' +
                                            '</div>' +
                                            '</div>';
                                    }
                                    a++;
                                }
                                $("#tr").append(replaceAll('index', '1', htmlRight));
                                $("#tl").append(replaceAll('index', '2', htmlLeft));
                                $("#tlr").append(replaceAll('index', '5', htmlLecheRight));   // este es 
                                $("#tll").append(replaceAll('index', '6', htmlLecheLeft));

                                $("#bl").append(replaceAll('index', '3', htmlLeft));
                                $("#br").append(replaceAll('index', '4', htmlRight));
                                $("#bll").append(replaceAll('index', '7', htmlLecheLeft));
                                $("#blr").append(replaceAll('index', '8', htmlLecheRight));
                            }
                            var arrayPuente = [];
                            $(document).ready(function () {

                                createOdontogram();
                                // trabajando
                                $(".click").click(function (event) {
                                    var control = $("#controls").children().find('.active').attr('id');
                                    var cuadro = $(this).find("input[name=cuadro]:hidden").val();
                                    console.log($(this).attr('id'))
                                    switch (control) {
                                        case "fractura": // Carie
                                            if ($(this).hasClass("click-blue")) {
                                                $(this).removeClass('click-blue');
                                                $(this).addClass('click-red');
                                            } else {
                                                if ($(this).hasClass("click-red")) {
                                                    $(this).removeClass('click-red');
                                                } else {
                                                    $(this).addClass('click-red');
                                                }
                                            }
                                            break;
                                        case "Radiografia":
                                            var dientePosition = $(this).position();
                                            console.log($(this))
                                            console.log(dientePosition)
                                            $(this).parent().children().each(function (index, el) {
                                                if ($(el).hasClass("click")) {
                                                    $(el).addClass('click-green');
                                                    $(el).removeClass('click');
                                                } else
                                                    if ($(el).hasClass("click-green")) {
                                                        $(el).removeClass('click-green');
                                                        $(el).addClass('click');
                                                    }
                                            });
                                            break;
                                        case "restauracion": //obturacion 
                                            // var dientePosition = $(this).position();
                                            // console.log($(this))
                                            //console.log(dientePosition)
                                            /*if ($(this).hasClass("click-red")) {
                                                $(this).removeClass('click-red');
                                                $(this).addClass('click-blue');
                                            } else */{
                                                if ($(this).hasClass("click-blue")) {
                                                    $(this).removeClass('click-blue');

                                                } else {
                                                    $(this).addClass('click-blue');
                                                    $(this).addClass('click');
                                                }
                                            }
                                            break;
                                        case "extraccion":
                                            var dientePosition = $(this).position();
                                            console.log($(this))
                                            console.log(dientePosition)
                                            $(this).parent().children().each(function (index, el) {
                                                if ($(el).hasClass("click")) {
                                                    $(el).addClass('click-delete');
                                                    $(el).removeClass('click');
                                                } else
                                                    if ($(el).hasClass("click-delete")) {
                                                        $(el).removeClass('click-delete');
                                                        $(el).addClass('click');
                                                    }
                                            });
                                            break;
                                        case "extraer":
                                            var dientePosition = $(this).position();
                                            console.log($(this))
                                            console.log(dientePosition)
                                            $(this).parent().children().each(function (index, el) {
                                                if ($(el).hasClass("click")) {
                                                    $(el).addClass('click-red');
                                                    $(el).removeClass('click');
                                                } else
                                                    if ($(el).hasClass("click-red")) {
                                                        $(el).removeClass('click-red');
                                                        $(el).addClass('click');
                                                    }
                                            });
                                            break;
                                        case "puente":
                                            var dientePosition = $(this).offset(), leftPX;
                                            console.log($(this)[0].offsetLeft)
                                            var noDiente = $(this).parent().children().first().text();
                                            var cuadrante = $(this).parent().parent().attr('id');
                                            var left = 0,
                                                width = 0;
                                            if (arrayPuente.length < 1) {
                                                $(this).parent().children('.cuadro').css('border-color', 'red');
                                                arrayPuente.push({
                                                    diente: noDiente,
                                                    cuadrante: cuadrante,
                                                    left: $(this)[0].offsetLeft,
                                                    father: null
                                                });
                                            } else {
                                                $(this).parent().children('.cuadro').css('border-color', 'red');
                                                arrayPuente.push({
                                                    diente: noDiente,
                                                    cuadrante: cuadrante,
                                                    left: $(this)[0].offsetLeft,
                                                    father: arrayPuente[0].diente
                                                });
                                                var diferencia = Math.abs((parseInt(arrayPuente[1].diente) - parseInt(arrayPuente[1].father)));
                                                if (diferencia == 1) width = diferencia * 60;
                                                else width = diferencia * 50;

                                                if (arrayPuente[0].cuadrante == arrayPuente[1].cuadrante) {
                                                    if (arrayPuente[0].cuadrante == 'tr' || arrayPuente[0].cuadrante == 'tlr' || arrayPuente[0].cuadrante == 'br' || arrayPuente[0].cuadrante == 'blr') {
                                                        if (arrayPuente[0].diente > arrayPuente[1].diente) {
                                                            console.log(arrayPuente[0])
                                                            leftPX = (parseInt(arrayPuente[0].left) + 10) + "px";
                                                        } else {
                                                            leftPX = (parseInt(arrayPuente[1].left) + 10) + "px";
                                                            //leftPX = "45px";
                                                        }
                                                    } else {
                                                        if (arrayPuente[0].diente < arrayPuente[1].diente) {
                                                            leftPX = "-45px";
                                                        } else {
                                                            leftPX = "45px";
                                                        }
                                                    }
                                                }
                                                console.log(leftPX)
                                                /*$(this).parent().append('<div style="z-index: 9999; height: 5px; width:' + width + 'px;" id="puente" class="click-red"></div>');
                                                $(this).parent().children().last().css({
                                                    "position": "absolute",
                                                    "top": "80px",
                                                    "left": "50px"
                                                });*/
                                                $(this).parent().append('<div style="z-index: 9999; height: 5px; width:' + width + 'px;" id="puente" class="click-red"></div>');
                                                $(this).parent().children().last().css({
                                                    "position": "absolute",
                                                    "top": "80px",
                                                    "left": leftPX
                                                });
                                            }

                                            break;
                                        default:
                                            console.log("borrar case");
                                    }
                                    return false;
                                });
                                return false;
                            });
                        };


                    </script>
                </ContentTemplate>
            </asp:UpdatePanel>
            <%--<asp:Panel runat="server" >--%>

            <%-- </asp:Panel>--%>
        </div>

        <%--15.	Ortodoncia dientes primarios--%>
        <%--16.	Ortodoncia dientes dentición mixta, permanente --%>
        <asp:Panel runat="server" ID="Panel3">
            <div class="row-fluid">
                <div class="col-sm-12">
                    <div class="box box-color box-bordered">
                        <div class="box-title box-color">
                            <h3><i class="icon-edit"></i>Ortodoncia, Terapias Miofuncionales</h3>
                        </div>
                        <div class="box-content nopadding">
                            <div class='form-horizontal form-column form-bordered'>
                                <div class="row">
                                    <div class="col-sm-12">
                                        <div class="control-group">
                                            <div class="col-sm-6">
                                                <%--15.Ortodoncia dientes primarios--%>
                                                <div class="control-group">
                                                    <label for="lblOrtodonciadienteprimarios" class="control-label col-sm-2">
                                                        Ortodoncia dientes primarios</label>
                                                    <div class="controls">
                                                        <div class="checkbox checkbox-primary col-lg-12">
                                                            <asp:CheckBoxList ID="CKOrtodonciadientesprimarios" RepeatColumns="2" RepeatDirection="Horizontal" TextAlign="Right" runat="server">
                                                            </asp:CheckBoxList>
                                                        </div>
                                                        <br>
                                                        <label>Otros:</label>
                                                        <input type="text" name="txtOrtodonciadientesprimariosOtros" id="txtOrtodonciadientesprimariosOtros" placeholder="Digite Aqui" class="form-control" runat="server">
                                                    </div>
                                                </div>
                                                <%--18.	TERAPIAS MIOFUNCIONALES  --%>
                                                <div class="control-group">
                                                    <label for="lblTerapiaMioFuncionales" class="control-label col-sm-2">
                                                        Terapia MioFuncionales
                                                    </label>
                                                    <div class="controls">
                                                        <asp:DropDownList ID="ddlTerapiaMioFuncionales" CssClass="select2-me input-block-level" runat="server">
                                                        </asp:DropDownList>
                                                        <br>
                                                        <label>Otros:</label>
                                                        <input type="text" name="txtTerapiaMioFuncionalesOtros" id="txtTerapiaMioFuncionalesOtros" placeholder="Digite Aqui" class="form-control" runat="server">
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-sm-6">
                                                <%--16.	Ortodoncia dientes dentición mixta, permanente --%>
                                                <div class="control-group">
                                                    <label for="lblOrtodonciadientesdenticionmixtapermanente" class="control-label col-sm-2">
                                                        Ortodoncia dientes dentición mixta, permanente</label>
                                                    <div class="controls">
                                                        <div class="checkbox checkbox-primary col-lg-12">
                                                            <asp:CheckBoxList ID="ckOrtodonciadientesdenticionmixtapermanente" RepeatColumns="2" RepeatDirection="Horizontal" TextAlign="Right" runat="server">
                                                            </asp:CheckBoxList>
                                                        </div>
                                                        <br>
                                                        <label>Otros:</label>
                                                        <input type="text" name="txtOrtodonciadientesdenticionmixtapermanenteOtros" id="txtOrtodonciadientesdenticionmixtapermanenteOtros" placeholder="Digite Aqui" class="form-control" runat="server">
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
            </div>
        </asp:Panel>

        <%--17. PROCEDIMIENTO A REALIZAR --%>
        <asp:Panel runat="server" ID="PNPROCEDIMIENTOSAREALIZAR" Visible="False">
            <div class="row-fluid">
                <%-- <asp:ScriptManager ID="ScriptManager1" runat="server">
                </asp:ScriptManager>--%>

                <asp:UpdatePanel ID="UpdatePanel6" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <div class="col-sm-12">
                            <div class="box  box-color box-bordered">
                                <div class="box-title">
                                    <h3>
                                        <i class="icon-edit"></i>Procedimiento a Realizar  
                                    </h3>
                                    <div class="actions">
                                        <%--<button type="button" id="BtnAddProcedimientosaRealizar" runat="server" onserverclick="_AddProcedimientosarealizar" validationgroup="PNPROCEDIMIENTOSAREALIZAR"
                                            class="btn btn-warning" data-dismiss="modal">
                                            <i class="icon-plus-sign"></i>&nbsp Añadir Procedimiento</button>--%>
                                        <button type="button" id="btnSaveProcedimientoaRealizar" runat="server" onserverclick="_SaveProcedimientosarealizar" validationgroup="PNPROCEDIMIENTOSAREALIZAR"
                                            class="btn btn-warning" data-dismiss="modal">
                                            <i class="icon-save"></i>&nbsp Guardar</button>
                                    </div>
                                </div>
                                <div id="MNTPROCEDIMIENTOSAREALIZAR" runat="server" visible="True">
                                    <div class="box-content nopadding">
                                        <%--Modal: Procedimiento a Realizar --%>
                                        <div class='form-horizontal form-bordered'>
                                            <%-- <div class="modal-body nopadding">--%>
                                            <%-- PROCEDIMIENTO A REALIZAR --%>
                                            <%-- <div class="control-group">
                                                <label for="lblFechaProcedimientoProximaCita" class="control-label">
                                                    Fecha</label>
                                                <div class="controls">
                                                    <input type='text' class="input-medium datepick" name="txtFechaprocedimientosaRealizar" id="txtFechaprocedimientosaRealizar" runat="server" data-rule-required="true" placeholder="dd/mm/aaaa" />
                                                </div>
                                                
                                            </div>--%>
                                            <div class="control-group">
                                                <label for="lblProcedimientoProximaCita" class="control-label">
                                                    Procedimiento</label>
                                                <div class="controls">
                                                    <asp:DropDownList ID="ddlprocedimientosaRealizar" CssClass="select2-me input-block-level" runat="server">
                                                    </asp:DropDownList> 
                                                    <%--<asp:RequiredFieldValidator ControlToValidate="ddlprocedimientosaRealizar" Display="Dynamic"
                                                        ErrorMessage="Requerido!" ForeColor="Red" ID="RequiredFieldValidator4" runat="server"
                                                        SetFocusOnError="True" ValidationGroup="pnlData" />--%>
                                                </div>
                                            </div>
                                            <%--piezas dentales--%>
                                            <div class="control-group">
                                                <label for="cmbPiezas" class="control-label">
                                                    Pieza Dental/Cuandrate</label>
                                                <div class="controls">
                                                    <asp:DropDownList runat="server" ID="ddlpiezaprocedimientoarealizar" CssClass='select2-me input-block-level'>
                                                    </asp:DropDownList>
                                                </div>
                                            </div>
                                            <%--COMENTARIOS--%>
                                            <div class="control-group">
                                                <label for="txtEVALUACION" class="control-label">
                                                    Comentarios</label>
                                                <div class="controls">
                                                    <asp:TextBox ID="txtcomentarioprocedimientosaRealizar" runat="server" TextMode="MultiLine" Height="50px"
                                                        Wrap="true" placeholder="Digite aquí" CssClass="input-block-level"></asp:TextBox>
                                                </div>
                                            </div>
                                            <%-- </div>--%>
                                        </div>

                                    </div>
                                </div>
                                <%--REPEATER: Procedimiento a Realizar--%>
                                <div class="box-content nopadding" id="TBPROCEDIMIENTOSAREALIZAR" runat="server" visible="true">
                                    <table class="table table-bordered dataTable dataTable-scroll-x dataTable-tools">
                                        <thead>
                                            <tr>
                                                <th>Fecha  
                                                </th>
                                                <th>Terapeuta
                                                </th>
                                                <th>Descripción
                                                </th>
                                                <th class="hidden-350">Comentarios
                                                </th>
                                                <th class="hidden-350">Acciones
                                                </th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <asp:Repeater ID="RPPROCEDIMIENTOSAREALIZAR" runat="server">
                                                <ItemTemplate>
                                                    <tr>
                                                        <td>
                                                            <%# Eval("Rowcdte")%> 
                                                        </td>
                                                        <td>
                                                            <%# Eval("TERAPEUTA")%>
                                                            <br />
                                                            <%# Eval("ESPECIALIDAD")%>
                                                        </td>
                                                        <td>
                                                            <%# Eval("DESCRIPCION")%>
                                                            <br />
                                                            <%# Eval("pieza")%> 
                                                        </td>
                                                        <td>
                                                            <%# Eval("Comentario")%>
                                                        </td>
                                                        <td class="hidden-350">
                                                            <p align="left">
                                                                <%-- <div class="actions">--%>
                                                                <asp:LinkButton ID="btnDeleteProcedimientosARealizar" CssClass="btn btn-red" runat="server" Text="Eliminar"
                                                                    CommandArgument='<%# Eval("Secuencia")%>'
                                                                    OnClientClick="return confirm('¿Está seguro que desea eliminar este registro?');" CommandName="DeleteDetProcedimientosaRealizar" OnClick="_DELETEProcedimientosarealizar"><i class="icon-remove-sign">&nbsp Eliminar</i></asp:LinkButton>
                                                                <%--   </div>--%>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                </ItemTemplate>
                                            </asp:Repeater>
                                        </tbody>
                                    </table>
                                </div>
                    </ContentTemplate>
                    <%--<Triggers>
                        <asp:AsyncPostBackTrigger ControlID="BtnAddPlanTratamiento" EventName="Click" />
                        <asp:AsyncPostBackTrigger ControlID="btnSaveTratamientos" EventName="Click" /> 
                    </Triggers>--%>
                </asp:UpdatePanel>
                <%-- <script type="text/javascript">
                                                            $(function FN_FechaprocedimientosaRealizar() {
                                                                alert("hola");
                                                                $('#MainContent_txtFechaprocedimientosaRealizar').datepicker({ 
                                                                    toggleActive: true,
                                                                    format: "mm/dd/yyyy",
                                                                    todayHighlight: true,
                                                                    // calendarWeeks: true ,
                                                                    language: "es-DO",
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
                                                </script>--%>
            </div>
        </asp:Panel>

        <%--18.	Objetivos a evaluar terapia Myobrace --%>
        <asp:Panel runat="server" ID="Panel4">
            <div class="row-fluid">
                <div class="col-sm-12">
                    <div class="box box-color box-bordered">
                        <div class="box-title box-color">
                            <h3><i class="icon-edit"></i>Objetivos a evaluar Terapia Myobrace</h3>
                        </div>
                        <div class="box-content nopadding">
                            <div class='form-horizontal form-column form-bordered'>
                                <div class="row">
                                    <div class="col-sm-12">
                                        <div class="control-group">
                                            <div class="col-sm-6">
                                                <%-- 1- a.	Si el niño tiene los labios cerrados--%>
                                                <div class="control-group">
                                                    <label for="lbltienelabioscerrados" class="control-label col-sm-2">
                                                        Tiene Labios Cerrados
                                                    </label>
                                                    <div class="controls">
                                                        <asp:DropDownList ID="ddlTieneLabiosCerrados" CssClass="input-medium" runat="server">
                                                            <asp:ListItem Value="">-- Seleccione --</asp:ListItem>
                                                            <asp:ListItem Value="SI">SI</asp:ListItem>
                                                            <asp:ListItem Value="NO">NO</asp:ListItem>
                                                        </asp:DropDownList>
                                                    </div>
                                                </div>
                                                <%-- c.	Hay movimientos mientras respira --%>
                                                <div class="control-group">
                                                    <label for="lblHaymovimientosmientrasrespira " class="control-label col-sm-2">
                                                        Hay movimientos mientras Respira 
                                                    </label>
                                                    <div class="controls">
                                                        <asp:DropDownList ID="ddlHaymovimientosmientrasrespira" CssClass="input-medium" runat="server">
                                                            <asp:ListItem Value="">-- Seleccione --</asp:ListItem>
                                                            <asp:ListItem Value="SI">SI</asp:ListItem>
                                                            <asp:ListItem Value="NO">NO</asp:ListItem>
                                                        </asp:DropDownList>
                                                    </div>
                                                </div>
                                                <%-- e.	Postura adecuada   --%>
                                                <div class="control-group">
                                                    <label for="lblPosturaadecuada" class="control-label col-sm-2">
                                                        Postura adecuada 
                                                    </label>
                                                    <div class="controls">
                                                        <asp:DropDownList ID="ddlPosturaadecuada" CssClass="input-medium" runat="server">
                                                            <asp:ListItem Value="">-- Seleccione --</asp:ListItem>
                                                            <asp:ListItem Value="SI">SI</asp:ListItem>
                                                            <asp:ListItem Value="NO">NO</asp:ListItem>
                                                        </asp:DropDownList>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-sm-6">
                                                <%--  b.	Respira por la nariz --%>
                                                <div class="control-group">
                                                    <label for="lblRespiraporlanariz" class="control-label col-sm-2">
                                                        Respira por la Nariz 
                                                    </label>
                                                    <div class="controls">
                                                        <asp:DropDownList ID="ddlRespiraporlanariz" CssClass="input-medium" runat="server">
                                                            <asp:ListItem Value="">-- Seleccione --</asp:ListItem>
                                                            <asp:ListItem Value="SI">SI</asp:ListItem>
                                                            <asp:ListItem Value="NO">NO</asp:ListItem>
                                                        </asp:DropDownList>
                                                    </div>
                                                </div>
                                                <%-- d.	Lengua está en su posición  --%>
                                                <div class="control-group">
                                                    <label for="lblLenguaestaensuposición" class="control-label col-sm-2">
                                                        Lengua está en su posición 
                                                    </label>
                                                    <div class="controls">
                                                        <asp:DropDownList ID="ddlLenguaestaensuposicion" CssClass="input-medium" runat="server">
                                                            <asp:ListItem Value="">-- Seleccione --</asp:ListItem>
                                                            <asp:ListItem Value="SI">SI</asp:ListItem>
                                                            <asp:ListItem Value="NO">NO</asp:ListItem>
                                                        </asp:DropDownList>
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
            </div>
        </asp:Panel>

        <%-- 20. PLAN DE TRATAMIENTO--%>
        <asp:Panel runat="server" ID="PNPLANDETRATAMIENTO">
            <div class="row-fluid">
                <asp:UpdatePanel ID="upPlanTratamiento" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>

                        <div class="col-sm-12">
                            <div class="box  box-color box-bordered">
                                <div class="box-title">
                                    <h3>
                                        <i class="icon-edit"></i>Plan Tratamiento
                                    </h3>
                                    <div class="actions">
                                        <%-- <button type="button" id="BtnAddPlanTratamiento" runat="server" onserverclick="_AddPlanTratamiento" validationgroup="pnlEdit"
                                            class="btn btn-warning" data-dismiss="modal">
                                            <i class="icon-plus-sign"></i>&nbsp Añadir Tratamiento</button>--%>
                                        <button type="button" id="btnSavePlanTratamiento" runat="server" onserverclick="_SavePlanTratamiento" validationgroup="pnlData"
                                            class="btn btn-warning" data-dismiss="modal">
                                            <i class="icon-save"></i>&nbsp Guardar</button>
                                    </div>
                                </div>
                                <div id="MNTPLANTRATAMIENTO" runat="server" visible="True">
                                    <div class="box-content nopadding">
                                        <%--Modal: PLAN DE TRATAMIENTO --%>
                                        <div class='form-horizontal form-bordered'>
                                            <div class="modal-body nopadding">
                                                <%-- Tipo de Evaluación --%>
                                                <div class="control-group" runat="server" visible="false">
                                                    <label for="cmbObjetivo" class="control-label" style="color: Red">
                                                        Especialidad</label>
                                                    <div class="controls">
                                                        <select runat="server" id="cmbTipo" name="cmbTipo" class='select2-me input-block-level'
                                                            data-rule-required="true">
                                                            <option value="">-- SELECCIONE --</option>
                                                        </select>
                                                        <br />
                                                        <asp:RequiredFieldValidator ControlToValidate="cmbTipo" Display="Dynamic" ErrorMessage="Requerido!"
                                                            ID="cmbTipo1" runat="server" SetFocusOnError="True" ValidationGroup="MNTPLANTRATAMIENTO" />
                                                    </div>
                                                </div>
                                                <%-- Objetivo --%>
                                                <div class="control-group" runat="server" visible="false">
                                                    <label for="cmbObjetivo" class="control-label" style="color: Red">
                                                        Objetivo</label>
                                                    <div class="controls">
                                                        <select runat="server" id="cmbObjetivo" name="cmbObjetivo" class='select2-me input-block-level'
                                                            data-rule-required="true">
                                                            <option value="">-- SELECCIONE --</option>
                                                        </select>
                                                        <br />
                                                        <asp:RequiredFieldValidator ControlToValidate="cmbObjetivo" Display="Dynamic" ErrorMessage="Requerido!"
                                                            ID="cmbObjetivo1" runat="server" SetFocusOnError="True" ValidationGroup="pnlData" />
                                                    </div>
                                                </div>
                                                <%-- Diagnostico --%>

                                                <div class="control-group">
                                                    <label for="cmbDetalles" class="control-label">
                                                        Tratamiento</label>
                                                    <div class="controls">
                                                        <select runat="server" id="cmbDetalles" class='select2-me input-block-level'>
                                                            <option value="">-- SELECCIONE --</option>
                                                        </select>
                                                        <%--&nbsp--%>
                                                        <asp:RequiredFieldValidator ControlToValidate="cmbDetalles" Display="Dynamic"
                                                            ErrorMessage="Requerido!" ForeColor="Red" ID="cmbDiagnostico1" runat="server"
                                                            SetFocusOnError="True" ValidationGroup="pnlData" />
                                                    </div>
                                                </div>
                                                <%--piezas dentales--%>
                                                <div class="control-group">
                                                    <label for="cmbPiezas" class="control-label">
                                                        Pieza Dental/Cuandrate</label>
                                                    <div class="controls">
                                                        <select runat="server" id="cmbPiezas" class='select2-me input-block-level'>
                                                            <option value="">-- SELECCIONE --</option>
                                                        </select>
                                                    </div>
                                                </div>
                                                <%--COMENTARIOS--%>
                                                <div class="control-group">
                                                    <label for="txtEVALUACION" class="control-label">
                                                        Comentarios</label>
                                                    <div class="controls">
                                                        <asp:TextBox ID="txtEVALUACION" runat="server" TextMode="MultiLine" Height="50px"
                                                            Wrap="true" placeholder="Digite aquí" CssClass="input-block-level"></asp:TextBox>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <%--REPEATER: PLAN DE TRATAMIENTO --%>
                                <div class="box-content nopadding" id="TBPLANTRATAMIENTO" runat="server" visible="true">
                                    <table class="table table-bordered dataTable dataTable-scroll-x dataTable-tools">
                                        <thead>
                                            <tr>
                                                <th>Fecha y Hora
                                                </th>
                                                <th>Especialista
                                                </th>
                                                <th>Descripción
                                                </th>
                                                <th class="hidden-350">Comentarios
                                                </th>
                                                <th class="hidden-350">Acciones
                                                </th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <asp:Repeater ID="RPPLANTRATAMIENTO" runat="server">
                                                <ItemTemplate>
                                                    <tr>
                                                        <td>
                                                            <%# Eval("FECHA")%>&nbsp<%# Eval("HORA")%></td>
                                                        <td>
                                                            <%# Eval("TERAPEUTA")%>
                                                            <br />
                                                            <%# Eval("ESPECIALIDAD")%>
                                                        </td>
                                                        <td>
                                                            <%# Eval("TRATNOMBRE")%>
                                                            <br />
                                                            <%# Eval("PIEZANOMBRE")%>
                                                        </td>
                                                        <td>
                                                            <%# Eval("DATOS")%>
                                                        </td>
                                                        <td class="hidden-350">
                                                            <p align="left">
                                                                <%-- <div class="actions">--%>
                                                                <asp:LinkButton ID="btnDeletePlanTratamiento" CssClass="btn btn-red" runat="server" Text="Eliminar"
                                                                    CommandArgument='<%# Eval("ROWGUID")%>'
                                                                    OnClientClick="return confirm('¿Está seguro que desea eliminar este registro?');" CommandName="DeleteDetPlanTratamiento" OnClick="_DELETEPlanTratamiento"><i class="icon-remove-sign">&nbsp Eliminar</i></asp:LinkButton>
                                                                <%--   </div>--%>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                </ItemTemplate>
                                            </asp:Repeater>
                                        </tbody>
                                    </table>
                                </div>
                    </ContentTemplate>
                    <%--<Triggers>
                        <asp:AsyncPostBackTrigger ControlID="BtnAddPlanTratamiento" EventName="Click" />
                        <asp:AsyncPostBackTrigger ControlID="btnSaveTratamientos" EventName="Click" /> 
                    </Triggers>--%>
                </asp:UpdatePanel>
            </div>

        </asp:Panel>

        <%-- 21. TRATAMIENTO REALIZADO--%>
        <asp:Panel runat="server" ID="PNTRATAMIENTOREALIZADO">
            <div class="row-fluid">
                <%-- <asp:ScriptManager ID="ScriptManager1" runat="server">
                </asp:ScriptManager>--%>
                <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <div class="col-sm-12">
                            <div class="box  box-color box-bordered">
                                <div class="box-title">
                                    <h3>
                                        <i class="icon-edit"></i>Tratamiento Realizado
                                    </h3>
                                    <div class="actions">
                                        <%-- <button type="button" id="btnTratamientoRealizado" runat="server" onserverclick="_AddTratamientoRealizado" validationgroup="PNTRATAMIENTOREALIZADO" class="btn btn-warning" data-dismiss="modal">
                                            <i class="icon-plus-sign"></i>&nbsp Añadir Tratamiento</button>--%>
                                        <button type="button" id="btnSaveTratamientoRealizado" runat="server" onserverclick="_SaveTratamientoRealizado" validationgroup="PNTRATAMIENTOREALIZADO" class="btn btn-warning" data-dismiss="modal">
                                            <i class="icon-save"></i>&nbsp Guardar</button>
                                    </div>
                                </div>
                                <div id="MNTTRATAMIENTOREALIZADO" runat="server" visible="True">
                                    <div class="box-content nopadding">
                                        <%--Modal: TRATAMIENTO  REALIZADO--%>
                                        <div class='form-horizontal form-bordered'>
                                            <%--<div class="modal-body nopadding">--%>
                                            <%-- Tipo de Evaluación --%>
                                            <%--<div class="control-group">
                                                    <label for="cmbObjetivo" class="control-label" style="color: Red">
                                                        Especialidad</label>
                                                    <div class="controls">
                                                        <select runat="server" id="Select1" name="cmbTipo" class='select2-me input-block-level'
                                                            data-rule-required="true">
                                                            <option value="">-- SELECCIONE --</option>
                                                        </select>
                                                        <br />
                                                        <asp:RequiredFieldValidator ControlToValidate="cmbTipo" Display="Dynamic" ErrorMessage="Requerido!"
                                                            ID="RequiredFieldValidator5" runat="server" SetFocusOnError="True" ValidationGroup="pnlData" />
                                                    </div>
                                                </div>--%>
                                            <%-- Objetivo --%>
                                            <%--<div class="control-group">
                                                    <label for="cmbObjetivo" class="control-label" style="color: Red">
                                                        Objetivo</label>
                                                    <div class="controls">
                                                        <select runat="server" id="Select2" name="cmbObjetivo" class='select2-me input-block-level'
                                                            data-rule-required="true">
                                                            <option value="">-- SELECCIONE --</option>
                                                        </select>
                                                        <br />
                                                        <asp:RequiredFieldValidator ControlToValidate="cmbObjetivo" Display="Dynamic" ErrorMessage="Requerido!"
                                                            ID="RequiredFieldValidator6" runat="server" SetFocusOnError="True" ValidationGroup="pnlData" />
                                                    </div>
                                                </div>--%>
                                            <%-- Diagnostico --%>
                                            <div class="control-group">
                                                <label for="cmbDetalles" class="control-label">
                                                    Tratamiento</label>
                                                <div class="controls">
                                                    <asp:DropDownList runat="server" ID="ddlTratamientoRealizado" class='select2-me input-block-level'>
                                                    </asp:DropDownList>
                                                    <%--&nbsp--%>
                                                    <%--<asp:RequiredFieldValidator ControlToValidate="ddlTratamientoRealizado" Display="Dynamic"
                                                            ErrorMessage="Requerido!" ForeColor="Red" ID="RequiredFieldValidator7" runat="server"
                                                            SetFocusOnError="True" ValidationGroup="PNTRATAMIENTOREALIZADO" />--%>
                                                </div>
                                            </div>
                                            <%--piezas dentales--%>
                                            <div class="control-group">
                                                <label for="cmbPiezas" class="control-label">
                                                    Pieza Dental/Cuandrate</label>
                                                <div class="controls">
                                                    <asp:DropDownList runat="server" ID="ddlPiezaTratamientoRealizado" class='select2-me input-block-level'>
                                                    </asp:DropDownList>
                                                    <%--&nbsp--%>
                                                    <%--                            <asp:RequiredFieldValidator ControlToValidate="cmbPiezas" Display="Dynamic"
                                ErrorMessage="Requerido!" ForeColor="Red" ID="RequiredFieldValidator1" runat="server"
                                SetFocusOnError="True" ValidationGroup="pnlData" />--%>
                                                </div>
                                            </div>
                                            <%--COMENTARIOS--%>
                                            <div class="control-group">
                                                <label for="txtEVALUACION" class="control-label">
                                                    Comentarios</label>
                                                <div class="controls">
                                                    <asp:TextBox ID="txtcomentariotratamientorealizado" runat="server" TextMode="MultiLine" Height="50px"
                                                        Wrap="true" placeholder="Digite aquí" CssClass="input-block-level"></asp:TextBox>
                                                </div>
                                            </div>
                                            <%-- </div>--%>
                                        </div>

                                    </div>
                                </div>
                                <%--REPEATER: TRATAMIENTO REALIZADO--%>
                                <div class="box-content nopadding" id="TBTRATAMIENTOREALIZADO" runat="server" visible="true">
                                    <table class="table table-bordered dataTable dataTable-scroll-x dataTable-tools">
                                        <thead>
                                            <tr>
                                                <th>Fecha y Hora
                                                </th>
                                                <th>Especialista
                                                </th>
                                                <th>Descripción
                                                </th>
                                                <th class="hidden-350">Comentarios
                                                </th>
                                                <th class="hidden-350">Acciones
                                                </th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <asp:Repeater ID="RPTRATAMIENTOREALIZADO" runat="server">
                                                <ItemTemplate>
                                                    <tr>
                                                        <td>
                                                            <%# Eval("Rowcdte")%>
                                                        </td>
                                                        <td>
                                                            <%# Eval("TERAPEUTA")%>
                                                            <br />
                                                            <%# Eval("ESPECIALIDAD")%>
                                                        </td>
                                                        <td>
                                                            <%# Eval("DESCRIPCION")%>
                                                            <br />
                                                            <%# Eval("PIEZA")%>
                                                        </td>
                                                        <td>
                                                            <%# Eval("COMENTARIO")%>
                                                        </td>
                                                        <td class="hidden-350">
                                                            <p align="left">
                                                                <asp:LinkButton ID="btnDeleteTratamientoRealizado" CssClass="btn btn-red" runat="server" Text="Eliminar"
                                                                    CommandArgument='<%# Eval("Secuencia")%>'
                                                                    OnClientClick="return confirm('¿Está seguro que desea eliminar este registro?');" CommandName="DeleteDetTratamientoRealizado" OnClick="_DELETETratamientoRealizado"><i class="icon-remove-sign">&nbsp Eliminar</i></asp:LinkButton>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                </ItemTemplate>
                                            </asp:Repeater>
                                        </tbody>
                                    </table>
                                </div>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>

        </asp:Panel>

        <%--22. Procedimiento a realizar próxima cita --%>
        <asp:Panel runat="server" ID="PNPROCEDIMIENTOPROXIMACITA">
            <div class="row-fluid">
                <%-- <asp:ScriptManager ID="ScriptManager1" runat="server">
                </asp:ScriptManager>--%>
                <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <div class="col-sm-12">
                            <div class="box  box-color box-bordered">
                                <div class="box-title">
                                    <h3>
                                        <i class="icon-edit"></i>Procedimiento a Realizar Próxima Cita 
                                    </h3>
                                    <div class="actions">
                                        <%-- <button type="button" id="Btnprocedimientoproximacita" runat="server" onserverclick="_Addprocedimientoproximacita" validationgroup="PNPROCEDIMIENTOPROXIMACITA"
                                            class="btn btn-warning" data-dismiss="modal">
                                            <i class="icon-plus-sign"></i>&nbsp Añadir Procedimiento</button>--%>
                                        <button type="button" id="btnsaveprocedimientoproximacita" runat="server" onserverclick="_Saveprocedimientoproximacita" validationgroup="PNPROCEDIMIENTOPROXIMACITA"
                                            class="btn btn-warning" data-dismiss="modal">
                                            <i class="icon-save"></i>&nbsp Guardar</button>
                                    </div>
                                </div>
                                <div id="MNTPROCEDIMIENTOPROXIMACITA" runat="server" visible="True">
                                    <div class="box-content nopadding">
                                        <%--Modal: Procedimiento a Realizar Próxima Cita--%>
                                        <div class='form-horizontal form-bordered'>
                                            <div class="modal-body nopadding">
                                                <%-- PROCEDIMIENTO A REALIZAR PROXIMACITA --%>
                                                <%-- <div class="control-group">
                                                    <label for="lblFechaProcedimientoProximaCita" class="control-label">
                                                        Fecha</label>
                                                    <div class="controls">
                                                        <input type='text' class="input-medium datepick" name="txtFechaproximacita" id="txtFechaproximacita" runat="server" data-rule-required="true" placeholder="dd/mm/aaaa" />
                                                    </div>
                                                    <script type="text/javascript">
                                                            $(function () {
                                                                $('#MainContent_txtFechaproximacita').datepicker({
                                                                    toggleActive: true,
                                                                    format: "dd/mm/yyyy",
                                                                    todayHighlight: true,
                                                                    // calendarWeeks: true ,
                                                                    language: "es-DO",
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
                                                </div>--%>

                                                <div class="control-group">
                                                    <label for="lblProcedimientoProximaCita" class="control-label">
                                                        Procedimiento</label>
                                                    <div class="controls">
                                                        <asp:DropDownList runat="server" ID="ddlProcedimientoProximaCita" CssClass='select2-me input-block-level'>
                                                        </asp:DropDownList>
                                                        <%--&nbsp--%>
                                                        <asp:RequiredFieldValidator ControlToValidate="ddlProcedimientoProximaCita" Display="Dynamic"
                                                            ErrorMessage="Requerido!" ForeColor="Red" ID="RequiredFieldValidator10" runat="server"
                                                            SetFocusOnError="True" ValidationGroup="PNPROCEDIMIENTOPROXIMACITA" />
                                                    </div>
                                                </div>

                                                <%--piezas dentales--%>
                                                <div class="control-group">
                                                    <label for="cmbPiezas" class="control-label">
                                                        Pieza Dental/Cuandrate</label>
                                                    <div class="controls">
                                                        <asp:DropDownList runat="server" ID="ddlpiezaprocedimientoproximacita" CssClass='select2-me input-block-level'>
                                                        </asp:DropDownList>
                                                    </div>
                                                </div>
                                                <%--COMENTARIOS--%>
                                                <div class="control-group">
                                                    <label for="txtEVALUACION" class="control-label">
                                                        Comentarios</label>
                                                    <div class="controls">
                                                        <asp:TextBox ID="txtcomentarioprocedimientoproximacita" runat="server" TextMode="MultiLine" Height="50px"
                                                            Wrap="true" placeholder="Digite aquí" CssClass="input-block-level"></asp:TextBox>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                    </div>
                                </div>
                                <%--REPEATER: Procedimiento a Realizar Próxima Cita--%>
                                <div class="box-content nopadding" id="tbprocedimientoproximacita" runat="server" visible="true">
                                    <table class="table table-bordered dataTable dataTable-scroll-x dataTable-tools">
                                        <thead>
                                            <tr>
                                                <th>Fecha  
                                                </th>
                                                <th>Terapeuta
                                                </th>
                                                <th>Descripción
                                                </th>
                                                <th class="hidden-350">Comentarios
                                                </th>
                                                <th class="hidden-350">Acciones
                                                </th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <asp:Repeater ID="RPPROCEDIMIENTOPROXIMACITA" runat="server">
                                                <ItemTemplate>
                                                    <tr>
                                                        <td>
                                                            <%# Eval("Rowcdte")%> 
                                                        </td>
                                                        <td>
                                                            <%# Eval("TERAPEUTA")%>
                                                            <br />
                                                            <%# Eval("ESPECIALIDAD")%>
                                                        </td>
                                                        <td>
                                                            <%# Eval("DESCRIPCION")%>
                                                            <br />
                                                            <%# Eval("pieza")%> 
                                                        </td>
                                                        <td>
                                                            <%# Eval("Comentario")%>
                                                        </td>
                                                        <td class="hidden-350">
                                                            <p align="left">
                                                                <%-- <div class="actions">--%>
                                                                <asp:LinkButton ID="btnDeleteProcedimientoProximaCita" CssClass="btn btn-red" runat="server" Text="Eliminar"
                                                                    CommandArgument='<%# Eval("Secuencia")%>'
                                                                    OnClientClick="return confirm('¿Está seguro que desea eliminar este registro?');" CommandName="DeleteDetProcedimientoProximaCita" OnClick="_DELETEProcedimientosProximaCita"><i class="icon-remove-sign">&nbsp Eliminar</i></asp:LinkButton>
                                                                <%--   </div>--%>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                </ItemTemplate>
                                            </asp:Repeater>
                                        </tbody>
                                    </table>
                                </div>
                    </ContentTemplate>
                    <%--<Triggers>
                        <asp:AsyncPostBackTrigger ControlID="BtnAddPlanTratamiento" EventName="Click" />
                        <asp:AsyncPostBackTrigger ControlID="btnSaveTratamientos" EventName="Click" /> 
                    </Triggers>--%>
                </asp:UpdatePanel>
            </div>

        </asp:Panel>
        <%--23. Insertar fotos, radiografías panorámicas, periapicales--%>
        <asp:Panel runat="server" ID="PNMultimedias">
            <div class="row-fluid">
                <asp:UpdatePanel ID="UpdatePanel3" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <div class="col-sm-12">
                            <div class="box  box-color box-bordered">
                                <div class="box-title">
                                    <h3>
                                        <i class="icon-edit"></i>Multimedia
                                    </h3>

                                    <div class="actions">
                                        <button type="button" id="Button2" runat="server" onserverclick="_AddMultimedia" validationgroup="PNMultimedias"
                                            class="btn btn-warning" data-dismiss="modal">
                                            <i class="icon-plus-sign"></i>&nbsp Añadir Multimedia</button>
                                    </div>
                                </div>
                                <div id="Div1" runat="server">
                                    <div class="box  ">
                                        <asp:UpdatePanel ID="UpdatePanel8" runat="server" UpdateMode="Conditional">
                                            <ContentTemplate>
                                                <%--REPEATER: Insertar fotos, radiografías panorámicas, periapicales--%>
                                                <div class="box-content nopadding" id="Div2" runat="server" visible="true">
                                                    <table class="table table-bordered dataTable dataTable-scroll-x dataTable-tools">
                                                        <thead>
                                                            <tr>
                                                                <th>Fecha y Hora</th>
                                                                <th>Profesional </th>
                                                                <th>Comentarios </th>
                                                                <th class="hidden-350">Acciones
                                                                </th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                            <asp:Repeater ID="RPMULTIMEDIA" runat="server">
                                                                <ItemTemplate>
                                                                    <tr>
                                                                        <td><%# Eval("ROWCDTE")%>
                                                                            <td>
                                                                                <%# Eval("TERAPEUTA")%>
                                                                                <br />
                                                                                <%# Eval("ESPECIALIDAD")%></td>
                                                                        </td>
                                                                        <td><%# Eval("NOTAS")%> </td>

                                                                        <td>
                                                                            <asp:LinkButton ID="btnFile" runat="server" CssClass="btn btn-primary" Text="Descargar"
                                                                                CommandArgument='<%# Eval("URL")%>' CommandName="View" OnClick="_VerMultimedias"><i class="icon-circle-arrow-down"></i></asp:LinkButton>

                                                                        </td>
                                                                    </tr>
                                                                </ItemTemplate>
                                                            </asp:Repeater>
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </ContentTemplate>
                                        </asp:UpdatePanel>

                                    </div>
                                </div>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>

        </asp:Panel>

        <%--24.	Interpretación radiográfica--%>
        <asp:Panel runat="server" ID="PNINTERPRETACIONRADIOGRAFICA">
            <div class="row-fluid">
                <%-- <asp:ScriptManager ID="ScriptManager1" runat="server">
                </asp:ScriptManager>--%>
                <asp:UpdatePanel ID="UpdatePanel7" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <div class="col-sm-12">
                            <div class="box  box-color box-bordered">
                                <div class="box-title">
                                    <h3>
                                        <i class="icon-edit"></i>Interpretación Radiográfica  
                                    </h3>
                                    <div class="actions">
                                        <%--<button type="button" id="BtnInterpretacionRadiografica" runat="server" onserverclick="_AddInterpretacionRadiografica" validationgroup="PNINTERPRETACIONRADIOGRAFICA"
                                            class="btn btn-warning" data-dismiss="modal">
                                            <i class="icon-plus-sign"></i>&nbsp Añadir Interpretación</button>--%>
                                        <button type="button" id="BtnSaveInterpretacionRadiografica" runat="server" onserverclick="_SaveInterpretacionRadiografica" validationgroup="PNINTERPRETACIONRADIOGRAFICA"
                                            class="btn btn-warning" data-dismiss="modal">
                                            <i class="icon-save"></i>&nbsp Guardar</button>
                                    </div>
                                </div>
                                <div id="MNTInterpretacionRadiografica" runat="server" visible="True">
                                    <div class="box-content nopadding">
                                        <%--Modal: Interpretación Radiográfica --%>
                                        <div class='form-horizontal form-bordered'>
                                            <div class="modal-body nopadding">
                                                <%-- Interpretación Radiográfica --%>
                                                <%--<div class="control-group">
                                                    <label for="lblFechaInterpretacionRadiografica" class="control-label">
                                                        Fecha</label>
                                                    <div class="controls">
                                                        <input type='text' class="input-medium datepick" name="txtFechaInterpretacionRadiografica" id="txtFechaInterpretacionRadiografica" runat="server" data-rule-required="true" placeholder="dd/mm/aaaa" />
                                                    </div>
                                                    <script type="text/javascript">
                                                        $(function () {
                                                            $('#MainContent_txtFechaInterpretacionRadiografica').datepicker({
                                                                toggleActive: true,
                                                                format: "dd/mm/yyyy",
                                                                todayHighlight: true,
                                                                // calendarWeeks: true ,
                                                                language: "es-DO",
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
                                                </div>--%>

                                                <div class="control-group">
                                                    <label for="lblProcedimientoProximaCita" class="control-label">
                                                        Interpretación Radiográfica</label>
                                                    <div class="controls">
                                                        <asp:DropDownList runat="server" ID="ddlInterpretacionRadiografica" class='select2-me input-block-level'>
                                                        </asp:DropDownList>
                                                        <%--&nbsp--%>
                                                        <asp:RequiredFieldValidator ControlToValidate="ddlInterpretacionRadiografica" Display="Dynamic"
                                                            ErrorMessage="Requerido!" ForeColor="Red" ID="RequiredFieldValidator5" runat="server"
                                                            SetFocusOnError="True" ValidationGroup="PNINTERPRETACIONRADIOGRAFICA" />
                                                    </div>
                                                </div>
                                                <%--piezas dentales--%>
                                                <div class="control-group">
                                                    <label for="cmbPiezas" class="control-label">
                                                        Pieza Dental/Cuandrate</label>
                                                    <div class="controls">
                                                        <asp:DropDownList runat="server" ID="ddlpiezaInterpretacionRadiografica" class='select2-me input-block-level'>
                                                        </asp:DropDownList>
                                                    </div>
                                                </div>
                                                <%--COMENTARIOS--%>
                                                <div class="control-group">
                                                    <label for="txtEVALUACION" class="control-label">
                                                        Comentarios</label>
                                                    <div class="controls">
                                                        <asp:TextBox ID="txtcomentariosInterpretacionRadiografica" runat="server" TextMode="MultiLine" Height="50px"
                                                            Wrap="true" placeholder="Digite aquí" CssClass="input-block-level"></asp:TextBox>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>


                                <%--REPEATER: Interpretación radiográfica--%>
                                <div class="box-content nopadding" id="TBInterpretacionRadiografica" runat="server" visible="true">
                                    <%-- 24. Interpretación radiográfica OTROS--%>
                                    <div class="control-group">
                                        <label for="lblInterpretacionradiográficaotros" class="control-label col-sm-6">
                                            Otros:</label>
                                        <div class="controls">
                                            <asp:TextBox ID="txtInterpretacionradiográficaOtros" Text='<%# Eval("ENTREVISTACONOTROS")%>' runat="server" placeholder="Digite Aqui" class="form-control"></asp:TextBox>
                                        </div>
                                    </div>
                                    <table class="table table-bordered dataTable dataTable-scroll-x dataTable-tools">
                                        <thead>
                                            <tr>
                                                <th>Fecha  
                                                </th>
                                                <th>Terapeuta
                                                </th>
                                                <th>Descripción
                                                </th>
                                                <th class="hidden-350">Comentarios
                                                </th>
                                                <th class="hidden-350">Acciones
                                                </th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <asp:Repeater ID="RPInterpretacionRadiografica" runat="server">
                                                <ItemTemplate>
                                                    <tr>
                                                        <td>
                                                            <%# Eval("Rowcdte")%> 
                                                        </td>
                                                        <td>
                                                            <%# Eval("TERAPEUTA")%>
                                                            <br />
                                                            <%# Eval("ESPECIALIDAD")%>
                                                        </td>
                                                        <td>
                                                            <%# Eval("DESCRIPCION")%>
                                                            <br />
                                                            <%# Eval("pieza")%> 
                                                        </td>
                                                        <td>
                                                            <%# Eval("Comentario")%>
                                                        </td>
                                                        <td class="hidden-350">
                                                            <p align="left">
                                                                <%-- <div class="actions">--%>
                                                                <asp:LinkButton ID="btnDeleteInterpretacionRadiografica" CssClass="btn btn-red" runat="server" Text="Eliminar"
                                                                    CommandArgument='<%# Eval("Secuencia")%>'
                                                                    OnClientClick="return confirm('¿Está seguro que desea eliminar este registro?');" CommandName="DeleteInterpretacionRadiografica" OnClick="_DELETEInterpretacionRadiografica"><i class="icon-remove-sign">&nbsp Eliminar</i></asp:LinkButton>
                                                                <%--   </div>--%>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                </ItemTemplate>
                                            </asp:Repeater>
                                        </tbody>
                                    </table>

                                </div>
                    </ContentTemplate>


                    <%--<Triggers>
                        <asp:AsyncPostBackTrigger ControlID="BtnAddPlanTratamiento" EventName="Click" />
                        <asp:AsyncPostBackTrigger ControlID="btnSaveTratamientos" EventName="Click" /> 
                    </Triggers>--%>
                </asp:UpdatePanel>
            </div>

        </asp:Panel>
        <%-- 25.	Prescripciones --%>
        <asp:Panel runat="server" ID="Panel6">
            <div class="row-fluid">
                <div class="col-sm-12">
                    <div class="box box-color box-bordered">
                        <div class="box-title box-color">
                            <h3><i class="icon-edit"></i>Prescripciones </h3>
                        </div>
                        <div class="box-content nopadding">
                            <div class='form-horizontal form-column form-bordered'>
                                <div class="row">
                                    <div class="col-sm-12">
                                        <div class="control-group">
                                            <div class="col-sm-6">
                                                <%--<script type="text/javascript">
                                                        var options = $("#MainContent_ddlPrescripciones option:selected");
                                                        var values = $.map(options, function (option) {
                                                            return option.text;
                                                        });
                                                </script>--%>
                                                <div class="control-group">
                                                    <label for="lblPrescripciones" class="control-label col-sm-2">
                                                        Prescripciones</label>
                                                    <div class="controls">
                                                        <select id="ddlPrescripciones" runat="server" multiple="true" cssclass="select2-me input-block-level" data-rule-required="true" class="chosen-select form-control">
                                                        </select>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-sm-6">
                                                <%-- 25. Prescripciones OTROS--%>
                                                <div class="control-group">
                                                    <label for="lblPrescripcionesotros" class="control-label col-sm-6">
                                                        Otros:</label>
                                                    <div class="controls">
                                                        <asp:TextBox ID="txtPrescripcionesotros" Text='<%# Eval("ENTREVISTACONOTROS")%>' runat="server" placeholder="Digite Aqui" class="form-control"></asp:TextBox>
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
            </div>
        </asp:Panel>

        <%--28-35 ALERTAS --%>
        <asp:Panel runat="server" ID="PNALERTAS">
            <div class="row-fluid">
                <div class="col-sm-12">
                    <div class="box box-color box-bordered">
                        <div class="box-title box-color">
                            <h3><i class="icon-edit"></i>Alertas</h3>
                        </div>
                        <div class="box-content nopadding">
                            <div class='form-horizontal form-column form-bordered'>
                                <div class="row">
                                    <div class="col-sm-12">
                                        <div class="control-group">
                                            <div class="col-sm-4">
                                                <%--28. Pacientes dado de alta--%>
                                                <div class="control-group">
                                                    <label for="lblPacientesdadodealta" class="control-label col-sm-6">
                                                        Pacientes dado de alta:  
                                                    </label>
                                                    <div class="controls">
                                                        <input type='text' class="input-medium datepick" name="txtPacientesdadodealtaDate" id="txtPacientesdadodealtaDate" runat="server" data-rule-required="true" placeholder="dd/mm/aaaa" />
                                                        <asp:DropDownList ID="ddlalertaPacientesdadodealta" CssClass="input-medium" runat="server">
                                                            <asp:ListItem Value="0">-- Seleccione --</asp:ListItem>
                                                            <asp:ListItem Value="120">4 Meses</asp:ListItem>
                                                            <asp:ListItem Value="180">6 Meses</asp:ListItem>
                                                        </asp:DropDownList>
                                                    </div>
                                                </div>
                                                <%--30. Control de destartrajes supragingival --%>
                                                <div class="control-group">
                                                    <label for="lblDestartrajesSupragingival" class="control-label col-sm-6">
                                                        Destartrajes Supragingival:  
                                                    </label>
                                                    <div class="controls">
                                                        <input type='text' class="input-medium datepick" name="txtDestartrajesSupragingivalDate" id="txtDestartrajesSupragingivalDate" runat="server" data-rule-required="true" placeholder="dd/mm/aaaa" />
                                                        <asp:DropDownList ID="ddlalertaDestartrajesSupragingival" CssClass="input-medium" runat="server">
                                                            <asp:ListItem Value="0">-- Seleccione --</asp:ListItem>
                                                            <asp:ListItem Value="7">Semanal</asp:ListItem>
                                                            <asp:ListItem Value="15">Quincenal</asp:ListItem>
                                                        </asp:DropDownList>
                                                    </div>
                                                </div>
                                                <%--32.	Alertas de Terapia Miofuncional. --%>
                                                <div class="control-group">
                                                    <label for="lblTerapiaMiofuncional" class="control-label col-sm-6">
                                                        Terapia Miofuncional:  
                                                    </label>
                                                    <div class="controls">
                                                        <input type='text' class="input-medium datepick" name="txtTerapiaMiofuncionalDate" id="txtTerapiaMiofuncionalDate" runat="server" data-rule-required="true" placeholder="dd/mm/aaaa" />
                                                        <asp:DropDownList ID="ddlalertaTerapiaMiofuncional" CssClass="input-medium" runat="server">
                                                            <asp:ListItem Value="0">-- Seleccione --</asp:ListItem>
                                                            <asp:ListItem Value="7">Semanal</asp:ListItem>
                                                            <asp:ListItem Value="14">2 Semanas</asp:ListItem>
                                                            <asp:ListItem Value="30">Mensual</asp:ListItem>
                                                        </asp:DropDownList>
                                                    </div>
                                                </div>
                                                <%--34.	Alerta barniz de flúor. --%>
                                                <div class="control-group">
                                                    <label for="lblBarnizFluor" class="control-label col-sm-6">
                                                        BarnizFluor  
                                                    </label>
                                                    <div class="controls">
                                                        <input type='text' class="input-medium datepick" name="txtBarnizFluorDate" id="txtBarnizFluorDate" runat="server" data-rule-required="true" placeholder="dd/mm/aaaa" />
                                                        <asp:DropDownList ID="ddlalertaBarnizFluor" CssClass="input-medium" runat="server">
                                                            <asp:ListItem Value="0">-- Seleccione --</asp:ListItem>
                                                            <asp:ListItem Value="7">Semanal</asp:ListItem>
                                                            <asp:ListItem Value="15">Quincenal</asp:ListItem>
                                                            <asp:ListItem Value="30">Mensual</asp:ListItem>
                                                            <asp:ListItem Value="90">Tres Meses</asp:ListItem>
                                                        </asp:DropDownList>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-sm-4">
                                                <%--29. Control de profilaxis --%>
                                                <div class="control-group">
                                                    <label for="lblControl de Profilaxis " class="control-label col-sm-6">
                                                        Control de profilaxis:  
                                                    </label>
                                                    <div class="controls">
                                                        <input type='text' class="input-medium datepick" name="txtprofilaxisDate" id="txtprofilaxisDate" runat="server" data-rule-required="true" placeholder="dd/mm/aaaa" />
                                                        <asp:DropDownList ID="ddlalertaprofilaxis" CssClass="input-medium" runat="server">
                                                            <asp:ListItem Value="0">-- Seleccione --</asp:ListItem>
                                                            <asp:ListItem Value="60">Cada 2 meses</asp:ListItem>
                                                            <asp:ListItem Value="120">Cada 4 meses</asp:ListItem>
                                                            <asp:ListItem Value="180">Cada 6 meses</asp:ListItem>
                                                        </asp:DropDownList>
                                                    </div>
                                                </div>
                                                <%--31. Alertas de controles mensuales de trauma dental --%>
                                                <div class="control-group">
                                                    <label for="lbltraumadental" class="control-label col-sm-6">
                                                        Trauma Dental:  
                                                    </label>
                                                    <div class="controls">
                                                        <input type='text' class="input-medium datepick" name="txttraumadentalDate" id="txttraumadentalDate" runat="server" data-rule-required="true" placeholder="dd/mm/aaaa" />
                                                        <asp:DropDownList ID="ddlalertatraumadental" CssClass="input-medium" runat="server">
                                                            <asp:ListItem Value="0">-- Seleccione --</asp:ListItem>
                                                            <asp:ListItem Value="30">Mensual</asp:ListItem>
                                                        </asp:DropDownList>
                                                    </div>
                                                </div>
                                                <%--33.	Objetivos para lograr en terapia Miofuncional Myobrace--%>
                                                <div class="control-group">
                                                    <label for="lblImpresiondiagnostica" class="control-label col-sm-2">
                                                        Objectivos Terapia Miofuncional Myobrace</label>
                                                    <div class="controls">
                                                        <div class="checkbox checkbox-primary col-lg-12">
                                                            <asp:CheckBoxList ID="ckObjectivosMiofuncionalMyobrace" RepeatColumns="1" RepeatDirection="Horizontal" TextAlign="Right" runat="server">
                                                            </asp:CheckBoxList>
                                                        </div>
                                                    </div>
                                                </div>
                                                <%--34.	35.	Alerta de control aparatos ortodoncia interceptiva convencionales. --%>
                                                <div class="control-group">
                                                    <label for="lblAparatosOrtondonciaInterceptivaConvencionales" class="control-label col-sm-6">
                                                        Ortodoncia Interceptiva Convencionales   
                                                    </label>
                                                    <div class="controls">
                                                        <input type='text' class="input-medium datepick" name="txtAparatosOrtondonciaInterceptivaConvencionalesDate" id="txtAparatosOrtondonciaInterceptivaConvencionalesDate" runat="server" data-rule-required="true" placeholder="dd/mm/aaaa" />
                                                        <asp:DropDownList ID="ddlAparatosOrtondonciaInterceptivaConvencionales" CssClass="input-medium" runat="server">
                                                            <asp:ListItem Value="0">-- Seleccione --</asp:ListItem>
                                                            <asp:ListItem Value="7">Semanal</asp:ListItem>
                                                            <asp:ListItem Value="15">Quincenal</asp:ListItem>
                                                            <asp:ListItem Value="30">Mensual</asp:ListItem>
                                                            <asp:ListItem Value="60">Cada 2 Meses</asp:ListItem>
                                                            <asp:ListItem Value="90">Cada 3 Meses</asp:ListItem>
                                                            <asp:ListItem Value="-1">Retiro de Aparato</asp:ListItem>
                                                        </asp:DropDownList>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-sm-4">
                                                <table class="table table-bordered">
                                                    <thead>
                                                        <tr>
                                                            <th>Tipo Alerta  
                                                            </th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <asp:Repeater ID="RPALERTAS" runat="server">
                                                            <ItemTemplate>
                                                                <tr>
                                                                    <td style="color: Red">
                                                                        <%# Eval("DescripcionAlerta")%>  
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
                    </div>

                </div>
            </div>
        </asp:Panel>
        <%--36.	Referimiento y  37.	Interconsulta multidisciplinaria --%>
        <asp:Panel runat="server" ID="Panel7">
            <div class="row-fluid">
                <div class="col-sm-12">
                    <div class="box box-color box-bordered">
                        <div class="box-title box-color">
                            <h3><i class="icon-edit"></i>Referimiento e Interconsulta Multidisciplinaria</h3>
                        </div>
                        <div class="box-content nopadding">
                            <div class='form-horizontal form-column form-bordered'>
                                <div class="row">
                                    <div class="col-sm-12">
                                        <div class="control-group">
                                            <div class="col-sm-6">
                                                <%--36.	Referimiento--%>
                                                <div class="control-group">
                                                    <label for="lblreferimiento" class="control-label col-sm-6">
                                                        Refererimiento:  
                                                    </label>
                                                    <div class="controls">
                                                        <asp:DropDownList ID="ddlreferimiento" CssClass="input-xlarge" runat="server">
                                                            <asp:ListItem Value="0">-- Seleccione --</asp:ListItem>
                                                            <asp:ListItem Value="Interdisciplinario">Interdisciplinario</asp:ListItem>
                                                            <asp:ListItem Value="Multidisciplinario">Multidisciplinario</asp:ListItem>
                                                        </asp:DropDownList>
                                                    </div>
                                                </div>
                                                <div class="control-group">
                                                    <label for="lblreferimientootros" class="control-label col-sm-6">
                                                        Otros:</label>
                                                    <div class="controls">
                                                        <asp:TextBox ID="txtreferimientootros" Text='<%# Eval("ENTREVISTACONOTROS")%>' runat="server" placeholder="Digite Aqui" class="form-control"></asp:TextBox>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-sm-6">
                                                <%--36.	37.	Interconsulta multidisciplinaria--%>

                                                <div class="control-group">
                                                    <label for="lblInterconsultaMultidisciplinaria" class="control-label col-sm-6">
                                                        Interconsulta Multidisciplinaria</label>
                                                    <div class="controls">
                                                        <textarea runat="server" name="txtInterconsultaMultidisciplinaria" id="txtInterconsultaMultidisciplinaria" text='<%# Eval("ENTREVISTACONOTROS")%>' rows="4" class="input-block-level" data-rule-required="true" placeholder="Digite Aqui"></textarea>
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
            </div>
        </asp:Panel>
        <%--<script>
            function toBase64() {
                str = document.getElementById("MainContent_pnodontograma").innerHTML;
                return window.btoa(unescape(encodeURIComponent(str)));
            }
        </script>
        <script>
            function triggerDownload(NombreArchivo) {
                var html = 'data:text/attachment;base64,' + toBase64();//toBase64(document.querySelector('html').innerHTML);
                var evt = new MouseEvent('click', {
                    view: window,
                    bubbles: false,
                    cancelable: false
                });
                var a = document.createElement('a');
                // a.setAttribute('download', 'file.html');
                a.setAttribute('data', 'http://caidsiges01:8000/records/');
                a.setAttribute('download', NombreArchivo + '.html');
                a.setAttribute('href', html);
                //a.location = "http://localhost:8082/records/";
                //a.setAttribute('href.location', "http://localhost:8082/records/");
                //a.href.location = "~/records/";
                //a.setAttribute('href', "http://caidsiges01:8000/records/");
                //a.setAttribute('target', '~/records/'); 
                //alert(a.href.location);
                a.dispatchEvent(evt);
                //alert(window.location.pathname);
                //window.location.reload(false);
            }

            //document.querySelector('span').addEventListener('click', function () {
            //triggerDownload();
            //});
        </script>--%>

        <%--         <script type="text/javascript">
                    function urlOdontograma1() {
                        txturlodontograma2.value = document.getElementById("MainContent_pnodontograma").innerHTML;
                        alert("hola");
            }
         </script>--%>
    </div>


</asp:Content>
