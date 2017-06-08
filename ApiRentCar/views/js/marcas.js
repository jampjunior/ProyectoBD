$(document).ready(function () {
    //console.log("ese que pasooooo");

    
         //PREPARAR LLAMADA API
           
        var urlApi = 'http://localhost:51093/api/Marcas';
        
        $.get(urlApi, function (respuesta, estado) {

            if (estado === 'success') {

                var lista = ('');

                $.each(respuesta.dataMarca, function (indice, elemento) {

                    lista = '<div id="resultado">';
                    lista += '<ul>';
                    lista += '<li>' + elemento.id + '</li>';
                    lista += '<li>' + elemento.denominacion + '</li>';
                    lista += '</ul>';
                    lista += '</div>';

                    $('#resultado').append(lista);

                });



            }


            //PROCESAR LOS RESULTADOS


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
                success: function (data) {
                  // debugger;
                    console.log(data);
                }
            });
        });


});