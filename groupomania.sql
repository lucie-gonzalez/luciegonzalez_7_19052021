CREATE DATABASE groupomania CHARACTER SET 'utf8';
USE groupomania;


CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `lastname` varchar(40) NOT NULL,
  `firstname` varchar(40) NOT NULL,
  `img_profil` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `role` int DEFAULT (0),
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



CREATE TABLE `post` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user` int DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `img` varchar(255) DEFAULT NULL,
  `text` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `PostUser` (`user`),
  CONSTRAINT `PostUser` FOREIGN KEY (`user`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=83 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;




CREATE TABLE `post_comment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user` int DEFAULT NULL,
  `msg` varchar(255) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `id_post` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_post` (`id_post`),
  KEY `PostcommentUser` (`user`),
  CONSTRAINT `post_comment_ibfk_1` FOREIGN KEY (`id_post`) REFERENCES `post` (`id`) ON DELETE CASCADE,
  CONSTRAINT `PostcommentUser` FOREIGN KEY (`user`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;





CREATE TABLE `post_like` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user` int DEFAULT NULL,
  `statut` int DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `id_post` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_post` (`id_post`),
  KEY `PostlikeUser` (`user`),
  CONSTRAINT `post_like_ibfk_1` FOREIGN KEY (`id_post`) REFERENCES `post` (`id`) ON DELETE CASCADE,
  CONSTRAINT `PostlikeUser` FOREIGN KEY (`user`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;




