const express = require('express')
const route = express.Router()
const userController = require('../controllers/userController')

route.post('/create', userController.CreateUser)
route.put('/update/:id', userController.UpdateUser)
route.delete('/delete/:id', userController.DeleteUser)
route.get('/all', userController.AllUser)

module.exports = route