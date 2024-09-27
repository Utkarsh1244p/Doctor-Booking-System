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

    //Doctor Related Functions
    public function CheckAppointmentOfDoctor($doctor_id)
    {
        $getAllAppointment = Appointment::where('doctor_id', $doctor_id)        
        ->get();
        return $getAllAppointment;
    }

    public function CheckAppointmentsDoctor($doctor_id, $date = null)
    {
        // If a date is provided, check the date format and fetch appointments by date
        if ($date) {
            try {
                // Try to parse the user input into a full datetime instance
                $carbonDateTime = Carbon::createFromFormat('Y-m-d H:i:s', $date);
                // If successful, the user passed a full datetime string
                $getAllAppointment = Appointment::where('doctor_id', $doctor_id)
                    ->where('appointment_date', $carbonDateTime) // Exact match for datetime
                    ->get();
            } catch (\Exception $e) {
                try {
                    // If it fails, assume the user passed only a date (Y-m-d)
                    $carbonDate = Carbon::createFromFormat('Y-m-d', $date);
                    $getAllAppointment = Appointment::where('doctor_id', $doctor_id)
                        ->whereDate('appointment_date', $carbonDate) // Match only the date part
                        ->get();
                } catch (\Exception $e) {
                    // If not a valid date, return an empty result or handle the error
                    echo "Doctor has no appointments.";
                    return [];
                }
            }
        } else {
            // If no date is provided, return all appointments for the patient
            $getAllAppointment = Appointment::where('doctor_id', $doctor_id)
                ->get();
        }

        return $getAllAppointment;
    }

    
    
    
    
    
    //Patient Related Functions
    public function CheckAppointmentAvailibility($doc_id,$date)
    {
        // dd($doc_id,$date);
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
        // Try to parse the user input into a Carbon date instance
        try {
            // Check if the input is a full datetime
            $carbonDateTime = Carbon::createFromFormat('Y-m-d H:i:s', $date);
            // If the above works, user has passed a datetime string
            $getAllAppointment = Appointment::where('patient_id', $patient_id)
                ->where('appointment_date', $carbonDateTime) // Exact match for datetime
                ->get();
        } catch (\Exception $e) {
            // If it fails, assume the user has passed only a date (Y-m-d)
            try {
                $carbonDate = Carbon::createFromFormat('Y-m-d', $date);
                $getAllAppointment = Appointment::where('patient_id', $patient_id)
                    ->whereDate('appointment_date', $carbonDate) // Match only the date part
                    ->get();
            } catch (\Exception $e) {
                // If it's not a valid date format, handle the error or return an empty result
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