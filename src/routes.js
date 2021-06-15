const express = require('express')
const routes = express.Router()
const UserController = require('./controllers/UserController')
const ProductController = require('./controllers/ProductController')

//Users Routes
routes.get('/users', UserController.index )
routes.post('/users', UserController.create)
routes.put('/users/:id', UserController.update)
routes.delete('/users/:id', UserController.delete)

//Product Routes
routes.get('/products', ProductController.index)
routes.post('/products', ProductController.create)
routes.put('/products/:id', ProductController.update)
routes.put('/products', ProductController.updateQuery)
routes.delete('/products/:id', ProductController.delete)


module.exports = routes