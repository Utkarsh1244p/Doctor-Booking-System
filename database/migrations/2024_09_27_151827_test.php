<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('test', function (Blueprint $table) {
            $table->uuid('id')->primary();
            $table->uuid('country_id');
            $table->string('name');
           // $table->foreignId('country_id')->constrained('countries','id')->onDelete('cascade');
          // $table->foreign('country_id')->references('id')->on('countries')->onDelete('cascade');
           $table->foreign('country_id')->references('id')->on('countries');
           


            $table->timestamps();
            $table->softDeletes();
            

            
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        //
    }
};
