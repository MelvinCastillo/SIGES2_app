<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="chossen2.aspx.cs" Inherits="CAID_V2.forms.chossen2" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Servicio Social- Seguimiento de Casos</title>
    <link href="../css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <%--<link href="../css/plugins/colorbox/colorbox.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="../css/style.css">
    <script src="../js/bootstrap.min.js" type="text/javascript"></script>
    <script src="../js/bootstrap.js" type="text/javascript"></script>--%>
  <%--  <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="../css/bootstrap-responsive.min.css">
    <link rel="stylesheet" href="../css/plugins/jquery-ui/smoothness/jquery-ui.css">
    <link rel="stylesheet" href="../css/plugins/jquery-ui/smoothness/jquery.ui.theme.css">
    <link rel="stylesheet" href="../css/plugins/datatable/TableTools.css">
    <link rel="stylesheet" href="../css/plugins/pageguide/pageguide.css">
    <link rel="stylesheet" href="../css/plugins/fullcalendar/fullcalendar.css">
    <link rel="stylesheet" href="../css/plugins/fullcalendar/fullcalendar.print.css"
        media="print">
    <link rel="stylesheet" href="../css/plugins/tagsinput/jquery.tagsinput.css">
    <link rel="stylesheet" href="../css/plugins/chosen/chosen.css">
    <link rel="stylesheet" href="../css/plugins/multiselect/multi-select.css">
    <link rel="stylesheet" href="../css/plugins/timepicker/bootstrap-timepicker.min.css">
    <link rel="stylesheet" href="../css/plugins/colorpicker/colorpicker.css">
    <link rel="stylesheet" href="../css/plugins/datepicker/datepicker.css">
    <link rel="stylesheet" href="../css/plugins/daterangepicker/daterangepicker.css">
    <link rel="stylesheet" href="../css/plugins/plupload/jquery.plupload.queue.css">--%>
    
    <link rel="stylesheet" href="../css/plugins/select2/select2.css">
    <%--<link rel="stylesheet" href="../css/plugins/icheck/all.css">
   <link rel="stylesheet" href="../css/style.css"> 
     <link rel="stylesheet" href="../css/themes.css"> 
    <link rel="stylesheet" type="../text/css/morris/morris.css" /> --%>

    <script src="../js/jquery.min.js" type="text/javascript"></script> 
    <%--<script src="../js/plugins/nicescroll/jquery.nicescroll.min.js" type="text/javascript"></script> --%>
   <%-- <script src="../js/jquery.min.js" type="text/javascript"></script> 
    <script src="../js/plugins/nicescroll/jquery.nicescroll.min.js" type="text/javascript"></script> 
    <script src="../js/plugins/jquery-ui/jquery.ui.core.min.js" type="text/javascript"></script>
    <script src="../js/plugins/jquery-ui/jquery.ui.widget.min.js" type="text/javascript"></script>
    <script src="../js/plugins/jquery-ui/jquery.ui.mouse.min.js" type="text/javascript"></script>
    <script src="../js/plugins/jquery-ui/jquery.ui.draggable.min.js" type="text/javascript"></script>
    <script src="../js/plugins/jquery-ui/jquery.ui.resizable.min.js" type="text/javascript"></script>
    <script src="../js/plugins/jquery-ui/jquery.ui.spinner.js" type="text/javascript"></script>
    <script src="../js/plugins/jquery-ui/jquery.ui.sortable.min.js" type="text/javascript"></script>
    <script src="../js/plugins/jquery-ui/jquery.ui.slider.js" type="text/javascript"></script> 
    <script src="../js/plugins/touch-punch/jquery.touch-punch.min.js" type="text/javascript"></script> 
    <script src="../js/plugins/slimscroll/jquery.slimscroll.min.js" type="text/javascript"></script> --%>
    <script src="../js/bootstrap.min.js" type="text/javascript"></script> 
    <%--<script src="../js/plugins/vmap/jquery.vmap.min.js" type="text/javascript"></script>
    <script src="../js/plugins/vmap/jquery.vmap.world.js" type="text/javascript"></script>
    <script src="../js/plugins/vmap/jquery.vmap.sampledata.js" type="text/javascript"></script> 
    <script src="../js/plugins/bootbox/jquery.bootbox.js" type="text/javascript"></script> 
    <script src="../js/plugins/flot/jquery.flot.min.js" type="text/javascript"></script>
    <script src="../js/plugins/flot/jquery.flot.bar.order.min.js" type="text/javascript"></script>
    <script src="../js/plugins/flot/jquery.flot.pie.min.js" type="text/javascript"></script>
    <script src="../js/plugins/flot/jquery.flot.resize.min.js" type="text/javascript"></script>
    <script src="../js/plugins/flot/jquery.flot.stack.js" type="text/javascript"></script>
    <script src="../js/plugins/flot/jquery.flot.JUMlib.js" type="text/javascript"></script>
    <script src="../js/plugins/flot/jquery.flot.spider.js" type="text/javascript"></script> 
    <script src="../js/plugins/imagesLoaded/jquery.imagesloaded.min.js" type="text/javascript"></script> 
    <script src="../js/plugins/pageguide/jquery.pageguide.js" type="text/javascript"></script> 
    <script src="../js/plugins/fullcalendar/fullcalendar.min.js" type="text/javascript"></script> --%>

    <%--<script src="../js/plugins/chosen/chosen.jquery.min.js" type="text/javascript"></script> 
    <script src="../js/plugins/plupload/plupload.full.js" type="text/javascript"></script>
    <script src="js/plugins/plupload/jquery.plupload.queue.js" type="text/javascript"></script> 
    <script src="../js/plugins/fileupload/bootstrap-fileupload.min.js" type="text/javascript"></script>
    <script src="../js/plugins/mockjax/jquery.mockjax.js" type="text/javascript"></script> --%>

    <script src="../js/plugins/select2/select2.min.js" type="text/javascript"></script> 
    <%--<script src="../js/plugins/icheck/jquery.icheck.min.js" type="text/javascript"></script> 
    <script src="../js/plugins/datatable/jquery.dataTables.min.js" type="text/javascript"></script>
    <script src="../js/plugins/datatable/TableTools.min.js" type="text/javascript"></script>
    <script src="../js/plugins/datatable/ColReorderWithResize.js" type="text/javascript"></script>
    <script src="../js/plugins/datatable/ColVis.min.js" type="text/javascript"></script>
    <script src="../js/plugins/datatable/jquery.dataTables.columnFilter.js" type="text/javascript"></script>
    <script src="../js/plugins/datatable/jquery.dataTables.grouping.js" type="text/javascript"></script> 
    <script src="../js/plugins/maskedinput/jquery.maskedinput.min.js" type="text/javascript"></script> 
    <script src="../js/plugins/tagsinput/jquery.tagsinput.min.js" type="text/javascript"></script> 
    <script src="../js/plugins/datepicker/bootstrap-datepicker.js" type="text/javascript"></script> 
    <script src="../js/plugins/daterangepicker/daterangepicker.js" type="text/javascript"></script>
    <script src="../js/plugins/daterangepicker/moment.min.js" type="text/javascript"></script> 
    <script src="../js/plugins/timepicker/bootstrap-timepicker.min.js" type="text/javascript"></script> 
    <script src="../js/plugins/colorpicker/bootstrap-colorpicker.js" type="text/javascript"></script>--%> 

  <%--  <script src="../js/plugins/chosen/chosen.jquery.min.js" type="text/javascript"></script> 
    <script src="../js/plugins/multiselect/jquery.multi-select.js" type="text/javascript"></script> 
    <script src="../js/plugins/ckeditor/ckeditor.js" type="text/javascript"></script> 
    <script src="../js/plugins/plupload/plupload.full.js" type="text/javascript"></script>
    <script src="../js/plugins/plupload/jquery.plupload.queue.js" type="text/javascript"></script> 
    <script src="../js/plugins/fileupload/bootstrap-fileupload.min.js" type="text/javascript"></script>
    <script src="../js/plugins/mockjax/jquery.mockjax.js" type="text/javascript"></script> --%>

<%--    <script src="../js/plugins/select2/select2.min.js" type="text/javascript"></script> 
    <script src="../js/plugins/icheck/jquery.icheck.min.js" type="text/javascript"></script> --%>
<%--    <script src="../js/plugins/complexify/jquery.complexify-banlist.min.js" type="text/javascript"></script>
    <script src="../js/plugins/complexify/jquery.complexify.min.js" type="text/javascript"></script> 
    <script src="../js/plugins/mockjax/jquery.mockjax.js" type="text/javascript"></script> 
    <script src="../js/plugins/validation/jquery.validate.min.js" type="text/javascript"></script>
    <script src="../js/plugins/validation/additional-methods.min.js" type="text/javascript"></script> 
    <script src="../js/plugins/form/jquery.form.min.js" type="text/javascript"></script> 
    <script src="../js/plugins/wizard/jquery.form.wizard.min.js" type="text/javascript"
        type="text/javascript"></script>--%>
    <%--<script src="../js/plugins/mockjax/jquery.mockjax.js"></script> 
    <script src="../js/plugins/validation/jquery.validate.min.js"></script>
    <script src="../js/plugins/validation/additional-methods.min.js"></script> 
    <script src="../js/plugins/raphael/raphael-min.js" type="text/javascript"></script>
    <script src="../js/plugins/morris/morris.min.js" type="text/javascript"></script>--%>

    <script src="../js/eakroko.min.js" type="text/javascript"></script>
    <!-- Theme scripts -->
    <%--<script src="../js/application.min.js" type="text/javascript"></script>--%>
    <!-- Just for demonstration -->
    <%--<script src="js/demonstration.min.js"></script>--%>
    <%--<script src="../js/cycle.js" type="text/javascript"></script>--%>
 <%--   <script src="../js/json_parse.js" type="text/javascript"></script>
    <script src="../js/json_parse_state.js" type="text/javascript"></script>
    <script src="../js/json2.js" type="text/javascript"></script>--%>
    <%--Toast Message--%>
    <%--<script src="../js/notify.js" type="text/javascript"></script>
    <script src="../js/notify.min.js" type="text/javascript"></script>
    <script language="javascript" type="text/javascript">--%>
    <%--<script type="text/javascript" src="../js/notify-metro.js"></script>--%>
    <%--// <![CDATA[

        function btnSave_onclick() {

        }

// ]]>--%>
    <%--  </script>--%>
                      
</head>
<body>
    <form id="form1" runat="server">
      <%--<script type="text/javascript">
          // alert($("DPPaciente.chosen-select").val())
          var options = $("#DPPaciente option:selected");

          var values = $.map(options, function (option) {
              return option.text;
          });
          alert(values);
                    </script>--%>
    <div class="box box-bordered">
        <div class="box-title">
            <h3>
                <i class="icon-edit"></i>Seguimiento de Casos</h3>
        </div>
        <div class="box-content nopadding">
            <div class='form-horizontal form-bordered'>
                <!-- Tipo de Reporte -->
                <div class="control-group">
                    <label for="CmbPaciente12" class="control-label" style="color: Red">
                        Paciente</label>
                    <div class="controls">
                        <asp:DropDownList ID="DPPaciente" runat="server" CssClass="select2-me input-block-level"
                            data-rule-required="true" multiple="multiple" class="chosen-select form-control">
                        </asp:DropDownList>
                    </div>
                    <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
                    <asp:Button ID="Button1" runat="server" Text="Button" OnClick="Button1_Click" />
                </div>
            </div>
        </div>
    </div>
    </form>
</body>
</html>
