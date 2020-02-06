<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true"
    CodeBehind="EstatusPruebasPendietesPX.aspx.cs" Inherits="CAID_V2.forms.EstatusPruebasPendietesPX" %>

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
                    <i class="icon-edit"></i>Estatus Pruebas Pendientes</h3>
            </div>
            <div class="box-content nopadding">
                <div class='form-horizontal form-bordered'>
                    <!-- Tipo de Reporte -->
                    <div class="control-group">
                        <label for="CmbPaciente12" class="control-label" style="color: Red">
                            Paciente</label>
                        <div class="controls">
                            <input type="text" name="txtNombrePaciente" id="txtNombrePaciente" placeholder="Digite Aqui" class='input-block-level' disabled runat="server" CssClass="input-xxlarge">
                        </div>
                    </div>

                    <!-- Estatus Pruebas Pendientes-->
                    <div class="control-group">
                        <label for="lblViaContacto" class="control-label" style="color: black">
                            Estatus</label>
                        <div class="controls"> 
                            <asp:DropDownList ID="CmbEstatus" runat="server" CssClass="select2-me input-xxlarge"
                                data-rule-required="true">
                                <asp:ListItem Value="">-- SELECCIONE --</asp:ListItem>
                                <asp:ListItem Value="PENDIENTE PRUEBAS MEDICAS">PENDIENTE PRUEBAS MEDICAS</asp:ListItem>
                                 <asp:ListItem Value="COMPLETADO">COMPLETADO</asp:ListItem>
                            </asp:DropDownList>

                        </div>
                    </div> 
                     <div class="control-group">
                                    <label for="txtCualesPruebas" class="control-label" style="color: Red">
                                        Indique Cuales Pruebas</label>
                                    <div class="controls">
                                        <textarea runat="server" name="txtCualesPruebas" id="txtCualesPruebas" rows="5" class="input-block-level"></textarea>

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
