@extends('page')

@section('content')

    <h1>Genre: {{ $genre->name }}</h1>
    <hr>
    <h2>Movies:</h2>
    @foreach($genre->movies as $movie)
        <a href="/movie?id={{ $movie->id }}"><h3>{{ $movie->name }}</h3></a>
    @endforeach

@endsection
