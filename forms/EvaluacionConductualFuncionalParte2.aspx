<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EvaluacionConductualFuncionalParte2.aspx.cs"
    Inherits="CAID_V2.forms.EvaluacionConductualFuncionalParte2" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Actividades por Pacientes</title>
    <link href="../css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="../css/plugins/colorbox/colorbox.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="../css/style.css" />
    <link rel="stylesheet" href="css/bootstrap.min.css" />
    <!-- Bootstrap responsive -->
    <link rel="stylesheet" href="../css/bootstrap-responsive.min.css" />
    <!-- jQuery UI -->
    <link rel="stylesheet" href="../css/plugins/jquery-ui/smoothness/jquery-ui.css" />
    <link rel="stylesheet" href="../css/plugins/jquery-ui/smoothness/jquery.ui.theme.css" />
    <!-- dataTables -->
    <link rel="stylesheet" href="../css/plugins/datatable/TableTools.css" />
    <!-- PageGuide -->
    <link rel="stylesheet" href="../css/plugins/pageguide/pageguide.css" />
    <!-- Fullcalendar -->
    <link rel="stylesheet" href="../css/plugins/fullcalendar/fullcalendar.css" />
    <link rel="stylesheet" href="../css/plugins/fullcalendar/fullcalendar.print.css"
        media="print" />
    <!-- Tagsinput -->
    <link rel="stylesheet" href="../css/plugins/tagsinput/jquery.tagsinput.css" />
    <!-- chosen -->
    <link rel="stylesheet" href="../css/plugins/chosen/chosen.css" />
    <!-- multi select -->
    <link rel="stylesheet" href="../css/plugins/multiselect/multi-select.css" />
    <!-- timepicker -->
    <link rel="stylesheet" href="../css/plugins/timepicker/bootstrap-timepicker.min.css" />
    <!-- colorpicker -->
    <link rel="stylesheet" href="../css/plugins/colorpicker/colorpicker.css" />
    <!-- Datepicker -->
    <link rel="stylesheet" href="../css/plugins/datepicker/datepicker.css" />
    <!-- Daterangepicker -->
    <link rel="stylesheet" href="../css/plugins/daterangepicker/daterangepicker.css" />
    <!-- Plupload -->
    <link rel="stylesheet" href="../css/plugins/plupload/jquery.plupload.queue.css" />
    <!-- select2 -->
    <link rel="stylesheet" href="../css/plugins/select2/select2.css" />
    <!-- icheck -->
    <link rel="stylesheet" href="../css/plugins/icheck/all.css" />
    <!-- Theme CSS -->
    <link rel="stylesheet" href="../css/style.css" />
    <!-- Color CSS -->
    <link rel="stylesheet" href="../css/themes.css" />
    <!-- Morris chart -->
    <link rel="stylesheet" type="../text/css/morris/morris.css" />
    <script src="../js/bootstrap.min.js" type="text/javascript"></script>
    <script src="../js/bootstrap.js" type="text/javascript"></script>

    <!-- jQuery -->
    <script src="../js/jquery.min.js" type="text/javascript"></script>
    <!-- Nice Scroll -->
    <script src="../js/plugins/nicescroll/jquery.nicescroll.min.js" type="text/javascript"></script>
    <!-- jQuery -->
    <script src="../js/jquery.min.js" type="text/javascript"></script>
    <!-- Nice Scroll -->
    <script src="../js/plugins/nicescroll/jquery.nicescroll.min.js" type="text/javascript"></script>
    <!-- jQuery UI -->
    <script src="../js/plugins/jquery-ui/jquery.ui.core.min.js" type="text/javascript"></script>
    <script src="../js/plugins/jquery-ui/jquery.ui.widget.min.js" type="text/javascript"></script>
    <script src="../js/plugins/jquery-ui/jquery.ui.mouse.min.js" type="text/javascript"></script>
    <script src="../js/plugins/jquery-ui/jquery.ui.draggable.min.js" type="text/javascript"></script>
    <script src="../js/plugins/jquery-ui/jquery.ui.resizable.min.js" type="text/javascript"></script>
    <script src="../js/plugins/jquery-ui/jquery.ui.spinner.js" type="text/javascript"></script>
    <script src="../js/plugins/jquery-ui/jquery.ui.sortable.min.js" type="text/javascript"></script>
    <script src="../js/plugins/jquery-ui/jquery.ui.slider.js" type="text/javascript"></script>
    <!-- Touch enable for jquery UI -->
    <script src="../js/plugins/touch-punch/jquery.touch-punch.min.js" type="text/javascript"></script>
    <!-- slimScroll -->
    <script src="../js/plugins/slimscroll/jquery.slimscroll.min.js" type="text/javascript"></script>
    <!-- Bootstrap -->
    <script src="../js/bootstrap.min.js" type="text/javascript"></script>
    <!-- vmap -->
    <script src="../js/plugins/vmap/jquery.vmap.min.js" type="text/javascript"></script>
    <script src="../js/plugins/vmap/jquery.vmap.world.js" type="text/javascript"></script>
    <script src="../js/plugins/vmap/jquery.vmap.sampledata.js" type="text/javascript"></script>
    <!-- Bootbox -->
    <script src="../js/plugins/bootbox/jquery.bootbox.js" type="text/javascript"></script>
    <!-- Flot -->
    <script src="../js/plugins/flot/jquery.flot.min.js" type="text/javascript"></script>
    <script src="../js/plugins/flot/jquery.flot.bar.order.min.js" type="text/javascript"></script>
    <script src="../js/plugins/flot/jquery.flot.pie.min.js" type="text/javascript"></script>
    <script src="../js/plugins/flot/jquery.flot.resize.min.js" type="text/javascript"></script>
    <script src="../js/plugins/flot/jquery.flot.stack.js" type="text/javascript"></script>
    <script src="../js/plugins/flot/jquery.flot.JUMlib.js" type="text/javascript"></script>
    <script src="../js/plugins/flot/jquery.flot.spider.js" type="text/javascript"></script>
    <!-- imagesLoaded -->
    <script src="../js/plugins/imagesLoaded/jquery.imagesloaded.min.js" type="text/javascript"></script>
    <!-- PageGuide -->
    <script src="../js/plugins/pageguide/jquery.pageguide.js" type="text/javascript"></script>
    <!-- FullCalendar -->
    <script src="../js/plugins/fullcalendar/fullcalendar.min.js" type="text/javascript"></script>
    <!-- Chosen -->
    <script src="../js/plugins/chosen/chosen.jquery.min.js" type="text/javascript"></script>
    <!-- PLUpload -->
    <script src="../js/plugins/plupload/plupload.full.js" type="text/javascript"></script>
    <script src="js/plugins/plupload/jquery.plupload.queue.js" type="text/javascript"></script>
    <!-- Custom file upload -->
    <script src="../js/plugins/fileupload/bootstrap-fileupload.min.js" type="text/javascript"></script>
    <script src="../js/plugins/mockjax/jquery.mockjax.js" type="text/javascript"></script>
    <!-- select2 -->
    <script src="../js/plugins/select2/select2.min.js" type="text/javascript"></script>
    <!-- icheck -->
    <script src="../js/plugins/icheck/jquery.icheck.min.js" type="text/javascript"></script>
    <!-- dataTables -->
    <script src="../js/plugins/datatable/jquery.dataTables.min.js" type="text/javascript"></script>
    <script src="../js/plugins/datatable/TableTools.min.js" type="text/javascript"></script>
    <script src="../js/plugins/datatable/ColReorderWithResize.js" type="text/javascript"></script>
    <script src="../js/plugins/datatable/ColVis.min.js" type="text/javascript"></script>
    <script src="../js/plugins/datatable/jquery.dataTables.columnFilter.js" type="text/javascript"></script>
    <script src="../js/plugins/datatable/jquery.dataTables.grouping.js" type="text/javascript"></script>
    <!-- Masked inputs -->
    <script src="../js/plugins/maskedinput/jquery.maskedinput.min.js" type="text/javascript"></script>
    <!-- TagsInput -->
    <script src="../js/plugins/tagsinput/jquery.tagsinput.min.js" type="text/javascript"></script>
    <!-- Datepicker -->
    <script src="../js/plugins/datepicker/bootstrap-datepicker.js" type="text/javascript"></script>
    <!-- Daterangepicker -->
    <script src="../js/plugins/daterangepicker/daterangepicker.js" type="text/javascript"></script>
    <script src="../js/plugins/daterangepicker/moment.min.js" type="text/javascript"></script>
    <!-- Timepicker -->
    <script src="../js/plugins/timepicker/bootstrap-timepicker.min.js" type="text/javascript"></script>
    <!-- Colorpicker -->
    <script src="../js/plugins/colorpicker/bootstrap-colorpicker.js" type="text/javascript"></script>
    <!-- Chosen -->
    <script src="../js/plugins/chosen/chosen.jquery.min.js" type="text/javascript"></script>
    <!-- MultiSelect -->
    <script src="../js/plugins/multiselect/jquery.multi-select.js" type="text/javascript"></script>
    <!-- CKEditor -->
    <script src="../js/plugins/ckeditor/ckeditor.js" type="text/javascript"></script>
    <!-- PLUpload -->
    <script src="../js/plugins/plupload/plupload.full.js" type="text/javascript"></script>
    <script src="../js/plugins/plupload/jquery.plupload.queue.js" type="text/javascript"></script>
    <!-- Custom file upload -->
    <script src="../js/plugins/fileupload/bootstrap-fileupload.min.js" type="text/javascript"></script>
    <script src="../js/plugins/mockjax/jquery.mockjax.js" type="text/javascript"></script>
    <!-- select2 -->
    <script src="../js/plugins/select2/select2.min.js" type="text/javascript"></script>
    <!-- icheck -->
    <script src="../js/plugins/icheck/jquery.icheck.min.js" type="text/javascript"></script>
    <!-- complexify -->
    <script src="../js/plugins/complexify/jquery.complexify-banlist.min.js" type="text/javascript"></script>
    <script src="../js/plugins/complexify/jquery.complexify.min.js" type="text/javascript"></script>
    <!-- Mockjax -->
    <script src="../js/plugins/mockjax/jquery.mockjax.js" type="text/javascript"></script>
    <!-- Validation -->
    <script src="../js/plugins/validation/jquery.validate.min.js" type="text/javascript"></script>
    <script src="../js/plugins/validation/additional-methods.min.js" type="text/javascript"></script>
    <!-- Form -->
    <script src="../js/plugins/form/jquery.form.min.js" type="text/javascript"></script>
    <!-- Wizard -->
    <%--<script src="../js/plugins/wizard/jquery.form.wizard.min.js" type="text/javascript"
        type="text/javascript"></script>--%>
    <script src="../js/plugins/mockjax/jquery.mockjax.js" type="text/javascript"></script>
    <!-- Validation -->
    <script src="../js/plugins/validation/jquery.validate.min.js" type="text/javascript"></script>
    <script src="../js/plugins/validation/additional-methods.min.js" type="text/javascript"></script>
    <!-- Morris.js charts -->
    <script src="../js/plugins/raphael/raphael-min.js" type="text/javascript"></script>
    <script src="../js/plugins/morris/morris.min.js" type="text/javascript"></script>
    <!-- Theme framework -->
    <script src="../js/eakroko.min.js" type="text/javascript"></script>
    <!-- Theme scripts -->
    <script src="../js/application.min.js" type="text/javascript"></script>
    <!-- Just for demonstration -->
    <%--<script src="js/demonstration.min.js"></script>--%>
    <script src="../js/cycle.js" type="text/javascript"></script>
    <script src="../js/json_parse.js" type="text/javascript"></script>
    <script src="../js/json_parse_state.js" type="text/javascript"></script>
    <script src="../js/json2.js" type="text/javascript"></script>
    <script src="../js/notify.js" type="text/javascript"></script>
    <script src="../js/notify.min.js" type="text/javascript"></script>
    <%--Toast Message--%>
    <%--// <![CDATA[

        function btnSave_onclick() {

        }

// ]]>--%>
    <%--  </script>--%>
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
        <script type="text/javascript">
            function notify(MSG, tipo) {
                $.notify(MSG, tipo);
            }
        </script>
        <div class="box box-bordered">
            <div class="box-title">
                <h3>
                    <i class="icon-edit"></i>Evaluación de Conducta Funcional PARTE 2
                </h3>
                <div class="actions">
                    <%----%>
                    <button type="button" id="tbnAdd" runat="server" validationgroup="pnlEdit"
                        class="btn" data-dismiss="modal" onserverclick="_Save">
                        <i class="icon-plus-sign"></i>&nbsp Guardar Parte 2</button>
                </div>
            </div>
        </div>
        <div class="table-responsive">
            <table class="table">
                <%--<thead>
                    <tr>
                        <th>CAMPO</th>
                        <th>DESCRIPCION</th>
                    </tr>
                </thead>--%>
                <tbody>
                    <tr>
                        <%-- ckReglamentoafectiva --%>
                        <td>
                            <asp:CheckBoxList ID="ckReglamentoafectiva" CellPadding="0" Font-Size="X-Small" CellSpacing="0"
                                RepeatColumns="1" RepeatDirection="Horizontal" runat="server">
                            </asp:CheckBoxList>
                        </td>
                        <td>
                            <label for="lblreglamento" class="control-label" style="color: black">Reglamento afectiva / reactividad emocional (Identificar los factores emocionales, ansiedad, depresión, ira, falta de autoestima, que juegan un rol importante en la organización o dirección de los problemas de conducta):</label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <%-- ckDistorsioncognitiva --%>
                            <asp:CheckBoxList ID="ckDistorsioncognitiva" CellPadding="0" Font-Size="X-Small" CellSpacing="0"
                                RepeatColumns="5" RepeatDirection="Horizontal" TextAlign="Right" runat="server">
                            </asp:CheckBoxList>
                        </td>
                        <td>
                            <label for="lbl2" class="control-label" style="color: black">Distorsión cognitiva (Identificar pensamientos distorsionados; atribuciones inexactas, que juegan un rol importante en la organización o dirección de los problemas de conducta):</label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <%-- ckRefuerzo --%>
                            <asp:CheckBoxList ID="ckRefuerzo" CellPadding="0" Font-Size="X-Small" CellSpacing="0"
                                RepeatColumns="5" RepeatDirection="Horizontal" TextAlign="Right" runat="server">
                            </asp:CheckBoxList>
                        </td>
                        <td>
                            <label for="lbl3" class="control-label" style="color: black">Refuerzo (Identificar los desencadenantes ambientales y  compensaciones que juegan un rol importante en la organización y dirección de los problemas de conducta):</label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <%-- ckModelado --%>
                            <asp:CheckBoxList ID="ckModelado" CellPadding="0" Font-Size="X-Small" CellSpacing="0"
                                RepeatColumns="1" RepeatDirection="Horizontal" TextAlign="Right" runat="server">
                            </asp:CheckBoxList>
                        </td>
                        <td>
                            <label for="lbl4" class="control-label" style="color: black">Modelado (Identificar el grado en el que se copia la conducta, que (conducta) están copiando y por qué están copiando la conducta):</label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <%-- ckProblemasfamiliares --%>
                            <asp:CheckBoxList ID="ckProblemasfamiliares" CellPadding="0" Font-Size="X-Small" CellSpacing="0"
                                RepeatColumns="5" RepeatDirection="Horizontal" TextAlign="Right" runat="server">
                            </asp:CheckBoxList>
                        </td>
                        <td>
                            <label for="lbl5" class="control-label" style="color: black">Problemas familiares (Identificar cuestiones familiares que juegan un rol importante en la organización y dirección de los problemas de conducta):</label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <%-- ckFisiologica --%>
                            <asp:CheckBoxList ID="ckFisiologica" CellPadding="0" Font-Size="X-Small" CellSpacing="0"
                                RepeatColumns="5" RepeatDirection="Horizontal" TextAlign="Right" runat="server">
                            </asp:CheckBoxList>
                        </td>
                        <td>
                            <label for="lbl6" class="control-label" style="color: black">Fisiológica (Identificar las características fisiológicas y / o de la personalidad, trastornos del desarrollo, el temperamento, que juegan un rol importante en la organización y dirección de los problemas de conducta):</label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <%-- ckComunicarnecesidad --%>
                            <asp:CheckBoxList ID="ckComunicarnecesidad" CellPadding="0" Font-Size="X-Small" CellSpacing="0"
                                RepeatColumns="5" RepeatDirection="Horizontal" TextAlign="Right" runat="server">
                            </asp:CheckBoxList>
                        </td>
                        <td>
                            <label for="lbl7" class="control-label" style="color: black">Comunicar necesidad (Identificar lo que el niño (a ) está tratando de decir a través de la los problemas de conducta):</label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <%-- ckPlanterapeutico --%>
                            <asp:CheckBoxList ID="ckPlanterapeutico" CellPadding="0" Font-Size="X-Small" CellSpacing="0"
                                RepeatColumns="5" RepeatDirection="Horizontal" TextAlign="Right" runat="server">
                            </asp:CheckBoxList>
                        </td>
                        <td>
                            <label for="lbl8" class="control-label" style="color: black">Plan terapéutico (Identificar como el plan terapéutico, las sesiones terapéuticas 1:1 o sesión grupal, juegan una rol importante en la organización y dirección de los problemas de conducta). </label>
                        </td>
                    </tr>
                </tbody>
            </table>

        </div>
        <div class="control-group">
            <div class="box-content nopadding">
                <table class="table table-bordered dataTable dataTable-tools">
                    <thead>
                        <tr>
                            <th>Fecha</th> 
                            <th>Fuentes</th>
                            <th>Conducta</th>
                            <th>Entorno</th>
                            <th>Frecuencia</th>
                            <th>Intensidad</th>
                            <th>Duración</th>
                            <th>Antecedentes</th>
                            <th>Descripción</th>
                        </tr>
                    </thead>
                    <tbody>
                        <asp:Repeater ID="rpHistorico" runat="server">
                            <ItemTemplate>
                                <tr>
                                    <td>
                                        <%# Eval("FECHA")%>
                                    </td>
                                    <td>
                                        <%# Eval("Fuentes")%>
                                    </td>
                                     <td>
                                        <%# Eval("DCONDUCTA")%>
                                    </td>
                                    <td>
                                        <%# Eval("ENTORNO")%>
                                    </td>
                                    <td>
                                        <%# Eval("FRECUENCIA")%>
                                    </td>
                                    <td>
                                        <%# Eval("INTENSIDAD")%>
                                    </td>
                                    <td>
                                        <%# Eval("DURACION")%>
                                    </td>
                                    <td>
                                        <%# Eval("ANTECEDENTES")%>
                                    </td>  
                                    <td>
                                        <strong>
                                            <%# Eval("ESCALA")%>
                                        </strong>
                                        <br />
                                        <%# Eval("DATOS")%>
                                    </td>                                    
                                </tr>
                            </ItemTemplate>
                        </asp:Repeater>
                    </tbody>
                </table>
            </div>
        </div>
    </form>
</body>
</html>
