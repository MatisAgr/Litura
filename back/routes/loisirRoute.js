const express = require('express');
const route = express.Router();
const controllerLoisir = require('../controllers/loisirController');

route.post('/create', controllerLoisir.CreateLoisir);
route.put('/update/:id', controllerLoisir.UpdateLoisir);
route.delete('/delete/:id', controllerLoisir.DeleteLoisir);
route.get('/all', controllerLoisir.AllLoisir);
route.get('/:categorie', controllerLoisir.FindLoisir);

module.exports = route
