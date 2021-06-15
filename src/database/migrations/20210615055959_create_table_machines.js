
exports.up = function(knex, Promise) {
    return knex.schema.createTable('machines', table => {
        table.increments('id').primary()
        table.string('name').notNull()
        table.string('type').notNull()//tipo da maquina
        table.decimal('opCost').notNull()//custo operacional
        table.integer('ownerId').references('id')
            .inTable('users').notNull()
    })
  
};

exports.down = function(knex, Promise) {
    return knex.schema.dropTable('machines')
  
};
