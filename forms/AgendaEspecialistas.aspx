<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="AgendaEspecialistas.aspx.cs" Inherits="CAID_V2.forms.AgendaEspecialistas" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <link rel="stylesheet/less" type="text/css" href="calendar.less" />
        <link rel="stylesheet" href="../css/calendar.css">
        <link rel="stylesheet" href="../css/calendar.min.css">

        <script type="text/javascript" src="../js/jquery.js"></script>
        <script type="text/javascript" src="../js/underscore-min.js"></script>
        <script type="text/javascript" src="../js/bootstrap3.min.js"></script>
        <script type="text/javascript" src="../js/jstz.js"></script>
        <script type="text/javascript" src="../js/jstz.min.js"></script>
        <script type="text/javascript" src="../js/esDO.js"></script>
        <script type="text/javascript" src="../js/calendar.js"></script>
        <script type="text/javascript" src="../js/widgets.js"></script>
        <script type="text/javascript" src="../js/embed.js"></script>
        <script type="text/javascript" src="../js/app.js"></script>

        <style type="text/css">
            .btn-twitter {
                padding-left: 30px;
                background: rgba(0, 0, 0, 0) url(https://platform.twitter.com/widgets/images/btn.27237bab4db188ca749164efd38861b0.png) -20px 9px no-repeat;
            }

                .btn-twitter:hover {
                    background-position: -21px -16px;
                }
        </style>
        <script>!function (d, s, id) { var js, fjs = d.getElementsByTagName(s)[0], p = /^http:/.test(d.location) ? 'http' : 'https'; if (!d.getElementById(id)) { js = d.createElement(s); js.id = id; js.src = p + '://platform.twitter.com/widgets.js'; fjs.parentNode.insertBefore(js, fjs); } }(document, 'script', 'twitter-wjs');
		</script>
        <div class="page-header">
            <div class="pull-right form-inline">
                <div class="btn-group">
                    <button class="btn btn-primary" data-calendar-nav="prev"><< Anterior</button>
                    <button class="btn" data-calendar-nav="today">Hoy</button>
                    <button class="btn btn-primary" data-calendar-nav="next">Siguiente >></button>
                </div>
                <div class="btn-group">
                    <button class="btn btn-warning" data-calendar-view="year">Anio</button>
                    <button class="btn btn-warning active" data-calendar-view="month">Mes</button>
                    <button class="btn btn-warning" data-calendar-view="week">Semana</button>
                    <button class="btn btn-warning" data-calendar-view="day">Dia</button>
                </div>
            </div>
            <h3>prueba</h3>
        </div>

        <div id="calendar"></div>

        <%--<script type="text/javascript">
        var calendar = $('#calendar').calendar({
            tmpl_path: "../tmpls/",
            events_source: []
        });
    </script>--%>
        <script type="text/javascript">
            var calendar = $("#calendar").calendar(
                {
                    language: 'es-DO',
                    tmpl_path: "../tmpls/",
                    events_source: [<%=@Session["XJSON"].ToString()%>]
                });
                //{ "success": 1, "result": [{ "id": 293, "title": "Event 1", "url": "http://example.com", "class": "event-important", "start": 12039485678000, "end": 1234576967000 }] }'
        </script>

        <script type="text/javascript">
                                    var calendar = $('#calendar').calendar({ language: 'es-DO', modal: "#events-modal" });
            //var calendar = $('#calendar').calendar({ events_source: '/api/events.php' });
            //var calendar = $("#calendar").calendar({ language: 'es-DO', modal: "#events-modal", modal_type: "ajax", modal_title: function (e) { return e.modal } })
        </script>
        <%--                <script type="text/javascript">
                    var calendar = $("#calendar").calendar(
                        {
                            language: 'es-DO',
                            tmpl_path: "../tmpls/",
                            events_source: function () { return [<%=@Session["XJSON"].ToString()%>]; }
                        });
                //{ "success": 1, "result": [{ "id": 293, "title": "Event 1", "url": "http://example.com", "class": "event-important", "start": 12039485678000, "end": 1234576967000 }] }'
        </script>--%>


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
        <%--        <script type="text/javascript">
            var disqus_shortname = 'bootstrapcalendar'; // required: replace example with your forum shortname
            (function () {
                var dsq = document.createElement('script'); dsq.type = 'text/javascript'; dsq.async = true;
                dsq.src = '../js/embed.js';
                (document.getElementsByTagName('head')[0] || document.getElementsByTagName('body')[0]).appendChild(dsq);
            })();
        </script>--%>
    </div>
    </container>
</asp:Content>
