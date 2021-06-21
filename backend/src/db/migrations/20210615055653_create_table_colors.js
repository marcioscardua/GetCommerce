
exports.up = function(knex, Promise) {
    return knex.schema.createTable('colors', table =>{
        table.increments('id').primary()
        table.string('name').notNull()
        table.string('type').notNull()
    })
  
};

exports.down = function(knex, Promise) {
    return knex.schema.dropTable('colors')
  
};
