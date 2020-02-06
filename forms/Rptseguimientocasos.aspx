<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RPTSEGUIMIENTOCASOS.aspx.cs" Inherits="CAID_V2.forms.RPTSEGUIMIENTOCASOS" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Reporte de Seguimiento de Casos</title>
    <link href="../css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <link href="../css/plugins/colorbox/colorbox.css" rel="stylesheet" type="text/css" />
        <link rel="stylesheet" href="../css/style.css">
            <script src="../js/bootstrap.min.js" type="text/javascript"></script>
    <script src="../js/bootstrap.js" type="text/javascript"></script>
    <link rel="stylesheet" href="css/bootstrap.min.css"> 
    <!-- Bootstrap responsive -->
    <link rel="stylesheet" href="../css/bootstrap-responsive.min.css"> 
    <!-- jQuery UI -->
    <link rel="stylesheet" href="../css/plugins/jquery-ui/smoothness/jquery-ui.css">
    <link rel="stylesheet" href="../css/plugins/jquery-ui/smoothness/jquery.ui.theme.css">
    <!-- dataTables -->
    <link rel="stylesheet" href="../css/plugins/datatable/TableTools.css">
    <!-- PageGuide -->
    <link rel="stylesheet" href="../css/plugins/pageguide/pageguide.css">
    <!-- Fullcalendar -->
    <link rel="stylesheet" href="../css/plugins/fullcalendar/fullcalendar.css">
    <link rel="stylesheet" href="../css/plugins/fullcalendar/fullcalendar.print.css" media="print">
    <!-- Tagsinput -->
    <link rel="stylesheet" href="../css/plugins/tagsinput/jquery.tagsinput.css">
    <!-- chosen -->
    <link rel="stylesheet" href="../css/plugins/chosen/chosen.css">
    <!-- multi select -->
    <link rel="stylesheet" href="../css/plugins/multiselect/multi-select.css">
    <!-- timepicker -->
    <link rel="stylesheet" href="../css/plugins/timepicker/bootstrap-timepicker.min.css">
    <!-- colorpicker -->
    <link rel="stylesheet" href="../css/plugins/colorpicker/colorpicker.css">
    <!-- Datepicker -->
    <link rel="stylesheet" href="../css/plugins/datepicker/datepicker.css">
    <!-- Daterangepicker -->
    <link rel="stylesheet" href="../css/plugins/daterangepicker/daterangepicker.css">
    <!-- Plupload -->
    <link rel="stylesheet" href="../css/plugins/plupload/jquery.plupload.queue.css">
    <!-- select2 -->
    <link rel="stylesheet" href="../css/plugins/select2/select2.css">
    <!-- icheck -->
    <link rel="stylesheet" href="../css/plugins/icheck/all.css">
    <!-- Theme CSS -->
    <link rel="stylesheet" href="../css/style.css">
    <!-- Color CSS -->
    <link rel="stylesheet" href="../css/themes.css">
    <!-- Morris chart -->
    <link rel="stylesheet" type="../text/css/morris/morris.css" />
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
    <script src="../js/plugins/validation/additional-methods.min.js"type="text/javascript"></script>
    <!-- Form -->
    <script src="../js/plugins/form/jquery.form.min.js" type="text/javascript"></script>
    <!-- Wizard -->
    <script src="../js/plugins/wizard/jquery.form.wizard.min.js" type="text/javascript" ></script>
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
    <%--Toast Message--%>

<%--// <![CDATA[

        function btnSave_onclick() {

        }

// ]]>--%>
  <%--  </script>--%>
</head>
<body>
    <form id="form1" runat="server">
    <div class="box box-bordered">
        <div class="box-title">
            <h3>
                <i class="icon-edit"></i>Reporte de Seguimiento de Casos</h3>
        </div>
        <div class="box-content nopadding">
            <div class='form-horizontal form-bordered'>
                <!-- Paciente -->   
                <div class="control-group">
                    <label for="CmbPaciente12" class="control-label" style="color: Red">
                        Paciente</label>
                    <div class="controls">
                        <asp:DropDownList ID="DPPaciente" runat="server" CssClass="select2-me input-block-level"
                            data-rule-required="true">
                        </asp:DropDownList> 
                    </div>
                </div>
                   <!-- Agente Social -->   
                <div class="control-group">
                    <label for="Cmbagentesocial" class="control-label" style="color: Red">
                        Agente Social</label>
                    <div class="controls">
                        <asp:DropDownList ID="dpagentesocial" runat="server" CssClass="select2-me input-block-level"
                            data-rule-required="true">
                        </asp:DropDownList> 
                    </div>
                </div>
                <!-- Fecha: Desde -->
                <div class="control-group">
                    <label for="txtDesde" class="control-label" style="color: Red">
                        Desde</label>
                    <div class="controls">
                        <input runat="server" name="txtDesde" id="txtDesde" type="text" class="input-medium datepick"
                            data-rule-required="false" placeholder="mm/dd/aaaa">
                            <script type="text/javascript">
                                $(function () {
                                    // ctl00_MainContent_txthorallegada
                                    $('#txtDesde').datepicker({
                                        toggleActive: false,
                                        format: "dd/mm/yyyy",
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

                          <asp:RequiredFieldValidator ControlToValidate="txtDesde" Display="Dynamic" ErrorMessage="Requerido!"
                            ID="txtDesde1" runat="server" SetFocusOnError="True" ValidationGroup="pnlData" /> 
                    </div>
                </div>
                <!-- Fecha: Hasta -->
                <div class="control-group">
                    <label for="txtHasta" class="control-label" style="color: Red">
                        Hasta</label>
                    <div class="controls">
                        <input runat="server" name="txtHasta" id="txtHasta" type="text" class="input-medium datepick"
                            data-rule-required="false" placeholder="mm/dd/aaaa">
                             <script type="text/javascript">
                                 $(function () {
                                     // ctl00_MainContent_txthorallegada
                                     $('#txtHasta').datepicker({
                                         toggleActive: false,
                                         format: "dd/mm/yyyy",
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
                                 function btnPrint_onclick() {

                                 }

                             </script>
                        <%--<asp:RequiredFieldValidator ControlToValidate="txtHasta" Display="Dynamic" ErrorMessage="Requerido!"
                            ID="txtHasta1" runat="server" SetFocusOnError="True" ValidationGroup="pnlData" />--%>
                    </div>
                </div>

                <div class="form-actions">
                 <%--onclick="return btnPrint_onclick()"--%>
                    <button type="submit" id="btnPrint" runat="server" class="btn btn-blue" onserverclick="_Show">
                        <i class="icon-ok"></i>&nbsp Aceptar</button>
                    <a href='javascript:history.go(-1)' class="btn"><i class="icon-arrow-left"></i>&nbsp
                        Cancelar</a>
                </div>
            </div>
        </div>
    </div>
    </form>
</body>
</html>
