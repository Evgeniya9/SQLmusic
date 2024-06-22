create table if not exists genre (
	id_genre int primary key,
	name_genre varchar(60) not NULL
);

create table if not exists artist (
	id_artist int primary key,
	name_artist varchar(60) not NULL
);

create table if not exists genre_artist (
	id_genre int,
	id_artist int,
	foreign key (id_genre) references genre(id_genre),
	foreign key (id_artist) references artist(id_artist)
);

create table if not exists album (
	id_album int primary key,
	id_artist int primary key,
	name_album varchar(60) not null,
	name_track varchar(60) not null
);

create table if not exists artist_album (
	id_artist int primary key,
	id_album int primary key,
	foreign key (id_artist) references artist(id_artist),
	foreign key (id_album) references album(id_album)
);

create table if not exists track (
	id_track int primary key,
	name_track varchar(60) not null,
	id_album int,
	foreign key (id_album) references album(id_album)
);

create table if not exists collection (
	id_collection int primary key,
	name_album varchar(60) not null,
	name_track varchar(60) not null,
	year_issue date not null
);

create table if not exists collection_track (
	id_collection int primary key,
	id_track int primary key,
	foreign key (id_collection) references collection(id_collection),
	foreign key (id_track) references track(id_track)
);