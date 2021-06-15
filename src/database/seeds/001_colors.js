
exports.seed = function(knex) {
  // Deletes ALL existing entries
  return knex('colors').del()
    .then(function () {
      // Inserts seed entries
      return knex('colors').insert([
        {name: 'Preto', type: 'silk'},
        {name: 'Branco', type: 'silk'},
        {name: 'Branco', type: 'Metalic'}
      
        
      ]);
    });
};
