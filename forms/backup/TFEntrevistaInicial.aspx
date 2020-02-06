<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true"
    CodeBehind="TFEntrevistaInicial.aspx.cs" Inherits="CAID_V2.forms.TFEntrevistaInicial" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">
    <div class="container-fluid" id="content">
        <link href="../css/bootstrap.min2.css" rel="stylesheet" />
        <link href="../css/StyleSheet1.css" rel="stylesheet" />
        <link href="../css/font-awesome.min2.css" rel="stylesheet" />

        <%-- <link href="../css/bootstrap.min2.css" rel="stylesheet" />
        <link href="../css/style2.css" rel="stylesheet" /> 
        <script src="../js/zepto.js"></script> 
        <script src="../js/icheck.js"></script>
        <script src="../js/icheck.min.js"></script>
        <script src="../js/custom.min.js"></script>
        <script>
            $(document).ready(function () {
                $('input').iCheck({
                    checkboxClass: 'icheckbox_square-blue',
                    radioClass: 'iradio_square-blue',
                    increaseArea: '0%' // optional 
                });
            });
        </script>--%>

        <%-- DATOS PERSONALES--%>
        <div class="row">
            <div class="col-sm-12">
                <div class="box box-color box-bordered">
                    <div class="box-title box-color">
                        <h3><i class="fa fa-list"></i>1. Datos Personales</h3>
                        <div class="actions">
                            <button type="button" id="tbnAdd" runat="server" validationgroup="pnlEdit"
                                class="btn btn-primary" data-dismiss="modal">
                                <%--onserverclick="_Save"--%>
                                <i class="icon-plus-sign"></i>&nbsp Guardar</button>
                        </div>
                    </div>
                    <div>
                        <div class="box-content nopadding">
                            <div class='form-horizontal form-column form-bordered'>
                                <div class="row">
                                    <%--DATOS PERSONALES DE LA MADRE--%>
                                    <div class="col-sm-4">
                                        <%-- 1- Nombre del Paciente--%>
                                        <div class="control-group">
                                            <label for="lblnombrePaciente" class="control-label col-sm-2">
                                                Nombre del Paciente</label>
                                            <div class="controls">
                                                <input type="text" name="txtNombrePaciente" id="txtNombrePaciente" placeholder="Digite Aqui" class="form-control" disabled>
                                            </div>
                                        </div>
                                        <%-- 1- Nombre de la madre--%>
                                        <div class="control-group">
                                            <label for="lblnombremadre" class="control-label col-sm-2">
                                                Nombre de la Madre</label>
                                            <div class="controls">
                                                <input type="text" name="txtNombreMadre" id="txtNombreMadre" placeholder="Digite Aqui" class="form-control" disabled>
                                            </div>
                                        </div>
                                        <%-- 2- Celular de la Madre--%>
                                        <div class="control-group">
                                            <label for="lblCelularmadre" class="control-label col-sm-2">
                                                Celular</label>
                                            <div class="controls">
                                                <input type="text" name="txtCelulareMadre" id="txtCelulareMadre" class="input-block-level mask_phone"
                                                    placeholder="(999) 999-9999">
                                            </div>
                                        </div>
                                        <%-- 3- Telefono de Residencia--%>
                                        <div class="control-group">
                                            <label for="lblTelefonoResidenciamadre" class="control-label col-sm-2">
                                                Telefono de Residencia</label>
                                            <div class="controls">
                                                <input type="text" name="txtTelefonoResidenciamadre" id="txtTelefonoResidenciamadre" class="input-block-level mask_phone"
                                                    placeholder="(999) 999-9999">
                                            </div>
                                        </div>
                                        <%-- 4- Telefono Trabajo--%>
                                        <div class="control-group">
                                            <label for="lblTelefonoTrabajomadre" class="control-label col-sm-2">
                                                Telefono Trabajo</label>
                                            <div class="controls">
                                                <input type="text" name="txtTelefonoTrabajomadre" id="txtTelefonoTrabajomadre" class="input-block-level mask_phone" placeholder="(999) 999-9999">
                                            </div>
                                        </div>
                                        <%-- 5- Telefono Trabajo--%>
                                        <div class="control-group">
                                            <label for="lblparticipantes" class="control-label col-sm-2">
                                                Correo Electronico Madre</label>
                                            <div class="controls">
                                                <input type="text" name="txtparticipantesotros" id="txtCorreoMadre" class="input-block-level mask_phone"
                                                    placeholder="(999) 999-9999">
                                            </div>
                                        </div>

                                    </div>
                                    <%--DATOS PERSONALES DEL PADRE--%>
                                    <div class="col-sm-4">
                                        <%-- 1- No. Expediente y Edad--%>
                                        <div class="control-group">
                                            <label for="lblExpedienteNo" class="control-label col-sm-2">
                                                Expediente: 
                                                <br>
                                                <br>
                                                Edad: 
                                            </label>
                                            <%--<label for="lblEdad" class="control-label col-sm-2" >
                                                Edad:</label>--%>
                                            <div class="controls">
                                                <input type="text" name="txtExpedienteNo" id="txtExpedienteNo" placeholder="Digite Aqui" class="form-control" disabled>
                                                <input type="text" name="txtEdad" id="txtEdad" placeholder="Digite Aqui" class="form-control" disabled>
                                            </div>
                                        </div>

                                        <%-- 1- Nombre del padre--%>
                                        <div class="control-group">
                                            <label for="lblnombrepadre" class="control-label col-sm-2">
                                                Nombre del Padre</label>
                                            <div class="controls">
                                                <input type="text" name="txtNombrepadre" id="txtNombrepadre" placeholder="Digite Aqui" class="form-control" disabled>
                                            </div>
                                        </div>
                                        <%-- 2- Celular del padre--%>
                                        <div class="control-group">
                                            <label for="lblCelularpadre" class="control-label col-sm-2">
                                                Celular</label>
                                            <div class="controls">
                                                <input type="text" name="txtCelularepadre" id="txtCelularepadre" class="input-block-level mask_phone"
                                                    placeholder="(999) 999-9999">
                                            </div>
                                        </div>
                                        <%-- 3- Telefono de Residencia--%>
                                        <div class="control-group">
                                            <label for="lblTelefonoResidenciapadre" class="control-label col-sm-2">
                                                Telefono de Residencia</label>
                                            <div class="controls">
                                                <input type="text" name="txtTelefonoResidenciapadre" id="txtTelefonoResidenciapadre" class="input-block-level mask_phone"
                                                    placeholder="(999) 999-9999">
                                            </div>
                                        </div>
                                        <%-- 4- Telefono Trabajo--%>
                                        <div class="control-group">
                                            <label for="lblTelefonoTrabajopadre" class="control-label col-sm-2">
                                                Telefono Trabajo</label>
                                            <div class="controls">
                                                <input type="text" name="txtTelefonoTrabajopadre" id="txtTelefonoTrabajopadre" class="input-block-level mask_phone"
                                                    placeholder="(999) 999-9999">
                                            </div>
                                        </div>
                                        <%-- 5- Telefono Trabajo--%>
                                        <div class="control-group">
                                            <label for="lblcorreopadre" class="control-label col-sm-2">
                                                Correo Electronico Padre</label>
                                            <div class="controls">
                                                <input type="text" name="txtcorreopadre" id="txtcorreopadre" class="input-block-level mask_phone"
                                                    placeholder="(999) 999-9999">
                                            </div>
                                        </div>

                                    </div>
                                    <%--DATOS PERSONALES DEL TUTOR--%>
                                    <div class="col-sm-4">
                                        <%-- 1-Diagnostico--%>
                                        <div class="control-group">
                                            <label for="lblDiagnosticoPaciente" class="control-label col-sm-2">
                                                Diagnostico</label>
                                            <div class="controls">
                                                <input type="text" name="txtDiagnosticoPaciente" id="txtDiagnosticoPaciente" placeholder="Digite Aqui" class="form-control" disabled>
                                            </div>
                                        </div>
                                        <%-- 1- Nombre del TUTOR--%>
                                        <div class="control-group">
                                            <label for="lblnombreTutor" class="control-label col-sm-2">
                                                Nombre del Tutor</label>
                                            <div class="controls">
                                                <input type="text" name="txtNombreTutor" id="txtNombreTutor" placeholder="Digite Aqui" class="form-control" disabled>
                                            </div>
                                        </div>
                                        <%-- 2- Celular del Tutor--%>
                                        <div class="control-group">
                                            <label for="lblCelularTutor" class="control-label col-sm-2">
                                                Celular</label>
                                            <div class="controls">
                                                <input type="text" name="txtCelulareTutor" id="txtCelulareTutor" class="input-block-level mask_phone"
                                                    placeholder="(999) 999-9999">
                                            </div>
                                        </div>
                                        <%-- 3- Telefono de Tutor--%>
                                        <div class="control-group">
                                            <label for="lblTelefonoResidenciaTutor" class="control-label col-sm-2">
                                                Telefono de Residencia</label>
                                            <div class="controls">
                                                <input type="text" name="txtTelefonoResidenciaTutor" id="txtTelefonoResidenciaTutor" class="input-block-level mask_phone"
                                                    placeholder="(999) 999-9999">
                                            </div>
                                        </div>
                                        <%-- 4- Telefono Trabajo--%>
                                        <div class="control-group">
                                            <label for="lblTelefonoTrabajoTutor" class="control-label col-sm-2">
                                                Telefono Tutor</label>
                                            <div class="controls">
                                                <input type="text" name="txtTelefonoTrabajoTutor" id="txtTelefonoTrabajoTutor" class="input-block-level mask_phone"
                                                    placeholder="(999) 999-9999">
                                            </div>
                                        </div>
                                        <%-- 5- Telefono Trabajo--%>
                                        <div class="control-group">
                                            <label for="lblcorreoTutor" class="control-label col-sm-2">
                                                Correo Electronico Tutor</label>
                                            <div class="controls">
                                                <input type="text" name="txtcorreoTutor" id="txtcorreoTutor" class="input-block-level mask_phone"
                                                    placeholder="(999) 999-9999">
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
        <%-- DATOS DE LA ENTREVISTA--%>
        <div class="row">
            <div class="col-sm-12">
                <div class="box box-color box-bordered">
                    <div class="box-title box-color">
                        <h3>
                            <i class="fa fa-list"></i>2. Datos de la Entrevista</h3>
                    </div>
                    <div>
                        <div class="box-content nopadding">
                            <div class='form-horizontal form-column form-bordered'>
                                <div class="row">
                                    <div class="col-sm-6">
                                        <%-- 1- Participantes--%>
                                        <div class="control-group">
                                            <label for="lblparticipantes" class="control-label col-sm-2">
                                                Participantes en la entrevista</label>
                                            <div class="controls">
                                                <div class="checkbox checkbox-primary col-lg-10">
                                                    <%--<asp:CheckBoxList ID="ckparticipantes" CellPadding="50" Font-Size="X-Small" CellSpacing="100"
                                                    RepeatColumns="5" RepeatDirection="Horizontal" TextAlign="Right" runat="server"> --%>
                                                    <asp:CheckBoxList ID="ckparticipantes" RepeatColumns="4" RepeatDirection="Horizontal" TextAlign="Right" runat="server">
                                                    </asp:CheckBoxList>
                                                </div>
                                                <%-- <asp:CheckBoxList ID="ckparticipantes"  
                                                    RepeatColumns="5" runat="server"  CssClass="checkbox checkbox-primary">
                                                </asp:CheckBoxList>--%>
                                                <input type="text" name="txtparticipantesotros" id="txtparticipantesotros" placeholder="Digite Otros Aqui" class="form-control">
                                            </div>
                                        </div>
                                        <%--2- Personas a Cargo--%>
                                        <div class="control-group">
                                            <label for="lblpersonasacargo" class="control-label col-sm-2">
                                                Persona/s a cargo del cuidado del paciente</label>
                                            <div class="controls" style="text-align: left;">
                                                <div class="checkbox checkbox-primary col-lg-10">
                                                    <asp:CheckBoxList ID="ckpersonaCargo" CellPadding="3" Font-Size="X-Small" CellSpacing="50"
                                                        RepeatColumns="4" RepeatDirection="Horizontal" TextAlign="Right" runat="server">
                                                    </asp:CheckBoxList>
                                                </div>
                                                <input type="text" name="txtpersoncargootros" id="txtpersoncargootros" placeholder="Digite Otros Aqui" class="form-control">
                                                Comentarios:</label>
                                                <input type="text" name="txtComentariopersoncargootros" id="txtComentariopersoncargootros" placeholder="Digite Aqui" class="form-control">
                                            </div>
                                        </div>
                                        <%--3- Quien maneja la disciplina--%>
                                        <div class="control-group">
                                            <label for="lblmanejadisciplina" class="control-label col-sm-2">
                                                Quien maneja la disciplina del paciente?</label>
                                            <div class="controls" style="text-align: left;">
                                                <div class="checkbox checkbox-primary col-lg-10">
                                                    <asp:CheckBoxList ID="ckmanejadisciplina" CellPadding="3" Font-Size="X-Small" CellSpacing="50"
                                                        RepeatColumns="4" RepeatDirection="Horizontal" TextAlign="Right" runat="server">
                                                    </asp:CheckBoxList>
                                                </div>
                                                <input type="text" name="txtmanejadisciplina1" id="txtmanejadisciplina1" placeholder="Digite Otros Aqui" class="form-control">
                                                Comentarios:</label>
                                                <input type="text" name="txtComentariomanejadisciplinaotros" id="txtComentariomanejadisciplinaotros" placeholder="Digite Aqui" class="form-control">
                                            </div>
                                        </div>
                                        <%--4- Cual es el estilo de crianza? Porque?--%>
                                        <div class="control-group">
                                            <label for="lblmanejadisciplina" class="control-label col-sm-2">
                                                Cual es el estilo de crianza? Porque?</label>
                                            <div class="controls">
                                                <asp:DropDownList ID="ddestilocrianza" runat="server" CssClass="select2-me input-block-level"
                                                    data-rule-required="true" AutoPostBack="True">
                                                </asp:DropDownList>
                                                Comentarios:</label>
                                                <input type="text" name="txtComentariomanejadisciplinaotros" id="txtComentariomanejadisciplinaotros" placeholder="Digite Aqui" class="form-control">
                                            </div>
                                        </div>
                                        <%--5-Estado Civil--%>
                                        <div class="control-group">
                                            <label for="lblEstadoCivil" class="control-label col-sm-2">
                                                Estado Civil de los padres:</label>
                                            <div class="controls">
                                                <asp:DropDownList ID="ddEstadoCivil" runat="server" CssClass="select2-me input-block-level"
                                                    data-rule-required="true" AutoPostBack="True">
                                                </asp:DropDownList>
                                                Otros:</label>
                                                <input type="text" name="txtestadocivilotros" id="txtestadocivilotros" placeholder="Digite Aqui" class="form-control">
                                            </div>
                                        </div>
                                        <%--6-Estructura Familiar--%>
                                        <div class="control-group">
                                            <label for="lblEstructuraFamiliar" class="control-label col-sm-2">
                                                Estructura Familiar:</label>
                                            <div class="controls">
                                                <asp:DropDownList ID="ddEstructuraFamiliar" runat="server" CssClass="select2-me input-block-level"
                                                    data-rule-required="true" AutoPostBack="True">
                                                </asp:DropDownList>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-sm-6">
                                        <%--7-Personas que viven en casa:--%>
                                        <div class="control-group">
                                            <label for="lblpersonavivencasa" class="control-label col-sm-2">
                                                Personas que viven en casa:</label>
                                            <div class="controls" style="text-align: left;">
                                                <div class="checkbox checkbox-primary col-lg-10">
                                                    <asp:CheckBoxList ID="ckpersonavivenencasa" CellPadding="3" Font-Size="X-Small" CellSpacing="50"
                                                        RepeatColumns="4" RepeatDirection="Horizontal" TextAlign="Right" runat="server">
                                                    </asp:CheckBoxList>
                                                </div>
                                                <input type="text" name="lblpersonavivenencasa" id="lblpersonavivenencasa" placeholder="Digite Otros Aqui" class="form-control">
                                            </div>
                                        </div>
                                        <%--8-Relacion entre los padres:--%>
                                        <div class="control-group">
                                            <label for="lblrelacionentrepadres" class="control-label col-sm-2">
                                                Relacion entre los padres:</label>
                                            <div class="controls">
                                                <asp:DropDownList ID="ddlrelacionpadres" runat="server" CssClass="select2-me input-block-level"
                                                    data-rule-required="true" AutoPostBack="True">
                                                </asp:DropDownList>
                                                Otros:</label>
                                                <input type="text" name="txtddlrelacionpadresotros" id="txtddlrelacionpadresotros" placeholder="Digite Aqui" class="form-control">
                                            </div>
                                        </div>
                                        <%--9-Relacionpacientemadre--%>
                                        <div class="control-group">
                                            <label for="lblrelacinopacientemadre" class="control-label col-sm-2">
                                                Relacion del paciente con la madre/madrastra:</label>
                                            <div class="controls">
                                                <asp:DropDownList ID="ddlrelacionpacientemadre" runat="server" CssClass="select2-me input-block-level"
                                                    data-rule-required="true" AutoPostBack="True">
                                                </asp:DropDownList>
                                                Otros:</label>
                                                <input type="text" name="txtrelacionpacientemadreOtros" id="txtrelacionpacientemadreOtros" placeholder="Digite Aqui" class="form-control">
                                                Comentarios:</label>
                                                <input type="text" name="txtrelacionpacientemadreComentario" id="txtrelacionpacientemadreComentario" placeholder="Digite Aqui" class="form-control">
                                            </div>
                                        </div>
                                        <%--10-Relacionpacientepadre--%>
                                        <div class="control-group">
                                            <label for="lblrelacinopacientepadre" class="control-label col-sm-2">
                                                Relacion del paciente con la padre/padrastro:</label>
                                            <div class="controls">
                                                <asp:DropDownList ID="ddrelacinopacientepadre" runat="server" CssClass="select2-me input-block-level"
                                                    data-rule-required="true" AutoPostBack="True">
                                                </asp:DropDownList>
                                                Otros:</label>
                                                <input type="text" name="txtrelacionpacientepadreOtros" id="txtrelacionpacientepadreOtros" placeholder="Digite Aqui" class="form-control">
                                                Comentarios:</label>
                                                <input type="text" name="txtrelacionpacientepadreComentario" id="txtrelacionpacientepadreComentario" placeholder="Digite Aqui" class="form-control">
                                            </div>
                                        </div>
                                        <%--11-RelacionpacienteCuidador--%>
                                        <div class="control-group">
                                            <label for="lblrelacinopacienteCuidador" class="control-label col-sm-2">
                                                Relacion del paciente con otro cuidador:</label>
                                            <div class="controls">
                                                <asp:DropDownList ID="ddlrelacionpacientecuidador" runat="server" CssClass="select2-me input-block-level"
                                                    data-rule-required="true" AutoPostBack="True">
                                                </asp:DropDownList>
                                                Otros:</label>
                                                <input type="text" name="txtrelacionpacientecuidadorOtros" id="txtrelacionpacientecuidadorOtros" placeholder="Digite Aqui" class="form-control">
                                                Comentarios:</label>
                                                <input type="text" name="txtrelacionpacientecuidadorComentario" id="txtrelacionpacientecuidadorComentario" placeholder="Digite Aqui" class="form-control">
                                            </div>
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="box-content nopadding">
                            <div class="row">
                                <div class="control-group">
                                    <div class="col-sm-12">
                                        <div class="box-title box-color col-lg-12">
                                            <h3>
                                                <i class="fa fa-list"></i>Hermanos</h3>
                                        </div>
                                    </div>
                                    <%--12-Hermanos--%>
                                    <div class="container-fluid">
                                        <div class="col-sm-6">
                                            <label>Cuantos?:</label>
                                            <input type="text" name="txthermanosCuantos" id="txthermanosCuantos" placeholder="Digite Aqui" class="form-control">
                                        </div>

                                        <div class="col-sm-6">
                                            <label>Causa:</label>
                                            <input type="text" name="txthermanosCausa" id="txthermanosCausa" placeholder="Digite Aqui" class="form-control">
                                        </div>
                                    </div>
                                    <%--13-Datos generales de Hermanos--%>
                                    <div class="container-fluid">
                                        <label for="lbldatoshermanos" class="control-label col-sm-12">Datos generales de Hermanos:</label>
                                        <div class="controls">

                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%-- DIAGNOSTICO--%>
        <div class="row">
            <div class="col-sm-12">
                <div class="box box-color box-bordered">
                    <div class="box-title">
                        <h3>
                            <i class="fa fa-list"></i>3. Historia del diagnostico, manejo familiar, escolar y de la comunidad, informaciones de interes</h3>
                    </div>
                    <div>
                        <div class="box-content nopadding">
                            <div class='form-horizontal form-column form-bordered'>
                                <div class="row">
                                    <div class="col-sm-6">
                                        <%--1-Hace que tiempo le informaron--%>
                                        <div class="control-group">
                                            <label for="lblhacequetiempo" class="control-label col-sm-2">
                                                Hace que tiempo le informacion del diagnostico? Impacto y manejo de la condicion en los padres, cambios y acomodaciones realizadas:</label>
                                            <div class="controls">
                                                <textarea runat="server" name="txthacequetiempoleinformacion" id="txthacequetiempoleinformacion" rows="8" class="input-block-level" data-rule-required="true" placeholder="Digite Aqui"></textarea>
                                            </div>
                                        </div>
                                        <%--2-Impacto y manejo de la condicion--%>
                                        <div class="control-group">
                                            <label for="lblimpactoymanejo" class="control-label col-sm-2">
                                                Impacto y manejo de la condicion en los familiares y comunidad:</label>
                                            <div class="controls">
                                                <textarea runat="server" name="txtimpactoymanejo" id="txtimpactoymanejo" rows="8" class="input-block-level" data-rule-required="true" placeholder="Digite Aqui"></textarea>
                                            </div>
                                        </div>
                                        <%-- Situaciones especiales dentro del ambito escolar--%>
                                        <div class="control-group">
                                            <label for="lblsituacionesespeciales" class="control-label col-sm-2">
                                                Situaciones especiales dentro del ambito escolar</label>
                                            <div class="controls" style="text-align: left;">
                                                <div class="checkbox checkbox-primary col-lg-12">
                                                    <asp:CheckBoxList ID="cksituacionesespeciales" CellPadding="3" Font-Size="X-Small" CellSpacing="50"
                                                        RepeatColumns="2" RepeatDirection="Horizontal" TextAlign="Right" runat="server">
                                                    </asp:CheckBoxList>
                                                </div>
                                            </div>
                                        </div>
                                        <%--Conducta e interaccion de el/la--%>
                                        <div class="control-group">
                                            <label for="lblconductaeinteraccion" class="control-label col-sm-2">
                                                Conducta e interaccion de el/la niño/a con su grupo de pares:</label>
                                            <div class="controls">
                                                <asp:DropDownList ID="ddconductaeinteraccion" runat="server" CssClass="select2-me input-block-level"
                                                    data-rule-required="true" AutoPostBack="True">
                                                </asp:DropDownList>
                                                Otros:</label>
                                                <input type="text" name="txtconductaeinteraccionotros" id="txtconductaeinteraccionotros" placeholder="Digite Aqui" class="form-control">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-sm-6">
                                        <%--Conducta e interaccion de el/la nino con su grupo de adultos--%>
                                        <div class="control-group">
                                            <label for="lblconductaeinteraccion" class="control-label col-sm-2">
                                                Conducta e interaccion de el/la niño/a con su grupo de adultos:</label>
                                            <div class="controls">
                                                <asp:DropDownList ID="ddconductaeinteraccionadultos" runat="server" CssClass="select2-me input-block-level"
                                                    data-rule-required="true" AutoPostBack="True">
                                                </asp:DropDownList>
                                                Otros:</label>
                                                <input type="text" name="txtconductaeinteraccionadultosotros" id="txtconductaeinteraccionadultosotros" placeholder="Digite Aqui" class="form-control">
                                            </div>
                                        </div>
                                        <%-- Expectativas actuales de los familiares--%>
                                        <div class="control-group">
                                            <label for="lblexpectativasactuales" class="control-label col-sm-2">
                                                Expectativas actuales de los familiares acerca de la condicion</label>
                                            <div class="controls">
                                                <textarea runat="server" name="expectativasactuales" id="Textarea2" rows="8" class="input-block-level" data-rule-required="true" placeholder="Digite Aqui"></textarea>
                                            </div>
                                        </div>
                                        <%-- Objectivos terapeuticos planteados--%>
                                        <div class="control-group">
                                            <label for="lblobjectivosterapeuticos" class="control-label col-sm-2">
                                                Objectivos terapeuticos planteados por la familia:</label>
                                            <div class="controls">
                                                <textarea runat="server" name="txtobjectivosterapeuticos" id="txtobjectivosterapeuticos" rows="8" class="input-block-level" data-rule-required="true" placeholder="Digite Aqui"></textarea>
                                            </div>
                                        </div>
                                        <%-- Que es para ustedes calidad de vida familiar?--%>
                                        <div class="control-group">
                                            <label for="lblqueescalidadvida" class="control-label col-sm-2">
                                                Que es para ustedes calidad de vida familiar?</label>
                                            <div class="controls">
                                                <textarea runat="server" name="txtqueescalidadvida" id="txtqueescalidadvida" rows="8" class="input-block-level" data-rule-required="true" placeholder="Digite Aqui"></textarea>
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
        <%-- PLAN DE INTERVENCION--%>
        <div class="row">
            <div class="col-sm-12">
                <div class="box box-color box-bordered">
                    <div class="box-title">
                        <h3>
                            <i class="fa fa-list"></i>4. Plan de intervencion</h3>
                    </div>
                    <div>
                        <div class="box-content nopadding">
                            <div class='form-horizontal form-column form-bordered'>
                                <div class="row">
                                    <div class="col-sm-6">
                                        <%-- Problemas identificados por el terapeuta--%>
                                        <div class="control-group">
                                            <label for="lblproblemasidentificados" class="control-label col-sm-2">
                                                Problemas identificados por el terapeuta con sus respectivas evidencias</label>
                                            <div class="controls" style="text-align: left;">
                                                <div class="checkbox checkbox-primary col-lg-12">
                                                    <asp:CheckBoxList ID="ckproblemasidentificados" CellPadding="3" Font-Size="X-Small" CellSpacing="50"
                                                        RepeatColumns="2" RepeatDirection="Horizontal" TextAlign="Right" runat="server">
                                                    </asp:CheckBoxList>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-sm-6">
                                        <%-- Objetivos terapeuticos planteados por el terapeuta--%>
                                        <div class="control-group">
                                            <label for="lblobjetivosplanteados" class="control-label col-sm-2">
                                                Objetivos terapeuticos planteados por el terapeuta</label>
                                            <div class="controls" style="text-align: left;">
                                                <div class="checkbox checkbox-primary col-lg-12">
                                                    <asp:CheckBoxList ID="ckobjetivosplanteados" CellPadding="3" Font-Size="X-Small" CellSpacing="50"
                                                        RepeatColumns="2" RepeatDirection="Horizontal" TextAlign="Right" runat="server">
                                                    </asp:CheckBoxList>
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
        <%-- TAREAS--%>
        <div class="row">
            <div class="col-sm-12">
                <div class="box box-color box-bordered">
                    <div class="box-title">
                        <h3>
                            <i class="fa fa-list"></i>5. Tareas</h3>
                    </div>
                    <div>
                        <div class="box-content nopadding">
                            <div class='form-horizontal form-column form-bordered'>
                                <div class="row">
                                    <div class="col-sm-12">
                                        <%-- tareas--%>
                                        <div class="control-group">
                                            <label for="lbltareas" class="control-label col-sm-2">
                                                Tareas:</label>
                                            <div class="controls">
                                                <textarea runat="server" name="txttareas" id="txttareas" rows="4" class="input-block-level" data-rule-required="true" placeholder="Digite Aqui"></textarea>
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
        <%-- Conducta de/los participantes durante la sesion.--%>
        <div class="row">
            <div class="col-sm-12">
                <div class="box box-color box-bordered">
                    <div class="box-title">
                        <h3>
                            <i class="fa fa-list"></i>6. Conducta de/los participantes durante la sesion.</h3>
                    </div>
                    <div>
                        <div class="box-content nopadding">
                            <div class='form-horizontal form-column form-bordered'>
                                <div class="row">
                                    <div class="col-sm-12">
                                        <%-- Conducta de/los participantes durante la sesion.--%>
                                        <div class="control-group">
                                            <label for="lblproblemasidentificados" class="control-label col-sm-2">
                                                Conducta de/los participantes durante la sesion.</label>
                                            <div class="controls">
                                                <asp:DropDownList ID="ddConductaparticipantesensession" runat="server" CssClass="select2-me input-block-level"
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
        <%-- Comentarios generales del terapeuta--%>
        <div class="row">
            <div class="col-sm-12">
                <div class="box box-color box-bordered">
                    <div class="box-title">
                        <h3>
                            <i class="fa fa-list"></i>7. Comentarios generales del terapeuta</h3>
                    </div>
                    <div>
                        <div class="box-content nopadding">
                            <div class='form-horizontal form-column form-bordered'>
                                <div class="row">
                                    <div class="col-sm-12">
                                        <%-- Comentarios generales del terapeuta--%>
                                        <div class="control-group">
                                            <label for="lblComentarios" class="control-label col-sm-2">
                                            </label>
                                            <div class="controls">
                                                <textarea runat="server" name="txtComentarios" id="txtComentarios" rows="4" class="input-block-level" data-rule-required="true" placeholder="Digite Aqui"></textarea>
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
        <%-- INFORMACION CONFIDENCIAL--%>
        <div class="row">
            <div class="col-sm-12">
                <div class="box box-color box-bordered">
                    <div class="box-title box-color">
                        <h3><i class="fa fa-list"></i>8. Informacion Confidencial</h3>
                    </div>
                    <div>
                        <div class="box-content nopadding">
                            <div class='form-horizontal form-column form-bordered'>
                                <div class="row">
                                    <%-- DATOS RELEVANTES DE LOS PADRES--%>
                                    <div class="col-sm-6">
                                        <%--2. Paciente con sospecha de maltrato:--%>
                                        <div class="control-group">
                                            <label for="lblpacientesospechamaltrato" class="control-label col-sm-2">
                                                Paciente con sospecha de maltrato:</label>
                                            <div class="controls">
                                                <asp:DropDownList ID="ddpacientesospechamaltrato" runat="server" CssClass="select2-me input-block-level"
                                                    data-rule-required="true" AutoPostBack="True">
                                                    <asp:ListItem>-- SELECCIONE --</asp:ListItem>
                                                    <asp:ListItem>SI</asp:ListItem>
                                                    <asp:ListItem>NO</asp:ListItem>
                                                </asp:DropDownList>
                                                Comentarios:
                                                <input type="text" name="txtpacientesospechamaltratoComentarios" id="txtpacientesospechamaltratoComentarios" placeholder="Digite Aqui" class="form-control">
                                            </div>
                                        </div>
                                        <%--3. Familia en proceso legal:--%>
                                        <div class="control-group">
                                            <label for="lblfamiliaenproceso" class="control-label col-sm-2">
                                                Familia en proceso legal:</label>
                                            <div class="controls">
                                                <asp:DropDownList ID="ddfamiliaenproceso" runat="server" CssClass="select2-me input-block-level"
                                                    data-rule-required="true" AutoPostBack="True">
                                                    <asp:ListItem>-- SELECCIONE --</asp:ListItem>
                                                    <asp:ListItem>SI</asp:ListItem>
                                                    <asp:ListItem>NO</asp:ListItem>
                                                </asp:DropDownList>
                                                Motivo:
                                                <input type="text" name="txtfamiliaenprocesoComentarios" id="txtfamiliaenprocesoComentarios" placeholder="Digite Aqui" class="form-control">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-sm-6">
                                        <%-- 4. Posibles problematicas que ha generado el diagnostico--%>
                                        <div class="control-group">
                                            <label for="lblposiblesproblematicas" class="control-label col-sm-2">
                                                Posibles problematicas que ha generado el diagnostico:</label>
                                            <div class="controls">
                                                <textarea runat="server" name="txtposiblesproblematicas" id="txtposiblesproblematicas" rows="4" class="input-block-level" data-rule-required="true" placeholder="Digite Aqui"></textarea>
                                            </div>
                                        </div>
                                        <%--5. Situaciones que generan malestar en la pareja-familia:--%>
                                        <div class="control-group">
                                            <label for="lblsituacionesquegeneran" class="control-label col-sm-2">
                                                Situaciones que generan malestar en la pareja-familia:</label>
                                            <div class="controls">
                                                <asp:DropDownList ID="ddsituacionesquegeneran" runat="server" CssClass="select2-me input-block-level"
                                                    data-rule-required="true" AutoPostBack="True">
                                                </asp:DropDownList>
                                                Otros:
                                                <input type="text" name="txtsituacionesquegeneranotros" id="txtsituacionesquegeneranotros" placeholder="Digite Aqui" class="form-control">
                                                Comentarios:
                                                <input type="text" name="txtsituacionesquegeneranComentarios" id="txtsituacionesquegeneranComentarios" placeholder="Digite Aqui" class="form-control">
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
        <%-- INFORMACION RELEVANTES SOBRE LOS PADRES--%>
        <div class="row">
            <div class="col-sm-12">
                <div class="box box-color box-bordered">
                    <div class="box-title box-color">
                        <h3>
                            <i class="fa fa-list"></i>Informacion relevantes sobre los padres</h3>
                    </div>
                    <div>
                        <div class="box-content nopadding">
                            <div class='form-horizontal form-column form-bordered'>
                                <div class="row">
                                    <%-- INFORMACION DE LA MADRE--%>
                                    <div class="col-sm-6">
                                        <%--2. Datos relevantes sobre la madre:--%>
                                        <div class="control-group">
                                            <div class="controls">
                                                <label for="lblDatosrelevantesmadre">
                                                    DATOS RELEVANTES SOBRE LA MADRE:</label>
                                                </br>
                                                  <label for="lblDatosrelevantesmadre">
                                                      Informacion de la Madre:</label>
                                            </div>
                                        </div>
                                        <div class="control-group">
                                            <label for="lblAntecedentesMedicosMadre" class="control-label col-sm-2">
                                                Antecedentes de Medicos:</label>
                                            <div class="controls">
                                                <asp:DropDownList ID="ddAntecedentesMedicosMadre" runat="server" CssClass="select2-me input-block-level"
                                                    data-rule-required="true" AutoPostBack="True">
                                                    <asp:ListItem>-- SELECCIONE --</asp:ListItem>
                                                    <asp:ListItem>SI</asp:ListItem>
                                                    <asp:ListItem>NO</asp:ListItem>
                                                </asp:DropDownList>
                                                Especifique:
                                                <input type="text" name="txtAntecedentesMedicosMadreEspecifique" id="txtAntecedentesMedicosMadreEspecifique" placeholder="Digite Aqui" class="form-control">
                                            </div>
                                        </div>
                                        <%--2. Diagnostico o sospecha de trastorno Mental:--%>
                                        <div class="control-group">
                                            <label for="lblDiagnosticoosospechatrastorno" class="control-label col-sm-2">
                                                Diagnostico o sospecha de trastorno Mental:</label>
                                            <div class="controls">
                                                <div class="checkbox checkbox-primary col-lg-12">
                                                    <asp:CheckBoxList ID="ckDiagnosticoTranstornoMental" CellPadding="50" Font-Size="X-Small" CellSpacing="50"
                                                        RepeatColumns="2" RepeatDirection="Horizontal" TextAlign="Right" runat="server">
                                                    </asp:CheckBoxList>
                                                </div>
                                                <input type="text" name="txtDiagnosticoosospechatrastornootros" id="txtDiagnosticoosospechatrastornootros" placeholder="Digite Otros Aqui" class="form-control">
                                            </div>
                                        </div>
                                        <%--Recibe Tratamiento psicologico:--%>
                                        <div class="control-group">
                                            <label for="lblRecibeTratamientopsicologico" class="control-label col-sm-2">
                                                Recibe Tratamiento psicologico:</label>
                                            <div class="controls">
                                                <asp:DropDownList ID="ddtxtRecibeTratamientopsicologico" runat="server" CssClass="select2-me input-block-level"
                                                    data-rule-required="true" AutoPostBack="True">
                                                    <asp:ListItem>-- SELECCIONE --</asp:ListItem>
                                                    <asp:ListItem>SI</asp:ListItem>
                                                    <asp:ListItem>NO</asp:ListItem>
                                                </asp:DropDownList>
                                                Motivo:
                                                <input type="text" name="txtRecibeTratamientopsicologicomotivo" id="txtRecibeTratamientopsicologicomotivo" placeholder="Digite Aqui" class="form-control">
                                                Profesional/institucion que le asiste:
                                                <input type="text" name="txtRecibeTratamientopsicologicoProfesional" id="txtRecibeTratamientopsicologicoProfesional" placeholder="Digite Aqui" class="form-control">
                                            </div>
                                        </div>
                                        <%--Recibe Tratamiento psiquiatrico:--%>
                                        <div class="control-group">
                                            <label for="lblRecibeTratamientopsiquiatrico" class="control-label col-sm-2">
                                                Recibe Tratamiento psiquiatrico:</label>
                                            <div class="controls">
                                                <asp:DropDownList ID="ddTratamientopsiquiatrico" runat="server" CssClass="select2-me input-block-level"
                                                    data-rule-required="true" AutoPostBack="True">
                                                    <asp:ListItem>-- SELECCIONE --</asp:ListItem>
                                                    <asp:ListItem>SI</asp:ListItem>
                                                    <asp:ListItem>NO</asp:ListItem>
                                                </asp:DropDownList>
                                                Motivo:
                                                <input type="text" name="txtRecibeTratamientopsiquiatricomotivo" id="txtRecibeTratamientopsiquiatricomotivo" placeholder="Digite Aqui" class="form-control">
                                                Profesional/institucion que le asiste:
                                                <input type="text" name="txtRecibeTratamientopsiquiatricoProfesional" id="txtRecibeTratamientopsiquiatricoProfesional" placeholder="Digite Aqui" class="form-control">
                                            </div>
                                        </div>
                                        <%--Antecedentes drogodependientes:--%>
                                        <div class="control-group">
                                            <label for="lblAntecedentesdrogodependientes" class="control-label col-sm-2">
                                                Antecedentes drogodependientes:</label>
                                            <div class="controls">
                                                <div class="checkbox checkbox-primary col-lg-10">
                                                    <asp:CheckBoxList ID="ckAntecedentesdrogodependientes" CellPadding="50" Font-Size="X-Small" CellSpacing="50"
                                                        RepeatColumns="1" RepeatDirection="Horizontal" TextAlign="Right" runat="server">
                                                    </asp:CheckBoxList>
                                                </div>
                                                <input type="text" name="txtAntecedentesdrogodependientes" id="txtAntecedentesdrogodependientes" placeholder="Digite Otros Aqui" class="form-control">
                                            </div>
                                        </div>
                                        <%--Otras informaciones de interes:--%>
                                        <div class="control-group">
                                            <label for="lblotrasinfdeinteresMadre" class="control-label col-sm-2">
                                                Otras informaciones de interes::</label>
                                            <div class="controls">
                                                <textarea runat="server" name="txthacequetiempoleinformacion" id="Textarea1" rows="8" class="input-block-level" data-rule-required="true" placeholder="Digite Aqui"></textarea>
                                            </div>
                                        </div>
                                    </div>
                                    <%-- INFORMACION DEL PADRE--%>
                                    <div class="col-sm-6">
                                        <%--2. Datos relevantes sobre la Padre:--%>
                                        <div class="control-group">
                                            <div class="controls">
                                                <label for="lblDatosrelevantespadre">
                                                    DATOS RELEVANTES SOBRE LA PADRE:</label>
                                                </br>
                                                  <label for="lblDatosrelevantespadre">
                                                      Informacion de la Padre:</label>
                                            </div>
                                        </div>
                                        <%--2. Antecedentes Medicos padre:--%>
                                        <div class="control-group">
                                            <label for="lblAntecedentesMedicospadre" class="control-label col-sm-2">
                                                Antecedentes Medicos Padre:</label>
                                            <div class="controls">
                                                <asp:DropDownList ID="ddAntecedentesMedicospadre" runat="server" CssClass="select2-me input-block-level"
                                                    data-rule-required="true" AutoPostBack="True">
                                                    <asp:ListItem>-- SELECCIONE --</asp:ListItem>
                                                    <asp:ListItem>SI</asp:ListItem>
                                                    <asp:ListItem>NO</asp:ListItem>
                                                </asp:DropDownList>
                                                Especifique:
                                                <input type="text" name="txtAntecedentesMedicospadreEspecifique" id="txtAntecedentesMedicospadreEspecifique" placeholder="Digite Aqui" class="form-control">
                                            </div>
                                        </div>
                                        <%--2. Diagnostico o sospecha de trastorno Mental:--%>
                                        <div class="control-group">
                                            <label for="lblDiagnosticoosospechatrastornopadre" class="control-label col-sm-2">
                                                Diagnostico o sospecha de trastorno Mental:</label>
                                            <div class="controls">
                                                <div class="checkbox checkbox-primary col-lg-12">
                                                    <asp:CheckBoxList ID="ckDiagnosticoosospechatrastornopadre" CellPadding="3" Font-Size="X-Small" CellSpacing="50"
                                                        RepeatColumns="2" RepeatDirection="Horizontal" TextAlign="Right" runat="server">
                                                    </asp:CheckBoxList>
                                                </div>
                                                <input type="text" name="txtDiagnosticoosospechatrastornopadreotros" id="txtDiagnosticoosospechatrastornopadreotros" placeholder="Digite Aqui" class="form-control">
                                            </div>
                                        </div>
                                        <%--Recibe Tratamiento psicologico:--%>
                                        <div class="control-group">
                                            <label for="lblRecibeTratamientopsicologicopadre" class="control-label col-sm-2">
                                                Recibe Tratamiento psicologico:</label>
                                            <div class="controls">
                                                <asp:DropDownList ID="ddRecibeTratamientopsicologicopadre" runat="server" CssClass="select2-me input-block-level"
                                                    data-rule-required="true" AutoPostBack="True">
                                                    <asp:ListItem>-- SELECCIONE --</asp:ListItem>
                                                    <asp:ListItem>SI</asp:ListItem>
                                                    <asp:ListItem>NO</asp:ListItem>
                                                </asp:DropDownList>
                                                Motivo:
                                                <input type="text" name="txtRecibeTratamientopsicologicopadremotivo" id="txtRecibeTratamientopsicologicopadremotivo" placeholder="Digite Aqui" class="form-control">
                                                Profesional/institucion que le asiste:
                                                <input type="text" name="txtRecibeTratamientopsicologicopadreProfesional" id="txtRecibeTratamientopsicologicopadreProfesional" placeholder="Digite Aqui" class="form-control">
                                            </div>
                                        </div>
                                        <%--Recibe Tratamiento psiquiatrico:--%>
                                        <div class="control-group">
                                            <label for="lblRecibeTratamientopsiquiatricopadre" class="control-label col-sm-2">
                                                Recibe Tratamiento psiquiatrico:</label>
                                            <div class="controls">
                                                <asp:DropDownList ID="ddRecibeTratamientopsiquiatricopadre" runat="server" CssClass="select2-me input-block-level"
                                                    data-rule-required="true" AutoPostBack="True">
                                                    <asp:ListItem>-- SELECCIONE --</asp:ListItem>
                                                    <asp:ListItem>SI</asp:ListItem>
                                                    <asp:ListItem>NO</asp:ListItem>
                                                </asp:DropDownList>
                                                Motivo:
                                                <input type="text" name="txtRecibeTratamientopsiquiatricopadremotivo" id="txtRecibeTratamientopsiquiatricopadremotivo" placeholder="Digite Aqui" class="form-control">
                                                Profesional/institucion que le asiste:
                                                <input type="text" name="txtRecibeTratamientopsiquiatricopadreProfesional" id="txtRecibeTratamientopsiquiatricopadreProfesional" placeholder="Digite Aqui" class="form-control">
                                            </div>
                                        </div>
                                        <%--Antecedentes drogodependientes:--%>
                                        <div class="control-group">
                                            <label for="lblAntecedentesdrogodependientespadre" class="control-label col-sm-2">
                                                Antecedentes drogodependientes:</label>
                                            <div class="controls">
                                                <div class="checkbox checkbox-primary col-lg-12">
                                                    <asp:CheckBoxList ID="ckAntecedentesdrogodependientespadre" CellPadding="3" Font-Size="X-Small" CellSpacing="50"
                                                        RepeatColumns="1" RepeatDirection="Horizontal" TextAlign="Right" runat="server">
                                                    </asp:CheckBoxList>
                                                </div>
                                                Otros:
                                                <input type="text" name="txtAntecedentesdrogodependientespadre" id="txtAntecedentesdrogodependientespadre" placeholder="Digite Aqui" class="form-control">
                                            </div>
                                        </div>
                                        <%--Otras informaciones de interes:--%>
                                        <div class="control-group">
                                            <label for="lblotrasinfdeinterespadre" class="control-label col-sm-2">
                                                Otras informaciones de interes:</label>
                                            <div class="controls">
                                                <textarea runat="server" name="txthacequetiempoleinformacionPadre" id="txthacequetiempoleinformacionPadre" rows="8" class="input-block-level" data-rule-required="true" placeholder="Digite Aqui"></textarea>
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
</asp:Content>

