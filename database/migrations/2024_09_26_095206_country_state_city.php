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
        Schema::create('country_state_city', function (Blueprint $table) {
            $table->uuid('id')->primarykey();
            $table->uuid('country_id');
            $table->uuid('state_id');
            $table->uuid('city_id');
            $table->enum('status',['active','nonactive'])->default('active');
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
