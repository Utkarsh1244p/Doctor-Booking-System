<?php

namespace App\Http\Controllers;

use App\Models\Appointment;
use Illuminate\Support\facades\Validator;
use Illuminate\Http\Request;

class DoctorController extends Controller
{
    // public function showAllAppointments(Request $request, $id){
    //     // Fetch all appointments based on doctor_id
    //     $appointments = Appointment::where('doctor_id', $id)->get();

    //     // Check if appointments exist for the given doctor
    //     if ($appointments->isEmpty()) {
    //         return response()->json([
    //             'success' => false,
    //             'message' => 'No appointments found for this doctor.'
    //         ], 404);
    //     }

    //     // Return the list of appointments
    //     return response()->json([
    //         'success' => true,
    //         'appointments' => $appointments
    //     ], 200);
    // }



    public function showallappointments(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'doctor_id' =>'required|exists:users,id',           
            'appointment_date' =>'date' 
            // Add more validation rules as needed. For example, check if the selected doctor is available at the specified appointment date.

        ]);
        if ($validator->fails()) {
            return response()->json($validator->errors(), 422);
        }

        $appointment=new Appointment();
        
        if(isset($request->doctor_id) && !isset($request->appointment_date))
        {
           $existingAppointment=$appointment->CheckAppointmentsDoctor($request->doctor_id);
        }

        if(isset($request->doctor_id) && isset($request->appointment_date))
        {
            $existingAppointment=$appointment->CheckAppointmentsDoctor($request->doctor_id, $request->appointment_date);
        }
        
        return response()->json($existingAppointment, 201);

    }
}
