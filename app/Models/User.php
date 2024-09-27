<?php

namespace App\Models;

// use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Laravel\Sanctum\HasApiTokens;

class User extends Authenticatable
{
    use HasApiTokens, HasFactory, Notifiable;

    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $table="users";
    protected $fillable = [
        'id',
        'name',
        'email',
        'password',
        'address1',
        'address2',
        'country_id',
        'state_id',
        'city_id',
        'contact',
        'role_id',
        'status',
        'created_at'        
        
    ];

    /**
     * The attributes that should be hidden for serialization.
     *
     * @var array<int, string>
     */
    protected $hidden = [
        'password',
        'remember_token',
    ];

    /**
     * The attributes that should be cast.
     *
     * @var array<string, string>
     */
    protected $casts = [
        'email_verified_at' => 'datetime',
    ];


    public function getUsers()
    {
      $getusers=$this->where('status','active')->get();
      return $getusers;
    }

    public function getUsersDetails($id)
    {
        $getUser = User::where('users.status', 'active')
        ->where('users.id',$id)
        ->join('roles', 'users.role_id', '=', 'roles.id')
        ->select('users.*', 'roles.role_name as role_name')
        ->first();
      return $getUser;
    }
    
}
