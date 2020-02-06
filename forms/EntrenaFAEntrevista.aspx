<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true"
    CodeBehind="EntrenaFAEntrevista.aspx.cs" Inherits="CAID_V2.forms.EntrenaFAEntrevista" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">
    <div class="container-fluid" id="content">
        <link href="../css/bootstrap.min2.css" rel="stylesheet" />
        <link href="../css/StyleSheet1.css" rel="stylesheet" />
        <link href="../css/font-awesome.min2.css" rel="stylesheet" />
        <link href="../css/plugins/datatable/datatables11015.min.css" rel="stylesheet" />
        <script src="../js/notify.js" type="text/javascript"></script>
        <script src="../js/notify.min.js" type="text/javascript"></script>
        <script src="../js/plugins/datatable/datatables11015.min.js"></script>
        <script src="../js/language/es-DO.js"></script>

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

        <style>
            input[type="checkbox"] {
                font-weight: bold;
                height: 20px;
                width: 20px;
                vertical-align: middle;
            }
        </style>
        <style type="text/css">
            input:checked {
                font-weight: bold;
                height: 20px;
                width: 20px;
            }
        </style>
        <%--HISTORIO--%>
        <asp:Panel runat="server" ID="pnlConsulta" Visible="false">
            <div class="row-fluid">
                <div class="col-sm-12">
                    <div class="box box-color box-bordered">
                        <div class="box-title">
                            <h3>
                                <i class="icon-reorder"></i>Programa de Entrenamiento a Familias
                            </h3>
                            <div class="actions">
                                <button type="button" id="btnadd" runat="server"
                                    class="btn btn-default" data-dismiss="modal" onserverclick="_Nuevo">
                                    <i class="icon-plus-sign"></i>&nbsp Nuevo</button>
                                <button type="button" id="Button1" runat="server"
                                    class="btn btn-primary" data-dismiss="modal" onserverclick="_BackMain">
                                    <i class="icon-arrow-left"></i>&nbsp Regresar
                                </button>
                                <a href="#" class="btn btn-mini content-refresh"><i class="icon-refresh"></i></a>
                                <a href="#" class="btn btn-mini content-slideUp"><i class="icon-angle-down"></i></a>
                            </div>
                        </div>
                        <div class="box-content nopadding">
                            <div class='form-horizontal form-bordered'>
                                <div class="control-group">
                                    <div class="box-content nopadding">
                                        <table id="tbevaluacionhistorico" class="table table-bordered dataTable dataTable-noheader" data-grouping="expandable">
                                            <thead>
                                                <tr>
                                                    <th>No.
                                                    </th>
                                                    <th>Fecha
                                                    </th>
                                                    <th>Evaluador
                                                    </th>
                                                    <th>Acciones
                                                    </th>

                                                </tr>
                                            </thead>
                                            <tbody>
                                                <asp:Repeater ID="rpHistorico" runat="server">
                                                    <ItemTemplate>
                                                        <tr>
                                                            <td>
                                                                <%# Eval("Secuencia")%>
                                                            </td>
                                                            <td>
                                                                <%# Eval("ROWCDTE")%>
                                                            </td>
                                                            <td>
                                                                <%# Eval("NOMBRE_ESPECIALISTA")%>
                                                            </td>
                                                            <%----%>
                                                            <td>
                                                                <asp:LinkButton ID="btnBuscar" CssClass="btn btn-primary" runat="server" Text="Ver"
                                                                    CommandArgument='<%# Eval("Secuencia")%>' CommandName="VerDetalle" OnClick="_VerDetalle"><i class="icon-search" >&nbsp Ver</i></asp:LinkButton>
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
        </asp:Panel>

        <%-- DATOS PERSONALES--%>
        <asp:Panel runat="server" ID="pnlData" Visible="True">
            <div class="row-fluid">
                <div class="col-sm-12">
                     <div class="box box-color box-bordered">
                        <div class="box-title  box-color">
                            <h3><i class="fa fa-list"></i>Programa Entrenamiento a Familias</h3>
                                 <div class="actions">
                                <button type="button" id="tbnAdd" runat="server"
                                    class="btn btn-default" data-dismiss="modal" onserverclick="_Save">
                                    <%----%>
                                    <i class="icon-plus-sign"></i>&nbsp Guardar</button>
                                <button type="button" id="btnregresar" runat="server" validationgroup="pnlEdit"
                                    class="btn btn-default" data-dismiss="modal" onserverclick="_BackMain">
                                    <%----%>
                                    <i class="icon-arrow-left"></i>&nbsp Regresar</button>

                            </div>
                             </div>
                          </div>
                    <div class="box box-color box-bordered">
                        <div class="box-title box-color">
                            <h3><i class="fa fa-list"></i>Datos Personales</h3>
                       
                        </div>
                        <div>
                            <div class="box-content nopadding">
                                <div class='form-horizontal form-column form-bordered'>
                                    <div class="row">
                                        <%-- DATOS PERSONALES DEL PACIENTE--%>
                                        <div class="col-sm-6">
                                            <%-- 1- No. Expediente--%>
                                            <div class="control-group">
                                                <label for="lblExpedienteNo" class="control-label col-sm-6">
                                                    Expediente:  
                                                </label>
                                                <div class="controls">
                                                    <input type="text" name="txtExpedienteNo" id="txtExpedienteNo" placeholder="Digite Aqui" class="form-control" disabled runat="server">
                                                </div>
                                            </div>
                                            <%-- 1- Nombre del Paciente--%>
                                            <div class="control-group">
                                                <label for="lblnombrePaciente" class="control-label col-sm-2">
                                                    Nombre del Niño</label>
                                                <div class="controls">
                                                    <input type="text" name="txtNombrePaciente" id="txtNombrePaciente" placeholder="Digite Aqui" class="form-control" disabled runat="server">
                                                </div>
                                            </div>
                                            <%-- 2- Fecha de Nacimiento--%>
                                            <div class="control-group">
                                                <label for="lblFechaNacimiento" class="control-label col-sm-2">
                                                    Fecha Nacimiento</label>
                                                <div class="controls">
                                                    <input type="text" name="txtFechanacimiento" id="txtFechanacimiento" placeholder="Digite Aqui" class="form-control" disabled runat="server">
                                                </div>
                                            </div>
                                            <%-- 3- Edad Cronologica--%>
                                            <div class="control-group">
                                                <label for="lblEdadCronologica" class="control-label col-sm-2">
                                                    Edad</label>
                                                <div class="controls">
                                                    <input type="text" name="txtEdadCronologica" id="txtEdadCronologica"
                                                        placeholder="99" runat="server" disabled>
                                                </div>
                                            </div>
                                            <%-- 4- Sexo--%>
                                            <div class="control-group">
                                                <label for="lblSexo" class="control-label col-sm-2">
                                                    Sexo</label>
                                                <div class="controls">
                                                    <input type="text" name="txtSexo" id="txtSexo"
                                                        placeholder="Digite Aqui" runat="server" disabled>
                                                </div>
                                            </div>
                                            <%-- 5- Con Quien Reside--%>
                                            <div class="control-group">
                                                <label for="lblConQuienReside" class="control-label col-sm-2">
                                                    Con Quien Reside el Niño?</label>
                                                <div class="controls">
                                                    <input type="text" name="txtConQuienReside" id="txtConQuienReside"
                                                        placeholder="Digite Aqui" runat="server" class="form-control" disabled>
                                                </div>
                                            </div>
                                            <%-- 6- Nivel Economico--%>
                                            <div class="control-group">
                                                <label for="lblNivelEconomico" class="control-label col-sm-2">
                                                    Nivel Economico</label>
                                                <div class="controls">
                                                    <input type="text" name="txtNivelEconomico" id="txtNivelEconomico"
                                                        placeholder="" runat="server" disabled>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-sm-6">

                                            <%-- 7- Direccion Actual--%>
                                            <div class="control-group">
                                                <label for="lblnombrepadre" class="control-label col-sm-6">
                                                    Direccion actual</label>
                                                <div class="controls">
                                                    <input type="text" name="txtdireccionactual" id="txtdireccionactual"
                                                        placeholder="Digite Aqui" runat="server" class="form-control" disabled>
                                                </div>
                                            </div>
                                            <%-- 8- Escolarizado--%>
                                            <div class="control-group">
                                                <label for="lblEscolarizado" class="control-label col-sm-6">
                                                    Escolarizado</label>
                                                <div class="controls">
                                                    <asp:DropDownList ID="ddlEscolarizado" CssClass="input-medium" runat="server">
                                                        <asp:ListItem Value="">-- Seleccione --</asp:ListItem>
                                                        <asp:ListItem Value="SI">SI</asp:ListItem>
                                                        <asp:ListItem Value="NO">NO</asp:ListItem>
                                                    </asp:DropDownList>
                                                </div>
                                            </div>
                                            <%-- 9- Tipo de Escuelas--%>
                                            <div class="control-group">
                                                <label for="lblTipoEscuelas" class="control-label col-sm-6">
                                                    Tipo de Escuela</label>
                                                <div class="controls">
                                                    <asp:DropDownList ID="ddlTipoEscuela" CssClass="input-medium" runat="server">
                                                        <asp:ListItem Value="">-- Seleccione --</asp:ListItem>
                                                        <asp:ListItem Value="Guarderia">Guarderia</asp:ListItem>
                                                        <asp:ListItem Value="Especial">Especial</asp:ListItem>
                                                        <asp:ListItem Value="Regular">Regular</asp:ListItem>
                                                    </asp:DropDownList>
                                                </div>
                                            </div>
                                            <%-- 7- Cuidador Principal--%>
                                            <div class="control-group">
                                                <label for="lblCuidadoPrincipal" class="control-label col-sm-6">
                                                    Cuidador Principal</label>
                                                <div class="controls">
                                                    <input type="text" name="txtcuidadoprincipal" id="txtcuidadoprincipal"
                                                        placeholder="Digite Aqui" runat="server" class="form-control" disabled>
                                                </div>
                                            </div>
                                            <%-- 3- Nombre de Evaluador--%>
                                            <div class="control-group">
                                                <label for="lblnombreevaluador" class="control-label col-sm-6">
                                                    Evaluador:</label>
                                                <div class="controls">
                                                    <input type="text" name="txtNombreEvaluador" id="txtNombreEvaluador" class="form-control" disabled runat="server">
                                                </div>
                                            </div> 
                                            <%-- 4- Fecha evaluacion--%>
                                            <div class="control-group">
                                                <label for="lblfechaevaluacion" class="control-label col-sm-2">
                                                    Fecha evaluación</label>
                                                <div class="controls">
                                                    <input type="text" name="txtfechaevaluacion" id="txtfechaevaluacion" placeholder="Digite Aqui" class="form-control" disabled runat="server">
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <%--DATOS DEL Nucleo Familiar--%>
                        <div class="box-content nopadding">
                            <div class="row">
                                <div class="control-group">
                                    <div class="col-sm-12">
                                        <div class="box-title box-color col-lg-12">
                                            <h3>
                                                <i class="fa fa-list"></i>Nucleo Familiar</h3>
                                        </div>

                                        <%--Nucleo Familiar--%>
                                        <div class="row-fluid">
                                            <div class="control-group" id="pnNucleoFamiliar">
                                                <div class="nopadding">
                                                    <table class="table table-bordered">
                                                        <thead runat="server">
                                                            <tr>
                                                                <th>Nombres y Apellidos</th>
                                                                <th>Parentesco</th>
                                                                 <th>Edad</th>
                                                                <th class="hidden-350">Nivel Escolar</th>
                                                                <th>Estatus Laboral</th>
                                                                <th>Estatus Marital</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                            <asp:Repeater ID="rpNucleoFamiliar" runat="server">
                                                                <ItemTemplate>
                                                                    <tr>
                                                                        <td>
                                                                            <%# Eval("FULLNAME")%>
                                                                        </td>
                                                                        <td>
                                                                            <%# Eval("FILIACIONNOMBRE")%>
                                                                        </td>
                                                                        <td>
                                                                            <%# Eval("EDAD")%>
                                                                        </td>
                                                                        <td class="hidden-350">
                                                                            <%# Eval("ESCOLARIDAD")%>
                                                                        </td>
                                                                        <td class="hidden-350">
                                                                            <%# Eval("ESTATUSLABORAL")%>
                                                                        </td>
                                                                        <td class="hidden-350">
                                                                            <%# Eval("ESTADOCIVIL")%>
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
            </div>
            <%--DATOS DE LA ENTREVISTA--%>
            <div class="col-sm-12">
                <div class="box box-color box-bordered">
                    <div class="box-title box-color">
                        <h3><i class="icon-edit"></i>Datos de la Entrevista</h3>
                    </div>
                    <div>
                        <div class="box-content nopadding">
                            <div class='form-vertical form-column form-bordered'>
                                <div class="row">
                                    <div class="col-sm-6">
                                        <%-- Pregunta 1--%>
                                        <div class="control-group">
                                            <label for="lblCualHabilidadespudieradestacar">
                                                1. Cuales habilidades de su hijo/a pudiera destacar?  
                                            </label>
                                            <div class="controls">
                                                <textarea runat="server" name="txtCualHabilidadespudieradestacar" id="txtCualHabilidadespudieradestacar" rows="2" class="input-block-level" data-rule-required="true" placeholder="Digite Aqui"></textarea>
                                            </div>
                                        </div>
                                        <%-- Pregunta 2--%>
                                        <div class="control-group">
                                            <label for="lblCualesmayoresdificultadespresenta">
                                                2. Cuales son las mayores dificultades que presenta su hijo/a?</label>
                                            <div class="controls">
                                                <textarea runat="server" name="txtCualesmayoresdificultadespresenta" id="txtCualesmayoresdificultadespresenta" rows="2" class="input-block-level" data-rule-required="true" placeholder="Digite Aqui"></textarea>
                                            </div>
                                        </div>
                                        <%-- Pregunta 3--%>
                                        <div class="control-group">
                                            <label for="lblQuecosasvidacotidiana">
                                                3. Que cosas de la vida cotidiana pueden alterarlo? (sonidos, cambios, luces, etc.)</label>
                                            <div class="controls">
                                                <textarea runat="server" name="txtQuecosasvidacotidiana" id="txtQuecosasvidacotidiana" rows="2" class="input-block-level" data-rule-required="true" placeholder="Digite Aqui"></textarea>
                                            </div>
                                        </div>
                                        <%-- Pregunta 4--%>
                                        <div class="control-group">
                                            <label for="lblQueinstruccionessigue">
                                                4. Que instrucciones sigue su hijo/a? Instrucciones cotidianas, instrucciones de dos pasos, instrucciones complejas.</label>
                                            <div class="controls">
                                                <textarea runat="server" name="txtQueinstruccionessigue" id="txtQueinstruccionessigue" rows="2" class="input-block-level" data-rule-required="true" placeholder="Digite Aqui"></textarea>
                                            </div>
                                        </div>
                                        <%-- Pregunta 5--%>
                                        <div class="control-group">
                                            <label for="lblCualeselmomentomasdificil">
                                                5. Cual es el momento mas dificil del dia con el/ella? Explorar conductas disruptivas: Autoagresiones, agresiones, escupir, morder, etc/.</label>
                                            <div class="controls">
                                                <textarea runat="server" name="txtCualeselmomentomasdificil" id="txtCualeselmomentomasdificil" rows="2" class="input-block-level" data-rule-required="true" placeholder="Digite Aqui"></textarea>
                                            </div>
                                        </div>
                                        <%-- Pregunta 6--%>
                                        <div class="control-group">
                                            <label for="lblQuecosaspuedehacerindependiente">
                                                6. Que cosas puede hacer de manera independiente? (Comer, higiene personal, dormirse solo)</label>
                                            <div class="controls">
                                                <textarea runat="server" name="txtQuecosaspuedehacerindependiente" id="txtQuecosaspuedehacerindependiente" rows="2" class="input-block-level" data-rule-required="true" placeholder="Digite Aqui"></textarea>
                                            </div>
                                        </div>
                                        <%-- Pregunta 7--%>
                                        <div class="control-group">
                                            <label for="lblAyudatareasdomesticas">
                                                7.  Ayuda en las tareas domesticas? Cuales?</label>
                                            <div class="controls">
                                                <textarea runat="server" name="txtAyudatareasdomesticas" id="txtAyudatareasdomesticas" rows="2" class="input-block-level" data-rule-required="true" placeholder="Digite Aqui"></textarea>
                                            </div>
                                        </div>
                                        <%-- Pregunta 8--%>
                                        <div class="control-group">
                                            <label for="lblpuedecomersolo">
                                                8.  Puede comer solo? (usa las manos, cuchara, tenedor, cuchillo, describir)</label>
                                            <div class="controls">
                                                <textarea runat="server" name="txtpuedecomersolo" id="txtpuedecomersolo" rows="2" class="input-block-level" data-rule-required="true" placeholder="Digite Aqui"></textarea>
                                            </div>
                                        </div>
                                        <%-- Pregunta 9--%>
                                        <div class="control-group">
                                            <label for="lblPuedetomarsolo">
                                                9. Puede tomar solo de un vaso sin tapa</label>
                                            <div class="controls">
                                                <textarea runat="server" name="txtPuedetomarsolo" id="txtPuedetomarsolo" rows="2" class="input-block-level" data-rule-required="true" placeholder="Digite Aqui"></textarea>
                                            </div>
                                        </div>
                                        <%-- Pregunta 10--%>
                                        <div class="control-group">
                                            <label for="lblpuedevestirsesolo">
                                                10. Puede vestirse y desvertise solo? (ponerse camiseta, camisa, pantalon, ropa interior, zipper, medias, cordones, medias)</label>
                                            <div class="controls">
                                                <textarea runat="server" name="txtpuedevestirsesolo" id="txtpuedevestirsesolo" rows="2" class="input-block-level" data-rule-required="true" placeholder="Digite Aqui"></textarea>
                                            </div>
                                        </div>
                                        <%-- Pregunta 11--%>
                                        <div class="control-group">
                                            <label for="lblvaalbanosolo">
                                                11. Va al baño solo? (puede desvestirse, limpiarse, descargar el inodoro, lavarse las manos)</label>
                                            <div class="controls">
                                                <textarea runat="server" name="txtvaalbanosolo" id="txtvaalbanosolo" rows="2" class="input-block-level" data-rule-required="true" placeholder="Digite Aqui"></textarea>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-sm-6">
                                        <%-- Pregunta 12--%>
                                        <div class="control-group">
                                            <label for="lblCualesmayorespreocupaciones">
                                                12. Cuales son sus mayores preocupaciones con respecto a su hijo/a y al diagnóstico?  
                                            </label>
                                            <div class="controls">
                                                <textarea runat="server" name="txtCualesmayorespreocupaciones" id="txtCualesmayorespreocupaciones" rows="2" class="input-block-level" data-rule-required="true" placeholder="Digite Aqui"></textarea>
                                            </div>
                                        </div>
                                        <%-- Pregunta 13--%>
                                        <div class="control-group">
                                            <label for="lblComosecomunica">
                                                13.  Como se comunica el/la niño/a (Con amigos, familiares, y en la escuela) Dice palabras?, Señala? Puede decir frases?</label>
                                            <div class="controls">
                                                <textarea runat="server" name="txtComosecomunica" id="txtComosecomunica" rows="2" class="input-block-level" data-rule-required="true" placeholder="Digite Aqui"></textarea>
                                            </div>
                                        </div>
                                        <%-- Pregunta 14--%>
                                        <div class="control-group">
                                            <label for="lblQueactividadesrealiza">
                                                14.  Que actividades realiza el niño/a con su familia? (fuera de la casa, en ambientes sociales, en cumpleaños, con adultos/niños en la escuela, en el barrio, con hermanos, en un cenro comercial, etc.)</label>
                                            <div class="controls">
                                                <textarea runat="server" name="txtQueactividadesrealiza" id="txtQueactividadesrealiza" rows="2" class="input-block-level" data-rule-required="true" placeholder="Digite Aqui"></textarea>
                                            </div>
                                        </div>
                                        <%-- Pregunta 15--%>
                                        <div class="control-group">
                                            <label for="lblQuehaceparaestimularlo">
                                                15. Actualmente, Qué hace con su hijo/a para estimularlo? (Explorar las actividades de la vida diaria que comparte con el/a niño/a.</label>
                                            <div class="controls">
                                                <textarea runat="server" name="txtQuehaceparaestimularlo" id="txtQuehaceparaestimularlo" rows="2" class="input-block-level" data-rule-required="true" placeholder="Digite Aqui"></textarea>
                                            </div>
                                        </div>
                                        <%-- Pregunta 16--%>
                                        <div class="control-group">
                                            <label for="lblddlEscala">
                                                16.  En una escala del 1 al 5, Que tanto cnoce sobre la condición de su hijo/a?</label>
                                            <div class="controls">
                                                <asp:DropDownList ID="ddlEscala" CssClass="input-medium" runat="server">
                                                    <asp:ListItem Value="0">-- Seleccione --</asp:ListItem>
                                                    <asp:ListItem Value="1">1</asp:ListItem>
                                                    <asp:ListItem Value="2">2</asp:ListItem>
                                                    <asp:ListItem Value="3">3</asp:ListItem>
                                                    <asp:ListItem Value="4">4</asp:ListItem>
                                                    <asp:ListItem Value="5">5</asp:ListItem>
                                                </asp:DropDownList>
                                            </div>
                                        </div>
                                        <%-- Pregunta 17--%>
                                        <div class="control-group">
                                            <label for="lblconquienescompartido">
                                                17. Con Quienes han compartido el diagnostico de él/a niño/a</label>
                                            <div class="controls">
                                                <textarea runat="server" name="txtconquienescompartido" id="txtconquienescompartido" rows="2" class="input-block-level" data-rule-required="true" placeholder="Digite Aqui"></textarea>
                                            </div>
                                        </div>
                                        <%-- Pregunta 18--%>
                                        <div class="control-group">
                                            <label for="lblconquiensientecuenta">
                                                18.  Con quien siente que cuenta para ayudarlo con su hijo/a?</label>
                                            <div class="controls">
                                                <textarea runat="server" name="txtconquiensientecuenta" id="txtconquiensientecuenta" rows="2" class="input-block-level" data-rule-required="true" placeholder="Digite Aqui"></textarea>
                                            </div>
                                        </div>
                                        <%-- Pregunta 19--%>
                                        <div class="control-group">
                                            <label for="lbltieneotrocondiscapacidad">
                                                19. Tiene otro hijo/a con discapacidad? (Especificar)</label>
                                            <div class="controls">
                                                <textarea runat="server" name="txttieneotrocondiscapacidad" id="txttieneotrocondiscapacidad" rows="2" class="input-block-level" data-rule-required="true" placeholder="Digite Aqui"></textarea>
                                            </div>
                                        </div>
                                        <%-- Pregunta 20--%>
                                        <div class="control-group">
                                            <label for="lblcualesonfortalezas">
                                                20. Cuales son sus fortalezas y retos como padre y/o madre</label>
                                            <div class="controls">
                                                <textarea runat="server" name="txtcualesonfortalezas" id="txtcualesonfortalezas" rows="2" class="input-block-level" data-rule-required="true" placeholder="Digite Aqui"></textarea>
                                            </div>
                                        </div>
                                        <%-- Pregunta 21--%>
                                        <div class="control-group">
                                            <label for="lblsituvieraoportunidad">
                                                21. Si tuviera la oportunidad de que se cumplan tres deseos sobre la discapacidad de su hijo/a Cuales serían?</label>
                                            <div class="controls">
                                                <textarea runat="server" name="txtsituvieraoportunidad" id="txtsituvieraoportunidad" rows="2" class="input-block-level" data-rule-required="true" placeholder="Digite Aqui"></textarea>
                                            </div>
                                        </div>
                                        <%-- Pregunta 22--%>
                                        <div class="control-group">
                                            <label for="lblAsistentesaentrevista">
                                                22. Asistentes a la entrevista/parentesco</label>
                                            <div class="controls">
                                                <textarea runat="server" name="txtAsistentesaentrevista" id="txtAsistentesaentrevista" rows="2" class="input-block-level" data-rule-required="true" placeholder="Digite Aqui"></textarea>
                                            </div>
                                        </div>
                                        <%-- Pregunta 23--%>
                                        <div class="control-group">
                                            <label for="lblObservacionesEntrevista">
                                                23. Observaciones de el/la entrevistador/a.</label>
                                            <div class="controls">
                                                <textarea runat="server" name="txtObservacionesEntrevista" id="txtObservacionesEntrevista" rows="2" class="input-block-level" data-rule-required="true" placeholder="Digite Aqui"></textarea>
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

