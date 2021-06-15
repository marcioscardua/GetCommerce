
exports.seed = function(knex) {
  // Deletes ALL existing entries
  return knex('fonts').del()
    .then(function () {
      // Inserts seed entries
      return knex('fonts').insert([
        {name: 'Russo One', type: 'Open'},
        {name: 'Courier', type: 'Monospace'}
      ]);
    });
};
