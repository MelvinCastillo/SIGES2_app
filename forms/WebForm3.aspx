<%--<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm3.aspx.cs" Inherits="CAID_V2.forms.WebForm3" %>--%>
<%--<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="<%--CancelacionesCitasMasivas.aspx.cs" Inherits="CAID_V2.forms.CancelacionesCitasMasivas" %>--%>
<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site1.Master" CodeBehind="WebForm3.aspx.cs" Inherits="CAID_V2.forms.WebForm3" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">
 
    <asp:Panel runat="server" ID="pnlData">  
            <div class="box box-bordered">
                <div class="box-title">
                    <h3>
                        <i class="icon-edit"></i>Cancelación Masiva de Citas Recurrentes</h3>
                    <div class="actions">
                        <button type="button" id="btnSave" runat="server" onserverclick="_Save" class="btn"
                            value="0" validationgroup="pnlData">
                            <i class="icon-save"></i>&nbsp Guardar</button>
                        <%--                        <button type="button" id="btnEditar" runat="server" onserverclick="_Editar" class="btn"
                            value="0" validationgroup="pnlData">
                        <i class="icon-edit"></i>&nbsp Actualizar</button>--%>
                        <button type="button" id="btnCancel" runat="server" onserverclick="_Cancel" class="btn">
                            <i class="icon-undo"></i>&nbsp Limpiar</button>
                        <button type="button" id="btnBack" runat="server" onserverclick="_Back2" class="btn">
                            <i class="icon-arrow-left"></i>&nbsp Regresar</button>
                    </div>
                </div>
                <div class="row-fluid">
                    <div class="box-content nopadding">
                        <div class='form-horizontal form-bordered'>
                            <%-- cmb Origen Tratamiento o Servicio --%>
                            <div class="control-group">
                                <label for="cmbOrigenTratamiento" class="control-label" style="color: Red">
                                    Servicio</label>
                                <div class="controls">
                                    <asp:DropDownList ID="cmbOrigenTratamiento" runat="server" CssClass="select2-me input-block-level"
                                        data-rule-required="true" AutoPostBack="True" OnSelectedIndexChanged="cmbOrigenTratamiento_SelectedIndexChanged">
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ControlToValidate="cmbOrigenTratamiento" Display="Dynamic"
                                        ErrorMessage="Requerido!" ID="RequiredFieldValidator3" runat="server" SetFocusOnError="True"
                                        ValidationGroup="pnlData" />
                                </div>
                            </div>
                            <%-- cmbTerapista --%>
                            <div class="control-group">
                                <label for="cmbTerapista" class="control-label" style="color: Red">
                                    Especialista</label>
                                <div class="controls">
                                    <asp:DropDownList ID="cmbTerapista" runat="server" CssClass="select2-me input-block-level"
                                        data-rule-required="true" AutoPostBack="True">
                                        <%--OnSelectedIndexChanged="cmbTerapista_SelectedIndexChanged"--%>
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ControlToValidate="cmbTerapista" Display="Dynamic" ErrorMessage="Requerido!"
                                        ID="RequiredFieldValidator5" runat="server" SetFocusOnError="True" ValidationGroup="pnlData" />
                                </div>
                            </div>
                            <!-- Rango de Fecha -->
                            <script type="text/javascript" src="../calendarscript/js/language/es-DO.js"></script>
                            <link href="../calendarscript/css/bootstrap.css" rel="stylesheet" />
                            <link href="../calendarscript/css/font-awesome.min.css" rel="stylesheet" />
                            <link href="../calendarscript/css/prettify-1.0.css" rel="stylesheet" />
                            <link href="../calendarscript/css/base.css" rel="stylesheet" />
                            <%--<script type="text/javascript" src="../calendarscript/js/respond.min.js"></script>--%>
                            <%--<link href="../calendarscript/css/bootstrap-datetimepicker.css" rel="stylesheet" />--%>
                            <%--<script type="text/javascript" src="../calendarscript/js/jquery-2.1.1.min.js"></script>--%>
                            <%--<script type="text/javascript" src="../calendarscript/js/bootstrap.min.js"></script>--%>
                            <%--<script type="text/javascript" src="../calendarscript/js/moment-with-locales.js"></script>--%>
                            <%--<script type="text/javascript" src="../calendarscript/js/bootstrap-datetimepicker.js"></script>--%>
                         
                        </div>
                    </div>
                </div>
            </div>
      
    </asp:Panel>
</asp:Content>
