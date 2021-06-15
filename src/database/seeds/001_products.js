
exports.seed = function(knex) {
  // Deletes ALL existing entries
  return knex('products').del()
    .then(function () {
      // Inserts seed entries
      return knex('products').insert([
        {firstname: 'marcio', lastname: 'scardua', email: 'marcio@gmail.com', password: '123456', cep: '165465' },
        {firstname: 'marcos', lastname: 'oliveira', email: 'marcos@gmail.com',  password: '123456', cep: '451887' }

      ]);
    });
};
