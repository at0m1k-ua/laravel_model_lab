drop database if exists php_lab6;
create database php_lab6;
use php_lab6;

drop table if exists movies;
create table movies (
    id int not null auto_increment primary key,
    name text
);

drop table if exists genres;
create table genres (
    id int not null auto_increment primary key,
    name text
);

drop table if exists movie_genre;
create table movie_genre (
    movie_id int not null,
    genre_id int not null,
    primary key (movie_id, genre_id),
    foreign key (movie_id) references movies (id) on delete cascade,
    foreign key (genre_id) references genres (id) on delete cascade
);

drop table if exists quotes;
create table quotes (
    id bigint not null auto_increment primary key,
    quote_text text not null,
    movie_character text not null,
    movie_id int not null,
    foreign key (movie_id) references movies (id) on delete cascade
);

insert into movies (name) values
    ('Fast X'),
    ('Iron Man'),
    ('Avengers: Endgame'),
    ('Shrek'),
    ('ALF'),
    ('The Lord of the Rings'),
    ('Transformers'),
    ('Garfield'),
    ('Super Mario Bros.'),
    ('Mr. Robot');

insert into genres (name) values
    ('Action'),
    ('Adventure'),
    ('Crime'),
    ('Mystery'),
    ('Thriller'),
    ('Motion Picture'),
    ('Sci-Fi'),
    ('Drama'),
    ('Animation'),
    ('Comedy'),
    ('Family'),
    ('Fantasy'),
    ('Romance');

insert into movie_genre
select
    movies.id as movie_id,
    genres.id as genre_id
from movies join genres
on
    (movies.name = 'Fast X' and genres.name in ('Action', 'Adventure', 'Crime', 'Thriller', 'Motion Picture')) or
    (movies.name = 'Iron Man' and genres.name in ('Action', 'Adventure', 'Sci-Fi')) or
    (movies.name = 'Avengers: Endgame' and genres.name in ('Action', 'Adventure', 'Drama', 'Sci-Fi')) or
    (movies.name = 'Shrek' and genres.name in ('Animation', 'Adventure', 'Comedy', 'Family', 'Fantasy', 'Romance')) or
    (movies.name = 'ALF' and genres.name in ('Comedy', 'Fantasy', 'Sci-Fi')) or
    (movies.name = 'The Lord of the Rings' and genres.name in ('Action', 'Adventure', 'Drama', 'Fantasy')) or
    (movies.name = 'Transformers' and genres.name in ('Action', 'Adventure', 'Sci-Fi')) or
    (movies.name = 'Garfield' and genres.name in ('Anination', 'Adventure', 'Comedy', 'Family', 'Fantasy')) or
    (movies.name = 'Super Mario Bros.' and genres.name in ('Adventure', 'Comedy', 'Family', 'Fantasy', 'Sci-Fi')) or
    (movies.name = 'Mr. Robot' and genres.name in ('Crime', 'Drama', 'Thriller'))
;

insert into quotes (quote_text, movie_character, movie_id) values
    ('Ogres are like onions.', 'Shrek', (select id from movies where name = 'Shrek')),
    ('Wow! Let’s do that again!', 'Donkey', (select id from movies where name = 'Shrek')),
    ('You’re a monster.', 'Gingerbread Man', (select id from movies where name = 'Shrek'));

