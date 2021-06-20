const knex = require('../database')

module.exports = {

    async list(req, res){

        //fazer um paginacao com o status de pagina
        
        //Fazer o join do owner
        
        const results = await knex('machines')

        return res.json(results)

    },
    async create(req, res, next){
        try {
            const machine = {...req.body}

            //validar
            
            await knex('machines').insert(machine)

            return res.status(201).send()
        } catch (error) {
            next(error)
        }
    },
    async update(req, res, next){
        try {
            const newmachine = {...req.body}
            const {id} = req.params
            //console.log(req.query.pronto)
            //console.log(req.query.final)
            await knex('machines').update(newmachine).where({id})
          
            res.send()
        } catch (error) {
            next(error)
        }
    },
    async delete(req, res, next){
        try {
            const id = req.params.id
            
            
            await knex('machines').where({id}).del()

            return res.send()
        } catch (error) {
            next(error)
            
        }
        

    }
}