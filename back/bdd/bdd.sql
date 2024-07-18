CREATE DATABASE IF NOT EXISTS Litura;
USE Litura;

-- Table Utilisateur
CREATE TABLE User (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    user_nom VARCHAR(50),
    user_prenom VARCHAR(50),
    user_mail VARCHAR(100),
    user_pass VARCHAR(100),
    user_type ENUM('user', 'admin')
    note_note INT,
);

-- Table loisir
CREATE TABLE Loisir (
    loisir_id INT PRIMARY KEY AUTO_INCREMENT,
    loisir_type ENUM('livre', 'bande_dessine', 'manga', 'comics'),
    loisir_nom VARCHAR(50),
    loisir_image VARCHAR(100),
    loisir_note FLOAT,
    loisir_desc VARCHAR(500),
);


INSERT INTO `loisir` (`loisir_id`, `loisir_type`, `loisir_nom`, `loisir_image`, `loisir_note`, `loisir_description`, `createdAt`, `updatedAt`) VALUES
(1, 'livre', 'Le temps des tempêtes', 'https://m.media-amazon.com/images/I/41o7YIV+X2L._SY445_SX342_.jpg', 4.5, 'À compter du 16 mai 2007 j’étais seul Bien sûr, il y avait le peuple français, mais sa force collective ne s’exprime pas dans le quotidien des décisions à prendre, ou des nominations à effectuer J’avais une équipe, des conseillers, des amis, des visiteurs du soir, mais j’étais seul à me battre.', '2024-07-17 12:50:43', '2024-07-17 12:50:43'),
(2, 'manga', 'Naruto', 'https://m.media-amazon.com/images/I/816kx8uxi6L._SY425_.jpg', 4, 'Naruto Uzumaki, un jeune ninja qui rêve de devenir Hokage, le plus puissant ninja de son village.', '2024-07-17 13:02:01', '2024-07-17 13:02:01'),
(3, 'manga', 'One Piece', 'https://static.fnac-static.com/multimedia/PE/Images/FR/NR/a0/e1/4c/5038496/1540-1/tsp20240629075448/One-Piece-Edition-originale-Tome-01.jpg', 4, 'Luffy et son équipage partent à la recherche du légendaire trésor One Piece pour devenir le roi des pirates.', '2024-07-17 13:03:14', '2024-07-17 13:03:14'),
(4, 'manga', 'Attack on Titan', 'https://m.media-amazon.com/images/I/51ywmxi7JVL._SY445_SX342_.jpg', 4.7, 'Eren Yeager et ses amis se battent pour sauver l\'humanité des Titans, des créatures gigantesques qui dévorent les humains.', '2024-07-17 13:04:07', '2024-07-17 13:04:07'),
(5, 'manga', 'My Hero Academia', 'https://m.media-amazon.com/images/I/51Vh+5ION1L._SY445_SX342_.jpg', 4.6, 'Dans un monde où presque tout le monde possède des super-pouvoirs, Izuku Midoriya rêve de devenir un héros malgré son absence de pouvoirs.', '2024-07-17 13:05:26', '2024-07-17 13:05:26'),
(6, 'manga', 'Dragon Ball', 'https://m.media-amazon.com/images/I/51LBGOEu-4L._SY445_SX342_.jpg', 4.8, 'Suivez les aventures de Son Goku et ses amis alors qu\'ils défendent la Terre contre divers ennemis.', '2024-07-17 13:06:13', '2024-07-17 13:06:13'),
(7, 'livre', '1984', 'https://m.media-amazon.com/images/I/51FtyMniiSS._SY445_SX342_.jpg', 3.7, 'Dans un monde dystopique, Winston Smith lutte contre un régime totalitaire et son chef Big Brother.', '2024-07-17 13:07:12', '2024-07-17 13:07:12'),
(8, 'livre', 'Le Petit Prince', 'https://m.media-amazon.com/images/I/416adnHl9wL._SY445_SX342_.jpg', 3.5, 'Un jeune prince voyage de planète en planète et apprend des leçons de vie essentielles.', '2024-07-17 13:08:07', '2024-07-17 13:08:07'),
(9, 'livre', 'Harry Potter à l\'école des sorciers', 'https://m.media-amazon.com/images/I/41Xjr0CjuEL._SY445_SX342_.jpg', 2.8, 'Harry Potter découvre qu\'il est un sorcier et entame ses études à l\'école de sorcellerie de Poudlard.', '2024-07-17 13:08:54', '2024-07-17 13:08:54'),
(10, 'livre', 'La Peste', 'https://m.media-amazon.com/images/I/31EGRZ-4pwL._SY445_SX342_.jpg', 4.6, 'Un récit de la lutte contre une épidémie de peste dans la ville algérienne d\'Oran.', '2024-07-17 13:10:06', '2024-07-17 13:10:06'),
(11, 'bande_dessine', 'Tintin-Le Secret de la Licorne', 'https://m.media-amazon.com/images/I/81yK6sGZEaL._SY425_.jpg', 2.8, 'Tintin et son chien Milou partent à la recherche d\'un trésor perdu.', '2024-07-17 13:12:43', '2024-07-17 13:12:43'),
(12, 'bande_dessine', 'Astérix le Gaulois', 'https://m.media-amazon.com/images/I/617+B6Nq5iL._SY445_SX342_.jpg', 4.7, 'Astérix et Obélix défendent leur village gaulois contre les envahisseurs romains.', '2024-07-17 13:13:51', '2024-07-17 13:13:51'),
(13, 'bande_dessine', 'Les Aventures de Lucky Luke - Le Pied-Tendre', 'https://m.media-amazon.com/images/I/515rEjZ-T6L._SY445_SX342_.jpg', 4.6, 'Lucky Luke, le cowboy solitaire, aide un pied-tendre à s\'adapter à la vie dans le Far West.', '2024-07-17 13:14:51', '2024-07-17 13:14:51'),
(14, 'bande_dessine', 'Les Schtroumpfs - Le Schtroumpfissime', 'https://m.media-amazon.com/images/I/51tGb3zdKcL._SY445_SX342_.jpg', 4.5, 'Les Schtroumpfs élisent un nouveau chef en l\'absence du Grand Schtroumpf.', '2024-07-17 13:15:36', '2024-07-17 13:15:36'),
(15, 'bande_dessine', 'Garfield - Garfield se lâche', 'https://m.media-amazon.com/images/I/5161dgJUHXL._SY445_SX342_.jpg', 4.6, 'Les aventures humoristiques du chat paresseux Garfield et de son propriétaire Jon.', '2024-07-17 13:16:13', '2024-07-17 13:16:13'),
(16, 'film', 'Inception', 'https://m.media-amazon.com/images/I/912AErFSBHL.__AC_SX300_SY300_QL70_ML2_.jpg', 4.8, 'Dom Cobb, un voleur qui infiltre les rêves pour dérober des secrets, est engagé pour implanter une idée dans l\'esprit d\'une cible.', '2024-07-17 13:20:09', '2024-07-17 13:20:09'),
(17, 'film', 'Le Seigneur des Anneaux : La Communauté de l\'Anneau', 'https://fr.web.img6.acsta.net/medias/nmedia/00/02/54/95/affiche2.jpg', 4.9, 'Un jeune hobbit nommé Frodon doit détruire un anneau maléfique avant que Sauron, le Seigneur des Ténèbres, ne le récupère.', '2024-07-17 13:21:16', '2024-07-17 13:21:16'),
(18, 'film', 'The Dark Knight', 'https://fr.web.img2.acsta.net/medias/nmedia/18/63/97/89/18949761.jpg', 4.9, 'Batman affronte le Joker, un criminel anarchiste qui sème le chaos à Gotham City.', '2024-07-17 13:21:57', '2024-07-17 13:21:57'),
(19, 'film', 'Forrest Gump', 'https://fr.web.img4.acsta.net/pictures/15/10/13/15/12/514297.jpg', 4.8, 'Forrest Gump, un homme au grand cœur mais à l\'esprit simple, vit une vie extraordinaire remplie de moments historiques.', '2024-07-17 13:22:50', '2024-07-17 13:22:50'),
(20, 'film', 'La La Land', 'https://fr.web.img4.acsta.net/pictures/16/11/10/13/52/169386.jpg', 4.7, 'Un musicien de jazz et une actrice en herbe tombent amoureux en essayant de réaliser leurs rêves à Los Angeles.', '2024-07-17 13:25:11', '2024-07-17 13:25:11'),
(21, 'serie', 'Breaking Bad', 'https://fr.web.img5.acsta.net/pictures/19/09/24/17/24/4667551.jpg', 4.9, 'Walter White, un professeur de chimie atteint d\'un cancer, commence à fabriquer de la méthamphétamine pour subvenir aux besoins de sa famille.', '2024-07-17 13:28:27', '2024-07-17 13:28:27'),
(22, 'serie', 'Game of Thrones', 'https://m.media-amazon.com/images/M/MV5BN2IzYzBiOTQtNGZmMi00NDI5LTgxMzMtN2EzZjA1NjhlOGMxXkEyXkFqcGdeQXVyNjAwNDUxODI@._V1_.jpg', 4.8, 'Des familles nobles se disputent le trône de fer et le contrôle des Sept Royaumes de Westeros.', '2024-07-17 13:29:22', '2024-07-17 13:29:22'),
(23, 'serie', 'Stranger Things', 'https://m.media-amazon.com/images/I/81eY+Q2pOGL.jpg', 4.7, 'Un groupe d\'enfants découvre des événements surnaturels et des secrets gouvernementaux après la disparition de leur ami.', '2024-07-17 13:30:09', '2024-07-17 13:30:09'),
(24, 'serie', 'The Mandalorian', 'https://m.media-amazon.com/images/I/81oP0pVLi5L._AC_UF1000,1000_QL80_.jpg', 4.7, 'Un chasseur de primes Mandalorian navigue dans les marges de la galaxie après la chute de l\'Empire.', '2024-07-17 13:30:48', '2024-07-17 13:30:48'),
(25, 'serie', 'The Crown', 'https://fr.web.img4.acsta.net/pictures/23/10/26/11/17/0715878.jpg', 1.5, 'La vie de la reine Élisabeth II et les événements politiques et sociaux qui ont façonné la seconde moitié du XXe siècle.', '2024-07-17 13:31:43', '2024-07-17 13:31:43');


INSERT INTO `user` (`user_id`, `user_nom`, `user_prenom`, `user_email`, `user_pass`, `user_type`, `createdAt`, `updatedAt`) VALUES
(1, 'Doe', 'John', 'john.doe@example.com', 'securepassword123', 'admin', '2024-07-17 13:33:15', '2024-07-17 13:33:15'),
(2, 'Bourges', 'Carm', 'carlbrgs@example.com', 'password123', 'user', '2024-07-17 13:33:48', '2024-07-17 13:33:48'),
(3, 'Lo', 'Jean', 'jeanlo@example.com', 'passwordé&é&é&', 'user', '2024-07-17 13:34:20', '2024-07-17 13:34:20'),
(4, 'admin', 'admin', 'admin@example.com', 'admin', 'admin', '2024-07-17 13:34:47', '2024-07-17 13:34:47');

