const knex = require('./database')
const passport = require('passport')
const passportJwt = require('passport-jwt')

const {secret} = require('../.env')
const {Strategy, ExtractJwt} = passportJwt

const params = {
    secretOrKey : secret,
    jwtFromRequest: ExtractJwt.fromAuthHeaderAsBearerToken()
}

const strategy = new Strategy(params, (payload, done) =>{

    knex('users')
        .where({id:payload.id})
        .first()
        .then(user => done(null, user ? {...payload} : false))
        .catch(err => done(err, false))
})

passport.use(strategy)

module.exports = {
    authenticate: () => passport.authenticate('jwt', {session:false})
}