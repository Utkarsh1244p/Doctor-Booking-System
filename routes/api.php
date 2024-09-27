<?php

use App\Http\Controllers\DoctorController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\UserController;
use App\Http\Controllers\AppointmentController;



// Route::get('/user', function (Request $request) {
//     return $request->user();
// })->middleware('auth:sanctum');
Route::get('/allusers', [UserController::class, 'index']);
Route::post('/createuser',[UserController::class,'create']);
Route::put('/updateuser/{id}', [UserController::class, 'update']);

Route::post('/take-appointment', [AppointmentController::class, 'create']);
Route::get('/check-appointment', action: [AppointmentController::class, 'checkappointment']);
Route::put('/change-appointment-status/{patient_id}/{appointment_id}/{status}/{date?}', [AppointmentController::class, 'updateappointmentstatus']);


Route::get('/show-all-appointments', [DoctorController::class, 'showallappointments']);
// Route::post('/show-all-appointments/{id}', [DoctorController::class, 'showAllAppointments']);




     
//Route::apiResource('/products',ProductController::class);

    
