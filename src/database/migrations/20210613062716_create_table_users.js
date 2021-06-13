exports.up = function(knex, Promise) {
    return knex.schema.createTable('users', table => {
        table.increments('id').primary()
        table.string('firstname').notNull()
        table.string('lastname').notNull()
        table.string('email').unique().notNull()
        table.string('password').notNull()
        table.integer('cep').notNull()
        table.boolean('typeuser').notNull().defaultTo(false) //false fabricante true comprador
        table.timestamp('created_at').defaultTo(knex.fn.now())
        table.timestamp('updated_at').defaultTo(knex.fn.now())
       
    })
  
};
exports.down = knex => knex.schema.dropTable('users')
