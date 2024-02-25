<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;
use App\Models\Pelicula;
use App\Models\Venta;

class CarteleraController extends Controller
{
    public function index()
    {
        $peliculas = DB::select('CALL getAllPeliculas()');

        return view('cartelera', ['peliculas' => $peliculas]);
    }

    // Método para obtener los géneros desde la base de datos y devolverlos en formato JSON
    public function obtenerGeneros()
    {
        $generos =  DB::select('CALL getAllGeneros()'); // Obtener todos los géneros desde la base de datos
        return response()->json($generos); // Devolver los géneros en formato JSON
    }

    public function obtenerIdiomas()
    {
        $idiomas =  DB::select('CALL getAllIdiomas()'); // Obtener todos los géneros desde la base de datos
        return response()->json($idiomas); // Devolver los géneros en formato JSON
    }
    

    public function obtenerDetallePelicula($id)
    {
        $pelicula = DB::select('CALL selectPelicula(?)', [$id]);

        // Verifica si la consulta devuelve algún resultado
        if (!empty($pelicula)) {
            // Extrae los datos de la primera fila (asumiendo que solo esperas una fila de resultado)
            $pelicula = $pelicula[0];

            // Pasa los datos de la película a la vista
            return view('cartelera', [
                'pelicula' => $pelicula
            ]);
        } else {
            // Maneja el caso en el que no se encontró ninguna película con el ID dado
            return response()->json(['error' => 'No se encontró ninguna película con el ID proporcionado'], 404);
        }
    }



    public function obtenerDetallePelicula7($id)
    {
        $pelicula = DB::select('CALL selectPelicula(?)', [$id]);

        // Verifica si la consulta devuelve algún resultado
        if (!empty($pelicula)) {
            // Extrae los datos de la primera fila (asumiendo que solo esperas una fila de resultado)
            $pelicula = $pelicula[0];

            // Construye el array asociativo con los datos de la película
            $datosPelicula = [
                'id' => $pelicula->PeliculaId,
                'titulo' => $pelicula->Pelicula_Nombre,
                'genero' => $pelicula->Genero,
                'idioma' => $pelicula->Idioma,
                'precio' => $pelicula->Pelicula_Precio,
                'año' => $pelicula->Pelicula_Year,
                'cantidad' => $pelicula->Pelicula_Cantidad,
                'imagen' => $pelicula->Pelicula_Imagen,
                'status' => $pelicula->Pelicula_Status
            ];

            // Envía el array como JSON al cliente
            return response()->json($datosPelicula);
        } else {
            // Maneja el caso en el que no se encontró ninguna película con el ID dado
            return response()->json(['error' => 'No se encontró ninguna película con el ID proporcionado'], 404);
        }
    }


    public function moverImagen(Request $request)
    {
        // Verificar si se ha subido una imagen
        if ($request->hasFile('imagen')) {
            // Obtener la imagen del formulario
            $imagen = $request->file('imagen');

            // Obtener el nombre original de la imagen
            $nombreImagen = $imagen->getClientOriginalName();

            // Mover la imagen al directorio deseado manteniendo su nombre original
            $imagen->move(public_path('img'), $nombreImagen);

            // Concatenar la ruta de la imagen al directorio public
            $imagenUrl = public_path('img') . $nombreImagen;
            
            // Retornar una respuesta indicando que la imagen ha sido cargada y movida
            return response()->json(['success' => true, 'message' => 'Imagen cargada y movida', 'imagen_url' => $imagenUrl]);
        } else {
            // Retornar una respuesta indicando que no se ha encontrado ninguna imagen en la solicitud
            return response()->json(['success' => false, 'message' => 'No se ha encontrado ninguna imagen en la solicitud']);
        }
    }


    public function agregarPelicula(Request $request)
    {
        Log::info('NUEVO_Datos recibidos del formulario:', $request->all());

        // Verificar si los campos numéricos no son negativos
        if ($request->precio < 0 || $request->anioEstreno < 0 || $request->cantidad < 0) {
            return response()->json(['success' => false, 'message' => 'No se pueden ingresar valores negativos']);
        }

        // Obtener el nombre de la imagen y moverla a la carpeta de destino
        if ($request->hasFile('imagen')) {
            $imagen = $request->file('imagen');
            $nombreImagen = $imagen->getClientOriginalName();
            $imagen->move(public_path('img'), $nombreImagen);
            $imagenUrl = asset('img/' . $nombreImagen);

            $pelicula = new Pelicula();
            $pelicula->Pelicula_Nombre = $request->nombrePelicula;
            $pelicula->Pelicula_GeneroId = $request->generoId;
            $pelicula->Pelicula_IdiomaId = $request->idiomaId;
            $pelicula->Pelicula_Precio = $request->precio;
            $pelicula->Pelicula_Year = $request->anioEstreno;
            $pelicula->Pelicula_Cantidad = $request->cantidad;
            $pelicula->Pelicula_Imagen = $imagenUrl;
            
            try{
                DB::statement('CALL insertPelicula(?, ?, ?, ?, ?, ?, ?)', [
                    $pelicula->Pelicula_Nombre,
                    $pelicula->Pelicula_GeneroId,
                    $pelicula->Pelicula_IdiomaId,
                    $pelicula->Pelicula_Precio,
                    $pelicula->Pelicula_Year,
                    $pelicula->Pelicula_Cantidad,
                    $pelicula->Pelicula_Imagen
                ]);
            } catch (\Exception $e) {
                // Si ocurre algún error al ejecutar el procedimiento almacenado, retornar un mensaje de error
                return response()->json(['success' => false, 'message' => 'Error al agregar la película']);
            }

            $peliculas = Pelicula::all(); // Obtener todas las películas actualizadas
            return response()->json(['success' => true, 'message' => 'Película agregada correctamente', 'peliculas' => $peliculas]);
            //return response()->json(['success' => true, 'message' => 'Película agregada correctamente', 'imagen_url' => $imagenUrl, 'pelicula' => $pelicula->toArray()]);

        } else {
            // Retornar una respuesta indicando que no se ha encontrado ninguna imagen en la solicitud
            return response()->json(['success' => false, 'message' => 'No se ha encontrado ninguna imagen en la solicitud']);
        }
    }

    public function realizarVenta(Request $request){
        Log::info('NUEVO_Datos recibidos del formulario:', $request->all());

        // Obtener los parámetros del formulario
        $peliculaId = $request->input('peliculaId');
        $precioTotal = $request->input('precioTotal');
        $precioPagar = $request->input('precioPagar');
        $cantidad = $request->input('cantidadEntradas');

        // Verificar si el precio a pagar es menor o igual que el precio total
        if ($precioPagar < $precioTotal) {
            return response()->json(['success' => false, 'message' => 'Recursos insuficientes.']);
        }else if ($precioPagar < 0) {
            return response()->json(['success' => false, 'message' => 'Introduce un pago válido']);
        }else{
            $venta = new Venta();
            $venta->Pelicula_Id = $request->peliculaId;
            $venta->Cantidad = $request->cantidadEntradas;

            try{
                $results = DB::select('CALL realizarVenta(?, ?)', [
                    $venta->Pelicula_Id,
                    $venta->Cantidad
                ]);
                
                $mensaje = $results[0]->Mensaje;
    
            } catch (\Exception $e) {
                // Si ocurre algún error al ejecutar el procedimiento almacenado, retornar un mensaje de error
                return response()->json(['success' => false, 'message' => $mensaje]);
            }
            $ventas = Venta::all(); // Obtener todas las películas actualizadas
            return response()->json(['success' => true, 'message' => $mensaje, 'ventas' => $ventas]);

        }

        /*try{
            $results = DB::select('CALL realizarVenta(?, ?)', [
                $venta->Pelicula_Id,
                $venta->Cantidad
            ]);
            
            $mensaje = $results[0]->Mensaje;

        } catch (\Exception $e) {
            // Si ocurre algún error al ejecutar el procedimiento almacenado, retornar un mensaje de error
            return response()->json(['success' => false, 'message' => $mensaje]);
        }
        $ventas = Venta::all(); // Obtener todas las películas actualizadas
        return response()->json(['success' => true, 'message' => $mensaje, 'ventas' => $ventas]);*/
    }

}
