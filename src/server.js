const express = require('express')
const routes = require('./routes')
const md = require('./middleware')
const app = express()

app.use(express.json())
app.use(routes )
//app.use(md)

//not found
app.use((req, res, next) => {
    const error  = new Error('Not found')
    error.status = 404
    next(error)
})

//Catch All
app.use((error, req, res, next) => {
    res.status(error.status || 500)
    res.json({error: error.message})


})

app.get(console.log('Teste'))
app.listen(4000, () => console.log('Servidor 3DMate'))