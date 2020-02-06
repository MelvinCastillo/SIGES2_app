<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="prueba2.aspx.cs" Inherits="CAID_V2.forms.prueba2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <!-- Fecha y Hora INICIO -->
            <script src="../img/jquery2.min.js"></script>
            <link href="../css/plugins/jquery-ui/smoothness/jquery-ui.css" rel="stylesheet" />
            <link href="../css/plugins/jquery-ui/smoothness/jquery.ui.theme.css" rel="stylesheet" />
            <link href="../bsall/css/bootstrap-theme.css" rel="stylesheet" />
         <%--   <a href="../bsall/css/bootstrap-theme.css.map">../bsall/css/bootstrap-theme.css.map</a>--%>
            <link href="../bsall/css/bootstrap-theme.min.css" rel="stylesheet" />
            <%--<a href="../bsall/css/bootstrap-theme.min.css.map">../bsall/css/bootstrap-theme.min.css.map</a>--%>
            <link href="../bsall/css/bootstrap.css" rel="stylesheet" />
          <%--  <a href="../bsall/css/bootstrap.css.map">../bsall/css/bootstrap.css.map</a>--%>
            <link href="../bsall/css/bootstrap.min.css" rel="stylesheet" />
            <script src="../bsall/js/bootstrap.js"></script>
            <script src="../bsall/js/bootstrap.min.js"></script>
            <script src="../bsall/js/npm.js"></script>
         <%--   <a href="../bsall/css/bootstrap.min.css.map">../bsall/css/bootstrap.min.css.map</a>--%>
            <script src="../js/moment-with-locales.js"></script>
            <script src="../js/plugins/momentjs/jquery.moment.js"></script>
            <script src="../js/plugins/daterangepicker/moment.min.js"></script>
            <script src="../js/moment.js"></script>

            <link rel="stylesheet" type="../css/bootstrap-datetimepicker.css" />
            <link rel="stylesheet" type="../css/bootstrap-datetimepicker.min.cs" />
            <script src="../js/bootstrap-datetimepicker.js"></script>
            <script src="../js/bootstrap-datetimepicker.min.js"></script>
            <%--<script type="text/javascript">
                $(function () {
                    //
                    // $('#ctl00_MainContent_txtfechanacimiento').datepicker({
                    $('#txtFechaInicio').datetimepicker({
                        toggleActive: false,
                        // format: "dd/mm/yyyy ",
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
                                            //$('.datepicker')
                                            //    .on('changeDate', function (e) {
                                            //        // Revalidate the date when user change it
                                            //        $('#frmadmitidosdevueltos').bootstrapValidator('revalidateField', 'endDate');
                                            //    });
            </script>--%>
            <div class="container">
                <div class="row">
                    <div class='col-sm-6'>
                        <div class="form-group">
                            <div class='input-group date' id='datetimepicker1'>
                                <input type='text' class="form-control" />
                                <span class="input-group-addon">
                                    <span class="glyphicon glyphicon-calendar"></span>
                                </span>
                            </div>
                        </div>
                    </div>
                    <script type="text/javascript">
                        $(function () {
                            $('#datetimepicker1').datetimepicker();
                        });
                    </script>
                </div>
            </div>

        </div>
    </form>
</body>
</html>
