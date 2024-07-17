const sequelize = require('../bdd/database')
const { DataTypes } = require('sequelize')


const User = sequelize.define('user', {
    user_id: {
        type: DataTypes.INTEGER,
        allowNull: false,
        primaryKey: true,
        autoIncrement: true
    },
    user_nom: {
        type: DataTypes.STRING,
        allowNull: false
    },
    user_prenom: {
        type: DataTypes.STRING,
        allowNull: false
    },
    user_email: {
        type: DataTypes.STRING,
        allowNull: false
    },
    user_pass: {
        type: DataTypes.STRING,
        allowNull: false
    },
    user_type: {
        type: DataTypes.ENUM('user', 'admin'),
        allowNull: false
    }
}, {
    freezeTableName: true
})

module.exports = User