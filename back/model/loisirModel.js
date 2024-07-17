const sequelize = require('../bdd/database')
const { DataTypes } = require('sequelize')


const Loisir = sequelize.define('loisir', {
    loisir_id: {
        type: DataTypes.INTEGER,
        allowNull: false,
        primaryKey: true,
        autoIncrement: true
    },
    loisir_type: {
        type: DataTypes.ENUM('livre', 'bande_dessine', 'serie', 'manga', 'film'),
        allowNull: false
    },
    loisir_nom: {
        type: DataTypes.STRING,
        allowNull: false
    },
    loisir_image: {
        type: DataTypes.STRING,
        allowNull: false
    },
    loisir_note: {
        type: DataTypes.FLOAT,
        allowNull: false
    },
    loisir_description: {
        type: DataTypes.STRING(1000),
        allowNull: false
    },

}, {
    freezeTableName: true
})

module.exports = Loisir