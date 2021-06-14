const bodyParser = require('body-parser')
const cors = require('cors')

module.exports = ap =>{
    ap.use(bodyParser.json())
    ap.use(cors())
}