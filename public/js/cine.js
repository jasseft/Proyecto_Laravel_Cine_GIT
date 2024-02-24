function init(){
    obtenerGeneros();
    obtenerIdiomas();

    $("#btnGuardarPelicula").on("click",function(){
        event.preventDefault(); 
        registroPelicula();   
    })

}

function obtenerGeneros(){
    // Llamada AJAX para obtener los géneros
    $.ajax({
        url: '/obtenerGeneros', // Ruta que apunta a la función en tu controlador que obtiene los géneros
        type: 'GET',
        success: function(data) {
            // Limpiar el select
            $('#generoId').empty();
            // Agregar opciones al select con los datos obtenidos
            $('#generoId').append($('<option>', {
                value: '',
                text: 'Selecciona un género'
            }));
            // Iterar sobre los datos y agregar cada género como una opción en el select
            $.each(data, function(index, genero) {
                $('#generoId').append($('<option>', {
                    value: genero.GeneroId,
                    text: genero.Genero_Nombre
                }));
            });
        }
    });
}

function obtenerIdiomas(){
    // Llamada AJAX para obtener los idiomas
    $.ajax({
        url: '/obtenerIdiomas', // Cambia esta URL por la ruta que apunta al método obtenerIdiomas en tu controlador
        type: 'GET',
        success: function(data) {
            // Limpiar el select
            $('#idiomaId').empty();
            // Agregar opciones al select con los datos obtenidos
            $('#idiomaId').append($('<option>', {
                value: '',
                text: 'Selecciona un idioma'
            }));
            // Iterar sobre los datos y agregar cada idioma como una opción en el select
            $.each(data, function(index, idioma) {
                $('#idiomaId').append($('<option>', {
                    value: idioma.IdiomaId,
                    text: idioma.Idioma_Nombre
                }));
            });
        }
    });
}

function mostrarDetalles(id) {
    // Realizar una solicitud AJAX para obtener los detalles de la película
    $.ajax({
        url: '/obtenerDetallePelicula/' + id,
        type: 'GET',
        success: function(response) {
            // Verifica si la respuesta contiene datos de la película
            if (response.error) {
                // Maneja el caso en el que ocurrió un error al obtener los detalles de la película
                console.error(response.error);
            } else {
                // Construye el contenido HTML para mostrar los detalles de la película en el modal
                var contenidoModal = `
                    <div><strong>Título:</strong> ${response.titulo}</div>
                    <div><strong>Género:</strong> ${response.genero}</div>
                    <div><strong>Idioma:</strong> ${response.idioma}</div>
                    <div><strong>Precio:</strong> ${response.precio}</div>
                    <div><strong>Año:</strong> ${response.año}</div>
                    <div><strong>Cantidad disponible:</strong> ${response.cantidad}</div>
                    <img src="${response.imagen}" alt="Imagen de la película">
                `;

                // Actualiza el contenido del modal con los detalles de la película
                $('#modalDetallesPelicula .modal-body').html(contenidoModal);

                // Muestra el modal
                $('#modalDetallesPelicula').modal('show');
            }
        },
        error: function(xhr, status, error) {
            // Maneja el caso en el que ocurrió un error durante la solicitud AJAX
            console.error(error);
        }
    });
}

function previewImage(event) {
    var reader = new FileReader();
    reader.onload = function() {
        var preview = document.getElementById('previewImagen');
        preview.src = reader.result;
        preview.style.display = 'block'; // Mostrar la imagen previa
    };
    reader.readAsDataURL(event.target.files[0]);
}

function registroPelicula(){
    var imagen = $('#imagen')[0].files[0]; // Obtener el archivo de imagen
    // Verificar si se seleccionó una imagen
    if (imagen) {
        // Crear un nuevo objeto FormData para enviar los datos del formulario
        var formData = new FormData($('#formAgregarPelicula')[0]);

        // Realizar una solicitud AJAX para mover la imagen al directorio deseado
        $.ajax({
            url: '/agregarPelicula',
            type: 'POST',
            data: formData,
            contentType: false,
            processData: false,
            success: function(response) {
                if(response.message==="Película agregada correctamente"){
                    Swal.fire({
                        title:response.message,
                        icon:'success',
                        confirmButtonText: 'Entendido',
                        timer:3000,
                        willClose: () => {
                            actualizarVista(response.peliculas);
                            $('#modalAgregarPelicula').modal('hide');
                            LimpiarModal();
                        }
                    })

                }else{
                    Swal.fire({
                        title:response.message,
                        icon:'error',
                        confirmButtonText: 'Entendido',
                         
                    })
                }
            }
        });
    } else {
        Swal.fire({
            title:'Por favor, selecciona una imágen',
            icon:'error',
            confirmButtonText: 'Entendido',
             
        })
    }
}

function moverImagen(){
    // // Recopilar los datos del formulario
    var nombrePelicula = $('#nombrePelicula').val();
    var generoId = $('#genero').val();
    var idiomaId = $('#idioma').val();
    var precio = $('#precio').val();
    var anioEstreno = $('#anioEstreno').val();
    var cantidad = $('#cantidad').val();
    var imagen = $('#imagen')[0].files[0]; // Obtener el archivo de imagen

    // Verificar si se seleccionó una imagen
    if (imagen) {
        // Crear un nuevo objeto FormData para enviar los datos del formulario
        var formData = new FormData($('#formAgregarPelicula')[0]);
   

        // Realizar una solicitud AJAX para mover la imagen al directorio deseado
        $.ajax({
            url: '/moverImagen',
            type: 'POST',
            data: formData,
            contentType: false,
            processData: false,
            success: function(response) {
                // Si la imagen se movió correctamente, mostrar un mensaje
                alert('Imagen cargada y movida. URL: ' + response.imagen_url);
                console.log(response);
            }
        });
    } else {
        // Mostrar un mensaje si no se seleccionó ninguna imagen
        alert('Por favor selecciona una imagen');
    }
}

function actualizarVista(peliculas) {
    // Limpiar la tabla de películas
    $('.tabla').empty();

    // Verificar si hay películas
    if (peliculas.length > 0) {
        // Iterar sobre las películas y agregarlas a la tabla
        $.each(peliculas, function(index, pelicula) {
            // Si es el inicio de una nueva fila, crear una fila
            if (index % 4 === 0) {
                $('.tabla').append('<tr>');
            }
            
            // Construir el HTML de la tarjeta de la película
            var tarjeta = '<td>' +
                '<div class="tarjeta" onclick="mostrarDetalles(' + pelicula.PeliculaId + ')">' +
                '<img src="' + pelicula.Pelicula_Imagen + '" alt="Imagen de la película" class="card-img-top">' +
                '<div class="card-body">' +
                // Agregar más detalles de la película si es necesario
                '</div>' +
                '</div>' +
                '</td>';

            // Agregar la tarjeta a la fila actual
            $('.tabla tr:last').append(tarjeta);
            
            // Si es el final de una fila o la última película, cerrar la fila
            if ((index + 1) % 4 === 0 || (index + 1) === peliculas.length) {
                $('.tabla').append('</tr>');
            }
        });
    } else {
        // Si no hay películas, mostrar un mensaje
        $('.tabla').append('<tr><td colspan="4">Sin películas</td></tr>');
    }
}

function LimpiarModal() {
    // Limpiar todos los campos del modalAgregarPelicula
    $('#nombrePelicula').val('');
    $('#generoId').val('');
    $('#idiomaId').val('');
    $('#precio').val('');
    $('#anioEstreno').val('');
    $('#cantidad').val('');
    $('#imagen').val('');
    $('#previewImagen').attr('src', '').hide(); // Ocultar la vista previa de la imagen
}

init();


