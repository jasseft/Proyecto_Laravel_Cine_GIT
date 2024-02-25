<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\CarteleraController;
/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "web" middleware group. Make something great!
|
*/

Route::get('/', function () {
    return view('welcome');
});

Route::get('/cine', function () {
    $peliculas = DB::select('CALL getAllPeliculas()');
    return view('cartelera', ['peliculas' => $peliculas]);
});

//Route::get('/cartelera', 'App\Http\Controllers\CarteleraController@index')->name('cartelera.index');


// Define la ruta para obtener los géneros
Route::get('/obtenerPeliculas', [CarteleraController::class, 'obtenerPeliculas'])->name('obtener.peliculas');
Route::get('/obtenerGeneros', [CarteleraController::class, 'obtenerGeneros'])->name('obtener.generos');
Route::get('/obtenerIdiomas', [CarteleraController::class, 'obtenerIdiomas'])->name('obtener.idiomas');
Route::get('/obtenerDetallePelicula/{id}', [CarteleraController::class, 'obtenerDetallePelicula']);
Route::post('/agregarPelicula', [CarteleraController::class, 'agregarPelicula'])->name('agregarPelicula');
Route::post('/realizarVenta', [CarteleraController::class, 'realizarVenta'])->name('realizar.venta');
// Ruta para manejar la solicitud POST a /moverImagen
//Route::post('/moverImagen', 'App\Http\Controllers\TuControlador@moverImagen')->name('mover.imagen');
Route::post('//moverImagen', [CarteleraController::class, 'moverImagen'])->name('mover.imagen');
//Route::post('/moverImagen', 'App\Http\Controllers\ImageController@uploadImage');

