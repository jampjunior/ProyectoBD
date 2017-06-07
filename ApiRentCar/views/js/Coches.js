 $(document).ready(function () {
        //console.log("ese que pasooooo");


        //PREPARAR LLAMADA API

     var urlApi = 'http://localhost:51093/api/Coches';

        $.get(urlApi, function (respuesta, estado) {

            if (estado === 'success') {

                var lista = ('');

                $.each(respuesta.data, function (indice, elemento) {

                    lista = '<div id="coche">';
                    lista += '<ul>';
                    lista += '<li>' + 'id: '+ elemento.id  + '</li>';
                    lista += '<li>' + 'Matricula; ' + elemento.matricula + '</li>';
                    lista += '<li>' + 'Color: ' + elemento.color + '</li>';
                    lista += '<li>' + 'Cilindrada: ' + elemento.cilindrada + '</li>';
                    lista += '<li>' + 'Nº Plazas: ' + elemento.nPlazas + '</li>';
                    lista += '<li>' + 'Fecha de Matriculacion: ' + elemento.fechaMatriculacion + '</li>';
                    lista += '<li>' + 'Marca: ' + elemento.marca.denominacion + '</li>';
                    lista += '<li>' + 'idMarca: ' + elemento.marca.id + '</li>';
                    lista += '<li>' + 'idTiposCombustible: ' + elemento.tipoCombustible.id + '</li>';
                    lista += '<li>' + 'Combustible: ' + elemento.tipoCombustible.denominacion + '</li>';
                    lista += '</ul>';
                    lista += '</div>';

                    $('#coche').append(lista);

                });



            }


            //PROCESAR LOS RESULTADOS


              });

 });