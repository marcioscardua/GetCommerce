exports.up = function(knex, Promise) {
    return knex.schema.createTable('products', table =>{
        table.increments('id').primary()
        table.string('name')
        table.decimal('price')
        table.string('description', 1000)
        table.string('weight')
        table.decimal('time_to_print')
        table.integer('color_id').references('id')
            .inTable('colors')
        table.string('text_position')
        table.integer('type_font').references('id').inTable('fonts')
  })
};

exports.down = function(knex, Promise) {
    return knex.schema.dropTable('products')
  
};
