**screen de l'application**
![image](https://user-images.githubusercontent.com/76063929/125630126-ad3901af-6daa-460f-900a-5d7a3874e33b.png)
![image](https://user-images.githubusercontent.com/76063929/125630180-27820d0f-c41f-4b30-89f9-4f0ecf73084f.png)
![image](https://user-images.githubusercontent.com/76063929/125630258-569be9c5-f7ee-4aa9-be97-4161e8cfc487.png)
![image](https://user-images.githubusercontent.com/76063929/125630381-ac4844d7-052f-4484-9012-e4b8d11cfee2.png)
![image](https://user-images.githubusercontent.com/76063929/125630322-954a06f5-b6c6-47c4-9372-da73aca7a3ec.png)
![image](https://user-images.githubusercontent.com/76063929/125630491-14ffec65-ddef-4e19-b14d-0f3cec9527c1.png)
![image](https://user-images.githubusercontent.com/76063929/125630437-05b9eb6a-ab0c-4ef9-9ee7-c48c380503a4.png)
![image](https://user-images.githubusercontent.com/76063929/125630556-4c72e044-0fdc-41f2-963b-e15f41eed0aa.png)






**Groupomania**

Création du réseau social d'entreprise Groupomania afin que les employés échangent sur des sujets divers.

Le projet a été généré avec Angular CLI version 12.1.1.

*modules et versions installés *

- @angular/cli@12.1.1
- angular@1.8.2
- bcrypt@5.0.1
- express@4.17.1
- nodejs@0.0.0
- nodemon@2.0.11
- npm@7.19.1
- mysql2-promise@0.1.4
- autoprefixer@10.2.6
- postcss-cli@8.3.1
- sass@1.35.2
- workbensh 8.0

Pour faire fonctionner le projet, vous devez installer node-sass à part.


*Les fonctionnalités importantes *

 => Mise en ligne d'un texte et d'une image/gif principal
    - ajout, modification, et supression

 => Commenter, suppresion de son commentaire

 => Evaluation du post au moyen d'un like ou dislike (possibilité de retirer son évaluation)
 
 => Création, identification, modification et suppression d'un compte

 => Créer un compte administrateur via MySQL

*méthodologie *

=> Cloner le repo : https://github.com/lucie-gonzalez/luciegonzalez_7_19052021.git

=> Entrer dans le dossier Groupomania grâce au terminal ou à l'invite de commande :

cd luciegonzalez_7_19052021

**➡️ Mysql **

*Création de la base de donnée *

=> Connectez vous à MySQL avec vos identifiants, puis:

=> Copier le script groupomania.sql

Commande sql:    

CREATE DATABASE groupomania;


*Structure  table users *


DROP TABLE IF EXISTS users; 

CREATE TABLE users ( id int NOT NULL AUTO_INCREMENT, email varchar(100) NOT NULL,password varchar(255) DEFAULT NULL,lastname varchar(40) NOT NULL,firstname varchar(40) NOT NULL, img_profil varchar(255) DEFAULT NULL, description varchar(255) DEFAULT NULL, role int DEFAULT (0), PRIMARY KEY (id), UNIQUE KEY email (email) ) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

*Structure table post *


DROP TABLE IF EXISTS post; 

CREATE TABLE post ( id int NOT NULL AUTO_INCREMENT, user int NOT NULL, img varchar(255) NOT NULL, text varchar(255) NOT NULL, date datetime DEFAULT NULL, PRIMARY KEY (id), KEY PostUser (user), CONSTRAINT PostUser FOREIGN KEY (user) REFERENCES users (id) ON DELETE CASCADE ON UPDATE CASCADE) ENGINE=InnoDB AUTO_INCREMENT=83 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

*Structure table post_comment *


DROP TABLE IF EXISTS post_comment;

CREATE TABLE post_comment ( id int NOT NULL AUTO_INCREMENT, msg varchar(255) DEFAULT NULL, user int NOT NULL, date datetime DEFAULT NULL, id_post int DEFAULT NULL,  PRIMARY KEY (id), KEY id_post (id_post), KEY PostcommentUser (user), CONSTRAINT post_comment_ibfk_1 FOREIGN KEY (id_post) REFERENCES post (id) ON DELETE CASCADE, CONSTRAINT PostcommentUser FOREIGN KEY (user) REFERENCES users (id) ON DELETE CASCADE ON UPDATE CASCADE ) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

*Structure table post_like *


DROP TABLE IF EXISTS post_like; 

CREATE TABLE post_like ( id int NOT NULL AUTO_INCREMENT, user int NOT NULL, statut int DEFAULT NULL, date datetime DEFAULT NULL, id_post int DEFAULT NULL, PRIMARY KEY (id), KEY id_post (id_post), KEY PostlikeUser (user), CONSTRAINT post_like_ibfk_1 FOREIGN KEY (id_post) REFERENCES post (id) ON DELETE CASCADE, CONSTRAINT post_like_ibfk_1_cascade FOREIGN KEY (post_id) REFERENCES post (post_id) ON DELETE CASCADE,  CONSTRAINT PostlikeUser FOREIGN KEY (user) REFERENCES users (id) ON DELETE CASCADE ON UPDATE CASCADE)ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
 
 
**Création compte moderateur **

 - Créer un compte sur le site (page signup)
 - Ouvrir la console de commande mysql
 - Entrer: 
UPDATE users SET role = 1 WHERE id = (l’id du compte à passer en admin);

**Utilisation de workbensh **

 - Télécharger et installer workbensh
 - Ouvrir l'instance
 - file/ open sql script
 - Choisir le script groupomania et cliquer sur execute (icon éclair aprés enregistrer)

 ==> Pour créer un moderateur:
 
 - Cliquer sur groupomania/tables/users
 - Cliquer sur modifier 
 - Cliquer sur 0 dans la colonne role de l'utilisateur et mettre 1 puis cliquer sur apply


#########################################

**➡️ Back-end **

Retour sur le projet, dans le terminal nous sommes dans le dossier luciegonzalez_7_19052021

*Lancer les commandes suivantes *

cd backend
npm install

*Création d'un fichier .env *


SECRET= Créez votre propre Token

user= Votre username MySQL

mp= Votre mot de passe MySQL

db= groupomania

pt= 3306

*Installation de nodemon *

npm install -g nodemon

*lancement du back-end *

=> écrire dans le terminal backend la commande :
nodemon server

**Le back-end est à présent opérationnel **

#########################################

**➡️ Front-end **

=> Dans un nouveau terminal ouvert depuis le dossier luciegonzalez_7_19052021, utilisez la commande suivante :
cd frontend

*installation du front-end *
npm install

*lancement du front-end *
ng serve --open


**Le front-end est à présent opérationnel **

#########################################

===> Par défaut le serveur client se lance automatiquement via le port 4200: http://localhost:4200/
