
exports.seed = function(knex) {
  // Deletes ALL existing entries
  return knex('users').del()
    .then(function () {
      // Inserts seed entries
      return knex('users').insert([
        {first_name: 'marcio', last_name: 'scardua', email: 'marcio@gmail.com', password: '123456', cep: '165465' },
        {first_name: 'marcos', last_name: 'oliveira', email: 'marcos@gmail.com',  password: '123456', cep: '451887' }

      ]);
    });
};
