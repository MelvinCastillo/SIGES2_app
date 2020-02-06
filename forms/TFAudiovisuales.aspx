<%--<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TFAudiovisuales.aspx.cs" Inherits="CAID_V2.forms.TFAudiovisuales" %>--%>

<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true"
    CodeBehind="TFAudiovisuales.aspx.cs" Inherits="CAID_V2.forms.TFAudiovisuales" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">
    <asp:HiddenField ID="xGUID" runat="server" />
    <%-- Consulta General --%>
    <asp:Panel runat="server" ID="pnlrecursos">
        <div class="box  box-bordered">
            <div class="box-title">
                <h3>
                    <i class="icon-calendar"></i>Herramientas y Recursos</h3>
                <div class="actions">
                    <button type="button" id="tbnAdd" runat="server" onserverclick="_Add" validationgroup="pnlEdit"
                        class="btn" data-dismiss="modal">
                        <i class="icon-plus-sign"></i>&nbsp Nuevo</button>
                    <a href="http://caidsiges01:8000/INDEX.ASPX" class="btn btn-default" data-dismiss="modal"><i class="icon-arrow-left btn"></i>Regresar</a>
                </div>
                <div class="actions">
                    <%--
                    <button type="button" id="btnBack" runat="server" onserverclick="_Back" class="btn">
                        <i class="icon-arrow-left"></i>&nbsp Regresar</button>--%>
                </div>
            </div>
            <div class="box-content nopadding">
                <div class='form-horizontal form-bordered'>
                    <!-- Opciones de Busqueda -->
                    <%-- <div class="control-group">
                        <label for="txtFecha1" class="control-label" style="color: Red">
                            Buscar</label>
                        <div class="controls">
                            <input runat="server" name="txtBuscar" id="txtBuscar" type="text" class='input-block-level'
                                placeholder="Nombres, Apellidos, Número de Record" data-rule-required="true" />
                        </div>
                    </div>
                    <div class="control-group">
                        <label for="lblbuscar" class="control-label" style="color: Red">
                            Acciones</label>
                        <div class="controls">  
                            <button id="btnShow" runat="server" class="btn content-refresh btn-primary">
                                <i class="icon-search"></i>&nbsp Buscar</button> 
                        </div>
                    </div>--%>
                    <div class="control-group">
                        <div class="box-content nopadding">
                            <table class="table table-bordered dataTable dataTable-scroll-x dataTable-tools">
                                <thead>
                                    <tr>
                                        <th>Nombre del Recurso
                                        </th>
                                        <th>Ver
                                        </th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <asp:Repeater ID="rpData" runat="server">
                                        <ItemTemplate>
                                            <tr>
                                                <td><%--OnClick="_Select"--%>
                                                    <%--            <asp:LinkButton ID="btnEdit" runat="server" Text='<%# Eval("DESCRIPCION")%>'
                                                        CommandName="Edit" OnClientClick="location.href='www.google.com','_blank'" ></asp:LinkButton>--%>
                                                    <asp:LinkButton ID="LinkButton1" runat="server" Text='<%# Eval("DESCRIPCION")%>'></asp:LinkButton>
                                                </td>
                                                <td>
                                                    <asp:LinkButton ID="btnver" CssClass="btn btn-primary" runat="server" Text="VER"
                                                        CommandArgument='<%# Eval("nombrearchivo")%>' CommandName="verrecursos" OnClick="_VER"><i class="icon-search">&nbsp VER</i></asp:LinkButton>

                                                    <%-- <button type="button" id="Button22" runat="server" onclick="geturl()"
                                                        class="btn btn-primary">
                                                        <i class="icon-plus-sign"></i>&nbsp VER</button>
                                                                                                        <script type="text/javascript">
                                                         function geturl() { 
                                                             name =  "<%# Eval("NOMBREARCHIVO")%>";
                                                             name = "window.open('"+name+"','_blank')";
                                                             return name;
                                                        } 
                                                       
                                                    </script>--%>
                                                    <%--                                                    <script>
                                                        function myFunction() {
                                                            location.href = "http://localhost/Probando_files/"+<%# Eval("NOMBREARCHIVO")%>;
                                                        }
                                                    </script>--%>

                                                    <%--<button class="btn btn-success" onclick=" window.open('http://localhost/Probando_files/<%# Eval("NOMBREARCHIVO")%>','_blank')">Google</button>
                                                    <button class="btn btn-success" onclick="myFunction()">Google1</button>--%>
                                                    <%-- <button class="btn btn-success" onclick=" window.open('http://localhost/Probando_files/'<%# Eval("NOMBREARCHIVO")%>",'_blank')"> VER2</button>--%>
                                                </td>
                                            </tr>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                </tbody>
                            </table>
                        </div>
                        <%--CONTENEDOR DE DOCUMENTOS--%>
                        <%--<video width="640" height="360" controls preload="none">
                            <!-- MP4 must be first for iPad! -->
                            <source src="__VIDEO__.MP4" type="video/mp4" /><!-- WebKit video    -->
                            <source src="__VIDEO__.webm" type="video/webm" /><!-- Chrome / Newest versions of Firefox and Opera -->
                            <source src="__VIDEO__.OGV" type="video/ogg" /><!-- Firefox / Opera -->
                            <!-- fallback to Flash: -->
                            <object width="640" height="384" type="application/x-shockwave-flash" data="http://localhost/Probando_files/PRUEBA.PNG">
                                <!-- Firefox uses the `data` attribute above, IE/Safari uses the param below -->
                                <param name="movie" value="__FLASH__.SWF" />
                                <param name="flashvars" value="image=__POSTER__.JPG&amp;file=__VIDEO__.MP4" />
                                <!-- fallback image. note the title field below, put the title of the video there -->
                                <img src="__VIDEO__.JPG" width="640" height="360" alt="__TITLE__"
                                    title="No video playback capabilities, please download the video below" />
                            </object>
                        </video>
                        <!-- you *must* offer a download link as they may be able to play the file locally. customise this bit all you want -->
                        <p>
                            <strong>Download Video:</strong>
                            Closed Format:  <a href="__VIDEO__.MP4">"MP4"</a>
                            Open Format:    <a href="__VIDEO__.OGV">"OGG"</a>
                        </p>--%>
                    </div>
                </div>
            </div>
        </div>
    </asp:Panel>
        <div class="box-content nopadding" id="contenedordocumentos2" runat="server"> 
        <div class="embed-responsive embed-responsive-16by9" runat="server">
            <div>
            <button type="button" id="btnregresar" runat="server"
                class="btn btn-primary" data-dismiss="modal" onserverclick="_Back" style="position: absolute; right: 0;">
                <i class="icon-arrow-left"></i>&nbsp Atras
            </button>
        </div>
             
            <iframe class="center" id="framerecursos" runat="server" width="1200" height="800" style="width: 100%;display:block;" align="middle" Src="" frameborder="0" allowfullscreen></iframe>
               
        </div>

    </div>
    <asp:Panel runat="server" ID="contenedordocumentos1">
    <div class="box-content nopadding" id="contenedordocumentos" runat="server">
        <div class="box-content nopadding">
            <div>
                <p>
                    <button type="button" id="btnSave" runat="server" onserverclick="_Save" class="btn btn-green"
                        validationgroup="pnlData">
                        <i class="icon-save"></i>&nbsp Guardar</button>
                    <button type="button" id="btnCancel" runat="server" onserverclick="_Cancel" class="btn">
                        <i class="icon-undo"></i>&nbsp Limpiar</button>
                    <button type="button" id="btnBack" runat="server" onserverclick="_Back" class="btn">
                        <i class="icon-arrow-left"></i>&nbsp Regresar</button>
                </p>
            </div>
        </div>

        <div class="row-fluid">
            <div class="span12">
                <div class="box box-bordered">
                    <div class="box-title">
                        <h3>
                            <i class="icon-edit"></i>Herramientas y Recursos</h3>
                    </div>
                    <div class="row-fluid">
                        <div class="box-content nopadding">
                            <div class='form-horizontal form-bordered'>
                                <%-- Nombre del Recurso --%>
                                <div class="control-group">
                                    <label for="cmbNombreRecurso" class="control-label" style="color: Red">
                                        Nombre del Recurso</label>
                                    <div class="controls">
                                        <asp:TextBox ID="txtNombreRecurso" runat="server"
                                            Wrap="true" placeholder="Digite aquí" CssClass="input-block-level"></asp:TextBox>
                                        <asp:RequiredFieldValidator ControlToValidate="txtNombreRecurso" Display="Dynamic" ErrorMessage="Requerido!"
                                            ID="valtxtNombreRecurso" runat="server" SetFocusOnError="True" ValidationGroup="pnlData" />
                                    </div>
                                </div> 
                                <%-- Tipo --%>
                                <div class="control-group">
                                    <label for="cmbTipo" class="control-label" style="color: Red">
                                        Tipo de Archivo</label>
                                    <div class="controls">
                                        <select runat="server" id="cmbTipo" name="cmbTipo" class='select2-me input-block-level'
                                            data-rule-required="true">
                                            <option value="">-- SELECCIONE --</option>
                                            <%--        <option value="PDF">DOCUMENTO PDF</option>
                                            <option value="DOC">DOCUMENTO WORD</option>
                                            <option value="XLS">DOCUMENTO EXCEL</option>
                                            <option value="JPG">IMAGEN JPG</option>
                                            <option value="PNG">IMAGEN PNG</option>
                                            <option value="AVI">VIDEO AVI</option>
                                            <option value="MP4">VIDEO MP4</option>
                                            <option value="MP3">AUDIO MP3</option>--%>
                                            <option value="MP3">DOCUMENTO</option>
                                            <option value="MP3">VIDEO</option>
                                            <option value="MP3">AUDIO</option>
                                            <option value="MP3">IMAGEN</option>
                                            <option value="MP3">OTROS</option>
                                        </select>
                                        <br />
                                        <asp:RequiredFieldValidator ControlToValidate="cmbTipo" Display="Dynamic" ErrorMessage="Requerido!"
                                            ID="valcmbTipo" runat="server" SetFocusOnError="True" ValidationGroup="pnlData" />
                                    </div>
                                </div>
                                <%-- Archivo --%>
                                <div class="control-group">
                                    <label for="txtNombre" class="control-label" style="color: Red">
                                        Archivo Digital</label>
                                    <div class="controls">
                                        <input type="file" id="File1" name="File1" runat="server" class="input-xxlarge">
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
</asp:Content>

