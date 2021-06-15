const express = require('express')
const routes = express.Router()
const UserController = require('./controllers/UserController')
const ProductController = require('./controllers/ProductController')
const ColorController = require('./controllers/ColorController')
const FontController = require('./controllers/FontController')
const MaterialController = require('./controllers/MaterialController')
const MachineController = require('./controllers/MachineController')
const OrderController = require('./controllers/OrderController')

//Users Routes
routes.get('/users', UserController.list )
routes.post('/users', UserController.create)
routes.put('/users/:id', UserController.update)
routes.delete('/users/:id', UserController.delete)

//Product Routes
routes.get('/products', ProductController.list)
routes.post('/products', ProductController.create)
routes.put('/products/:id', ProductController.update)
routes.put('/products', ProductController.updateQuery)
routes.delete('/products/:id', ProductController.delete)

//Colors Routes
routes.get('/colors',ColorController.list )
routes.post('/colors', ColorController.create)
routes.put('/colors/:id', ColorController.update)
routes.delete('/colors/:id', ColorController.delete)

//Fonts Routes
routes.get('/fonts',FontController.list )
routes.post('/fonts', FontController.create)
routes.put('/fonts/:id', FontController.update)
routes.delete('/fonts/:id', FontController.delete)


//Materials Routes
routes.get('/materials',MaterialController.list )
routes.post('/materials', MaterialController.create)
routes.put('/materials/:id', MaterialController.update)
routes.delete('/materials/:id', MaterialController.delete)

//Machines Routes
routes.get('/machines',MachineController.list )
routes.post('/machines', MachineController.create)
routes.put('/machines/:id', MachineController.update)
routes.delete('/machines/:id', MachineController.delete)

//Order Routes
routes.get('/orders',OrderController.list )
routes.post('/orders', OrderController.create)
routes.put('/orders/:id', OrderController.update)
routes.delete('/orders/:id', OrderController.delete)

module.exports = routes