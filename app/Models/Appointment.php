<?php

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Appointment extends Model
{
    use HasFactory;
    protected $table="appointments";
    protected $fillable=[
        'id',
        'patient_id',
        'doctor_id',
        'appointment_date',        
        'status'
    ];

    public function CheckAppointmentOfDoctor($doctor_id)
    {
        $getAllAppointment = Appointment::where('doctor_id', $doctor_id)        
        ->get();
        return $getAllAppointment;
    }

    public function CheckAppointmentsDoctor($doctor_id, $date = null)
    {
        if ($date) {
            try {
                $carbonDateTime = Carbon::createFromFormat('Y-m-d H:i:s', $date);
                $getAllAppointment = Appointment::where('doctor_id', $doctor_id)
                    ->where('appointment_date', $carbonDateTime)
                    ->get();
            } catch (\Exception $e) {
                try {
                    $carbonDate = Carbon::createFromFormat('Y-m-d', $date);
                    $getAllAppointment = Appointment::where('doctor_id', $doctor_id)
                        ->whereDate('appointment_date', $carbonDate)
                        ->get();
                } catch (\Exception $e) {
                    echo "Doctor has no appointments.";
                    return [];
                }
            }
        } else {
            $getAllAppointment = Appointment::where('doctor_id', $doctor_id)
                ->get();
        }

        return $getAllAppointment;
    }

    public function CheckAppointmentAvailibility($doc_id,$date)
    {
        $existingAppointment = Appointment::where('doctor_id', $doc_id)
        ->where('appointment_date', $date)
        ->where('status','appointed')
        ->first();
        return $existingAppointment? true : false;
    }

    public function CheckAppointmentOfPatient($patient_id)
    {
        $getAllAppointment = Appointment::where('patient_id', $patient_id)        
        ->get();
        return $getAllAppointment;
    }

    public function CheckAllAppointmentByDate($date, $patient_id)
    {
        try {

            $carbonDateTime = Carbon::createFromFormat('Y-m-d H:i:s', $date);
            $getAllAppointment = Appointment::where('patient_id', $patient_id)
                ->where('appointment_date', $carbonDateTime) 
                ->get();
        } catch (\Exception $e) {

            try {
                $carbonDate = Carbon::createFromFormat('Y-m-d', $date);
                $getAllAppointment = Appointment::where('patient_id', $patient_id)
                    ->whereDate('appointment_date', $carbonDate) 
                    ->get();
            } catch (\Exception $e) {
                return [];
            }
        }
        
        return $getAllAppointment;
    }


    public function CheckAllAppointmentByPateintId($userid,$appointmentid)
    {
        $getAllAppointment = Appointment::where('id',$appointmentid)
        ->where('patient_id', $userid)->where('status','pending')    
        ->first();
        return $getAllAppointment;
    }

    public function CheckAppointmentByDoctorId($userid,$appointmentid)
    {
        $getAllAppointment = Appointment::where('id',$appointmentid)
        ->where('doctor_id', $userid)->where('status','pending')    
        ->first();
        return $getAllAppointment;
    }
}
