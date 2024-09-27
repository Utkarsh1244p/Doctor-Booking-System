<?php

namespace App\Http\Controllers;

use App\Models\Appointment;
use Illuminate\Support\facades\Validator;
use Illuminate\Http\Request;

class DoctorController extends Controller
{
    public function showallappointments(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'doctor_id' =>'required|exists:users,id',           
            'appointment_date' =>'date' 

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
