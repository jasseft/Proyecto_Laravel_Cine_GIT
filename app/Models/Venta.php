<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Venta extends Model
{
    protected $table = 'tbl_ope_venta';

    protected $primaryKey = 'VentaId';

    protected $fillable = [
        'Pelicula_Id',
        'Idioma_Id',
        'Genero_Id',
        'Cantidad',
        'Ganancias',
        'Venta_Status',
    ];

    // Si necesitas timestamps (created_at y updated_at)
    public $timestamps = false;

    // Aquí puedes definir relaciones con otros modelos si es necesario
}
