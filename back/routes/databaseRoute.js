const express = require('express')
const route = express.Router()
const databaseController = require('../controllers/databaseController')

route.get('/AllTable', databaseController.AllTable)
route.get('/createTableLoisir', databaseController.createTableLoisir)
route.get('/createTableUser', databaseController.createTableUser)

module.exports = route