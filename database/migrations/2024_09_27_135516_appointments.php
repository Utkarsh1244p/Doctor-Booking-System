<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
       
        Schema::create('appointments', function (Blueprint $table) {
            $table->uuid('id')->primary();
            $table->uuid('patient_id');
            $table->uuid('doctor_id');
            $table->dateTime('appointment_date');
            $table->enum('status',["appointed","pending","cancelled","expired","rejected"])->defaultValue('appointed');
            $table->uuid('appointment_updated_by')->nullable();          
            $table->timestamps();
            $table->softDeletes();
            $table->foreign('patient_id')->references('id')->on('users');
            $table->foreign('doctor_id')->references('id')->on('users');
            $table->foreign('appointment_updated_by')->references('id')->on('users');


            
        });
    }
    

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('appointments');

    }
};
