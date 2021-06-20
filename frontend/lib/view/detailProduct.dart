import 'package:getcommerce/controllers/baseController.dart';
import 'package:getcommerce/view/editProduct.dart';
import 'package:getcommerce/view/listProducts.dart';
import 'package:flutter/material.dart';

class Detail extends StatefulWidget {
  List list;
  int index;

  Detail({this.index, this.list});

  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  WebService webService = new WebService();

  void confirm() {
    AlertDialog alertDialog = new AlertDialog(
      content:
          new Text("Deseja excluir '${widget.list[widget.index]['name']}'"),
      actions: <Widget>[
        new ElevatedButton(
          child: new Text(
            "SIM",
            style: new TextStyle(color: Colors.black),
          ),
          style: ElevatedButton.styleFrom(
            primary: Colors.cyanAccent,
            onPrimary: Colors.white,
          ),
          onPressed: () {
            webService
                .removeProduct(widget.list[widget.index]['id'].toString());
            Navigator.of(context).push(new MaterialPageRoute(
              builder: (BuildContext context) => new ListProducts(),
            ));
          },
        ),
        new ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Colors.cyanAccent, // background
            onPrimary: Colors.white, // foreground
          ),
          child: new Text("NÃO", style: new TextStyle(color: Colors.black)),
          //color: Colors.green,
          onPressed: () => Navigator.pop(context),
        ),
      ],
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alertDialog;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar:
            new AppBar(title: new Text("${widget.list[widget.index]['name']}")),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            padding: const EdgeInsets.all(13.0),
            child: new Align(
              child: new Column(
                children: <Widget>[
                  new Padding(
                    padding: const EdgeInsets.only(top: 15.0),
                  ),
                  new Text(
                    widget.list[widget.index]['name'].toString().toUpperCase(),
                    style: new TextStyle(
                        fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                  Divider(),
                  Text(
                    "${widget.list[widget.index]['description']}",
                    style: new TextStyle(
                      fontSize: 18.0,
                    ),
                    maxLines: 30,
                    textAlign: TextAlign.justify,
                  ),
                  Divider(),
                  new Text(
                    "Preço: R\$${widget.list[widget.index]['price'].toString().replaceAll(".", ",")}",
                    style: new TextStyle(fontSize: 18.0),
                  ),
                  new Text(
                    "Tempo de Fabricação:${widget.list[widget.index]['time_to_print'].toString()}min",
                    style: new TextStyle(fontSize: 18.0),
                  ),
                  new Text(
                    "Peso:${widget.list[widget.index]['weight'].toString().replaceAll(".", ",")}g",
                    style: new TextStyle(fontSize: 18.0),
                  ),
                  new Padding(
                    padding: const EdgeInsets.only(top: 15.0),
                  ),
                  new Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      new ElevatedButton(
                        child: new Text("Editar"),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.deepOrangeAccent, // background
                          onPrimary: Colors.white, // foreground
                        ),
                        onPressed: () =>
                            Navigator.of(context).push(new MaterialPageRoute(
                          builder: (BuildContext context) => new EditProduct(
                            list: widget.list,
                            index: widget.index,
                          ),
                        )),
                      ),
                      VerticalDivider(),
                      new ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.red, // background
                          onPrimary: Colors.white, // foreground
                        ),
                        child: new Text("Excluir"),
                        onPressed: () => confirm(),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
