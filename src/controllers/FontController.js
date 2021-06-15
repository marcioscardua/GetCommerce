const knex = require('../database')

module.exports = {

    async list(req, res){

        //fazer um paginacao com o status de pagina
        
        const results = await knex('fonts')

        return res.json(results)

    },
    async create(req, res, next){
        try {
            const font = {...req.body}

            //validar
            
            await knex('fonts').insert(font)

            return res.status(201).send()
        } catch (error) {
            next(error)
        }
    },
    async update(req, res, next){
        try {
            const newfont = {...req.body}
            const {id} = req.params
            //console.log(req.query.pronto)
            //console.log(req.query.final)
            await knex('fonts').update(newfont).where({id})
          
            res.send()
        } catch (error) {
            next(error)
        }
    },
    async delete(req, res, next){
        try {
            const id = req.params.id
            

            //tratar a exclusaso pois fonts relaciona com products
            
            await knex('fonts').where({id}).del()

            return res.send()
        } catch (error) {
            next(error)
            
        }
        

    }
}