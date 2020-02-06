<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="COPY.aspx.cs"
    Inherits="AgendaEspecialistas" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head id="Head1" runat="server">
    <title>COPY</title>

    <link href="../css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet/less" type="text/css" href="calendar.less" />
    <link rel="stylesheet" href="../css/calendar.css" />
    <link rel="stylesheet" href="../css/calendar.min.css" />

    <script type="text/javascript" src="../js/jquery-latest.js"></script>
    <script type="text/javascript" src="../js/underscore-min.js"></script>
    <script type="text/javascript" src="../js/bootstrap3.min.js"></script>
    <script type="text/javascript" src="../js/jstz.js"></script>
    <script type="text/javascript" src="../js/jstz.min.js"></script>
    <script type="text/javascript" src="../js/calendar.js"></script>
    <script type="text/javascript" src="../js/widgets.js"></script>
    <script type="text/javascript" src="../js/embed.js"></script>
    <script type="text/javascript" src="../js/app.js"></script>
    <script type="text/javascript" src="../js/esDO.js"></script>
    <style type="text/css">
        .btn-twitter {
            padding-left: 30px;
            background: rgba(0, 0, 0, 0) url(https://platform.twitter.com/widgets/images/btn.27237bab4db188ca749164efd38861b0.png) -20px 9px no-repeat;
        }

            .btn-twitter:hover {
                background-position: -21px -16px;
            }
    </style>

</head>
<body>
 <div class="container">
	<div class="jumbotron">
		<script>!function (d, s, id) { var js, fjs = d.getElementsByTagName(s)[0], p = /^http:/.test(d.location) ? 'http' : 'https'; if (!d.getElementById(id)) { js = d.createElement(s); js.id = id; js.src = p + '://platform.twitter.com/widgets.js'; fjs.parentNode.insertBefore(js, fjs); } }(document, 'script', 'twitter-wjs');
		</script>
	</div>


        <div class="page-header">

            <div class="pull-right form-inline">
                <div class="btn-group">
                    <button class="btn btn-primary" data-calendar-nav="prev"><< Prev</button>
                    <button class="btn" data-calendar-nav="today">Today</button>
                    <button class="btn btn-primary" data-calendar-nav="next">Next >></button>
                </div>
                <div class="btn-group">
                    <button class="btn btn-warning" data-calendar-view="year">Year</button>
                    <button class="btn btn-warning" data-calendar-view="month">Month</button>
                    <button class="btn btn-warning active" data-calendar-view="week">Week</button>
                    <button class="btn btn-warning" data-calendar-view="day">Day</button>
                </div>
            </div>
        </div>
        <div id="calendar"></div>
        <script type="text/javascript">
            var calendar = $("#calendar").calendar(
                {
                    tmpl_path: "../tmpls/",
                    events_source: function () {
                        return prueba;
                    }
                });
        </script>
        <script type="text/javascript">
            //var calendar = $('#calendar').calendar({ language: 'es-DO', modal: "#events-modal" });
            //var calendar = $('#calendar').calendar({ events_source: '/api/events.php' });
            var calendar = $("#calendar").calendar({ modal: "#events-modal", modal_type: "ajax", modal_title: function (e) { return e.title } })
        </script>
        <div class="modal fade" id="events-modal">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h3>Event</h3>
                    </div>
                    <div class="modal-body" style="height: 400px">
                    </div>
                    <div class="modal-footer">
                        <a href="#" data-dismiss="modal" class="btn">Close</a>
                    </div>
                </div>
            </div>
        </div>


  </div>
</body>
</html>
