const sequelize = require('../bdd/database');
const User = require('../model/userModel');
const Loisir = require('../model/loisirModel');

exports.AllTable = async(req, res) => {
    await sequelize.query('CREATE DATABASE IF NOT EXISTS litura;');
    await sequelize.query('DROP TABLE IF EXISTS user;');
    await sequelize.query('DROP TABLE IF EXISTS loisir;');
    await User.sync();
    await Loisir.sync();
    res.status(200).json('la bdd et les tables sont crées')
}

exports.createTableUser = async(req, res) => {
    await sequelize.query('CREATE TABLE IF EXISTS user;');
    await User.sync({ force: true });
    res.status(200).json('table utilisateur créer')
}

exports.createTableLoisir = async(req, res) => {
    await sequelize.query('CREATE TABLE IF EXISTS loisir;');
    await Loisir.sync({ force: true });
    res.status(200).json('table loisir créer')
}