<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\facades\Validator;
use illuminate\Support\Str;
use App\Models\Appointment;
use App\Models\User;

use Carbon\Carbon;

class AppointmentController extends Controller
{

    public function create(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'patient_id' =>'required|exists:users,id',
            'doctor_id' =>'required|exists:users,id',
            'appointment_date' =>'required|date|after:' 
            

        ]);
        if ($validator->fails()) {
            return response()->json($validator->errors(), 422);
        }

        $appointment= new Appointment();
        $existingAppointment=$appointment->CheckAppointmentAvailibility($request->doctor_id,$request->appointment_date);
        
        if ($existingAppointment) {
            return response()->json([
                'success' => false,
                'message' => 'This appointment time is already booked. Please put some other date'
            ], 400);
        }
    
        $appointment = Appointment::create([
            'id' => Str::uuid(),
            'patient_id' => $request->patient_id,
            'doctor_id' => $request->doctor_id,
            'appointment_date' => $request->appointment_date,
            'status' => 'pending',
            'created_at' => now()          

        ]);
        return response()->json($appointment, 201);

    }


    public function checkappointment(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'patient_id' =>'required|exists:users,id',           
            'appointment_date' =>'date' 
            

        ]);
        if ($validator->fails()) {
            return response()->json($validator->errors(), 422);
        }

        $appointment=new Appointment();
        
        if(isset($request->patient_id) && !isset($request->appointment_date))
        {
           $existingAppointment=$appointment->CheckAppointmentOfPatient($request->patient_id);
        }

        if(isset($request->patient_id) && isset($request->appointment_date))
        {
            $existingAppointment=$appointment->CheckAllAppointmentByDate($request->appointment_date,$request->patient_id);
        }
        
        return response()->json($existingAppointment, 201);

    }


    public function updateappointmentstatus($userid,$appointmentid,$status,$date=null)
    {
        $user=User::find($userid);
        if(!$user){
            return response()->json(['message' => 'User not found'], 404);
        }
 
        if($user->role_id=='1' && ($status=='approved' || $status=='appointed')){
            return response()->json(['message' => 'Invalid status provided for user'], 404);

        }
        
        if (!in_array($status, ['rejected','cancelled','postpond','approved','appointed'])) {
            return response()->json(['message' => 'Invalid status provided'], 400);
        }

        if ($status=='postpond' && !isset($date) ) {
            return response()->json(['message' => 'To postpond appointment Date is required'], 400);
        }   
     
        
        $appointment=new Appointment();
        if($user->role_id=='1'){
        $existingAppointment=$appointment->CheckAllAppointmentByPateintId($userid,$appointmentid);
        }else{
        $existingAppointment=$appointment->CheckAppointmentByDoctorId($userid,$appointmentid);
        }

        if($existingAppointment)
        {
            if($status=='postpond'){
            $newAppointmentDate = Carbon::parse($date);

            if ($newAppointmentDate->isFuture()) {
                $existingAppointment->status='pending';
                $existingAppointment->appointment_date=$newAppointmentDate;
            } else {
            return response()->json(['message' => 'The new appointment date must be in the future.'], 400);
            }

            $existingAppointment->status='pending';
            $existingAppointment->appointment_date=$date;
            
            }else{
                $existingAppointment->status=($status=='approved') ? 'appointed' : $status ;
            }

            $existingAppointment->appointment_updated_by=$userid;


            $existingAppointment->save();
            return response()->json(['message' => 'Appointment is '. $status.' successfully!!!!'], 404);

        }else{
            return response()->json(['message' => 'Appointment in pending status not found'], 404);

        }
    }




}