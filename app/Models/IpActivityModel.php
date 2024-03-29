<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class IpActivityModel extends Model
{

    protected $table = 'auth_logins';
    public $timestamps = false;

    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $fillable = [
        'success',
        'user_id',
        'date',
        'login',
        'type',
        'ip_address',
        'user_agent',
    ];

    /**
     * The attributes that should be hidden for serialization.
     *
     * @var array<int, string>
     */
    protected $hidden = [

    ];

    /**
     * The attributes that should be cast.
     *
     * @var array<string, string>
     */
    protected $casts = [

    ];

    /**
     * The model's default values for attributes.
     *
     * @var array
     */
    protected $attributes = [

    ];

    public function keepLimitOfAttempts(int $trashHold)
    {

        $countAll = $this->count();
        if ($countAll > $trashHold) {
            $lastId = $this->latest('id')->first()->id;
            $targetId = $lastId - $trashHold;
            $this->where([['id', '<=', $targetId]])->delete();
        }
    }
}
