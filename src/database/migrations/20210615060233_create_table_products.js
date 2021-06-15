exports.up = function(knex, Promise) {
    return knex.schema.createTable('products', table =>{
        table.increments('id').primary()
        table.string('name').notNull()
        table.decimal('price').notNull()
        table.string('description', 1000)
        table.string('weight').notNull()
        table.decimal('time_to_print').notNull()
        table.integer('color_id').references('id')
            .inTable('colors').notNull()
        table.string('text_position').notNull()
        table.integer('type_font').references('id').inTable('fonts')



  })
};

exports.down = function(knex, Promise) {
    return knex.schema.dropTable('products')
  
};
