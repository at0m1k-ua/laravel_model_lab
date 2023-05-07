@extends('page')

@section('content')

    <h1>Genres list</h1>
    <hr>
    @foreach($genres as $genre)
        <a href="/genre?id={{ $genre->id }}"><h3>{{ $genre->name }}</h3></a>
    @endforeach

@endsection
