exports.up = function(knex, Promise) {
    return knex.schema.createTable('orders', table => {
        table.increments('id').primary()
        table.integer('customerId').references('id')
            .inTable('users').notNull()
        table.string('cepDelivery').notNull()
        table.integer('productId').references('id')
            .inTable('products').notNull()
        table.string('status')
    })
  
};

exports.down = function(knex, Promise) {
    return knex.schema.dropTable('orders')
  
};
