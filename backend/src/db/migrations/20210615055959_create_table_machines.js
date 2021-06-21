
exports.up = function(knex, Promise) {
    return knex.schema.createTable('machines', table => {
        table.increments('id').primary()
        table.string('name').notNull()
        table.string('type').notNull()//tipo da maquina
        table.decimal('op_cost').notNull()//custo operacional
        table.integer('owner_id').references('id')
            .inTable('users').notNull()
    })
  
};

exports.down = function(knex, Promise) {
    return knex.schema.dropTable('machines')
  
};
