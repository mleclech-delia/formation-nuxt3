CREATE TABLE "films" (
	"id" serial PRIMARY KEY NOT NULL,
	"title" varchar NOT NULL,
	"publication_year" integer NOT NULL,
	"genre_id" integer NOT NULL,
	"synopsis" varchar NOT NULL,
	"image_cover" varchar NOT NULL
);
--> statement-breakpoint
CREATE TABLE "gender" (
	"id" serial PRIMARY KEY NOT NULL,
	"label" varchar NOT NULL
);
--> statement-breakpoint
ALTER TABLE "films" ADD CONSTRAINT "films_genre_id_gender_id_fk" FOREIGN KEY ("genre_id") REFERENCES "public"."gender"("id") ON DELETE no action ON UPDATE no action;

-- Insertion des gender uniques
INSERT INTO gender (label) VALUES
    ('Science-Fiction'),
    ('Drame'),
    ('Crime'),
    ('Fantasy'),
    ('Animation'),
    ('Action'),
    ('Thriller'),
    ('Aventure'),
    ('Comédie'),
    ('Guerre');

-- Insertion des films (avec leurs IDs de genre correspondants)
INSERT INTO films (title, publication_year, genre_id, synopsis, image_cover) VALUES
    ('Inception', 2010, (SELECT id FROM gender WHERE label = 'Science-Fiction'), 'Dom Cobb est un voleur expérimenté, spécialisé dans l''art périlleux de l''extraction : sa spécialité consiste à s''approprier les secrets les plus précieux d''un individu pendant qu''il rêve.', 'https://m.media-amazon.com/images/M/MV5BMjAxMzY3NjcxNF5BMl5BanBnXkFtZTcwNTI5OTM0Mw@@._V1_.jpg'),
    ('Le Parrain', 1972, (SELECT id FROM gender WHERE label = 'Crime'), 'L''histoire de la famille Corleone, une des plus grandes familles de la mafia italienne à New York.', 'https://m.media-amazon.com/images/M/MV5BM2MyNjYxNmUtYTAwNi00MTYxLWJmNWYtYzZlODY3ZTk3OTFlXkEyXkFqcGdeQXVyNzkwMjQ5NzM@._V1_.jpg'),
    ('Pulp Fiction', 1994, (SELECT id FROM gender WHERE label = 'Crime'), 'L''odyssée sanglante et burlesque de petits malfrats dans la jungle de Hollywood.', 'https://m.media-amazon.com/images/M/MV5BNGNhMDIzZTUtNTBlZi00MTRlLWFjM2ItYzViMjE3YzI5MjljXkEyXkFqcGdeQXVyNzkwMjQ5NzM@._V1_.jpg'),
    ('Matrix', 1999, (SELECT id FROM gender WHERE label = 'Science-Fiction'), 'Un programmeur découvre que le monde dans lequel il vit est une simulation créée par des machines.', 'https://m.media-amazon.com/images/M/MV5BNzQzOTk3OTAtNDQ0Zi00ZTVkLWI0MTEtMDllZjNkYzNjNTc4L2ltYWdlXkEyXkFqcGdeQXVyNjU0OTQ0OTY@._V1_.jpg'),
    ('Le Seigneur des Anneaux', 2001, (SELECT id FROM gender WHERE label = 'Fantasy'), 'Un jeune hobbit doit détruire un anneau magique pour sauver la Terre du Milieu.', 'https://m.media-amazon.com/images/M/MV5BN2EyZjM3NzUtNWUzMi00MTgxLWI0NTctMzY4M2VlOTdjZWRiXkEyXkFqcGdeQXVyNDUzOTQ5MjY@._V1_.jpg'),
    ('Titanic', 1997, (SELECT id FROM gender WHERE label = 'Drame'), 'Une histoire d''amour tragique à bord du plus célèbre paquebot du monde.', 'https://m.media-amazon.com/images/M/MV5BMDdmZGU3NDQtY2E5My00ZTliLWIzOTUtMTY4ZGI1YjdiNjk3XkEyXkFqcGdeQXVyNTA4NzY1MzY@._V1_.jpg'),
    ('Interstellar', 2014, (SELECT id FROM gender WHERE label = 'Science-Fiction'), 'Un groupe d''explorateurs utilise une faille dans l''espace-temps afin de sauver l''humanité.', 'https://m.media-amazon.com/images/M/MV5BZjdkOTU3MDktN2IxOS00OGEyLWFmMjktY2FiMmZkNWIyODZiXkEyXkFqcGdeQXVyMTMxODk2OTU@._V1_.jpg'),
    ('Le Roi Lion', 1994, (SELECT id FROM gender WHERE label = 'Animation'), 'Un jeune lion prince doit surmonter la mort tragique de son père et reprendre sa place légitime sur le trône.', 'https://m.media-amazon.com/images/M/MV5BYTYxNGMyZTYtMjE3MS00MzNjLWFjNmYtMDk3N2FmM2JiM2M1XkEyXkFqcGdeQXVyNjY5NDU4NzI@._V1_.jpg'),
    ('Gladiator', 2000, (SELECT id FROM gender WHERE label = 'Action'), 'Un général romain devient gladiateur et cherche à se venger de l''empereur qui a tué sa famille.', 'https://m.media-amazon.com/images/M/MV5BMDliMmNhNDEtODUyOS00MjNlLTgxODEtN2U3NzIxMGVkZTA1L2ltYWdlXkEyXkFqcGdeQXVyNjU0OTQ0OTY@._V1_.jpg'),
    ('Avatar', 2009, (SELECT id FROM gender WHERE label = 'Science-Fiction'), 'Un marine paraplégique est envoyé sur Pandora où il prend parti pour le peuple Na''vi.', 'https://m.media-amazon.com/images/M/MV5BZDA0OGQxNTItMDZkMC00N2UyLTg3MzMtYTJmNjg3Nzk5MzRiXkEyXkFqcGdeQXVyMjUzOTY1NTc@._V1_.jpg'),
    ('Forrest Gump', 1994, (SELECT id FROM gender WHERE label = 'Drame'), 'L''histoire extraordinaire d''un homme ordinaire qui a vécu une vie remarquable.', 'https://m.media-amazon.com/images/M/MV5BNWIwODRlZTUtY2U3ZS00Yzg1LWJhNzYtMmZiYmEyNmU1NjMzXkEyXkFqcGdeQXVyMTQxNzMzNDI@._V1_.jpg'),
    ('Le Silence des Agneaux', 1991, (SELECT id FROM gender WHERE label = 'Thriller'), 'Une jeune agent du FBI demande l''aide d''un tueur en série emprisonné pour en arrêter un autre.', 'https://m.media-amazon.com/images/M/MV5BNjNhZTk0ZmEtNjJhMi00YzFlLWE1MmEtYzM1M2ZmMGMwMTU4XkEyXkFqcGdeQXVyNjU0OTQ0OTY@._V1_.jpg'),
    ('Star Wars: Un Nouvel Espoir', 1977, (SELECT id FROM gender WHERE label = 'Science-Fiction'), 'Un jeune fermier rejoint une rébellion galactique contre un empire tyrannique.', 'https://m.media-amazon.com/images/M/MV5BOTA5NjhiOTAtZWM0ZC00MWNhLThiMzEtZDFkOTk2OTU1ZDJkXkEyXkFqcGdeQXVyMTA4NDI1NTQx._V1_.jpg'),
    ('Jurassic Park', 1993, (SELECT id FROM gender WHERE label = 'Aventure'), 'Un parc d''attractions peuplé de dinosaures génétiquement recréés tourne au cauchemar.', 'https://m.media-amazon.com/images/M/MV5BMjM2MDgxMDg0Nl5BMl5BanBnXkFtZTgwNTM2OTM5NDE@._V1_.jpg'),
    ('Le Grand Bleu', 1988, (SELECT id FROM gender WHERE label = 'Drame'), 'L''histoire de deux plongeurs en apnée et leur passion pour les profondeurs.', 'https://m.media-amazon.com/images/M/MV5BOTg3MGE4YzQtNjBkZi00MTRmLTk5NTEtZDk4MzU4OTFkMTYyXkEyXkFqcGdeQXVyMjUzOTY1NTc@._V1_.jpg'),
    ('Amélie', 2001, (SELECT id FROM gender WHERE label = 'Comédie'), 'Une jeune serveuse décide de faire le bien autour d''elle dans le Montmartre des années 90.', 'https://m.media-amazon.com/images/M/MV5BNDg4NjM1YjMtYmNhZC00MjM0LWFiZmYtNGY1YjA3MzZmODc5XkEyXkFqcGdeQXVyNDk3NzU2MTQ@._V1_.jpg'),
    ('The Dark Knight', 2008, (SELECT id FROM gender WHERE label = 'Action'), 'Batman affronte son plus grand défi : le Joker terrorise Gotham City.', 'https://m.media-amazon.com/images/M/MV5BMTMxNTMwODM0NF5BMl5BanBnXkFtZTcwODAyMTk2Mw@@._V1_.jpg'),
    ('Les Évadés', 1994, (SELECT id FROM gender WHERE label = 'Drame'), 'L''histoire d''amitié entre deux prisonniers sur plusieurs décennies.', 'https://m.media-amazon.com/images/M/MV5BNDE3ODcxYzMtY2YzZC00NmNlLWJiNDMtZDViZWM2MzIxZDYwXkEyXkFqcGdeQXVyNjAwNDUxODI@._V1_.jpg'),
    ('Il faut sauver le soldat Ryan', 1998, (SELECT id FROM gender WHERE label = 'Guerre'), 'Durant la Seconde Guerre mondiale, des soldats partent en mission pour sauver un parachutiste.', 'https://m.media-amazon.com/images/M/MV5BZjhkMDM4MWItZTVjOC00ZDRhLThmYTAtM2I5NzBmNmNlMzI1XkEyXkFqcGdeQXVyNDYyMDk5MTU@._V1_.jpg'),
    ('Le Cinquième Élément', 1997, (SELECT id FROM gender WHERE label = 'Science-Fiction'), 'Un chauffeur de taxi devient le gardien d''une arme capable de sauver la Terre.', 'https://m.media-amazon.com/images/M/MV5BZWFjYmZmZGQtYzg4YS00ZGE5LTgwYzAtZmQwZjQ2NDliMGVmXkEyXkFqcGdeQXVyNTUyMzE4Mzg@._V1_.jpg'),
    ('Blade Runner 2049', 2017, (SELECT id FROM gender WHERE label = 'Science-Fiction'), 'Un jeune blade runner découvre un secret enfoui qui le force à retrouver Rick Deckard, disparu depuis 30 ans.', 'https://m.media-amazon.com/images/M/MV5BNzA1Njg4NzYxOV5BMl5BanBnXkFtZTgwODk5NjU3MzI@._V1_.jpg'),
    ('Gran Torino', 2008, (SELECT id FROM gender WHERE label = 'Drame'), 'Un vétéran de la guerre de Corée solitaire se lie d''amitié avec ses voisins hmongs et les protège de gang locaux.', 'https://m.media-amazon.com/images/M/MV5BMTc5NTk2OTU1Nl5BMl5BanBnXkFtZTcwMDc3NjAwMg@@._V1_.jpg'),
    ('Le Prestige', 2006, (SELECT id FROM gender WHERE label = 'Thriller'), 'Deux magiciens deviennent des rivaux acharnés dans le Londres de la fin du 19e siècle.', 'https://m.media-amazon.com/images/M/MV5BMjA4NDI0MTIxNF5BMl5BanBnXkFtZTYwNTM0MzY2._V1_.jpg'),
    ('Into the Wild', 2007, (SELECT id FROM gender WHERE label = 'Aventure'), 'Après l''université, un jeune homme abandonne toutes ses possessions et fait de l''auto-stop jusqu''en Alaska pour vivre dans la nature.', 'https://m.media-amazon.com/images/M/MV5BMTAwNDEyODU1MjheQTJeQWpwZ15BbWU2MDc3NDQwNw@@._V1_.jpg'),
    ('La La Land', 2016, (SELECT id FROM gender WHERE label = 'Drame'), 'Un pianiste de jazz et une aspirante actrice tombent amoureux tout en poursuivant leurs rêves à Los Angeles.', 'https://m.media-amazon.com/images/M/MV5BMzUzNDM2NzM2MV5BMl5BanBnXkFtZTgwNTM3NTg4OTE@._V1_.jpg');