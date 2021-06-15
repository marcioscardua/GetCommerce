const knex = require('../database')

module.exports = {

    async list(req, res){

        //fazer um paginacao com o status de pagina
        
        //Fazer os join do cliente e produto
        
        const results = await knex('orders')

        return res.json(results)

    },
    async create(req, res, next){
        try {
            const order = {...req.body}

            //validar
            
            await knex('orders').insert(order)

            return res.status(201).send()
        } catch (error) {
            next(error)
        }
    },
    async update(req, res, next){
        try {
            const neworder = {...req.body}
            const {id} = req.params
            //console.log(req.query.pronto)
            //console.log(req.query.final)
            await knex('orders').update(neworder).where({id})
          
            res.send()
        } catch (error) {
            next(error)
        }
    },
    async delete(req, res, next){
        try {
            const id = req.params.id
            

           
            
            await knex('orders').where({id}).del()

            return res.send()
        } catch (error) {
            next(error)
            
        }
        

    }
}