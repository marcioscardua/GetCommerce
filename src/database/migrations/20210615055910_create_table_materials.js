
exports.up = function(knex, Promise) {
    return knex.schema.createTable('material',table =>{
        table.increments('id').primary()
        table.string('name').notNull()
        table.decimal('bestTem') // best temperature
        table.date('openDate')
        table.integer('colorId').references('id')
            .inTable('colors')
        table.decimal('price').notNull() //price for kg
    })
  
};

exports.down = function(knex, Promise) {
    return knex.schema.dropTable('material')
  
};
