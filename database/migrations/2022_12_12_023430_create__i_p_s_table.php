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
        Schema::create('_i_p_s', function (Blueprint $table) {
            $table->id();
            $table->decimal('nilai', $precision = 4, $scale = 2);
            $table->foreignId('mahasiswa_id')->constrained('mahasiswa');
            $table->foreignId('semester_id')->constrained('semester');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('_i_p_s');
    }
};
