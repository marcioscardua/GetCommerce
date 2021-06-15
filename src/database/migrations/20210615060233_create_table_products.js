exports.up = function(knex, Promise) {
    return knex.schema.createTable('products', table =>{
        table.increments('id').primary()
        table.string('name').notNull()
        table.decimal('price').notNull()
        table.string('description', 1000)
        table.string('weight').notNull()
        table.decimal('timeToPrint').notNull()
        table.integer('colorId').references('id')
            .inTable('colors').notNull()
        table.string('textPosition').notNull()
        table.integer('typeFont').references('id').inTable('fonts')



  })
};

exports.down = function(knex, Promise) {
    return knex.schema.dropTable('products')
  
};
