
exports.up = function(knex, Promise) {
    return knex.schema.createTable('material',table =>{
        table.increments('id').primary()
        table.string('name').notNull()
        table.decimal('best_temp') // best temperature
        table.date('open_date')
        table.integer('color_id').references('id')
            .inTable('colors')
        table.decimal('price').notNull() //price for kg
    })
  
};

exports.down = function(knex, Promise) {
    return knex.schema.dropTable('material')
  
};
