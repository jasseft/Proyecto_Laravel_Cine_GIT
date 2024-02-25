<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Pelicula extends Model
{
    use HasFactory;

    protected $table = 'tbl_peliculas'; // Nombre de la tabla en la base de datos

    protected $primaryKey = 'PeliculaId'; // Nombre de la clave primaria en la tabla

    // Indica si los campos created_at y updated_at deben ser gestionados automáticamente
    public $timestamps = false;

    // Especifica los campos que se pueden asignar masivamente
    protected $fillable = [
        'PeliculaId',
        'Pelicula_Nombre',
        'Pelicula_GeneroId',
        'Pelicula_IdiomaId',
        'Pelicula_Precio',
        'Pelicula_Year',
        'Pelicula_Cantidad',
        'Pelicula_Imagen',
        'Pelicula_Status'
    ];
}
