const bcrypt = require('bcrypt-nodejs')
const jwt = require('jwt-simple')
const knex = require('../database')
const {secret} = require('../../.env')

module.exports = {
    async signin(req, res){
        if(!req.body.email || !req.body.password ){
            return res.status(400).send('Informe usuario e senha') 
        }
        const user = await knex('users').where({email:req.body.email}).first()

        //Se nao for encontrado
        if(!user){
            return res.status(400).send('Usuario nao encontrado!')
        }
        const isMatch = bcrypt.compareSync(req.body.password, user.password)
        if(!isMatch){
            return res.status(401).send('Email/Senha invalido')
        }
        const now = Math.floor(Date.now() /1000)
        //atencao ao payload
        const payload = {
            id: user.id,
            name: user.name,
            email: user.email,
            iat: now,
            exp: now + (60*60*24*3)
        }
        res.json({
            ...payload,
            token: jwt.encode(payload, secret)
        })
    },

    async validateToken(req, res){
        const user = req.body || null
        try {
            if(user){
                const token = jwt.decode(user.token, secret)
                if(new Date(token.exp * 1000) > new Date()){
                    return res.send(true)
                }
            }
        } catch (error) {
           
            res.json({Erro:'Token'})          
        }
        res.send(false)
    }


}