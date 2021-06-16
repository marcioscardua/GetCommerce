const express = require('express')
const routes = express.Router()
const UserController = require('./controllers/UserController')
const ProductController = require('./controllers/ProductController')
const ColorController = require('./controllers/ColorController')
const FontController = require('./controllers/FontController')
const MaterialController = require('./controllers/MaterialController')
const MachineController = require('./controllers/MachineController')
const OrderController = require('./controllers/OrderController')
const Validate = require('./controllers/ValidateController')
const auth = require('./passport')


//Global ---
routes.post('/signin', Validate.signin)
routes.post('/signup', UserController.create)
routes.post('/validateToken', Validate.validateToken)


//Users Routes
//routes.all('/users', auth.authenticate())
routes.get('/users', UserController.list )
routes.post('/users', UserController.create)

//routes.all('/users/:id', auth.authenticate())
routes.put('/users/:id', UserController.update)
routes.delete('/users/:id', UserController.delete)

//Product Routes
//routes.all('/products', auth.authenticate())
routes.get('/products', ProductController.list)
routes.post('/products', ProductController.create)
routes.put('/products', ProductController.updateQuery)

//routes.all('/products/:id', auth.authenticate())
routes.put('/products/:id', ProductController.update)
routes.delete('/products/:id', ProductController.delete)

//Colors Routes
//routes.all('/colors', auth.authenticate())
routes.get('/colors',ColorController.list )
routes.post('/colors', ColorController.create)

//routes.all('/colors/:id', auth.authenticate())
routes.put('/colors/:id', ColorController.update)
routes.delete('/colors/:id', ColorController.delete)

//Fonts Routes
//routes.all('/fonts', auth.authenticate())
routes.get('/fonts',FontController.list )
routes.post('/fonts', FontController.create)

//routes.all('/fonts/:id', auth.authenticate())
routes.put('/fonts/:id', FontController.update)
routes.delete('/fonts/:id', FontController.delete)


//Materials Routes
//routes.all('/materials', auth.authenticate())
routes.get('/materials',MaterialController.list )
routes.post('/materials', MaterialController.create)

//routes.all('/materials/:id', auth.authenticate())
routes.put('/materials/:id', MaterialController.update)
routes.delete('/materials/:id', MaterialController.delete)

//Machines Routes
//routes.all('/machines/', auth.authenticate())
routes.get('/machines',MachineController.list )
routes.post('/machines', MachineController.create)

//routes.all('/machines/:id', auth.authenticate())
routes.put('/machines/:id', MachineController.update)
routes.delete('/machines/:id', MachineController.delete)

//Order Routes
//routes.all('/orders', auth.authenticate())
routes.get('/orders',OrderController.list )
routes.post('/orders', OrderController.create)

//routes.all('/orders/:id', auth.authenticate())
routes.put('/orders/:id', OrderController.update)
routes.delete('/orders/:id', OrderController.delete)

module.exports = routes