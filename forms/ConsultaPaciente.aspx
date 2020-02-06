<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true"
    CodeBehind="ConsultaPaciente.aspx.cs" Inherits="CAID_V2.forms.ConsultaPaciente" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">
    <%-- <form id="form1" runat="server">--%>

    <asp:Panel runat="server" ID="pnlData">
        <%--<script src="../js/bootstrap.min.js" type="text/javascript"></script>--%>
        <script src="../js/plugins/select2/select2.min.js" type="text/javascript"></script>
        <script src="../js/plugins/maskedinput/jquery.maskedinput.min.js" type="text/javascript"></script>
        <script src="../js/plugins/datepicker/bootstrap-datepicker.js" type="text/javascript"></script>

        <%--<link href="../css/bootstrap.min.css" rel="stylesheet" type="text/css" />--%>
        <link rel="stylesheet" href="../css/plugins/select2/select2.css" />
        <link rel="stylesheet" href="../css/style.css" />
        <link rel="stylesheet" href="../css/themes.css" />
        <link href="../css/bootstrap.min2.css" rel="stylesheet" />

        <script type="text/javascript">
            function AllowFormToRun() {
                var MyEventValidation = $("#__EVENTVALIDATION");

                if (MyEventValidation.length == 0 || MyEventValidation.val() == "") {
                    alert("Por favor espera a que la pagina cargue completamente.");
                    return false;
                }

                return true;
            }
        </script>
        <div class="row-fluid">
            <div class="span12">
                <div class="box box-color box-bordered">
                    <div class="box-title">
                        <h3><i class="icon-user"></i>Consulta de Pacientes</h3>
                        <h5 style="text-align: right; color: white;"><i class="icon-calendar"></i>
                            <strong>FECHA MODIFICACION: &nbsp<asp:Label ID="lblfechamodificacion" runat="server" Text=""></asp:Label></strong> </h5>
                    </div> 
                </div> 
            </div>
        </div>
        <div class="row-fluid">
            <%-- <div class="span12">--%>
            <div class="box box-bordered">
                <%-- <div class="box-content nopadding">--%>
                <div class='form-horizontal  form-column  form-bordered'>
                    <!-- Tipo de Reporte -->
                    <div class="box  box-color box-bordered">
                        <div class="box-content nopadding">
                            <div class="control-group">
                                <div class="col-sm-12">
                                    <div class="control-group">
                                        <%-- <div class="span8">--%>
                                        <label for="CmbPaciente12" class="control-label" style="color: Black">
                                            <strong>PACIENTE</strong></label>
                                        <div class="controls">
                                            <asp:DropDownList ID="DPPaciente" runat="server" class='input-block-level select2-me input-xlarge'
                                                data-rule-required="true">
                                            </asp:DropDownList>
                                            <asp:RequiredFieldValidator ControlToValidate="DPPaciente" Display="Dynamic" ErrorMessage="Requerido!"
                                                ID="DPPaciente1" runat="server" SetFocusOnError="True" ValidationGroup="pnlData" />
                                            <%--        <div style="vertical-align: center">--%>
                                            <button type="submit" id="btnPrint" runat="server" class="btn content-refresh btn-blue" onserverclick="_Show">
                                                <i class="icon-search"></i>&nbsp Buscar</button>
                                            <%--<a href='javascript:history.go(-1)' class="btn"><i class="icon-arrow-left"></i>&nbsp--%>
                                            <a href='http://caidsiges01:8000/index.aspx' class="btn"><i class="icon-arrow-left"></i>&nbsp  Regresar</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="control-group">

                                <div class="col-sm-6">
                                    <!-- Género -->
                                    <div class="control-group">
                                        <label for="cmbSexo" class="control-label" style="color: black">
                                            <strong>Sexo</strong></label>
                                        <div class="controls">
                                            <select runat="server" id="cmbSexo" name="cmbSexo" class='select2-me input-xlarge'
                                                data-rule-required="true">
                                                <option value="">-- SELECCIONE --</option>
                                                <option value="M">MASCULINO</option>
                                                <option value="F">FEMENINO</option>
                                            </select>
                                            <br />
                                            <%--                                   <asp:RequiredFieldValidator ControlToValidate="cmbSexo" Display="Dynamic" ErrorMessage="Requerido!"
                                        ID="valcmbSexo" runat="server" SetFocusOnError="True" ValidationGroup="pnlData" />--%>
                                        </div>
                                    </div>
                                    <!-- EDAD -->
                                    <div class="control-group">
                                        <label for="lbledad" class="control-label" style="color: black">
                                            <strong>Edad</strong></label>
                                        <div class="controls">
                                            <label for="lbledad12" class="control-label" style="color: black">
                                                <strong>
                                                    <asp:Label ID="lbledad1" runat="server" Text=""></asp:Label></strong></label>
                                            <br />
                                        </div>
                                    </div>
                                    <!-- NSS -->
                                    <div class="control-group">
                                        <label for="txtNSS" class="control-label" style="color: black">
                                            <strong># Seguridad Social</strong></label>
                                        <div class="controls">
                                            <input runat="server" name="txtNSS" id="txtNSS" type="text" class='input-xlarge'
                                                data-rule-required="true" />
                                            <br />
                                            <%--                                   <asp:RequiredFieldValidator ControlToValidate="txtNSS" Display="Dynamic" ErrorMessage="Requerido!"
                                        ID="valtxtNSS" runat="server" SetFocusOnError="True" ValidationGroup="pnlData" />--%>
                                        </div>
                                    </div>
                                    <!-- Fecha Nacimiento -->
                                    <div class="control-group">
                                        <label for="txtFechaNace" class="control-label" style="color: black">
                                            <strong>Fecha de Nacimiento</strong></label>
                                        <div class="controls">
                                            <input runat="server" name="txtFechaNace" id="txtFechaNace" type="text" class="input-medium datepick"
                                                data-rule-required="true" placeholder="mm/dd/aaaa">
                                            <br />
                                            <asp:RequiredFieldValidator ControlToValidate="txtFechaNace" Display="Dynamic" ErrorMessage="Requerido!"
                                                ID="valtxtFechaNace" runat="server" SetFocusOnError="True" ValidationGroup="pnlData" />
                                        </div>
                                    </div>
                                    <!-- Categoria -->
                                    <div class="control-group">
                                        <label for="lblCategoria" class="control-label" style="color: black">
                                            <strong>Categoria</strong></label>
                                        <div class="controls">
                                            <input runat="server" name="txtCategoria" id="txtCategoria" type="text" class='input-xlarge'
                                                data-rule-required="true" />
                                            <br />
                                        </div>
                                    </div>
                                    <!-- País -->
                                    <div class="control-group">
                                        <label for="cmbPais" class="control-label" style="color: black">
                                            <strong>País de Nacimiento</strong></label>
                                        <div class="controls">
                                            <asp:DropDownList ID="cmbPais" runat="server" CssClass="select2-me input-block-level"
                                                data-rule-required="true" AutoPostBack="True">
                                                <%--OnSelectedIndexChanged="cmbPais_SelectedIndexChanged"--%>
                                            </asp:DropDownList>
                                            <br />
                                            <asp:RequiredFieldValidator ControlToValidate="cmbPais" Display="Dynamic" ErrorMessage="Requerido!"
                                                ID="valcmbPais" runat="server" SetFocusOnError="True" ValidationGroup="pnlData" />
                                        </div>
                                    </div>
                                    <!-- Ciudad -->
                                    <div class="control-group">
                                        <label for="cmbCiudad" class="control-label" style="color: black">
                                            <strong>Ciudad de Nacimiento</strong></label>
                                        <div class="controls">
                                            <select runat="server" id="cmbCiudad" name="cmbCiudad" class='select2-me input-block-level'
                                                data-rule-required="true">
                                            </select>
                                            <br />
                                            <asp:RequiredFieldValidator ControlToValidate="cmbCiudad" Display="Dynamic" ErrorMessage="Requerido!"
                                                ID="valcmbCiudad" runat="server" SetFocusOnError="True" ValidationGroup="pnlData" />
                                        </div>
                                    </div>
                                    <!-- Condición -->
                                    <div class="control-group">
                                        <label for="cmbCondicion" class="control-label" style="color: black">
                                            <strong>Condición</strong></label>
                                        <div class="controls">
                                            <select runat="server" id="cmbCondicion" name="cmbCondicion" class='select2-me input-xlarge'
                                                data-rule-required="true">
                                                <option value="">-- SELECCIONE --</option>
                                                <option value="1">HIJO(A) BIOLOGICO(A)</option>
                                                <option value="2">HIJO(A) ADOPTIVO(A)</option>
                                                <option value="3">HIJO(A) DE CRIANZA</option>
                                            </select>
                                            <br />
                                            <asp:RequiredFieldValidator ControlToValidate="cmbCondicion" Display="Dynamic" ErrorMessage="Requerido!"
                                                ID="valcmbCondicion" runat="server" SetFocusOnError="True" ValidationGroup="pnlData" />
                                        </div>
                                    </div>
                                    <!-- Estatus Pacientes -->
                                    <div class="control-group">
                                        <label for="EstatusPaciente" class="control-label" style="color: black">
                                            <strong>Estatus Paciente</strong></label>
                                        <div class="controls">
                                            <input runat="server" name="TxtEstatusPaciente" id="TxtEstatusPaciente" type="text"
                                                class="input-block-level" placeholder="Estatus Paciente ..." data-rule-required="true">
                                            <br />
                                        </div>
                                    </div>
                                    <!-- Diagnóstico 1 -->
                                    <div class="control-group">
                                        <label for="cmbDIAGNOSTICO1" class="control-label" style="color: black">
                                            <strong>Diagnóstico 1</strong></label>
                                        <div class="controls">
                                            <select runat="server" id="cmbDIAGNOSTICO1" name="cmbDIAGNOSTICO1" class='select2-me input-block-level'
                                                data-rule-required="true">
                                            </select>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <!-- Reside Con -->
                                    <div class="control-group">
                                        <label for="cmbResideCon" class="control-label" style="color: black">
                                            <strong>Reside con</strong></label>
                                        <div class="controls">
                                            <select runat="server" id="cmbResideCon" name="cmbResideCon" class='select2-me input-block-level'
                                                data-rule-required="true">
                                                <option value="">-- SELECCIONE --</option>
                                                <option value="1">AMBOS PADRES</option>
                                                <option value="2">MADRE</option>
                                                <option value="3">PADRE</option>
                                                <option value="4">TUTOR</option>
                                            </select>
                                            <input runat="server" name="txtResideCon" id="txtResideCon" type="text" class="input-block-level"
                                                placeholder="Nombre" data-rule-required="true">
                                            <br />
                                            <asp:RequiredFieldValidator ControlToValidate="cmbResideCon" Display="Dynamic" ErrorMessage="Requerido!"
                                                ID="valcmbResideCon" runat="server" SetFocusOnError="True" ValidationGroup="pnlData" />
                                        </div>
                                    </div>
                                    <!-- Cuidado Por -->
                                    <div class="control-group">
                                        <label for="cmbCuidadoPor" class="control-label" style="color: black">
                                            <strong>Cuidado por</strong></label>
                                        <div class="controls">
                                            <select runat="server" id="cmbCuidadoPor" name="cmbCuidadoPor" class='select2-me input-block-level'
                                                data-rule-required="true">
                                                <option value="">-- SELECCIONE --</option>
                                                <option value="1">AMBOS PADRES</option>
                                                <option value="2">MADRE</option>
                                                <option value="3">PADRE</option>
                                                <option value="4">TUTOR</option>
                                                <option value="5">OTRO</option>
                                            </select>
                                            <input runat="server" name="txtCuidadoPor" id="txtCuidadoPor" type="text" class="input-block-level"
                                                placeholder="Otro ..." data-rule-required="true">
                                            <br />
                                            <asp:RequiredFieldValidator ControlToValidate="cmbCuidadoPor" Display="Dynamic" ErrorMessage="Requerido!"
                                                ID="valcmbCuidadoPor" runat="server" SetFocusOnError="True" ValidationGroup="pnlData" />
                                        </div>
                                    </div>
                                    <!-- ARS -->
                                    <div class="control-group">
                                        <label for="cmbARS" class="control-label" style="color: black">
                                            <strong>Aseguradora</strong></label>
                                        <div class="controls">
                                            <select runat="server" id="cmbARS" name="cmbARS" class='select2-me input-block-level'
                                                data-rule-required="true">
                                            </select>
                                            <br />
                                            <asp:RequiredFieldValidator ControlToValidate="cmbARS" Display="Dynamic" ErrorMessage="Requerido!"
                                                ID="valcmbARS" runat="server" SetFocusOnError="True" ValidationGroup="pnlData" />
                                        </div>
                                    </div>
                                    <!-- Pre-Diagnóstico -->
                                    <div class="control-group">
                                        <label for="cmbPREDIAGNOSTICO" class="control-label" style="color: black">
                                            <strong>Pre-Diagnóstico</strong></label>
                                        <div class="controls">
                                            <select runat="server" id="cmbPREDIAGNOSTICO" name="cmbPREDIAGNOSTICO" class='select2-me input-block-level'
                                                data-rule-required="true">
                                            </select>
                                            <input runat="server" name="txtOtrosPrediagnostico" id="txtOtrosPrediagnostico" type="text"
                                                class="input-block-level" placeholder="Otro ..." data-rule-required="true">
                                            <br />
                                            <asp:RequiredFieldValidator ControlToValidate="cmbPREDIAGNOSTICO" Display="Dynamic"
                                                ErrorMessage="Requerido!" ID="valcmbPREDIAGNOSTICO" runat="server" SetFocusOnError="True"
                                                ValidationGroup="pnlData" />
                                        </div>
                                    </div>
                                    <!-- Categoria Paciente -->
                                    <div class="control-group">
                                        <label for="cmbCategoria" class="control-label" style="color: black">
                                            <strong>Categoría</strong></label>
                                        <div class="controls">
                                            <select runat="server" id="cmbCategoria" name="cmbCategoria" class='select2-me input-block-level'
                                                data-rule-required="true">
                                            </select>
                                            <br />
                                            <asp:RequiredFieldValidator ControlToValidate="cmbCategoria" Display="Dynamic" ErrorMessage="Requerido!"
                                                ID="valcmbCategoria" runat="server" SetFocusOnError="True" ValidationGroup="pnlData" />
                                        </div>
                                    </div>
                                    <!-- Agente Servicio Social -->
                                    <div class="control-group">
                                        <label for="cmbagenteservicio" class="control-label" style="color: black">
                                            <strong>Agente Servicio Social</strong></label>
                                        <div class="controls">
                                            <input runat="server" name="TxtAgenteServicioSocial" id="TxtAgenteServicioSocial" type="text"
                                                class="input-block-level" placeholder="Agente Servicio Social ..." data-rule-required="true">
                                            <br />
                                        </div>
                                    </div>
                                    <!-- Mptivo Estatus -->
                                    <div class="control-group">
                                        <label for="MotivoEstatus" class="control-label" style="color: black">
                                            <strong>Motivo Estatus</strong></label>
                                        <div class="controls">
                                            <textarea runat="server" name="TxtMotivoEstatus" id="TxtMotivoEstatus" rows="2" class="input-block-level" data-rule-required="true" placeholder="Digite Aqui"></textarea>

                                        </div>
                                    </div>
                                    <!-- Diagnóstico 2 -->
                                    <div class="control-group">
                                        <label for="cmbDIAGNOSTICO2" class="control-label" style="color: black">
                                            <strong>Diagnóstico 2</strong></label>
                                        <div class="controls">
                                            <select runat="server" id="cmbDIAGNOSTICO2" name="cmbDIAGNOSTICO2" class='select2-me input-block-level'
                                                data-rule-required="true">
                                            </select>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <%-- </div>--%>
            </div>
            <%-- </div>--%>
        </div>

        <div class="row-fluid">
            <%--<div class="span12">
                <div class="box box-bordered">--%>
            <%--<div class="row-fluid">--%>
            <%--<div class="box-content nopadding">--%>
            <%--<div class='form-horizontal form-column form-bordered'>
                <div class="box  box-color box-bordered">
                      <div class="box-content nopadding">

                    </div>
                </div>
            </div> --%>


            <%--DIRECCIONES--%>
            <div class='form-horizontal form-column form-bordered'>
                <div class="box  box-color box-bordered">
                    <div class="box-title">
                        <h3>
                            <i class="icon-table"></i>Direcciones
                        </h3>
                    </div>
                    <div class="box-content nopadding">
                        <div class="control-group">
                            <%-- <asp:Panel CssClass="modal" ID="SMX00100" runat="server" Visible="true">--%>
                            <%--  <div class='form-horizontal'>--%>
                            <%--    <div class="box-content">--%>
                            <div class="col-sm-6">
                                <div class="control-group">
                                    <label for="txtDirDireccion" class="control-label">
                                        Dirección</label>
                                    <div class="controls">
                                        <input type="text" runat="server" name="txtDirDireccion" id="txtDirDireccion" class="input-block-level">
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label for="cmbDirPais" class="control-label">
                                        <strong>País</strong>
                                    </label>
                                    <div class="controls">
                                        <asp:DropDownList ID="cmbDirPais" runat="server" CssClass="select2-me input-block-level"
                                            data-rule-required="true" AutoPostBack="True">
                                        </asp:DropDownList>
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label for="cmbDirProvincia" class="control-label">
                                        <strong>Provincia</strong>
                                    </label>
                                    <div class="controls">
                                        <asp:DropDownList ID="cmbDirProvincia" runat="server" CssClass="select2-me input-block-level"
                                            data-rule-required="true" AutoPostBack="True">
                                        </asp:DropDownList>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="control-group">
                                    <label for="cmbDirMunicipio" class="control-label">
                                        <strong>Municipio</strong>
                                    </label>
                                    <div class="controls">
                                        <asp:DropDownList ID="cmbDirMunicipio" runat="server" CssClass="select2-me input-block-level"
                                            data-rule-required="true" AutoPostBack="True">
                                        </asp:DropDownList>
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label for="cmbDirSector" class="control-label">
                                        <strong>Sector</strong>
                                    </label>
                                    <div class="controls">
                                        <select runat="server" id="cmbDirSector" name="cmbDirSector" class='select2-me input-block-level'
                                            data-rule-required="true">
                                        </select>
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label for="cmbDirZona" class="control-label">
                                        <strong>Zona</strong>
                                    </label>
                                    <div class="controls">
                                        <select runat="server" id="cmbDirZona" name="cmbDirZona" class='select2-me input-block-level'
                                            data-rule-required="true">
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <%--  </div>--%>
                            <%-- </asp:Panel>--%>
                        </div>
                    </div>
                </div>
            </div>
            <%--TELEFONOS--%>
            <%--<div class='form-horizontal form-column form-bordered'>--%>
            <div class="tab-pane" id="tabtelefonos">
                <div class="box  box-color box-bordered">
                    <div class="box-title">
                        <h3>
                            <i class="icon-phone"></i>Teléfonos
                        </h3>
                    </div>
                    <%--<h5 class="control-list">Teléfonos
                                    </h5>--%>
                    <div class="control-group">
                        <div class="box-content nopadding">
                            <div class="col-sm-6">
                                <div class="control-group">
                                    <label for="txtDirTel1" class="control-label">
                                        <strong>Teléfono 1</strong>
                                    </label>
                                    <div class="controls">
                                        <input type="text" runat="server" name="txtDirTel1" id="txtDirTel1" class="input-block-level mask_phone"
                                            placeholder="(999) 999-9999">
                                        <select runat="server" id="cmbPropietarioTel1" name="cmbPropietarioTel1" class='select2-me input-block-level'>
                                        </select>
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label for="txtDirTel2" class="control-label">
                                        <strong>Teléfono 2</strong></label>
                                    <div class="controls">
                                        <input type="text" runat="server" name="txtDirTel2" id="txtDirTel2" class="input-block-level mask_phone"
                                            placeholder="(999) 999-9999">
                                        <select runat="server" id="cmbPropietarioTel2" name="cmbPropietarioTel2" class='select2-me input-block-level'>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="control-group">
                                    <label for="txtDirTel3" class="control-label">
                                        <strong>Teléfono 3</strong></label>
                                    <div class="controls">
                                        <input type="text" runat="server" name="txtDirTel3" id="txtDirTel3" class="input-block-level mask_phone"
                                            placeholder="(999) 999-9999">
                                        <select runat="server" id="cmbPropietarioTel3" name="cmbPropietarioTel3" class='select2-me input-block-level'>
                                        </select>
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label for="txtDirTel4" class="control-label">
                                        <strong>Teléfono 4</strong></label>
                                    <div class="controls">
                                        <input type="text" runat="server" name="txtDirTel4" id="txtDirTel4" class="input-block-level mask_phone"
                                            placeholder="(999) 999-9999">
                                        <select runat="server" id="cmbPropietarioTel4" name="cmbPropietarioTel4" class='select2-me input-block-level'>
                                        </select>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
            <%--Formulario NUCLEO FAMILIAR--%>
            <div class="box  box-color box-bordered">
                <div class="box-title">
                    <h3>
                        <i class="icon-book"></i>Nucleo Familiar
                    </h3>
                </div>
                <div class="control-group">
                    <div class="tab-pane" id="tabNucleoFam2">
                        <div class="box-content nopadding">
                            <table class="table table-bordered dataTable-scroll-x">
                                <thead>
                                    <tr>
                                        <th>NOMBRE
                                        </th>
                                        <th>AFILIACION
                                        </th>
                                        <th>PARENTESCO
                                        </th>
                                        <th>EDAD
                                        </th>
                                        <th>SEXO
                                        </th>
                                        <th>ESCOLARIDAD
                                        </th>
                                        <th>OCUPACION
                                        </th>
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
                                                    <%# Eval("PARENTESCO")%>
                                                </td>
                                                <td>
                                                    <%# Eval("EDAD")%>
                                                </td>
                                                <td>
                                                    <%# Eval("SEXO")%>
                                                </td>
                                                <td>
                                                    <%# Eval("ESCOLARIDAD")%>
                                                </td>
                                                <td>
                                                    <%# Eval("OCUPACION")%>
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
            <%--Formulario CITA RECURRENTES--%>
            <div class="control-group">

                <div class="row-fluid">
                    <div class="span12">
                        <div class="box  box-color box-bordered">
                            <div class="box-title">
                                <h3>
                                    <i class="icon-book"></i>Citas Recurrentes
                                </h3>
                            </div>
                            <div class="box-content nopadding">
                                <table class="table table-bordered dataTable dataTable-scroll-x dataTable-tools dataTable-grouping">
                                    <thead>
                                        <tr>
                                            <th>Paciente </th>
                                            <th>Especialista </th>
                                            <th class="hidden-480">Horario
                                            </th>
                                            <th class="hidden-480">Semanas Faltantes
                                            </th>
                                            <th class="hidden-480">Estado
                                            </th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <asp:Repeater ID="rpCitasRecurrentes" runat="server">
                                            <ItemTemplate>
                                                <tr>
                                                    <td>
                                                        <%# Eval("RECORDID")%> &nbsp-&nbsp <%# Eval("FULLNAME")%>
                                                    </td>
                                                    <td>
                                                        <%# Eval("TERAPISTANOMBRE")%> &nbsp-&nbsp <%# Eval("ESPECIALIDAD")%>
                                                    </td>

                                                    <td class="hidden-480">
                                                        <%# Eval("DIA")%> &nbsp-&nbsp  <%# Convert.ToDateTime(Eval("HORAINI")).ToString("hh:mm tt") %>&nbsp-&nbsp<%# Convert.ToDateTime(Eval("HORAFIN")).ToString("hh:mm tt")%></td>
                                                    <td>
                                                        <%# Eval("SemanasFaltantes")%>
                                                    </td>
                                                    <td>
                                                        <%# Eval("CITAESTADO")%>  
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
            <%--Formulario tardanzas y ausencias--%>
            <div class="control-group">
                <div class="row-fluid">
                    <div class="box box-color  box-bordered">
                        <div class="box-title">

                            <h3><i class="icon-calendar"></i>Tardanzas y Ausencias</h3>
                        </div>
                        <div class="box-content nopadding">
                            <div class='form-horizontal form-bordered'>
                                <div class="control-group">
                                    <div class="box-content nopadding">
                                        <table class="table table-bordered dataTable dataTable-scroll-x dataTable-tools dataTable-grouping">
                                            <thead>
                                                <tr>
                                                    <th>Nombres y Apellidos
                                                    </th>
                                                    <th>Tipo
                                                    </th>
                                                    <th class="hidden-350">Es Justificada
                                                    </th>
                                                    <th class="hidden-350">Fecha
                                                    </th>
                                                    <th class="hidden-480">Quien Llamo
                                                    </th>
                                                    <th class="hidden-480">Motivo
                                                    </th>

                                                </tr>
                                            </thead>
                                            <tbody>
                                                <asp:Repeater ID="rpDataPaciente" runat="server">
                                                    <ItemTemplate>
                                                        <tr>
                                                            <td>
                                                                <%# Eval("FULLNAME")%>
                                                            </td>
                                                            <td>
                                                                <%# Eval("Tipo")%>
                                                            </td>
                                                            <td class="hidden-350">
                                                                <%# Eval("EsJustificada")%>
                                                            </td>
                                                            <td class="hidden-350">
                                                                <%# Eval("Fecha")%>
                                                            </td>
                                                            <td class="hidden-480">
                                                                <%# Eval("QuienLlamo")%>
                                                            </td>
                                                            <td class="hidden-480">
                                                                <%# Eval("MotivoDispensa")%>
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

            <%--DE ALTA PACIENTE SERVICIO--%>
            <div class="control-group">
                <div class="row-fluid">
                    <div class="box box-color box-bordered">
                        <div class="box-title">
                            <h3>
                                <i class="icon-check"></i>De Alta Servicio
                            </h3>
                        </div>
                        <div class="box-content nopadding">
                            <div class='form-horizontal form-bordered'>
                                <div class="control-group">
                                    <div class="box-content nopadding">
                                        <table class="table table-bordered dataTable dataTable-scroll-x dataTable-tools">
                                            <thead>
                                                <tr>
                                                    <th>Fecha
                                                    </th>
                                                    <th>Especialidad
                                                    </th>
                                                    <th class="hidden-350">Especialista
                                                    </th>
                                                    <th class="hidden-350">Comentario
                                                    </th>

                                                </tr>
                                            </thead>
                                            <tbody>
                                                <asp:Repeater ID="rpDataDEALTASERVICIO" runat="server">
                                                    <ItemTemplate>
                                                        <tr>
                                                            <td>
                                                                <%# Eval("ROWCDTE")%>
                                                            </td>
                                                            <td>
                                                                <%# Eval("ESPECIALIDADNOMBRE")%>
                                                            </td>
                                                            <td class="hidden-350">
                                                                <%# Eval("ESPECIALISTANOMBRE")%>
                                                            </td>
                                                            <td class="hidden-350">
                                                                <%# Eval("COMENTARIO")%>
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
            <!-- visualizar escolaridad -->
            <%--<div  style="width:100%; height:600">
                                    <label for="lblescolaridad" class="control-label" style="color: black">
                                        <strong>Escolaridad</strong></label>
                                    <div class="embed-responsive embed-responsive-16by9">
                                        <iframe id="frmEscolaridad" class="embed-responsive-item" src="" style="width: 100%;
                                            height: 200%;" frameborder="0"></iframe>
                                        <script type="text/javascript"> 
                                            document.getElementById("frmEscolaridad").setAttribute("src", "http://:11551/forms/Escolaridad.aspx")
                                        
                                        </script>
                                    </div>
                                </div>--%>
            <%-- </div>--%>
            <%--</div>--%>
            <%-- </div>
            </div>--%>
        </div>

    </asp:Panel>
</asp:Content>
