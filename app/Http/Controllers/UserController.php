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
        $validator = Validator::make($request->all(), [
            'name' => 'required|string|max:255',
            'email' => 'required|email|unique:users,email', 
            'password' => 'required|min:8', 
            'address1' => 'required|string|max:255',
            'address2' => 'nullable|string|max:255', 
            'country_id' => 'required|integer|exists:countries,id', 
            'state_id' => 'required|integer|exists:states,id', 
            'city_id' => 'required|integer|exists:cities,id', 
            'contact' => 'required|string|max:15', 
            'role_id' => 'required|integer|exists:roles,id', 
            'status' => 'required|in:active,inactive', 
        ]);
       
        $user = User::create([
            'id' => Str::uuid(),
            'name' => $request->name,
            'email' => $request->email,
            'password' => bcrypt($request->password),
            'address1' => $request->address1,
            'address2' => $request->address2,
            'country_id' => $request->country_id,
            'state_id' => $request->state_id,
            'city_id' => $request->city_id,
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

        $user->fill($request->only([
        'name', 'email', 'address1', 'address2', 
        'country_id', 'state_id', 'city_id', 
        'contact', 'role_id', 'status'
        ]));


        if ($request->filled('password')) {
        $user->password = bcrypt($request->password);
        }

        $user->updated_at = now();
        $user->save();

        return response()->json(['message' => 'User updated successfully'], 201);
    }
}