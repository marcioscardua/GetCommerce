
const knex = require('../database')

module.exports = {
    async index(req, res){
        //const user = {...req.body}
        const results = await knex('users')
        //console.log(user.cep)

        return res.json(results)
    }


}

