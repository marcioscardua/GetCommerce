
const knex = require('../database')
const validator = require('./validator/validator')
const bcrypt = require('bcrypt-nodejs')



//funcao responsvel pela hash
 function encryptPassword (password){
    const salt = bcrypt.genSaltSync(10)
    return bcrypt.hashSync(password, salt)
}

module.exports = {

   
    async list(req, res){
        //const user = {...req.body}
        const results = await knex('users').where({deleted_at: null})
        //console.log(user.cep)

        return res.json(results)
    },
    async create(req, res, next){
        try{
            const user = {...req.body}

            //console.log(user.first_name)

           // if(user.first_name == undefined)

            //throw error

            validator.existsOrError(user.first_name, 'Nome não informado.' )
            validator.existsOrError(user.last_name, 'Sobrenome não informado.' )
            validator.existsOrError(user.email, 'E-mail não informado.' )
            validator.existsOrError(user.password, 'Senha não informado.' )    
            validator.existsOrError(user.cep, 'CEP não informado.' )
            validator.adressCep(user.cep)//uma promise

            const userInsideDB = await knex('users').where({email: user.email}).first()

            validator.notExistsOrError(userInsideDB, "E-mail já cadastrado.")

            user.password =  encryptPassword(user.password)

            await knex('users').insert(user)
            //return res.status(201).send()
          
            return res.json({Criado: true})
           
       }catch(error){
            res.status(400).json({erro: error})
            next(error)           
       }    
    },
    async update(req, res, next){
        try {
            const user = {...req.body}
            const {id} = req.params
            user.password =  encryptPassword(user.password)

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
           let cont = id

           await knex('users').update({deleted_at: new Date()}).where({id})


           return res.send({id})
        } catch (error) {
            next(error)
        }
    }

}

