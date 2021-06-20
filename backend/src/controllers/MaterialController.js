const knex = require('../database')

module.exports = {

    async list(req, res){

        //fazer um paginacao com o status de pagina
        
        //Fazer o join da cor
        
        const results = await knex('material')

        return res.json(results)

    },
    async create(req, res, next){
        try {
            const material = {...req.body}

            //validar
            
            await knex('material').insert(material)

            return res.status(201).send()
        } catch (error) {
            next(error)
        }
    },
    async update(req, res, next){
        try {
            const newmaterial = {...req.body}
            const {id} = req.params
            //console.log(req.query.pronto)
            //console.log(req.query.final)
            await knex('material').update(newmaterial).where({id})
          
            res.send()
        } catch (error) {
            next(error)
        }
    },
    async delete(req, res, next){
        try {
            const id = req.params.id
            

            //tratar a exclusaso pois material relaciona com products
            
            await knex('material').where({id}).del()

            return res.send()
        } catch (error) {
            next(error)
            
        }
        

    }
}