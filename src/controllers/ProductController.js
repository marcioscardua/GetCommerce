const knex = require('../database')
const { update } = require('./UserController')



module.exports = {

    async index(req, res){

        //fazer um paginacao com o status de pagina
        
        const results = await knex('products')

        return res.json(results)

    },
    async create(req, res, next){
        try {
            const product = {...req.body}

            //validar
            
            await knex('products').insert(product)

            return res.status(201).send()
        } catch (error) {
            next(error)
        }
    },
    async update(req, res, next){
        try {
            const newproduct = {...req.body}
            const {id} = req.params
            //console.log(req.query.pronto)
            //console.log(req.query.final)
            await knex('products').update(newproduct).where({id})
          
            res.send()
        } catch (error) {
            next(error)
        }
    },
    async updateQuery(req, res, next){
        try {
            const newproduct = {...req.body}
            const id = req.query.id
            const flag = req.query.pronto
           
            if(flag == 1){
                await knex('products').update(newproduct).where({id})
                res.send()
            }else{
                res.send('NaoPronto')
            }        
          
            
        } catch (error) {
            next(error)
        }
    },
    async delete(req, res, next){
        try {
            const id = req.params.id

            await knex('products').where({id}).del()

            return res.send()
        } catch (error) {
            next(error)
            
        }
        

    }
}