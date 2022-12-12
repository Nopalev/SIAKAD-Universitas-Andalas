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
        Schema::create('forum_diskusi', function (Blueprint $table) {
            $table->id();
            $table->string('nama');
            $table->text('input_dosen');
            $table->text('input_mahasiswa');
            $table->text('jawaban_akhir');
            $table->foreignId('dosen_id')->constrained('dosen');
            $table->foreignId('mahasiswa_id')->constrained('mahasiswa');
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
        Schema::dropIfExists('forum_diskusi');
    }
};
