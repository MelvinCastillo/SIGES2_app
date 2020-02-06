<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true"
    CodeBehind="EvaluacionTerapiaHabla.aspx.cs" Inherits="CAID_V2.forms.EvaluacionTerapiaHabla" %>

<%--Acto Médico: Anamnesis--%>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container-fluid" id="content">
        <link href="../css/bootstrap.min2.css" rel="stylesheet" />
        <link href="../css/StyleSheet1.css" rel="stylesheet" />
        <link href="../css/font-awesome.min2.css" rel="stylesheet" /> 

        <link href="../font/glyphicons-halflings-regular.woff" rel="stylesheet" type="text/css"> 
        <link href="../font/fontawesome-webfont.woff" rel="stylesheet" type="text/css"> 
        <link href="../font/fontawesome-webfont.woff_v=3.2.1" rel="stylesheet" type="text/css">  
        <script type='text/javascript'>
            // price text-box allow numeric and allow 2 decimal points only
            function extractNumber(obj, decimalPlaces, allowNegative) {
                var temp = obj.value;

                // avoid changing things if already formatted correctly
                var reg0Str = '[0-9]*';
                if (decimalPlaces > 0) {
                    reg0Str += '\[\,\.]?[0-9]{0,' + decimalPlaces + '}';
                } else if (decimalPlaces < 0) {
                    reg0Str += '\[\,\.]?[0-9]*';
                }
                reg0Str = allowNegative ? '^-?' + reg0Str : '^' + reg0Str;
                reg0Str = reg0Str + '$';
                var reg0 = new RegExp(reg0Str);
                if (reg0.test(temp)) return true;

                // first replace all non numbers
                var reg1Str = '[^0-9' + (decimalPlaces != 0 ? '.' : '') + (decimalPlaces != 0 ? ',' : '') + (allowNegative ? '-' : '') + ']';
                var reg1 = new RegExp(reg1Str, 'g');
                temp = temp.replace(reg1, '');

                if (allowNegative) {
                    // replace extra negative
                    var hasNegative = temp.length > 0 && temp.charAt(0) == '-';
                    var reg2 = /-/g;
                    temp = temp.replace(reg2, '');
                    if (hasNegative) temp = '-' + temp;
                }

                if (decimalPlaces != 0) {
                    var reg3 = /[\,\.]/g;
                    var reg3Array = reg3.exec(temp);
                    if (reg3Array != null) {
                        // keep only first occurrence of .
                        //  and the number of places specified by decimalPlaces or the entire string if decimalPlaces < 0
                        var reg3Right = temp.substring(reg3Array.index + reg3Array[0].length);
                        reg3Right = reg3Right.replace(reg3, '');
                        reg3Right = decimalPlaces > 0 ? reg3Right.substring(0, decimalPlaces) : reg3Right;
                        temp = temp.substring(0, reg3Array.index) + '.' + reg3Right;
                    }
                }

                obj.value = temp;
            }
            function blockNonNumbers(obj, e, allowDecimal, allowNegative) {
                var key;
                var isCtrl = false;
                var keychar;
                var reg;
                if (window.event) {
                    key = e.keyCode;
                    isCtrl = window.event.ctrlKey
                }
                else if (e.which) {
                    key = e.which;
                    isCtrl = e.ctrlKey;
                }

                if (isNaN(key)) return true;

                keychar = String.fromCharCode(key);

                // check for backspace or delete, or if Ctrl was pressed
                if (key == 8 || isCtrl) {
                    return true;
                }

                reg = /\d/;
                var isFirstN = allowNegative ? keychar == '-' && obj.value.indexOf('-') == -1 : false;
                var isFirstD = allowDecimal ? keychar == '.' && obj.value.indexOf('.') == -1 : false;
                var isFirstC = allowDecimal ? keychar == ',' && obj.value.indexOf(',') == -1 : false;
                return isFirstN || isFirstD || isFirstC || reg.test(keychar);
            }
            function blockInvalid(obj) {
                var temp = obj.value;
                if (temp == "-") {
                    temp = "";
                }

                if (temp.indexOf(".") == temp.length - 1 && temp.indexOf(".") != -1) {
                    temp = temp + "00";
                }
                if (temp.indexOf(".") == 0) {
                    temp = "0" + temp;
                }
                if (temp.indexOf(".") == 1 && temp.indexOf("-") == 0) {
                    temp = temp.replace("-", "-0");
                }
                if (temp.indexOf(",") == temp.length - 1 && temp.indexOf(",") != -1) {
                    temp = temp + "00";
                }
                if (temp.indexOf(",") == 0) {
                    temp = "0" + temp;
                }
                if (temp.indexOf(",") == 1 && temp.indexOf("-") == 0) {
                    temp = temp.replace("-", "-0");
                }
                temp = temp.replace(",", ".");
                obj.value = temp;
            };
            // end of price text-box allow numeric and allow 2 decimal points only
            $('input[type="text"]').keydown(function (e) {
                var ingnore_key_codes = [8, 32];
                if ($.inArray(e.keyCode, ingnore_key_codes) >= 0) {
                    e.preventDefault();
                }
            });
            function isNumberKey(evt) {
                var charCode = (evt.which) ? evt.which : event.keyCode
                if (charCode != 46 && charCode > 31 && (charCode < 48 || charCode > 57))
                    return false;

                return true;
            };
            function IsFloatOnly(element) {
                var value = $(element).val();
                var regExp = "^\\d+(\\.\\d+)?$";
                return value.match(regExp);
            }
            function FilterInput(event) {
                var keyCode = ('which' in event) ? event.which : event.keyCode;

                isNumeric = (keyCode >= 48 /* KeyboardEvent.DOM_VK_0 */ && keyCode <= 57 /* KeyboardEvent.DOM_VK_9 */) ||
                        (keyCode >= 96 /* KeyboardEvent.DOM_VK_NUMPAD0 */ && keyCode <= 105 /* KeyboardEvent.DOM_VK_NUMPAD9 */);
                modifiers = (event.altKey || event.ctrlKey || event.shiftKey);
                return isNumeric || modifiers;
            }
            function keyispressed(e) {
                var charval = String.fromCharCode(e.keyCode);
                if (isNaN(charval)) {
                    return false;
                }
                return true;
            }
            function makeMoney(source) {
                //Grab the value from the element
                var money = parseFloat(source.value, 10).toFixed(2);

                //Format your value
                source.value = '$' + money.toString();
            };
            function toUSD(objctrl) {
                //Get the Entered Value
                var number = objctrl.value.toString(),
                //Split the number between dollars and cents
                dollars = number.split('.')[0], cents = (number.split('.')[1] || '') + '00';
                dollars = dollars.split('').reverse().join('').replace(/(\d{3}(?!$))/g, '$1,').split('').reverse().join('');
                //Concatenate the number with currecny symbol
                objctrl.value = dollars + '.' + cents.slice(0, 2);
            };

        </script>
        <script src="../js/notify.js" type="text/javascript"></script>
        <script src="../js/notify.min.js" type="text/javascript"></script>
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
                background-color: dodgerblue;
                color: white;
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

        <div class="row-fluid">
            <asp:Repeater ID="rpPaxHeader" runat="server">
                <ItemTemplate>
                    <%# Eval("HTML")%>
                </ItemTemplate>
            </asp:Repeater>
        </div>

        <%--DATOS PERSONALES--%>
        <div class="row-fluid">
            <div class="span12">
                <div class="box box-bordered">
                    <div class="box-title ">
                        <h3 runat="server" id="H3">
                            <i class="icon-edit"></i>Datos Personales</h3>
                        <div class="actions">
                            <%-- <div class="form-actions">--%>
                            <button type="submit" id="btnSave" style="background-color: dodgerblue;" runat="server" onserverclick="_Save" class="btn btn-blue" validationgroup="pnlData">
                                <i class="icon-save"></i>&nbsp Guardar</button>

                            <button type="submit" id="btnRegresar" style="background-color: dodgerblue;" runat="server" onserverclick="_Back" class="btn btn-blue" validationgroup="pnlData">
                                <i class="icon-arrow-left"></i>&nbsp Regresar</button>
                            <%--</div>--%>

                            <a href="#" class="btn btn-mini content-slideUp"><i class="icon-angle-down"></i>
                            </a>
                        </div>
                    </div>

                    <div class='form-horizontal form-striped'>
                        <div>
                            <div class="box-content nopadding">
                                <div class='form-horizontal form-column form-bordered'>
                                    <div class="row">
                                       
                                        <div class="col-sm-6">
                                             <%--Fecha de Nacimiento--%>
                                            <div class="control-group">
                                                <label for="lblFechaNacimiento" class="control-label col-sm-2">
                                                    <strong>Fecha Nacimiento</strong></label>
                                                <div class="controls">
                                                    <input type="text" name="txtFechaNacimiento" id="txtFechaNacimiento" placeholder="Digite Aqui" class="form-control" disabled runat="server">
                                                </div>
                                            </div>
                                            <%--Motivo de Consulta --%>
                                            <div class="control-group">
                                                <label for="lblMotivodeConsulta" class="control-label col-sm-2">
                                                    <strong>Motivo de Consulta</strong></label>
                                                <div class="controls">
                                                    <input type="text" name="txtMotivodeConsulta" id="txtMotivodeConsulta" placeholder="Digite Aqui" class="form-control" runat="server">
                                                </div>
                                            </div>
                                      
                                        </div>
                                       
                                        <div class="col-sm-6">
                                             <%--Lugar de Residencia del Nino--%>
                                            <div class="control-group">
                                                <label for="lblLugardeResidenciadelNino" class="control-label col-sm-2">
                                                    <strong>Lugar Residencia</strong></label>
                                                <div class="controls">
                                                    <input type="text" name="txtLugardeResidenciadelNino" id="txtLugardeResidenciadelNino" placeholder="Digite Aqui" class="form-control" disabled runat="server">
                                                </div>
                                            </div>
                                             
                                        <%--HA RECIBIDO TERAPIA DEL LENGUAJE --%> 
                                            <div class="control-group">
                                                <label for="lblHARECIBIDOTERAPIADELLENGUAJE" class="control-label col-sm-2">
                                                    <strong>¿Ha Recibido Terapia del Lenguaje?</strong></label>
                                                <div class="controls">
                                                    <asp:DropDownList ID="ddlHARECIBIDOTERAPIADELLENGUAJE" CssClass="col-sm-6" runat="server" data-rule-required="true">
                                                        <asp:ListItem Value="">-- SELECCIONE --</asp:ListItem>
                                                        <asp:ListItem Value="SI">SI</asp:ListItem>
                                                        <asp:ListItem Value="NO">NO</asp:ListItem>
                                                    </asp:DropDownList>
                                                    <div>
                                                        <br>
                                                        <br>
                                                        <strong>¿POR CUÁNTO TIEMPO?</strong>
                                                        <input type="text" name="txtPORCUANTOTIEMPO" id="txtPORCUANTOTIEMPO" placeholder="Digite Aqui" class="form-control" runat="server">
                                                    </div>
                                                </div>
                                            </div>
                                        </div>  

                                    </div>
                                    <div class="row">
                                        <div class="col-sm-12">
                                            <%--1-Historia familiar relevante--%>
                                            <div class="control-group">
                                                <label for="lblDatosRevelantedeHistoriaClinica" class="control-label col-sm-2">
                                                    <strong>Datos Revelante de Historia Clinica</strong></label>
                                                <div class="controls">
                                                    <textarea runat="server" name="txtDatosRevelantedeHistoriaClinica" id="txtDatosRevelantedeHistoriaClinica" rows="4" class="input-block-level" data-rule-required="true" placeholder="Digite Aqui"></textarea>
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

        <%-- ANTECEDENTES PATOLOGICOS --%>
        <div class="row-fluid">
            <div class="box box-bordered">
                <div class="box-title">
                    <h3 runat="server" id="H14">
                        <i class="icon-edit"></i>Antecedentes Patológicos</h3>
                    <div class="actions">
                        <a href="#" class="btn btn-mini content-slideUp"><i class="icon-angle-down"></i>
                        </a>
                    </div>
                </div>

                <div class='form-group form-vertical'>
                    <div>
                        <div class="box-content nopadding">
                            <div class='form-horizontal form-column form-bordered'>
                                <div class="row">
                                    <%--Traumatismo Con Pérdida De Conocimiento--%>
                                    <div class="col-sm-6">
                                        <div class="control-group">
                                            <label for="lblTraumatismoConPerdidaDeConocimiento" class="control-label col-sm-6">
                                                <strong>Traumatismo Pérdida Conoci.</strong></label>
                                            <div class="controls">
                                                <input type="text" name="txtTraumatismoConPerdidaDeConocimiento" id="txtTraumatismoConPerdidaDeConocimiento" placeholder="Digite Aqui" cssclass="col-sm-6" class="form-control" runat="server">
                                            </div>
                                        </div>


                                        <%--Traumatismo Con Pérdida De Conocimiento - CUALES--%>
                                        <div class="control-group">
                                            <label for="lblTraumatismoConPerdidaDeConocimientoCuales" class="control-label col-sm-2">
                                                <span></span>
                                                <strong>Cuales</strong></label>

                                            <div class="controls">
                                                <input type="text" name="txtTraumatismoConPerdidaDeConocimientoCuales" id="txtTraumatismoConPerdidaDeConocimientoCuales" placeholder="Digite Aqui" class="form-control" runat="server">
                                            </div>
                                        </div>
                                        <%--Crisis O Procesos Febriles Con Convulsiones--%>
                                        <div class="control-group">
                                            <label for="lblCrisisOProcesosFebrilesConConvulsiones" class="control-label col-sm-6">
                                                <strong>Procesos Febriles Con Convulsiones</strong></label>
                                            <div class="controls">
                                                <input type="text" name="txtCrisisOProcesosFebrilesConConvulsiones" id="txtCrisisOProcesosFebrilesConConvulsiones" placeholder="Digite Aqui" class="form-control" runat="server">
                                            </div>
                                        </div>
                                        <%--Con Que Frecuencia--%>
                                        <div class="control-group">
                                            <label for="lblConQueFrecuencia" class="control-label col-sm-6">
                                                <strong>Con Que Frecuencia</strong></label>
                                            <div class="controls">
                                                <input type="text" name="txtConQueFrecuencia" id="txtConQueFrecuencia" placeholder="Digite Aqui" class="form-control" runat="server">
                                            </div>
                                        </div>

                                        <%--¿Alergias? --%>
                                        <div class="control-group">
                                            <label for="lblAlergias" class="control-label col-sm-6">
                                                <strong>¿Alergias? </strong>
                                            </label>
                                            <div class="controls">
                                                <asp:DropDownList ID="ddlAlergia" CssClass="col-sm-6" runat="server" data-rule-required="true">
                                                    <asp:ListItem Value="">-- SELECCIONE --</asp:ListItem>
                                                    <asp:ListItem Value="SI">SI</asp:ListItem>
                                                    <asp:ListItem Value="NO">NO</asp:ListItem>
                                                </asp:DropDownList>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-sm-6">
                                        <%--Dificultades Respiratorias--%>
                                        <div class="control-group">
                                            <label for="lblDificultadesRespiratorias" class="control-label col-sm-2">
                                                <strong>Dificultades Respiratorias</strong></label>
                                            <div class="controls">
                                                <input type="text" name="txtDificultadesRespiratorias" id="txtDificultadesRespiratorias" placeholder="Digite Aqui" class="form-control" runat="server">
                                            </div>
                                        </div>
                                        <%--Dificultades Respiratorias - Cuales--%>
                                        <div class="control-group">
                                            <label for="lblDificultadesRespiratoriasCuales" class="control-label col-sm-2">
                                                <strong>Cuales</strong></label>
                                            <div class="controls">
                                                <input type="text" name="txtDificultadesRespiratoriasCuales" id="txtDificultadesRespiratoriasCuales" placeholder="Digite Aqui" class="form-control" runat="server">
                                            </div>
                                        </div>
                                        <%--A Qué Edad--%>
                                        <div class="control-group">
                                            <label for="lblAQueEdad" class="control-label col-sm-2">
                                                <br>
                                                <strong>A Qué Edad</strong></label>
                                            <div class="controls">
                                                <input type="text" name="txtAQueEdad" id="txtAQueEdad" placeholder="Digite Aqui" class="form-control" runat="server">
                                            </div>
                                        </div>
                                        <%--¿Otitis?--%>
                                        <div class="control-group">
                                            <label for="lblOtitis" class="control-label col-sm-2">
                                                <strong>¿Otitis?</strong></label>
                                            <div class="controls">
                                                <asp:DropDownList ID="ddlotitis" CssClass="col-sm-6" runat="server" data-rule-required="true">
                                                    <asp:ListItem Value="">-- SELECCIONE --</asp:ListItem>
                                                    <asp:ListItem Value="SI">SI</asp:ListItem>
                                                    <asp:ListItem Value="NO">NO</asp:ListItem>
                                                </asp:DropDownList>
                                                <asp:DropDownList ID="ddlotitisLado" CssClass="col-sm-6" runat="server" data-rule-required="true">
                                                    <asp:ListItem Value="">-- SELECCIONE --</asp:ListItem>
                                                    <asp:ListItem Value="Izquierda">Izquierda</asp:ListItem>
                                                    <asp:ListItem Value="Derecha">Derecha</asp:ListItem>
                                                </asp:DropDownList>
                                            </div>
                                        </div>
                                        <%--¿A Qué Es Alérgico?--%>
                                        <div class="control-group">
                                            <label for="lblAQueEsAlergico" class="control-label col-sm-2">
                                                <strong>¿A Qué Es Alérgico?</strong></label>
                                            <div class="controls">
                                                <input type="text" name="txtAQueEsAlergico" id="txtAQueEsAlergico" placeholder="Digite Aqui" class="form-control" runat="server">
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

        <%-- ENFERMEDADES CONGÉNITAS --%>
        <div class="row-fluid">
            <div class="box box-bordered">
                <div class="box-title">
                    <h3 runat="server" id="H15">
                        <i class="icon-edit"></i>Enfermedades Congénitas</h3>
                    <div class="actions">
                        <a href="#" class="btn btn-mini content-slideUp"><i class="icon-angle-down"></i>
                        </a>
                    </div>
                </div>

                <div class='form-group form-vertical'>
                    <div>
                        <div class="box-content nopadding">
                            <div class='form-horizontal form-column form-bordered'>
                                <div class="row">

                                    <div class="col-sm-6">
                                        <%--Hipertrofia De Adenoides--%>
                                        <div class="control-group">
                                            <label for="lblHipertrofiaDeAdenoides" class="control-label col-sm-2">
                                                <strong>Hipertrofia De Adenoides</strong></label>
                                            <div class="controls">
                                                <asp:DropDownList ID="ddlHipertrofiaDeAdenoides" CssClass="col-sm-6" runat="server" data-rule-required="true">
                                                    <asp:ListItem Value="">-- SELECCIONE --</asp:ListItem>
                                                    <asp:ListItem Value="SI">SI</asp:ListItem>
                                                    <asp:ListItem Value="NO">NO</asp:ListItem>
                                                </asp:DropDownList>
                                            </div>
                                        </div>

                                        <%--¿Cirugía?--%>
                                        <div class="control-group">
                                            <label for="lblCirugia" class="control-label col-sm-2">
                                                <strong>¿Cirugía?</strong></label>
                                            <div class="controls">
                                                <asp:DropDownList ID="ddlCirugia" CssClass="col-sm-6" runat="server" data-rule-required="true">
                                                    <asp:ListItem Value="">-- SELECCIONE --</asp:ListItem>
                                                    <asp:ListItem Value="SI">SI</asp:ListItem>
                                                    <asp:ListItem Value="NO">NO</asp:ListItem>
                                                </asp:DropDownList>

                                            </div>
                                        </div>
                                        <%--Cirugia Cuales--%>
                                        <div class="control-group">
                                            <label for="lblCirugiaCuales" class="control-label col-sm-2">
                                                <strong>Cuales</strong></label>
                                            <div class="controls">
                                                <input type="text" name="txtCirugiaCuales" id="txtCirugiaCuales" placeholder="Digite Aqui" class="form-control" runat="server">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-sm-6">
                                        <%--Hospitalizaciones--%>
                                        <div class="control-group">
                                            <label for="lblHospitalizaciones" class="control-label col-sm-2">
                                                <strong>Hospitalizaciones</strong></label>
                                            <div class="controls">
                                                <asp:DropDownList ID="ddlHospitalizaciones" CssClass="col-sm-6" runat="server" data-rule-required="true">
                                                    <asp:ListItem Value="">-- SELECCIONE --</asp:ListItem>
                                                    <asp:ListItem Value="SI">SI</asp:ListItem>
                                                    <asp:ListItem Value="NO">NO</asp:ListItem>
                                                </asp:DropDownList>
                                            </div>
                                        </div>
                                        <%--Tratamiento Farmacológico --%>
                                        <div class="control-group">
                                            <label for="lblTratamientoFarmacologico" class="control-label col-sm-2">
                                                <strong>Tratamiento Farmacológico</strong></label>
                                            <div class="controls">
                                                <asp:DropDownList ID="ddlTratamientoFarmacologico" CssClass="col-sm-6" runat="server" data-rule-required="true">
                                                    <asp:ListItem Value="">-- SELECCIONE --</asp:ListItem>
                                                    <asp:ListItem Value="SI">SI</asp:ListItem>
                                                    <asp:ListItem Value="NO">NO</asp:ListItem>
                                                </asp:DropDownList>
                                            </div>
                                        </div>

                                        <%--Tratamiento Farmacológico - Cuales--%>
                                        <div class="control-group">
                                            <label for="lblTratamientoFarmacologicoCuales" class="control-label col-sm-2">
                                                <strong>Cuales</strong></label>
                                            <div class="controls">
                                                <input type="text" name="txtTratamientoFarmacologicoCuales" id="txtTratamientoFarmacologicoCuales" placeholder="Digite Aqui" class="form-control" runat="server">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-sm-12">
                                        <%--Comentarios ENFERMEDADES CONGÉNITAS --%>
                                        <div class="control-group">
                                            <label for="txtVoz" class="control-label" style="font-size: small;">
                                                <strong>Comentarios</strong></label>
                                            <div class="controls">
                                                <asp:TextBox ID="txtComentariosENFERMEDADESCONGENITAS" runat="server" TextMode="MultiLine" Height="100px" ValidationGroup="pnlData"
                                                    Wrap="true" placeholder="Comentarios" CssClass="input-block-level"></asp:TextBox>
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


        <%-- HISTORIA DE ALIMENTACION --%>
        <div class="row-fluid">
            <div class="box box-bordered">
                <div class="box-title">
                    <h3 runat="server" id="H16">
                        <i class="icon-edit"></i>Historia De Alimentación</h3>
                    <div class="actions">
                        <a href="#" class="btn btn-mini content-slideUp"><i class="icon-angle-down"></i>
                        </a>
                    </div>
                </div>

                <%--<div class="col-sm-12">--%>
                <%--<div class="box-content nopadding">--%>
                <div class='form-group form-vertical'>
                    <div>
                        <div class="box-content nopadding">
                            <div class='form-horizontal form-column form-bordered'>
                                <div class="row">
                                    <div class="col-sm-6">
                                        <%--¿SUCCIÓN? SI O NO--%>
                                        <div class="control-group">
                                            <label for="lblSUCCION" class="control-label col-sm-2">
                                                <strong>¿Succión?</strong></label>
                                            <div class="controls">
                                                <asp:DropDownList ID="dllSUCCION" CssClass="col-sm-6" runat="server" data-rule-required="true">
                                                    <asp:ListItem Value="">-- SELECCIONE --</asp:ListItem>
                                                    <asp:ListItem Value="SI">SI</asp:ListItem>
                                                    <asp:ListItem Value="NO">NO</asp:ListItem>
                                                </asp:DropDownList>
                                            </div>
                                        </div>

                                        <%--¿LECHE MATERNA?--%>
                                        <div class="control-group">
                                            <label for="lblLECHEMATERNA" class="control-label col-sm-2">
                                                <strong>¿Leche Materna?</strong></label>
                                            <div class="controls">
                                                <asp:DropDownList ID="ddlLECHEMATERNA" CssClass="col-sm-6" runat="server" data-rule-required="true">
                                                    <asp:ListItem Value="">-- SELECCIONE --</asp:ListItem>
                                                    <asp:ListItem Value="SI">SI</asp:ListItem>
                                                    <asp:ListItem Value="NO">NO</asp:ListItem>
                                                </asp:DropDownList>
                                            </div>
                                        </div>

                                        <%--¿LECHE ARTIFICIAL? --%>
                                        <div class="control-group">
                                            <label for="lblLECHEARTIFICIAL" class="control-label col-sm-2">
                                                <strong>¿Leche Artificial?</strong></label>
                                            <div class="controls">
                                                <asp:DropDownList ID="ddlLECHEARTIFICIAL" CssClass="col-sm-6" runat="server" data-rule-required="true">
                                                    <asp:ListItem Value="">-- SELECCIONE --</asp:ListItem>
                                                    <asp:ListItem Value="SI">SI</asp:ListItem>
                                                    <asp:ListItem Value="NO">NO</asp:ListItem>
                                                </asp:DropDownList>
                                            </div>
                                        </div>

                                        <%--¿BIBERÓN? --%>
                                        <div class="control-group">
                                            <label for="lblBIBERON" class="control-label col-sm-2">
                                                <strong>¿Biberón?</strong></label>
                                            <div class="controls">
                                                <asp:DropDownList ID="ddlBIBERON" CssClass="col-sm-6" runat="server" data-rule-required="true">
                                                    <asp:ListItem Value="">-- SELECCIONE --</asp:ListItem>
                                                    <asp:ListItem Value="SI">SI</asp:ListItem>
                                                    <asp:ListItem Value="NO">NO</asp:ListItem>
                                                </asp:DropDownList>
                                            </div>
                                        </div>

                                        <%--Tipo De Alimento Que Ingiere Con Mayor Frecuencia --%>
                                        <div class="control-group">
                                            <label for="lblTipoDeAlimentoQueIngiereConMayorFrecuencia" class="control-label col-sm-2">
                                                <strong>Tipo De Alimento Que Ingiere Con Mayor Frecuencia</strong></label>
                                            <div class="controls">
                                                <asp:DropDownList ID="ddlTipoDeAlimentoQueIngiereConMayorFrecuencia" CssClass="col-sm-6" runat="server" data-rule-required="true">
                                                    <asp:ListItem Value="">-- SELECCIONE --</asp:ListItem>
                                                    <asp:ListItem Value="Líquido">Líquido</asp:ListItem>
                                                    <asp:ListItem Value="Colado">Colado</asp:ListItem>
                                                    <asp:ListItem Value="Puré">Puré</asp:ListItem>
                                                    <asp:ListItem Value="Espeso ">Espeso</asp:ListItem>
                                                    <asp:ListItem Value="Sólido ">Sólido</asp:ListItem>
                                                </asp:DropDownList>
                                            </div>
                                        </div>

                                        <%--Sabores Preferidos --%>
                                        <div class="control-group">
                                            <label for="lblSaboresPreferidos" class="control-label col-sm-2">
                                                <strong>Sabores Preferidos</strong></label>
                                            <div class="controls">
                                                <asp:DropDownList ID="ddlSaboresPreferidos" CssClass="col-sm-6" runat="server" data-rule-required="true">
                                                    <asp:ListItem Value="">-- SELECCIONE --</asp:ListItem>
                                                    <asp:ListItem Value="Salados">Salados</asp:ListItem>
                                                    <asp:ListItem Value="Dulces">Dulces</asp:ListItem>
                                                    <asp:ListItem Value="Acidos">Acidos</asp:ListItem>
                                                </asp:DropDownList>
                                            </div>
                                        </div>

                                        <%--Número De Comidas Al Día:--%>
                                        <div class="control-group">
                                            <label for="lblNumeroDeComidasAlDia" class="control-label col-sm-2">
                                                <strong># Comidas Al Día:</strong></label>
                                            <div class="controls">
                                                <input type="text" name="txtNumeroDeComidasAlDia" id="txtNumeroDeComidasAlDia" placeholder="Digite Aqui" cssclass="col-sm-6" class="form-control" runat="server">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-sm-6">
                                        <%--¿SUCCIÓN? TIPO--%>
                                        <div class="control-group">
                                            <label for="lblSUCCIONTipo" class="control-label col-sm-2">
                                                <strong>Tipo de Succión</strong></label>
                                            <div class="controls">
                                                <asp:DropDownList ID="ddlSUCCIONTIPO" CssClass="col-sm-6" runat="server" data-rule-required="true">
                                                    <asp:ListItem Value="">-- SELECCIONE --</asp:ListItem>
                                                    <asp:ListItem Value="DIGITAL">DIGITAL</asp:ListItem>
                                                    <asp:ListItem Value="CHUPON">CHUPON</asp:ListItem>
                                                    <asp:ListItem Value="LABIAL">LABIAL</asp:ListItem>
                                                </asp:DropDownList>
                                            </div>
                                        </div>
                                        <%--¿LECHE MATERNA? TIEMPO--%>
                                        <div class="control-group">
                                            <label for="lblLECHEMATERNATIEMPO" class="control-label col-sm-6">
                                                <strong>Tiempo</strong></label>
                                            <div class="controls">
                                                <input type="text" name="txtLECHEMATERNATIEMPO" id="txtLECHEMATERNATIEMPO" placeholder="Digite Aqui" cssclass="col-sm-6" class="form-control" runat="server">
                                            </div>
                                        </div>
                                        <%--¿LECHE ARTIFICIAL? TIEMPO--%>
                                        <div class="control-group">
                                            <label for="lblLECHEARTIFICIALTIEMPO" class="control-label col-sm-6">
                                                <strong>Tiempo</strong></label>
                                            <div class="controls">
                                                <input type="text" name="txtLECHEARTIFICIALTIEMPO" id="txtLECHEARTIFICIALTIEMPO" placeholder="Digite Aqui" cssclass="col-sm-6" class="form-control" runat="server">
                                            </div>
                                        </div>
                                        <%--¿SE AUTOALIMENTA? --%>
                                        <div class="control-group">
                                            <label for="lblSEAUTOALIMENTA" class="control-label col-sm-2">
                                                <strong>Se Autoalimenta</strong></label>
                                            <div class="controls">
                                                <asp:DropDownList ID="ddlSEAUTOALIMENTA" CssClass="col-sm-6" runat="server" data-rule-required="true">
                                                    <asp:ListItem Value="">-- SELECCIONE --</asp:ListItem>
                                                    <asp:ListItem Value="SI">SI</asp:ListItem>
                                                    <asp:ListItem Value="NO">NO</asp:ListItem>
                                                </asp:DropDownList>
                                            </div>
                                        </div>
                                        <%--¿Existen Estímulos Distractores Durante La Alimentación?--%>
                                        <div class="control-group">
                                            <label for="lblExistenEstímulosDistractoresDuranteLaAlimentacion" class="control-label col-sm-2">
                                                <strong>¿Existen Estímulos Distractores Durante La Alimentación?</strong></label>
                                            <div class="controls">
                                                <asp:DropDownList ID="ddlExistenEstímulosDistractoresDuranteLaAlimentacion" CssClass="col-sm-6" runat="server" data-rule-required="true">
                                                    <asp:ListItem Value="">-- SELECCIONE --</asp:ListItem>
                                                    <asp:ListItem Value="Si">Si</asp:ListItem>
                                                    <asp:ListItem Value="No">No</asp:ListItem>
                                                </asp:DropDownList>
                                                <br>
                                                <br>
                                                <label><strong>¿Cuales?</strong></label>
                                                <input type="text" name="txtExistenEstímulosDistractoresDuranteLaAlimentacionCuales" id="txtExistenEstímulosDistractoresDuranteLaAlimentacionCuales" placeholder="Digite Aqui" cssclass="col-sm-6" class="form-control" runat="server">
                                            </div>
                                        </div>
                                        <%--Temperatura --%>
                                        <div class="control-group">
                                            <label for="lblTemperatura" class="control-label col-sm-2">
                                                <strong>Temperatura</strong></label>
                                            <div class="controls">
                                                <asp:DropDownList ID="ddlTemperatura" CssClass="col-sm-6" runat="server" data-rule-required="true">
                                                    <asp:ListItem Value="">-- SELECCIONE --</asp:ListItem>
                                                    <asp:ListItem Value="Ambiente">Ambiente</asp:ListItem>
                                                    <asp:ListItem Value="Frio">Frio</asp:ListItem>
                                                    <asp:ListItem Value="Caliente">Caliente</asp:ListItem>
                                                </asp:DropDownList>
                                            </div>
                                        </div>

                                        <%--Deglución  --%>
                                        <div class="control-group">
                                            <label for="lblDeglucion" class="control-label col-sm-2">
                                                <strong>Deglución </strong>
                                            </label>
                                            <div class="controls">
                                                <asp:DropDownList ID="ddlDeglucion" CssClass="col-sm-6" runat="server" data-rule-required="true">
                                                    <asp:ListItem Value="">-- SELECCIONE --</asp:ListItem>
                                                    <asp:ListItem Value="Adecuada">Adecuada</asp:ListItem>
                                                    <asp:ListItem Value="Atipica">Atipica</asp:ListItem>
                                                    <asp:ListItem Value="Adaptada">Adaptada</asp:ListItem>
                                                    <asp:ListItem Value="Posible Disfagia">Posible Disfagia</asp:ListItem>
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
        <div class="row-fluid">
            <div class="span12">
                <div class="box box-bordered">
                    <div class="box-title">
                        <h3 runat="server" id="H1">
                            <i class="icon-edit"></i>Desarrollo del Lenguaje</h3>
                        <div class="actions">
                            <a href="#" class="btn btn-mini content-slideUp"><i class="icon-angle-down"></i>
                            </a>
                        </div>
                    </div>
                    <div class="box-content nopadding">
                        <div class='form-horizontal form-striped'>
                            <%-- Tipo de Evaluación --%>
                            <div class="control-group">
                                <label for="cmbTipo" class="control-label" style="color: red; font-size: small;">
                                    <strong>Especialidad</strong></label>
                                <div class="controls">
                                    <select runat="server" id="cmbTipo" name="cmbTipo" class='select2-me input-block-level' 
                                        data-rule-required="true">
                                        <option value="">-- SELECCIONE --</option>
                                    </select>
                                    <br />
                                    <asp:RequiredFieldValidator ControlToValidate="cmbTipo" Display="Dynamic" ErrorMessage="Requerido!"
                                        ID="cmbTipo1" runat="server" SetFocusOnError="True" ValidationGroup="pnlData" />
                                </div>
                            </div>
                            <%--Se expresa a través de:--%>
                            <div class="control-group">
                                <label for="textfield" class="control-label"><strong>Se expresa a través de:</strong></label>
                                <%--<div class="controls" style="text-align: left; margin: auto; text-align: center;">
                                    <asp:CheckBoxList ID="ckExpresiones" CellPadding="50" Font-Size="XX-Small" CellSpacing="5" RepeatColumns="8" RepeatDirection="Horizontal" TextAlign="Right"
                                        runat="server">
                                    </asp:CheckBoxList>--%>
                                <div class="controls">
                                    <div class="checkbox checkbox-primary col-lg-10" style="text-align: left; margin: auto; text-align: Left;">
                                        <asp:CheckBoxList ID="ckExpresiones" RepeatColumns="1" RepeatDirection="Horizontal"
                                            runat="server">
                                        </asp:CheckBoxList>
                                    </div>
                                </div>
                            </div>

                            <%--A que edad dijo (Vocales, Silabas etc)--%>
                            <div class="control-group">
                                <label for="textfield" class="control-label">
                                    <strong>¿A qué edad dijo…?
                                    </strong>
                                </label>
                                <div class="controls">

                                    <div class="span4">
                                        <div class="control-list">
                                            <strong>Vocales</strong>
                                        </div>

                                        <input runat="server" type="text" name="txtVocales" id="txtVocales" value="0" class="spinner input-block-level"
                                            placeholder="Edad">
                                        <input type="text" runat="server" name="txtCVocales" id="txtCVocales" placeholder="¿Cuáles?" class="input-block-level">
                                    </div>

                                    <div class="span4">
                                        <div class="control-list">
                                            <strong>Sílabas</strong>
                                        </div>
                                        <input runat="server" type="text" name="txtSilabas" id="txtSilabas" value="0" class="spinner input-block-level"
                                            placeholder="Edad">
                                        <input type="text" runat="server" name="txtCSilabas" id="txtCSilabas" placeholder="¿Cuáles?" class="input-block-level">
                                    </div>


                                    <div class="span4">
                                        <div class="control-list">
                                            <strong>Palabras</strong>
                                        </div>
                                        <input runat="server" type="text" name="txtPalabras" id="txtPalabras" value="0" class="spinner input-block-level"
                                            placeholder="Edad">
                                        <input type="text" runat="server" name="txtCPalabras" id="txtCPalabras" placeholder="¿Cuáles?" class="input-block-level">
                                    </div>

                                    &nbsp

                                <div class="row-fluid">
                                    <div class="span6">
                                        <div class="control-list">
                                            <strong>Frases</strong>
                                        </div>
                                        <input runat="server" type="text" name="txtFrases" id="txtFrases" value="0" class="spinner input-block-level"
                                            placeholder="Edad">
                                        <input type="text" runat="server" name="txtCFrases" id="txtCFrases" placeholder="¿Cuáles?" class="input-block-level">
                                    </div>


                                    <div class="span6">
                                        <div class="control-list">
                                            <strong>Oraciones</strong>
                                        </div>

                                        <input runat="server" type="text" name="txtOraciones" id="txtOraciones" value="0" class="spinner input-block-level"
                                            placeholder="Edad">
                                        <input type="text" runat="server" name="txtCOraciones" id="txtCOraciones" placeholder="¿Cuáles?" class="input-block-level">
                                    </div>
                                </div>



                                </div>
                            </div>

                            <%--Reconoce su nombre cuando se le llama:--%>
                            <div class="control-group">
                                <label for="cmbSeReconoce" class="control-label"><strong>Reconoce su nombre</strong></label>
                                <div class="controls">

                                    <select runat="server" id="cmbSeReconoce" name="cmbSeReconoce" class='select2-me input-xlarge'>
                                        <option value="">-- SELECCIONE --</option>
                                        <option value="SI"></option>
                                        <option value="NO"></option>
                                    </select>
                                </div>
                            </div>

                            <div class="control-group">
                                <label for="txtEVALUACION" class="control-label" style="font-size: small;">
                                    <strong>Comentarios</strong></label>
                                <div class="controls">
                                    <asp:TextBox ID="txtEVALUACION" runat="server" TextMode="MultiLine" Height="100px" ValidationGroup="pnlData"
                                        Wrap="true" placeholder="Digite aquí" CssClass="input-block-level"></asp:TextBox>
                                </div>
                            </div>

                        </div>


                    </div>
                </div>
            </div>
        </div>

        <div class="row-fluid">
            <div class="span12">
                <div class="box box-bordered">
                    <div class="box-title">
                        <h3 runat="server" id="H2">
                            <i class="icon-edit"></i>Órganos Bucofonatorios</h3>
                        <div class="actions">
                            <a href="#" class="btn btn-mini content-slideUp"><i class="icon-angle-down"></i>
                            </a>
                        </div>
                    </div>
                    <div class="box-content nopadding">
                        <div class='form-horizontal form-striped'>


                            <%--Labios--%>
                            <div class="control-group">
                                <label for="cmbLabios" class="control-label"><strong>Anatomia Labial</strong></label>
                                <div class="controls">

                                    <div class="checkbox checkbox-primary col-lg-10" style="text-align: left; margin: auto; text-align: Left;">

                                        <asp:CheckBoxList ID="ckLabios" CellPadding="5" Font-Size="XX-Small" CellSpacing="5" RepeatColumns="1" RepeatDirection="Horizontal" TextAlign="Right"
                                            runat="server">
                                        </asp:CheckBoxList>
                                    </div>
                                    <br>
                                    <input type="text" runat="server" placeholder="Observaciones" name="txtCLabios" id="txtCLabios" class="input-block-level">
                                </div>
                            </div>

                            <%--Funcion Labial--%>
                            <div class="control-group">
                                <label for="cmbLabios" class="control-label"><strong>Función Labial</strong></label>
                                <div class="controls">
                                    <div class="checkbox checkbox-primary col-lg-10" style="text-align: left; margin: auto; text-align: Left;">
                                        <asp:CheckBoxList ID="ckFuncionLabial" CellPadding="5" Font-Size="XX-Small" CellSpacing="5" RepeatColumns="1" RepeatDirection="Horizontal" TextAlign="Right"
                                            runat="server">
                                        </asp:CheckBoxList>
                                    </div>
                                </div>
                            </div>

                            <%--Mandíbula:--%>
                            <div class="control-group">
                                <label for="cmbMandibula" class="control-label"><strong>Mandíbula</strong></label>
                                <div class="controls">

                                    <select runat="server" id="cmbMandibula" name="cmbMandibula" class='select2-me input-xlarge'>
                                        <option value="">-- SELECCIONE --</option>
                                        <option value="PROGNATISMO"></option>
                                        <option value="RETROGNATISMO"></option>
                                        <option value="NORMAL"></option>
                                    </select>
                                    &nbsp
                                <input type="text" runat="server" name="txtCMandibula" id="txtCMandibula" class="input-xxlarge">
                                </div>
                            </div>

                            <%--Dientes--%>
                            <div class="control-group">
                                <label for="cmbDientes" class="control-label"><strong>Dientes</strong></label>
                                <div class="controls">

                                    <div class="row-fluid">
                                        <div class="checkbox checkbox-primary col-lg-10" style="text-align: left; margin: auto; text-align: Left;">
                                            <asp:CheckBoxList ID="ckDientes2" CellPadding="5" Font-Size="XX-Small" CellSpacing="5" RepeatColumns="1" RepeatDirection="Horizontal" TextAlign="Right"
                                                runat="server">
                                            </asp:CheckBoxList>
                                        </div>
                                    </div>



                                    <div class="row-fluid">
                                        <div class="control-list">
                                            Mala posición dentaria
                                        </div>
                                        <select runat="server" id="cmbDientes" name="cmbDientes" class='select2-me input-xlarge'>
                                            <option value="">-- SELECCIONE --</option>
                                            <option value="SI"></option>
                                            <option value="NO"></option>
                                            <option value="Se expresa a traves de"></option>
                                        </select>
                                        &nbsp
                                <input type="text" runat="server" name="txtOtros" id="txtOtros" placeholder="Otros" class="input-xxlarge">
                                    </div>
                                </div>
                            </div>

                            <%--BRUXISMO--%>
                            <div class="control-group">
                                <label for="cmbBRUXISMO" class="control-label"><strong>Bruxismo </strong></label>
                                <div class="controls">
                                    <div class="row-fluid">
                                        <div class="checkbox checkbox-primary col-lg-10" style="text-align: left; margin: auto; text-align: Left;">
                                            <asp:CheckBoxList ID="ckBRUXISMO" CellPadding="5" Font-Size="XX-Small" CellSpacing="5" RepeatColumns="1" RepeatDirection="Horizontal" TextAlign="Right"
                                                runat="server">
                                            </asp:CheckBoxList>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <%--Paladar:--%>
                            <div class="control-group">
                                <label for="cmbPaladar" class="control-label"><strong>Paladar</strong></label>
                                <div class="controls">

                                    <select runat="server" id="cmbPaladar" name="cmbPaladar" class='select2-me input-xlarge'>
                                        <option value="">-- SELECCIONE --</option>
                                        <option value="ALTO"></option>
                                        <option value="OJIVAL"></option>
                                        <option value="FISURADO"></option>
                                        <option value="HENDIDO"></option>
                                    </select>
                                    &nbsp
                                <input type="text" runat="server" name="txtCPaladar" id="txtCPaladar" class="input-xxlarge">
                                </div>
                            </div>

                            <%--Velo Paladar:--%>
                            <div class="control-group">
                                <label for="cmbVeloPaladar" class="control-label"><strong>Velo del Paladar</strong></label>
                                <div class="controls">

                                    <select runat="server" id="cmbVeloPaladar" name="cmbVeloPaladar" class='select2-me input-xlarge'>
                                        <option value="">-- SELECCIONE --</option>
                                        <option value="FISURADO"></option>
                                        <option value="PARALIZADO"></option>
                                    </select>

                                    &nbsp
                                <input type="text" runat="server" name="txtCVeloPaladar" id="txtCVeloPaladar" class="input-xxlarge">
                                </div>
                            </div>

                            <%--Lengua:--%>
                            <div class="control-group">
                                <label for="cmbLengua" class="control-label"><strong>Lengua</strong></label>
                                <div class="controls">
                                    <div class="checkbox checkbox-primary col-lg-10" style="text-align: left; margin: auto; text-align: Left;">
                                        <asp:CheckBoxList ID="ckLengua" CellPadding="5" Font-Size="XX-Small" CellSpacing="5" RepeatColumns="1" RepeatDirection="Horizontal" TextAlign="Right"
                                            runat="server">
                                        </asp:CheckBoxList>
                                    </div>
                                    <br>
                                    <input type="text" runat="server" name="txtCLengua" placeholder="Observaciones" id="txtCLengua" class="input-block-level">
                                </div>

                            </div>

                            <%--Uvula:--%>
                            <div class="control-group">
                                <label for="cmbUvula" class="control-label"><strong>Úvula</strong></label>
                                <div class="controls">

                                    <select runat="server" id="cmbUvula" name="cmbUvula" class='select2-me input-xlarge'>
                                        <option value="">-- SELECCIONE --</option>
                                        <option value="AUSENTE"></option>
                                        <option value="PRESENTE"></option>
                                        <option value="BÍFIDA"></option>
                                        <option value="LADEADA"></option>
                                        <option value="HIPERTROFIA"></option>
                                    </select>

                                    &nbsp
                                <input type="text" runat="server" name="txtCUvula" id="txtCUvula" class="input-xxlarge">
                                </div>
                            </div>

                        </div>


                    </div>
                </div>
            </div>
        </div>
        <%-- DESARROLLO PSICOMOTOR--%>
        <div class="row-fluid">
            <div class="span12">
                <div class="box box-bordered">
                    <div class="box-title">
                        <h3 runat="server" id="H4">
                            <i class="icon-edit"></i>Desarrollo Psicomotor</h3>
                        <div class="actions">
                            <a href="#" class="btn btn-mini content-slideUp"><i class="icon-angle-down"></i>
                            </a>
                        </div>
                    </div>
                    <div class='form-horizontal form-striped'>
                        <div>
                            <div class="box-content nopadding">
                                <div class='form-horizontal form-column form-bordered'>
                                    <div class="row">
                                        <div class="col-sm-12">
                                            <h4 align="center" runat="server" id="H5"><i></i>A QUE EDAD</h4>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <%--Sostuvo la Cabeza--%>
                                        <div class="col-sm-6">
                                            <div class="control-group">
                                                <label for="lblsostuvolacabeza" class="control-label col-sm-2">
                                                    <strong>Sostuvo la Cabeza</strong></label>
                                                <div class="controls">
                                                    <input type="text" name="txtSostuvolaCabeza" id="txtSostuvolaCabeza" placeholder="Digite Aqui" class="form-control" runat="server">
                                                </div>
                                            </div>

                                        </div>
                                        <%--Se Sento--%>
                                        <div class="col-sm-6">
                                            <div class="control-group">
                                                <label for="lblSeSento" class="control-label col-sm-2">
                                                    <strong>Se Sentó</strong></label>
                                                <div class="controls">
                                                    <input type="text" name="txtSeSento" id="txtSeSento" placeholder="Digite Aqui" class="form-control" runat="server">
                                                </div>
                                            </div>
                                        </div>

                                    </div>
                                    <div class="row">
                                        <%--GATEÓ--%>
                                        <div class="col-sm-6">
                                            <div class="control-group">
                                                <label for="lblGATEO" class="control-label col-sm-2">
                                                    <strong>Gateó</strong></label>
                                                <div class="controls">
                                                    <input type="text" name="txtGATEO" id="txtGATEO" placeholder="Digite Aqui" class="form-control" runat="server">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-sm-6">
                                            <div class="control-group">
                                                <label for="lblcamino" class="control-label col-sm-2">
                                                    <strong>Caminó</strong></label>
                                                <div class="controls">
                                                    <input type="text" name="txtcamino" id="txtcamino" placeholder="Digite Aqui" class="form-control" runat="server">
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

        <%-- FUNCIONES AUDITIVAS--%>
        <div class="row-fluid">
            <div class="span12">
                <div class="box box-bordered">
                    <div class="box-title">
                        <h3 runat="server" id="H17">
                            <i class="icon-edit"></i>Funciones Auditivas</h3>
                        <div class="actions">
                            <a href="#" class="btn btn-mini content-slideUp"><i class="icon-angle-down"></i>
                            </a>
                        </div>
                    </div>
                    <div class='form-horizontal form-striped'>
                        <div>
                            <div class="box-content nopadding">
                                <div class='form-horizontal form-column form-bordered'>
                                    <%--Funciones auditivas:--%>
                                    <div class="control-group">
                                        <label for="cmbFuncionesAuditivas" class="control-label"><strong>Funciones auditivas</strong></label>
                                        <div class="controls">
                                            <select runat="server" id="cmbFuncionesAuditivas" name="cmbFuncionesAuditivas" class='select2-me input-xlarge'>
                                                <option value="">-- SELECCIONE --</option>
                                                <option value="AUDICIÓN NORMAL"></option>
                                                <option value="HIPOACUSIA"></option>
                                                <option value="HIPERACUSIA"></option>
                                                <option value="SORDERA"></option>
                                            </select>
                                        </div>
                                    </div>

                                    <%--Respiración--%>
                                    <div class="control-group">
                                        <label for="cmbRespiracion" class="control-label"><strong>Respiración</strong></label>
                                        <div class="controls">

                                            <select runat="server" id="cmbRespiracion" name="cmbRespiracion" class='select2-me input-xlarge'>
                                                <option value="">-- SELECCIONE --</option>
                                                <option value="NASAL"></option>
                                                <option value="ORAL"></option>
                                                <option value="MIXTA"></option>
                                                <option value="CLAVICULAR"></option>
                                                <option value="DIAFRAGMÁTICA"></option>
                                                <option value="COSTODIAFRAGMÁTICA"></option>
                                            </select>
                                        </div>
                                    </div>


                                    <%--Características de la voz--%>
                                    <div class="control-group">
                                        <label for="txtVoz" class="control-label" style="font-size: small;">
                                            <strong>Características de la voz</strong></label>
                                        <div class="controls">
                                            <asp:TextBox ID="txtVoz" runat="server" TextMode="MultiLine" Height="100px" ValidationGroup="pnlData"
                                                Wrap="true" placeholder="Características de la voz" CssClass="input-block-level"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%-- CARACTERISTICAS DEL LENGUAJE--%>
        <div class="row-fluid">
            <div class="box box-bordered">
                <div class="box-title">
                    <h3 runat="server" id="H6">
                        <i class="icon-edit"></i>Características del Lenguaje</h3>
                    <div class="actions">
                        <a href="#" class="btn btn-mini content-slideUp"><i class="icon-angle-down"></i>
                        </a>
                    </div>
                </div>

                <div class="box-content nopadding">
                    <div class='form-group form-vertical'>
                        <div class="row">
                            <div class="col-sm-12">
                                <h4 align="center" runat="server" id="H7"><i></i>•	ATENCIÓN</h4>
                            </div>
                        </div>
                        <div class="row-fluid">
                            <%--MIRA A LOS OJOS CUANDO LE HABLAN--%>
                            <div class="col-sm-6">
                                <div class="control-group">
                                    <label for="lblMIRAALOSOJOSCUANDOLEHABLAN" class="control-label col-sm-6">
                                        <strong>MIRA A LOS OJOS CUANDO LE HABLAN</strong></label>
                                    <div class="controls">
                                        <asp:DropDownList ID="ddlMIRAALOSOJOSCUANDOLEHABLAN" CssClass="col-sm-6" runat="server" data-rule-required="true">
                                            <asp:ListItem Value="">-- SELECCIONE --</asp:ListItem>
                                            <asp:ListItem Value="SI">SI</asp:ListItem>
                                            <asp:ListItem Value="NO">NO</asp:ListItem>
                                            <asp:ListItem Value="N/A">N/A</asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                </div>
                                <%--ESCUCHA CUANDO LE HABLAN --%>
                                <div class="control-group">
                                    <label for="lblESCUCHACUANDOLEHABLAN" class="control-label col-sm-6">
                                        <strong>ESCUCHA CUANDO LE HABLAN</strong></label>
                                    <div class="controls">
                                        <asp:DropDownList ID="ddlESCUCHACUANDOLEHABLAN" CssClass="col-sm-6" runat="server" data-rule-required="true">
                                            <asp:ListItem Value="">-- SELECCIONE --</asp:ListItem>
                                            <asp:ListItem Value="SI">SI</asp:ListItem>
                                            <asp:ListItem Value="NO">NO</asp:ListItem>
                                            <asp:ListItem Value="N/A">N/A</asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                </div>

                                <%--PERMANECE SENTADO --%>
                                <div class="control-group">
                                    <label for="lblPERMANECESENTADO" class="control-label col-sm-6">
                                        <strong>PERMANECE SENTADO</strong></label>
                                    <div class="controls">
                                        <asp:DropDownList ID="ddlPERMANECESENTADO" CssClass="col-sm-6" runat="server" data-rule-required="true">
                                            <asp:ListItem Value="">-- SELECCIONE --</asp:ListItem>
                                            <asp:ListItem Value="SI">SI</asp:ListItem>
                                            <asp:ListItem Value="NO">NO</asp:ListItem>
                                            <asp:ListItem Value="N/A">N/A</asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                </div>
                            </div>
                            <%--REACCIONA AL CAMBIO EN UN JUEGO--%>
                            <div class="col-sm-6">
                                <div class="control-group">
                                    <label for="lblREACCIONAALCAMBIOENUNJUEGO" class="control-label col-sm-6">
                                        <strong>REACCIONA AL CAMBIO EN UN JUEGO</strong></label>
                                    <div class="controls">
                                        <asp:DropDownList ID="ddlREACCIONAALCAMBIOENUNJUEGO" CssClass="col-sm-6" runat="server" data-rule-required="true">
                                            <asp:ListItem Value="">-- SELECCIONE --</asp:ListItem>
                                            <asp:ListItem Value="SI">SI</asp:ListItem>
                                            <asp:ListItem Value="NO">NO</asp:ListItem>
                                            <asp:ListItem Value="N/A">N/A</asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                </div>
                            </div>
                            <%--MANTIENE LA ATENCIÓN DURANTE ACTIVIDADES DE MESA O SALÓN --%>
                            <div class="col-sm-6">
                                <div class="control-group">
                                    <label for="lblMANTIENELAATENCIONDURANTEACTIVIDADES" class="control-label col-sm-6">
                                        <strong>MANTIENE LA ATENCIÓN DURANTE ACTIVIDADES DE MESA O SALÓN
                                        </strong>
                                    </label>
                                    <div class="controls">
                                        <asp:DropDownList ID="ddlMANTIENELAATENCIONDURANTEACTIVIDADES" CssClass="col-sm-6" runat="server" data-rule-required="true">
                                            <asp:ListItem Value="">-- SELECCIONE --</asp:ListItem>
                                            <asp:ListItem Value="SI">SI</asp:ListItem>
                                            <asp:ListItem Value="NO">NO</asp:ListItem>
                                            <asp:ListItem Value="N/A">N/A</asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-12">
                                <h4 align="center" runat="server" id="H8"><i></i>•	MEMORIA</h4>
                            </div>
                        </div>
                        <div class="row-fluid">
                            <%--RECUERDA DONDE ESTÁN LOS OBJETOS--%>
                            <div class="col-sm-6">
                                <div class="control-group">
                                    <label for="lblRECUERDADONDEESTANLOSOBJETOS" class="control-label col-sm-6">
                                        <strong>RECUERDA DONDE ESTÁN LOS OBJETOS</strong></label>
                                    <div class="controls">
                                        <asp:DropDownList ID="ddlRECUERDADONDEESTANLOSOBJETOS" CssClass="col-sm-6" runat="server" data-rule-required="true">
                                            <asp:ListItem Value="">-- SELECCIONE --</asp:ListItem>
                                            <asp:ListItem Value="SI">SI</asp:ListItem>
                                            <asp:ListItem Value="NO">NO</asp:ListItem>
                                            <asp:ListItem Value="N/A">N/A</asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                </div>
                            </div>
                            <%--RECONOCE OBJETOS O IMÁGENES VISTAS--%>
                            <div class="col-sm-6">
                                <div class="control-group">
                                    <label for="lblRECONOCEOBJETOSOIMAGENESVISTAS" class="control-label col-sm-6">
                                        <strong>RECONOCE OBJETOS O IMÁGENES VISTAS</strong></label>
                                    <div class="controls">
                                        <asp:DropDownList ID="ddlRECONOCEOBJETOSOIMAGENESVISTAS" CssClass="col-sm-6" runat="server" data-rule-required="true">
                                            <asp:ListItem Value="">-- SELECCIONE --</asp:ListItem>
                                            <asp:ListItem Value="SI">SI</asp:ListItem>
                                            <asp:ListItem Value="NO">NO</asp:ListItem>
                                            <asp:ListItem Value="N/A">N/A</asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                </div>
                            </div>

                        </div>
                        <div class="row">
                            <div class="col-sm-12">
                                <h4 align="center" runat="server" id="H9"><i></i>• PERCEPCIÓN VISUAL</h4>
                            </div>
                        </div>
                        <div class="row-fluid">
                            <%--ASOCIA OBJETOS- IMÁGENES--%>
                            <div class="col-sm-6">
                                <div class="control-group">
                                    <label for="lblASOCIAOBJETOSIMAGENES" class="control-label col-sm-6">
                                        <strong>ASOCIA OBJETOS- IMÁGENES</strong></label>
                                    <div class="controls">
                                        <asp:DropDownList ID="ddlASOCIAOBJETOSIMAGENES" CssClass="col-sm-6" runat="server" data-rule-required="true">
                                            <asp:ListItem Value="">-- SELECCIONE --</asp:ListItem>
                                            <asp:ListItem Value="SI">SI</asp:ListItem>
                                            <asp:ListItem Value="NO">NO</asp:ListItem>
                                            <asp:ListItem Value="N/A">N/A</asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>

        </div>

        <div class="row-fluid">
            <div class="box box-bordered">
                <div class="box-title">
                    <h3 runat="server" id="H10">
                        <i class="icon-edit"></i>Historia Escolar</h3>
                    <div class="actions">
                        <a href="#" class="btn btn-mini content-slideUp"><i class="icon-angle-down"></i>
                        </a>
                    </div>
                </div>

                <div class="box-content nopadding">
                    <div class='form-group form-vertical'>
                        <div class="row-fluid">
                            <%--¿A QUÉ EDAD INICIO LA ESCUELA?--%>
                            <div class="col-sm-6">
                                <div class="control-group">
                                    <label for="lblAQUEEDADINICIOLAESCUELA" class="control-label col-sm-6">
                                        <strong>¿A QUÉ EDAD INICIO LA ESCUELA?</strong></label>
                                    <div class="controls">
                                        <input type="text" name="txtAQUEEDADINICIOLAESCUELA" id="txtAQUEEDADINICIOLAESCUELA" placeholder="Digite Aqui" class="col-sm-6" runat="server">
                                    </div>
                                </div>
                                <%--¿HA TENIDO PROBLEMAS DE ADAPTACIÓN?--%>
                                <div class="control-group">
                                    <label for="lblHATENIDOPROBLEMASDEADAPTACION" class="control-label col-sm-6">
                                        <strong>¿HA TENIDO PROBLEMAS ADAPTACIÓN?</strong></label>
                                    <div class="controls">
                                        <asp:DropDownList ID="ddlHATENIDOPROBLEMASDEADAPTACION" CssClass="col-sm-6" runat="server" data-rule-required="true">
                                            <asp:ListItem Value="">-- SELECCIONE --</asp:ListItem>
                                            <asp:ListItem Value="SI">SI</asp:ListItem>
                                            <asp:ListItem Value="NO">NO</asp:ListItem>
                                            <asp:ListItem Value="N/A">N/A</asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                </div>
                                <%--EMPAREJA IMÁGENES IGUALES--%>
                                <div class="control-group">
                                    <label for="lblEMPAREJAIMAGENESIGUALES" class="control-label col-sm-6">
                                        <strong>EMPAREJA IMÁGENES IGUALES</strong></label>
                                    <div class="controls">
                                        <asp:DropDownList ID="ddlEMPAREJAIMAGENESIGUALES" CssClass="col-sm-6" runat="server" data-rule-required="true">
                                            <asp:ListItem Value="">-- SELECCIONE --</asp:ListItem>
                                            <asp:ListItem Value="SI">SI</asp:ListItem>
                                            <asp:ListItem Value="NO">NO</asp:ListItem>
                                            <asp:ListItem Value="N/A">N/A</asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <%--REALIZA CONTACTO VISUAL --%>
                                <div class="control-group">
                                    <label for="lblREALIZACONTACTOVISUAL" class="control-label col-sm-6">
                                        <strong>REALIZA CONTACTO VISUAL
                                        </strong>
                                    </label>
                                    <div class="controls">
                                        <asp:DropDownList ID="ddlREALIZACONTACTOVISUAL" CssClass="col-sm-6" runat="server" data-rule-required="true">
                                            <asp:ListItem Value="">-- SELECCIONE --</asp:ListItem>
                                            <asp:ListItem Value="OCASIONAL">OCASIONAL</asp:ListItem>
                                            <asp:ListItem Value="SOSTENIDO">SOSTENIDO</asp:ListItem>
                                            <asp:ListItem Value="NO REALIZA">NO REALIZA</asp:ListItem>
                                            <asp:ListItem Value="N/A">N/A</asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                </div>
                                <%--Sigue instrucciones::--%>
                                <div class="control-group">
                                    <label for="cmbSigueInstrucciones" class="control-label  col-sm-6">
                                        <strong>SIGUE INSTRUCCIONES</strong></label>
                                    <div class="controls">
                                        <asp:DropDownList ID="cmbSigueInstrucciones" CssClass="col-sm-6" runat="server" data-rule-required="true">
                                            <asp:ListItem Value="">-- SELECCIONE --</asp:ListItem>
                                            <asp:ListItem Value="SIMPLES">SIMPLES</asp:ListItem>
                                            <asp:ListItem Value="COMPLEJAS">COMPLEJAS</asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>

        </div>

        <div class="row-fluid">
            <div class="box box-bordered">
                <div class="box-title">
                    <h3 runat="server" id="H11">
                        <i class="icon-edit"></i>Iniciar una conversación con el evaluado, de la manera más espontanea posible, a continuación se sugieren las siguientes interrogantes; que pueden ser efectuadas al inicio de la entrevista.</h3>
                    <div class="actions">
                        <a href="#" class="btn btn-mini content-slideUp"><i class="icon-angle-down"></i>
                        </a>
                    </div>
                </div>
                <div class="box-content nopadding">
                    <div class='form-group form-vertical'>
                        <div class="row-fluid">
                            <div class="col-sm-6">
                                <%--¿CÓMO TE LLAMAS?--%>
                                <div class="control-group">
                                    <label for="lblCOMOTELLAMAS" class="control-label col-sm-6">
                                        <strong>¿CÓMO TE LLAMAS?</strong></label>
                                    <div class="controls">
                                        <input type="text" runat="server" name="txtCOMOTELLAMAS" id="txtCOMOTELLAMAS" class="input-block-level" cssclass="col-sm-6">
                                    </div>
                                </div>
                                <%--¿CUÁNTOS AÑOS TIENES?--%>
                                <div class="control-group">
                                    <label for="lblCUANTOSANIOSTIENES" class="control-label col-sm-6">
                                        <strong>¿CUÁNTOS AÑOS TIENES?</strong></label>
                                    <div class="controls">
                                        <input type="text" runat="server" name="txtCUANTOSANIOSTIENES" id="txtCUANTOSANIOSTIENES" class="input-block-level" cssclass="col-sm-6">
                                    </div>
                                </div>
                                <%--¿CON QUIÉN HAS VENIDO?--%>
                                <div class="control-group">
                                    <label for="lblCONQUIENHASVENIDO" class="control-label col-sm-6">
                                        <strong>¿CON QUIÉN HAS VENIDO?</strong></label>
                                    <div class="controls">
                                        <input type="text" runat="server" name="txtCONQUIENHASVENIDO" id="txtCONQUIENHASVENIDO" class="input-block-level" cssclass="col-sm-6">
                                    </div>
                                </div>
                                <%--¿CUÁL ES EL NOMBRE DE TU PAPA?--%>
                                <div class="control-group">
                                    <label for="lblCUALESELNOMBREDETUPAPA" class="control-label col-sm-6">
                                        <strong>¿CUÁL ES EL NOMBRE DE TU PAPA?</strong></label>
                                    <div class="controls">
                                        <input type="text" runat="server" name="txtCUALESELNOMBREDETUPAPA" id="txtCUALESELNOMBREDETUPAPA" class="input-block-level" cssclass="col-sm-6">
                                    </div>
                                </div>
                                <%--¿CUÁL ES EL NOMBRE DE TU MAMA?--%>
                                <div class="control-group">
                                    <label for="lblCUALESELNOMBREDETUMAMA" class="control-label col-sm-6">
                                        <strong>¿CUÁL ES EL NOMBRE DE TU MAMA?</strong></label>
                                    <div class="controls">
                                        <input type="text" runat="server" name="txtCUALESELNOMBREDETUMAMA" id="txtCUALESELNOMBREDETUMAMA" class="input-block-level" cssclass="col-sm-6">
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <%--¿TIENES HERMANOS? --%>
                                <div class="control-group">
                                    <label for="lblTIENESHERMANOS" class="control-label col-sm-6">
                                        <strong>¿TIENES HERMANOS?
                                        </strong>
                                    </label>
                                    <div class="controls">
                                        <input type="text" runat="server" name="txtTIENESHERMANOS" id="txtTIENESHERMANOS" class="input-block-level" cssclass="col-sm-6">
                                    </div>
                                </div>
                                <%--¿CÓMO SE LLAMAN?--%>
                                <div class="control-group">
                                    <label for="lblCOMOSELLAMAN" class="control-label col-sm-6">
                                        <strong>¿CÓMO SE LLAMAN?</strong></label>
                                    <div class="controls">
                                        <input type="text" runat="server" name="txtCOMOSELLAMAN" id="txtCOMOSELLAMAN" class="input-block-level" cssclass="col-sm-6">
                                    </div>
                                </div>
                                <%--¿CUÁL ES EL NOMBRE DE TU COLEGIO?--%>
                                <div class="control-group">
                                    <label for="lblCUALESELNOMBREDETUCOLEGIO" class="control-label col-sm-6">
                                        <strong>¿CUÁL ES EL NOMBRE DE TU COLEGIO?</strong></label>
                                    <div class="controls">
                                        <input type="text" runat="server" name="txtCUALESELNOMBREDETUCOLEGIO" id="txtCUALESELNOMBREDETUCOLEGIO" class="input-block-level" cssclass="col-sm-6">
                                    </div>
                                </div>
                                <%--¿QUÉ TE GUSTA COMER?--%>
                                <div class="control-group">
                                    <label for="lblQUETEGUSTACOMER" class="control-label col-sm-6">
                                        <strong>¿QUÉ TE GUSTA COMER?</strong></label>
                                    <div class="controls">
                                        <input type="text" runat="server" name="txtQUETEGUSTACOMER" id="txtQUETEGUSTACOMER" class="input-block-level" cssclass="col-sm-6">
                                    </div>
                                </div>
                                <%--¿QUÉ TE GUSTA JUGAR?--%>
                                <div class="control-group">
                                    <label for="lblQUETEGUSTAJUGAR" class="control-label col-sm-6">
                                        <strong>¿QUÉ TE GUSTA JUGAR?</strong></label>
                                    <div class="controls">
                                        <input type="text" runat="server" name="txtQUETEGUSTAJUGAR" id="txtQUETEGUSTAJUGAR" class="input-block-level" cssclass="col-sm-6">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>

        <div class="row-fluid">
            <div class="box box-bordered">
                <div class="box-title">
                    <h3 runat="server" id="H12">
                        <i class="icon-edit"></i>Objetivos A Trabajar</h3>
                    <div class="actions">
                        <a href="#" class="btn btn-mini content-slideUp"><i class="icon-angle-down"></i>
                        </a>
                    </div>
                </div>

                <div class="box-content nopadding">
                    <div class='form-group form-vertical'>
                        <div class="row-fluid">
                            <div class="control-group">

                                <div class="controls">
                                    <asp:TextBox ID="txtOBJETIVOSATRABAJAR" runat="server" TextMode="MultiLine" Height="100px"
                                        Wrap="true" placeholder="Digite aquí" CssClass="input-block-level"></asp:TextBox>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="row-fluid">
            <div class="box box-bordered">
                <div class="box-title">
                    <h3 runat="server" id="H13">
                        <i class="icon-edit"></i>Observaciones</h3>
                    <div class="actions">
                        <a href="#" class="btn btn-mini content-slideUp"><i class="icon-angle-down"></i>
                        </a>
                    </div>
                </div>

                <div class="box-content nopadding">
                    <div class='form-group form-vertical'>
                        <div class="row-fluid">
                            <div class="control-group">

                                <div class="controls">
                                    <asp:TextBox ID="txtOBSERVACIONES" runat="server" TextMode="MultiLine" Height="100px"
                                        Wrap="true" placeholder="Digite aquí" CssClass="input-block-level"></asp:TextBox>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div> 

</asp:Content>













