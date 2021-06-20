
exports.seed = function(knex) {
  // Deletes ALL existing entries
  return knex('products').del()
    .then(function () {
      // Inserts seed entries
      return knex('products').insert([
        {
        name: 'Suporte Hibrido', price: '89.90', 
        description: ' Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse quis sollicitudin nunc, eget porta nisl. Nullam sit amet varius mauris. Proin eu bibendum mi, et volutpat orci. Nullam lobortis sed turpis eget fermentum. Nullam varius tellus cursus elit accumsan lobortis. Mauris rhoncus quis ipsum ac viverra. Ut mattis, lacus non fringilla laoreet, augue ante consectetur est,  ',
        weight: '79', time_to_print: '480', color_id: 2, text_position: 'Esquerda', type_font: 1 },
        
        {
        name: 'Bomba Limpeza Facil', price: '29.90', 
        description: ' Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse quis sollicitudin nunc, eget porta nisl. Nullam sit amet varius mauris. Proin eu bibendum mi, et volutpat orci. Nullam lobortis sed turpis eget fermentum. Nullam varius tellus cursus elit accumsan lobortis. Mauris rhoncus quis ipsum ac viverra. Ut mattis, lacus non fringilla laoreet, augue ante consectetur s ',
        weight: '11', time_to_print: '120', color_id: 1, text_position: 'center', type_font: 2 }
      ]);
    });
};
