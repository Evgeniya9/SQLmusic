create table if not exists genre (
	id_genre int primary key,
	name_genre varchar(60) not NULL
);

create table if not exists artist (
	id_artist int primary key,
	name_artist varchar(60) not NULL
);

create table if not exists genre_artist (
	primary key (id_genre, id_artist),
	foreign key (id_genre) references genre(id_genre),
	foreign key (id_artist) references artist(id_artist)
);

create table if not exists album (
	id_album int primary key,
	name_album varchar(60) not null,
	time_album time not null,
	year_album date not null
);

create table if not exists artist_album (
	primary key (id_artist,id_album),
	foreign key (id_artist) references artist(id_artist),
	foreign key (id_album) references album(id_album)
);

create table if not exists track (
	id_track int primary key,
	id_album int primary key,
	name_track varchar(60) not null,
	time_track time not null,
	foreign key (id_album) references album(id_album)
);

create table if not exists collection(
	id_collection int primary key,
	year_issue date not null,
	time_collection time not null
);

create table if not exists collection_track(
	primary key (id_collection,id_track),
	foreign key (id_collection) references collection(id_collection),
	foreign key (id_track) references track(id_track)
);