const express = require('express')
const routes = require('./routes')
const md = require('./middleware')
const app = express()

app.use(express.json())
app.use(routes )
//app.use(md)

app.get(console.log('Teste'))
app.listen(4000, () => console.log('Servidor 3DMate'))