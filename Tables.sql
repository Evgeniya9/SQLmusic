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
	id_artist int,
	id_album int,
	primary key (id_artist,id_album),
	foreign key (id_artist) references artist(id_artist),
	foreign key (id_album) references album(id_album)
);

create table if not exists track (
	id_track int,
	id_album int,
	primary key (id_track, id_album),
	name_track varchar(60) not null,
	time_track time not null,
	unique(id_track, id_album),
	foreign key (id_album) references album(id_album)
);

create table if not exists collection(
	name_collection varchar(60) not null,
	id_collection int primary key,
	year_issue date not null,
	time_collection time not null
);

CREATE TABLE IF NOT EXISTS collection_track(
    id_collection INT,
    id_track INT,
    id_album INT,
    PRIMARY KEY (id_collection, id_track, id_album),
    FOREIGN KEY (id_collection) REFERENCES collection(id_collection),
    FOREIGN KEY (id_track, id_album) REFERENCES track(id_track, id_album)
);

-- Добавляем данные в таблицу genre
INSERT INTO genre (id_genre, name_genre) VALUES
(1, 'Рок'),
(2, 'Поп'),
(3, 'Джаз');

-- Добавляем данные в таблицу artist
INSERT INTO artist (id_artist, name_artist) VALUES
(1, 'Фредди Меркьюри'),
(2, 'Роберт Плант'),
(3, 'Artik & Asti'),
(4, 'Элла Фицджеральд'),
(5, 'Morgenstern');

-- Добавляем данные в таблицу genre_artist
INSERT INTO genre_artist (id_genre, id_artist) VALUES
(1, 1),
(1, 2),
(2, 3),
(3, 4);

-- Добавляем данные в таблицу album
INSERT INTO album (id_album, name_album, time_album, year_album) VALUES
(4, 'All That Jazz', '01:01:08', '1989-03-18'),
(3, 'Миллениум X', '00:30:04', '2021-07-23'),
(2, 'Raise the Roof', '00:53:32', '2022-11-19'),
(1, 'Barcelona', '00:25:32', '1988-10-10');

-- Добавляем данные в таблицу artist_album
INSERT INTO artist_album (id_artist, id_album) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4);

-- Добавляем данные в таблицу track
INSERT INTO track (id_track, id_album, name_track, time_track) VALUES
(1, 4, 'Little Jazz', '00:05:37'),
(2, 4, 'The Nearness of You', '00:07:09'),
(3, 3, 'Она не я', '00:03:37'),
(4, 3, 'Лампочки', '00:03:16'),
(5, 2, 'Last Kind Words Blues', '00:04:06'),
(6, 1, 'The Golden Boy', '00:06:08');

-- Добавляем данные в таблицу collection
INSERT INTO collection (name_collection, id_collection, year_issue , time_collection) VALUES
('Cборник Эльзы',1, '2023-02-03', '01:30:00'),
('Сборник Дмитрия',2, '2023-04-09', '02:00:00'),
('Сборник Егора',3, '2024-01-27', '02:30:00'),
('Сборник Миши',5, '2019-05-27', '02:45:00'),
('Сборник Евгении',6, '2020-02-12', '02:17:00'),
('Сборник Ахата',4, '2024-06-08', '03:00:00');

-- Добавляем данные в таблицу collection_track
INSERT INTO collection_track (id_collection, id_track, id_album) VALUES
(1, 1, 4),
(1, 2, 4),
(2, 3, 3),
(2, 4, 3),
(3, 5, 2),
(3, 6, 1),
(4, 1, 4),
(4, 3, 3);


