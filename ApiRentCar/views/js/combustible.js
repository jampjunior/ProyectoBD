$(document).ready(function () {
    //console.log("ese que pasooooo");

    function GetCombustible() { //PREPARAR LLAMADA API

        var urlApi = 'http://localhost:51093/api/TiposCombustible';

        $.get(urlApi, function (respuesta, estado) {

            if (estado === 'success') {

                var lista = ('');

                $.each(respuesta.dataTipoCombustible, function (indice, elemento) {

                    lista = '<div id="resultado">';
                    lista += '<ul>';
                    lista += '<li>' + elemento.id + '</li>';
                    lista += '<li>' + elemento.denominacion + '</li>';
                    lista += '</ul>';
                    lista += '</div>';

                    $('#combustible').append(lista);

                });
            }

        });
    }
   



    $('#btnAddCombustible').click(function () {
         debugger;
        var nuevoCombustible = $('#txtTipoCombustible').val();
        var urlAPI = 'http://localhost:51093/api/TiposCombustible';
        var dataNuevoCombustible = {
            id: 0,
            denominacion: dataNuevoCombustible
        };
        debugger;

        $.ajax({
            url: urlAPI,
            type: "POST",
            dataType: 'json',
            data: dataNuevoCombustible,
            success: function (respuesta) {
                debugger;
                console.log(respuesta);
                GetCombustible();
            },
            error: function (respuesta) {
                console.log(respuesta);
            }
        });
    });

    GetCombustible();








});