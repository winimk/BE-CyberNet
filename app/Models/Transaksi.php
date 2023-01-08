<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Transaksi extends Model
{
    use HasFactory;
    protected $table = 'transaksi';
    protected $primaryKey = 'id_transaksi';
    protected $keyType = 'integer';
    // use HasFactory;
    // protected $fillable = ['*'];
    protected $fillable = ['id_paket', 'id_user', 'nama_user', 'tgl_transaksi', 'harga', 'lama', 'total'];
}
