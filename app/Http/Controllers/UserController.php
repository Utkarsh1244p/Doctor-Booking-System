<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\facades\Validator;
use illuminate\Support\Str;
use App\Models\User;
class UserController extends Controller
{
    public function index()
    {
        $user=new User();
        $users=$user->getUsers();
        
     return response()->json($users, 200);
    
    }

    public function create(request $request)
    {
       
        $user = User::create([
            'id' => Str::uuid(),
            'name' => $request->name,
            'email' => $request->email,
            'password' => bcrypt($request->password),
            'address1' => $request->address1,
            'address2' => $request->address2,
            'country_state_city_id' => $request->country_state_city_id,
            'contact' => $request->contact,
            'role_id'=>$request->role_id,
            'status'=>$request->status,
            'created_at'=>now()

        ]);

        return response()->json(['message' => 'User created successfully'], 201);
    }

    public function update(Request $request,$id)
    {

       $user=User::find($id);
       if(!$user){
           return response()->json(['message' => 'User not found'], 404);
       }
       $user->name=$request->name;
       $user->email=$request->email;
       $user->password=$request->password;
       $user->address1=$request->address1;
       $user->address2=$request->address2;
       $user->country_state_city_id=$request->country_state_city_id;
       $user->contact=$request->contact;
       $user->role_id=$request->role_id;
       $user->status=$request->status;
       $user->updated_at=now();
       $user->save();

        return response()->json(['message' => 'User updated successfully'], 201);
    }
}
