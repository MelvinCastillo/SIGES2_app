<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true"
    CodeBehind="prueba3.aspx.cs" Inherits="CAID_V2.forms.prueba3" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">
    <div class="container" id="content">
        <link href="font/font-awesome.min.css" rel="stylesheet" />
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css" integrity="sha384-/Y6pD6FV/Vv2HJnA6t+vslU6fwYXjCFtcEpHbNJ0lyAFsXTsjBbfaDjzALeQsN6M" crossorigin="anonymous">

        <link href="../css/StyleSheet1.css" rel="stylesheet" />
        <link href="../css/font-awesome.min2.css" rel="stylesheet">
        <script>
            // Initialize tooltip component
            $(function () {
                $('[data-toggle="tooltip"]').tooltip()
            })

            // Initialize popover component
            $(function () {
                $('[data-toggle="popover"]').popover()
            })
        </script>
        <script>
            $('ckparticipantes').prop('indeterminate', true)
        </script>
        <div>
            <div class="controls">
                 
                <div class="checkbox checkbox-primary">
                    <asp:CheckBoxList ID="ckparticipantes" RepeatColumns="5" RepeatDirection="Vertical"  runat="server"  Font-Size="X-Small" >
                        <asp:ListItem>Madre mia de prueba</asp:ListItem>
                        <asp:ListItem>Madre</asp:ListItem>
                        <asp:ListItem>Abuela</asp:ListItem>
                        <asp:ListItem>Abuelo</asp:ListItem>
                        <asp:ListItem>Tio/a</asp:ListItem>
                        <asp:ListItem>Nana</asp:ListItem>
                    </asp:CheckBoxList>
                </div>
                 
                   
            </div>
        </div>
        <%-- DATOS PERSONALES--%>
        <div class="row">
            <div class="col-sm-12">
                <div class="box box-color">
                    <div class="box-title box-color">
                        <h3>
                            <i class="fa fa-list"></i>1. Datos Personales</h3>
                    </div>
                    <div>
                        <div class="box-content nopadding">
                            <div class='form-horizontal form-column form-bordered'>
                                <div class="row">
                                    <div class="col-sm-12">
                                        <%-- 1- Participantes--%>
                                        <div class="control-group">
                                            <label for="lblparticipantes" class="control-label col-sm-4" style="color: Black">
                                                <strong>Participantes en la entrevista</strong></label>

                                            <strong>OTROS</strong></label>
                                                <input type="text" name="txtparticipantesotros" id="txtparticipantesotros" placeholder="Digite Aqui" class="form-control">
                                        </div>
                                    </div>


                                </div>
                                <div class="col-sm-6">
                                    <%--6-Estructura Familiar--%>
                                    <div class="control-group">
                                        <label for="lblEstructuraFamiliar" class="control-label col-sm-2" style="color: Black">
                                            <strong>Estructura Familiar:</strong></label>
                                        <div class="controls">
                                            <asp:DropDownList ID="ddEstructuraFamiliar" runat="server" CssClass="select2-me input-block-level"
                                                data-rule-required="true" AutoPostBack="True">
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

</asp:Content>

