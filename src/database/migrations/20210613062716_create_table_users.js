const { updateTrigger } = require('../../../knexfile');


exports.up = function(knex, Promise) {
    return knex.schema.createTable('users', table => {
        table.increments('id').primary()
        table.string('first_name').notNull()
        table.string('last_name').notNull()
        table.string('email').unique().notNull()
        table.string('password').notNull()
        table.integer('cep').notNull()
        table.boolean('type_user').notNull().defaultTo(false) //false fabricante true comprador
        table.timestamp('created_at').defaultTo(knex.fn.now())
        table.timestamp('updated_at').defaultTo(knex.fn.now())
       
    }).then(()=>knex.raw(updateTrigger('users')))
  
};
exports.down = knex => knex.schema.dropTable('users')
