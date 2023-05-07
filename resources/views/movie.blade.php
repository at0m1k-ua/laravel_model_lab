@extends('page')

@section('content')

    <h1>Movie: "{{ $movie->name }}"</h1>
    <hr>
    <h2>Genres:</h2>
    @foreach($movie->genres as $genre)
        <a href="/genre?id={{ $genre->id }}"><h3>{{ $genre->name }}</h3></a>
    @endforeach

    @if(!$movie->quotes->isEmpty())
        <hr>
        <h2>Quotes:</h2>
        @foreach($movie->quotes as $quote)
            <p style="font-style: italic;">"{{ $quote->quote_text }}"</p>
            <p>{{ $quote->movie_character }}</p>
            <br>
        @endforeach
    @endif

@endsection
