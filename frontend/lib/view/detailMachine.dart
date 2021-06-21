import 'package:getcommerce/controllers/baseController.dart';
import 'package:flutter/material.dart';
import 'package:getcommerce/view/editMachine.dart';
import 'package:getcommerce/view/listMachines.dart';

class DetailMachine extends StatefulWidget
{
  final List list;
  final int index;
  DetailMachine({this.index, this.list});
  @override
  _DetailMachineState createState() => _DetailMachineState();
}
class _DetailMachineState extends State<DetailMachine>
{
  WebService webService = new WebService();
  void confirm() {
    AlertDialog alertDialog = new AlertDialog(
      content:new Text("Deseja excluir '${widget.list[widget.index]['name']}'"),
      actions: <Widget>[
        new ElevatedButton(
          child: new Text("SIM",style: new TextStyle(color: Colors.black)),
          style: ElevatedButton.styleFrom(primary: Colors.cyanAccent,onPrimary: Colors.white),
          onPressed: () 
          {
            webService.removeMachine(widget.list[widget.index]['id'].toString());
            Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new ListMachines()));
          },
        ),
        new ElevatedButton(
          style: ElevatedButton.styleFrom(primary: Colors.cyanAccent,onPrimary: Colors.white),
          child: new Text("NÃO", style: new TextStyle(color: Colors.black)),
          onPressed: () => Navigator.pop(context),
        ),
      ],
    );
    showDialog(
      context: context,
      builder: (BuildContext context)
      {
        return alertDialog;
      },
    );
  }
  @override
  Widget build(BuildContext context)
  {
    return new Scaffold(
      appBar: new AppBar(title: new Text("${widget.list[widget.index]['name']}")),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          padding: const EdgeInsets.all(13.0),
          child: new Align(
            child: new Column(
              children: <Widget>
              [
                new Padding(padding: const EdgeInsets.only(top: 15.0)),
                new Text(widget.list[widget.index]['name'].toString().toUpperCase(), style: new TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
                Divider(),
                Text("Tipo: ${widget.list[widget.index]['typeController']}",style: new TextStyle(fontSize: 18.0),maxLines: 30,textAlign: TextAlign.justify),
                Divider(),
                new Text("Custo Operacional: R\$${widget.list[widget.index]['op_cost'].toString()}",style: new TextStyle(fontSize: 18.0)),
                new Text("Identificador de Usuário: ${widget.list[widget.index]['owner_id'].toString()}",style: new TextStyle(fontSize: 18.0)),
                new Padding(padding: const EdgeInsets.only(top: 15.0)),
                new Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    new ElevatedButton(
                      child: new Text("Editar"),
                      style: ElevatedButton.styleFrom(primary: Colors.deepOrangeAccent,onPrimary: Colors.white),
                      onPressed: () => Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new EditMachine())),
                    ),
                    VerticalDivider(),
                    new ElevatedButton(
                      style: ElevatedButton.styleFrom(primary: Colors.red,onPrimary: Colors.white),
                      child: new Text("Excluir"),
                      onPressed: () => confirm(),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      )
    );
  }
}