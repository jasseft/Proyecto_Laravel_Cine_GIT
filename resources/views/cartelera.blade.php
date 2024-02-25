<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="csrf-token" content="{{ csrf_token() }}">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>CINE UBAM</title>
    <link rel="icon" type="image/png" href="https://cdn-icons-png.flaticon.com/512/2809/2809590.png">
    <!-- Agrega Bootstrap CSS -->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link href="https://cdn.jsdelivr.net/npm/sweetalert2@11.10.5/dist/sweetalert2.min.css" rel="stylesheet">
    <link rel="stylesheet" href="{!! asset('css/cine.css') !!}">
</head>
<body>
    <h1 style="text-align: center;">CINE UBAM</h1>
    <div class="container">
        <!-- Botón para abrir el modal -->
        <button id="btnAgregarPelicula" class="btn btn-primary" data-toggle="modal" data-target="#modalAgregarPelicula">Agregar Película</button>
        <!-- Tabla con las tarjetas de películas -->
        @if (!empty($peliculas))
            <table class="tabla">
                @php
                    $chunks = array_chunk($peliculas, 4);
                @endphp
                @foreach ($chunks as $chunk)
                    <tr>
                        @foreach ($chunk as $pelicula)
                            <td>
                                <div class="tarjeta" onclick="mostrarDetalles({{ $pelicula->PeliculaId }})">
                                    <img src="{{ $pelicula->Pelicula_Imagen }}" alt="Imagen de la película" class="card-img-top">
                                    <div class="card-body">
                                        <!--<h5 class="card-title">{{ $pelicula->Pelicula_Nombre }}</h5>
                                        <p class="card-text">Género: {{ $pelicula->Genero }}</p>
                                        <p class="card-text">Idioma: {{ $pelicula->Idioma }}</p>
                                        <p class="card-text">Precio: {{ $pelicula->Pelicula_Precio }}</p>
                                        <p class="card-text">Año: {{ $pelicula->Pelicula_Year }}</p>
                                        <p class="card-text">Cantidad disponible: {{ $pelicula->Pelicula_Cantidad }}</p>-->
                                    </div>
                                </div>
                            </td>
                        @endforeach
                    </tr>
                @endforeach
            </table>
        @else
            <center><h3>SIN FUNCIONES</h3></center>
        @endif
    </div>

    <!-- Modal para agregar película -->
    <div class="modal fade" id="modalAgregarPelicula" tabindex="-1" role="dialog" aria-labelledby="modalAgregarPeliculaLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="modalAgregarPeliculaLabel">Agregar Película</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Cerrar">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <!-- Formulario para agregar película -->
                    <form id="formAgregarPelicula" method="POST" enctype="multipart/form-data">
                        @csrf
                        <!-- Campo para el nombre de la película -->
                        <div class="form-group">
                            <label for="nombrePelicula">Nombre de la película</label>
                            <input type="text" class="form-control" id="nombrePelicula" name="nombrePelicula" required>
                        </div>

                        <!-- Campo para seleccionar el género -->
                        <div class="form-group">
                            <label for="genero">Género</label>
                            <select class="form-control" id="generoId" name="generoId" required>
                                <!-- Aquí se cargarán las opciones de manera dinámica -->
                            </select>
                        </div>

                        <!-- Campo para seleccionar el idioma -->
                        <div class="form-group">
                            <label for="idioma">Idioma</label>
                            <select class="form-control" id="idiomaId" name="idiomaId" required>
                                <!-- Aquí se cargarán las opciones de manera dinámica -->
                            </select>
                        </div>

                        <!-- Campo para el precio -->
                        <div class="form-group">
                            <label for="precio">Precio</label>
                            <input type="number" class="form-control" id="precio" name="precio" min="0" step="0.01" required>
                        </div>

                        <!-- Campo para el año de estreno -->
                        <div class="form-group">
                            <label for="anioEstreno">Año de estreno</label>
                            <input type="number" class="form-control" id="anioEstreno" name="anioEstreno" min="1900" max="2099" required>
                        </div>

                        <!-- Campo para la cantidad -->
                        <div class="form-group">
                            <label for="cantidad">Cantidad</label>
                            <input type="number" class="form-control" id="cantidad" name="cantidad" min="0" required>
                        </div>

                        <!-- Campo para la imagen -->
                        <div class="form-group">
                            <label for="imagen">Imagen</label>
                            <input type="file" class="form-control-file" id="imagen" name="imagen" accept="image/*" onchange="previewImage(event)">
                            <img id="previewImagen" src="#" alt="Vista previa de la imagen" style="display: none; margin-top: 10px; max-width: 100%; height: auto;">
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
                    <button type="submit" class="btn btn-primary" id="btnGuardarPelicula">Guardar</button>
                </div>
            </div>
        </div>
    </div>

    <!-- Modal para mostrar los detalles de la película -->
    <div class="modal fade" id="modalDetallesPelicula" tabindex="-1" role="dialog" aria-labelledby="modalDetallesPeliculaLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="modalDetallesPeliculaLabel">Detalles de la Película</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Cerrar">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form id="formVentaPelicula" method="POST">
                        @csrf
                        <div><strong>ID:</strong> {{ $pelicula->PeliculaId }}</div>
                        <div><strong>Título:</strong> {{ $pelicula->Pelicula_Nombre }}</div>
                        <div><strong>Género:</strong> {{ $pelicula->Genero }}</div>
                        <div><strong>Idioma:</strong> {{ $pelicula->Idioma }}</div>
                        <div><strong>Precio:</strong> {{ $pelicula->Pelicula_Precio }}</div>
                        <div><strong>Año:</strong> {{ $pelicula->Pelicula_Year }}</div>
                        <div><strong>Cantidad disponible:</strong> {{ $pelicula->Pelicula_Cantidad }}</div>
                        <input type="hidden" id="peliculaId" name="peliculaId" value="{{ $pelicula->PeliculaId }}">
                        <div class="form-group">
                            <label for="cantidad">Entradas</label>
                            <input type="number" class="form-control" id="cantidadEntradas" name="cantidadEntradas" min="0">
                        </div>
                        <button type="button" class="btn btn-primary" id="btnCalcularPrecio" onclick="calcularPrecio({{ $pelicula->Pelicula_Precio }})" >Calcular Precio</button><br>
                        <div id="totalPagar"></div><br>
                        <div class="form-group">
                            <label for="precio">Pagar con:</label>
                            <input type="number" class="form-control" id="precioPagar" name="precioPagar" min="{{ $pelicula->Pelicula_Precio }}">
                        </div>
                        <button type="submit" class="btn btn-success" id="btnRealizarVenta">Comprar</button><br>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                </div>
            </div>
        </div>
    </div>

    <!-- Agrega jQuery y Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/js/bootstrap.bundle.min.js"></script>

    <script type="text/javascript" src="{{ asset('js/cine.js') }}"></script>
</body>
</html>

