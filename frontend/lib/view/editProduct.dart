import 'package:getcommerce/controllers/baseController.dart';
import 'package:getcommerce/view/listProducts.dart';
import 'package:flutter/material.dart';

class EditProduct extends StatefulWidget {
  final List list;
  final int index;

  EditProduct({this.list, this.index});

  @override
  _EditProductState createState() => _EditProductState();
}

class _EditProductState extends State<EditProduct> {
  WebService webService = new WebService();

  TextEditingController controllerName;
  TextEditingController controllerPrice;
  TextEditingController controllerDescrip;
  TextEditingController controllerId;
  TextEditingController controllerPeso;
  TextEditingController controllerCor;
  TextEditingController controllerFonte;
  TextEditingController controllerTime;

  @override
  void initState() {
    controllerId = new TextEditingController(text: widget.list[widget.index]['id'].toString());
    controllerName = new TextEditingController(text: widget.list[widget.index]['name'].toString());
    controllerPrice = new TextEditingController(text: widget.list[widget.index]['price'].toString().replaceAll(".", ","));
    controllerDescrip = new TextEditingController(text: widget.list[widget.index]['description'].toString());
    controllerPeso = new TextEditingController(text: widget.list[widget.index]['weight'].toString());
    controllerCor = new TextEditingController(text: widget.list[widget.index]['color_id'].toString());
    controllerFonte = new TextEditingController(text: widget.list[widget.index]['type_font'].toString());
    controllerTime = new TextEditingController(text: widget.list[widget.index]['time_to_print'].toString());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Edição"),
      ),
      body: Form(
        child: ListView(
          padding: const EdgeInsets.all(10.0),
          children: <Widget>[
            new Column(
              children: <Widget>[
                new ListTile(
                  title: new TextFormField(
                    controller: controllerName,
                    validator: (value) {
                      if (value.isEmpty) return "Nome";
                    },
                    decoration: new InputDecoration(
                      labelText: "Nome",
                    ),
                  ),
                ),
                new ListTile(
                  title: new TextFormField(
                    controller: controllerPrice,
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value.isEmpty) return "Preço R\$";
                    },
                    decoration: new InputDecoration(
                      labelText: "Preço R\$",
                    ),
                  ),
                ),
                new ListTile(
                  title: new TextFormField(
                    controller: controllerPeso,
                    validator: (value) {
                      if (value.isEmpty) return "Peso";
                    },
                    decoration: new InputDecoration(
                      labelText: "Peso",
                    ),
                  ),
                ),
                new ListTile(
                  title: new TextFormField(
                    controller: controllerCor,
                    validator: (value) {
                      if (value.isEmpty) return "Cor";
                    },
                    decoration: new InputDecoration(
                      labelText: "Cor",
                    ),
                  ),
                ),
                new ListTile(
                  title: new TextFormField(
                    controller: controllerFonte,
                    validator: (value) {
                      if (value.isEmpty) return "Font";
                    },
                    decoration: new InputDecoration(
                      labelText: "Font",
                    ),
                  ),
                ),
                new ListTile(
                  title: new TextFormField(
                    controller: controllerTime,
                    validator: (value) {
                      if (value.isEmpty) return "Tempo";
                    },
                    decoration: new InputDecoration(
                      labelText: "Tempo",
                    ),
                  ),
                ),
                new ListTile(
                  title: new TextFormField(
                    controller: controllerDescrip,
                    validator: (value) {
                      if (value.isEmpty) return "Descrição";
                    },
                    decoration: new InputDecoration(
                      helperMaxLines: 15,
                      labelText: "Descrição",
                    ),
                    maxLines: 15,
                  ),
                ),
                const Divider(
                  height: 1.0,
                ),
                new Padding(
                  padding: const EdgeInsets.all(10.0),
                ),
                new ElevatedButton(
                  child: new Text("Editar"),
                  onPressed: () {
                    webService.updateProduct(controllerId.text.trim(), controllerName.text.trim(), controllerPrice.text.replaceAll(",", "."),
                        controllerDescrip.text.trim(), controllerFonte.text.trim(), controllerCor.text.trim(), controllerPeso.text.trim(), controllerTime.text.trim()  );
                    Navigator.of(context).push(new MaterialPageRoute(
                      builder: (BuildContext context) => new ListProducts(),
                    ));
                  },
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
