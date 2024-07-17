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


