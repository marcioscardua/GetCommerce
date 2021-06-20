const knex = require('../database')

module.exports = {

    async list(req, res){

        //fazer um paginacao com o status de pagina
        
        const results = await knex('colors')

        return res.json(results)

    },
    async create(req, res, next){
        try {
            const color = {...req.body}

            //validar
            
            await knex('colors').insert(color)

            return res.status(201).send()
        } catch (error) {
            next(error)
        }
    },
    async update(req, res, next){
        try {
            const newcolor = {...req.body}
            const {id} = req.params
            //console.log(req.query.pronto)
            //console.log(req.query.final)
            await knex('colors').update(newcolor).where({id})
          
            res.send()
        } catch (error) {
            next(error)
        }
    },
    async delete(req, res, next){
        try {
            const id = req.params.id
            

            //tratar a exclusaso pois colors relaciona com products
            
            await knex('colors').where({id}).del()

            return res.send()
        } catch (error) {
            next(error)
            
        }
        

    }
}