<?php

use App\Models\Genre;
use App\Models\Movie;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "web" middleware group. Make something great!
|
*/

Route::get('/', function () {
    return redirect('/genres');
});

Route::get('/genres', function() {
    return view('genres', ['genres' => Genre::orderBy('name')->get()]);
});

Route::get('/genre', function(Request $request) {
    $genre = Genre::find($request->id);
    if (!$genre) {
        return redirect('/genres');
    }

    return view('genre', ['genre' => $genre]);
});

Route::get('/movie', function(Request $request) {
    $movie = Movie::find($request->id);
    if (!$movie) {
        return redirect('/genres');
    }

    return view('movie', ['movie' => $movie]);
});
