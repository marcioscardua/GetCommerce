import 'package:getcommerce/controllers/baseController.dart';
import 'package:flutter/material.dart';
import 'package:getcommerce/view/editProduct.dart';
import 'package:getcommerce/view/editUser.dart';
import 'package:getcommerce/view/listProducts.dart';
import 'package:getcommerce/view/listUsers.dart';

class DetailUser extends StatefulWidget
{
  final List list;
  final int index;
  DetailUser({this.index, this.list});
  @override
  _DetailUserState createState() => _DetailUserState();
}
class _DetailUserState extends State<DetailUser>
{
  WebService webService = new WebService();
  void confirm() {
    AlertDialog alertDialog = new AlertDialog(
      content:new Text("Deseja excluir "+"${widget.list[widget.index]['first_name']}".toString()+" "+"${widget.list[widget.index]['last_name']}".toString()),
      actions: <Widget>[
        new ElevatedButton(
          child: new Text("SIM",style: new TextStyle(color: Colors.black)),
          style: ElevatedButton.styleFrom(primary: Colors.cyanAccent,onPrimary: Colors.white),
          onPressed: () 
          {
            webService.removeUser(widget.list[widget.index]['id'].toString());
            Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new ListUsers()));
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
      appBar: new AppBar(title: new Text("${widget.list[widget.index]['first_name']}".toString()+" "+"${widget.list[widget.index]['last_name']}".toString())),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          padding: const EdgeInsets.all(13.0),
          child: new Align(
            child: new Column(
              children: <Widget>
              [
                new Padding(padding: const EdgeInsets.only(top: 15.0)),
                new Text("${widget.list[widget.index]['first_name']}".toString().toUpperCase()+" "+"${widget.list[widget.index]['last_name']}".toString().toUpperCase(), style: new TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
                Divider(),
                Text("E-mail: ${widget.list[widget.index]['email']}",style: new TextStyle(fontSize: 18.0)),

                new Text("CEP:${widget.list[widget.index]['cep'].toString()}",style: new TextStyle(fontSize: 18.0)),
                new Text("Tipo de Usuário:${widget.list[widget.index]['type_user']}",style: new TextStyle(fontSize: 18.0)),
                new Padding(padding: const EdgeInsets.only(top: 15.0)),
                new Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    new ElevatedButton(
                      child: new Text("Editar"),
                      style: ElevatedButton.styleFrom(primary: Colors.deepOrangeAccent,onPrimary: Colors.white),
                      onPressed: () => Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new EditUser(list: widget.list,index: widget.index))),
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