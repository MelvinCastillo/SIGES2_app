<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true"
    CodeBehind="DiagnosticoInstitucional.aspx.cs" Inherits="CAID_V2.forms.DiagnosticoInstitucional" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">
    <asp:Panel runat="server" ID="pnlData">
        <script src="../js/notify.js" type="text/javascript"></script>
        <script src="../js/notify.min.js" type="text/javascript"></script>
        <script type="text/javascript">
            function notify(MSG, tipo) {
                $.notify(MSG, tipo);
            }
        </script>

        <div class="box box-bordered">
            <div class="box-title">
                <h3>
                    <i class="icon-edit"></i>Impresión Diagnostica</h3>
            </div>
            <div class="box-content nopadding">
                <div class='form-horizontal form-bordered'>
                    <!-- Tipo de Reporte -->
                    <div class="control-group">
                        <label for="CmbPaciente12" class="control-label" style="color: Red">
                            Paciente</label>
                        <div class="controls">
                            <input type="text" name="txtNombrePaciente" id="txtNombrePaciente" placeholder="Digite Aqui" class='input-block-level' disabled runat="server" cssclass="input-xxlarge">
                        </div>
                    </div>

                    <!-- Diagnostico 1 -->
                    <div class="control-group">
                        <label for="lblViaContacto" class="control-label" style="color: black">
                            Diagnostico principal</label>
                        <div class="controls">
                            <asp:DropDownList ID="CmbDiagnostico1" runat="server" CssClass="select2-me input-xxlarge"
                                data-rule-required="true">
                            </asp:DropDownList>

                        </div>
                    </div>
                    <!-- Diagnostico 2 -->
                    <div class="control-group">
                        <label for="lblMotivo" class="control-label" style="color: black">
                            Comorbilidad</label>
                        <div class="controls">
                            <asp:DropDownList ID="CmbDiagnostico2" runat="server" CssClass="select2-me input-xxlarge"
                                data-rule-required="true">
                            </asp:DropDownList>
                        </div>
                    </div>
                    <div class="control-group">
                        <label for="txtDiagnosticoOtros" class="control-label">Diagnostico Otros</label>
                        <div class="controls" style="text-align: center;">
                            <asp:TextBox ID="txtDiagnosticoOtros" runat="server" TextMode="MultiLine" Height="150px"
                                Wrap="true" placeholder="Diagnostico Otros" CssClass="input-block-level"></asp:TextBox>
                        </div>
                    </div>

                    <div class="control-group">
                        <label for="lblacciones" class="control-label">
                            Acciones</label>
                        <div class="controls" style="text-align: left;">
                            <button type="submit" id="btnPrint" runat="server" class="btn content-refresh btn-primary" onserverclick="_Save">
                                <i class="icon-search"></i>&nbsp Guardar</button>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </asp:Panel>

</asp:Content>
