const express = require('express')
const routes = require('./routes')
const cors = require('cors')
const app = express()


app.use(cors())
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

app.listen(4000, () => console.log('Servidor 3DMate'))