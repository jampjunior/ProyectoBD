$(document).ready(function () {
    //console.log("ese que pasooooo");

    function GetMarcas() {
        //PREPARAR LLAMADA API

        var urlApi = 'http://localhost:51093/api/Marcas';

        $.get(urlApi, function (respuesta, estado) {

            if (estado === 'success') {

                var lista = ('');
                lista += '<table>';
                lista += '    <tr>';
                lista += '        <td>Id.</td>'
                lista += '        <td>Denominación</td>'
                lista += '        <td>Acciones</td>'
                lista += '    </tr>';

                $.each(respuesta.dataMarca, function (indice, elemento) {

                    lista += '    <tr>';
                    lista += '        <td>' + elemento.id + '</td>';
                    lista += '        <td>' + elemento.denominacion + '</td>';
                    lista += '        <td>';
                    lista += '<button data-id="' + elemento.id + '" id="eliminar">X</button>';
                    lista += '<button id="Editar">Editar</button>';
                    lista += '        <td>';
                    lista += '    </tr>';
                    

                });

                lista += '</table>';
                $('#resultado').append(lista);
            }


            //PROCESAR LOS RESULTADOS


        });

    }

    $('#resultado').on('click', '#eliminar', function () {
        var idMarca = $(this).attr('data-id');
        var urlAPI = 'http://localhost:51093/api/Marcas';
        $.ajax({
            url: urlAPI + '/' + idMarca,
            type: "DELETE",
            success: function (respuesta) {
                GetMarcas();
            },
            error: function (respuesta) {
                console.log(respuesta);
            }
        });
    });

  

    $('#btnAddMarca').click(function () {
        // debugger;
        var nuevaMarca = $('#txtMarcaDenominacion').val();
        var urlAPI = 'http://localhost:51093/api/Marcas';
        var dataNuevaMarca = {
            id: 0,
            denominacion: nuevaMarca
        };
        // debugger;

        $.ajax({
            url: urlAPI,
            type: "POST",
            dataType: 'json',
            data: dataNuevaMarca,
            success: function (respuesta) {
                //debugger;
                console.log(respuesta);
                GetMarcas();
            },
            error: function (respuesta) {
                console.log(respuesta);
            }
        });

        $.ajax({
            url: 'http://localhost:51093/api/Marcas/5',
            type: "PUT",
            dataType: 'json',
            data: dataNuevaMarca,
            success: function (respuesta) {
                GetMarcas();
            },
            error: function (respuesta) {
                console.log(respuesta);
            }
        });


        $.ajax({
            url: 'http://localhost:51093/api/Marcas/5',
            type: "DELETE",
            success: function (respuesta) {
                GetMarcas();
            },
            error: function (respuesta) {
                console.log(respuesta);
            }
        });


    });

    GetMarcas();







});
