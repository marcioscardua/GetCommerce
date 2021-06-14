
const knex = require('../database')

module.exports = {
    async index(req, res){
        //const user = {...req.body}
        const results = await knex('users')
        //console.log(user.cep)

        return res.json(results)
    },
    async create(req, res, next){
        try{
            const user = {...req.body}

            //Tratar os dados antes
            
            await knex('users').insert(user)
            return res.status(201).send()

       }catch(error){
            next(error)
           
       }
    },
    async update(req, res, next){
        try {
            const user = {...req.body}
            const {id} = req.params

            await knex('users').update(user).where({id})

            return res.send()
        } catch (error) {
            next(error)
        }
    },
    async delete(req, res, next){
        try {
           const {id} = req.params
           
           //validar

           await knex('users').where({id}).del()

           return res.send()
        } catch (error) {
            next(error)
        }
    }

}

