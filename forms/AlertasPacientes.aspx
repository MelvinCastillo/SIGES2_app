<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true"
    CodeBehind="AlertasPacientes.aspx.cs" Inherits="CAID_V2.forms.AlertasPacientes" %>

<%--Acto Médico: Anamnesis--%>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <script src="../js/notify.js" type="text/javascript"></script>
    <script src="../js/notify.min.js" type="text/javascript"></script>
    <script type="text/javascript">
        function notify(MSG, tipo) {
            $.notify(MSG, tipo);
        }
    </script>

    <div class="row-fluid">
        <asp:Repeater ID="rpPaxHeader" runat="server">
            <ItemTemplate>
                <%# Eval("HTML")%>
            </ItemTemplate>
        </asp:Repeater>
    </div>
       <asp:Panel  ID="tabsearchpaciente" runat="server">
                    <div class='form-horizontal form-bordered'  >
                    <!-- Tipo de Reporte -->
                    <div class="box box-bordered" >
                        <div class="box-title"  >
                            <div class="row-fluid">
                                <label for="CmbPaciente12" id="CmbPaciente12" runat="server" class="control-label" style="color: Black; text-align: center">
                                    <strong>PACIENTE </strong>
                                </label>
                                <input runat="server" type="text" name="txtRecordNo" id="txtRecordNo" class="input-medium">
                                <%-- <br />--%>
                                <%-- <div class="row-fluid">--%>
                                <asp:DropDownList ID="cmbPaciente" runat="server" CssClass="select2-me input-xxlarge"
                                    data-rule-required="true" AutoPostBack="false">
                                </asp:DropDownList>
                                <button type="button" id="btnFilter2" runat="server" onserverclick="_Search2" class="btn btn-blue"
                                    validationgroup="pnlSearch">
                                    <i class="icon-search"></i>&nbsp Buscar Record</button>

                            </div>
                        </div>
                    </div>
                    <%--</div>--%>
                </div>
        </asp:Panel>
    <div class="row-fluid">
        <div class="span12"> 
            <div class="box box-bordered">
                <div class="box-title" >
                    <h3>
                        <i class="icon-edit"></i>Registro de Referimientos 
                    </h3>
                    <div class="actions">
                        <button type="button" id="tbnAdd" runat="server" onserverclick="_Add" validationgroup="pnlEdit"
                            class="btn" data-dismiss="modal">
                            <i class="icon-plus-sign"></i>&nbsp Añadir</button>
                        <button type="button" id="btnBack" runat="server" onserverclick="_Back" class="btn">
                            <i class="icon-arrow-left"></i>&nbsp Regresar</button>
                    </div>
                </div> 
                  <div class='form-horizontal form-bordered'>
                <div class="box-content nopadding">
                    <table class="table table-bordered dataTable  dataTable-tools table-responsive ">
                        <thead>
                            <tr>
                                <th>No.
                                </th>
                                <th style="width: 1%;">Fecha y Hora
                                </th>
                                <th >Especialista
                                </th>
                                <th >Actividad
                                </th>

                                 <th>Acciones
                                        </th>
                                <th>Asistio?
                                </th> 
                                  <th style="width: 1%;">Detalles
                                </th>
                                <th style="display: none;"> 
                                </th> 
                            </tr>
                        </thead>
                        <tbody>
                            <asp:Repeater ID="rpHistorico" runat="server">
                                <ItemTemplate>
                                    <tr>
                                        <th>
                                            <%# Eval("NUMERO")%>
                                        </th>
                                        <td>
                                            <%# Eval("FECHA")%>&nbsp<%# Eval("HORA")%>
                                        </td>
                                        <td>
                                            <%# Eval("TERAPEUTA")%> <br>
                                            <%# Eval("ESPECIALIDAD")%>
                                        </td>
                                        <td>
                                            <%# Eval("ACTIVIDAD")%>
                                        </td>

                                          <td>
                                                    <asp:LinkButton ID="btnDelete" CssClass="btn btn-red" runat="server" Text="Eliminar"
                                                        CommandArgument='<%# Eval("ROWGUID")%>' CommandName="Delete" OnClick="_Select"
                                                        OnClientClick="return confirm('¿Está seguro que desea eliminar este referimiento?');"></asp:LinkButton>
                                           </td>

                                        <td id="_ddlasistio" runat="server">
                                            <asp:DropDownList ID="ddlasistio" CssClass="input-small" runat="server" SelectedValue='<%# Eval("ASISTIO")%>' AutoPostBack="True" OnSelectedIndexChanged="ddlasistio_SelectedIndexChanged">
                                                <asp:ListItem Value="">N/A</asp:ListItem>
                                                <asp:ListItem Value="S">SI</asp:ListItem>
                                                <asp:ListItem Value="N">NO</asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                      <td >
                                            <%# Eval("ALERTA")%>
                                        </td>
                                        <td style="display: none;">
                                            <asp:Label ID="lblCODIGO" runat="server" Text='<%# Eval("ROWGUID")%>'></asp:Label></td> 
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

    <%--Modal: Mantenimiento--%>
    <asp:Panel CssClass="modal" ID="MNTAUXILIAR" runat="server" Visible="false">
        <div class="box  box-bordered">
            <div class='form-horizontal form-bordered'>
                <div class="box-title">
                    <h3>Referimientos
                    </h3>
                    <div class="actions">
                        <button id="btnCloseMSG" runat="server" onserverclick="_CloseModal" aria-hidden="true"
                            class="close" data-dismiss="modal" type="button">
                            x</button>
                    </div>
                </div>
                <div class="modal-body nopadding">
                    <div class="control-group">
                        <label for="txtACTIVIDAD" class="control-label">
                            Actividad</label>
                        <div class="controls">
                            <asp:TextBox ID="txtACTIVIDAD" runat="server"
                                Wrap="true" placeholder="Digite aquí" CssClass="input-block-level"></asp:TextBox>
                        </div>
                    </div>
                    <div class="control-group">
                        <label for="txtEVALUACION" class="control-label">
                            Detalles</label>
                        <div class="controls">
                            <asp:TextBox ID="txtAlertas" runat="server" TextMode="MultiLine" Height="100px"
                                Wrap="true" placeholder="Digite aquí" CssClass="input-block-level"></asp:TextBox>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" id="btnSaveNotas" runat="server" onserverclick="_Save" validationgroup="pnlData"
                        class="btn btn-primary" data-dismiss="modal">
                        <i class="icon-save"></i>&nbsp Guardar</button>
                </div>
            </div>
        </div>
    </asp:Panel>
    <%--Sombra--%>
    <div id="MainShadow" runat="server">
    </div>
</asp:Content>
