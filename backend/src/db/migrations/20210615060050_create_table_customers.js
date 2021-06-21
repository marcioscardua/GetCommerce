
// se der tempo 
exports.up = function(knex, Promise) { 
    return knex.schema.createTable('customers', table =>{
        table.integer('customer_id').references('id')
            .inTable('users')
    })
  
};

exports.down = function(knex, Promise) {
    return knex.schema.dropTable('customers')
  
};
