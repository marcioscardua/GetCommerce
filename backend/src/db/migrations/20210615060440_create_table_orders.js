exports.up = function(knex, Promise) {
    return knex.schema.createTable('orders', table => {
        table.increments('id').primary()
        table.integer('customer_id').references('id')
            .inTable('users').notNull()
        table.string('cep_delivery').notNull()
        table.integer('product_id').references('id')
            .inTable('products').notNull()
        table.string('status')
    })
  
};

exports.down = function(knex, Promise) {
    return knex.schema.dropTable('orders')
  
};
