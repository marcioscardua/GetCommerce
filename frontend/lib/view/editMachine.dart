import 'package:getcommerce/controllers/baseController.dart';
import 'package:flutter/material.dart';
import 'package:getcommerce/view/listMachines.dart';

class EditMachine extends StatefulWidget
{
  final List list;
  final int index;
  EditMachine({this.list, this.index});
  @override
  _EditMachineState createState() => _EditMachineState();
}
class _EditMachineState extends State<EditMachine>
{
  WebService webService = new WebService();
  TextEditingController _nameController;
  TextEditingController _typeController;
  TextEditingController _opCostController;
  TextEditingController _ownerIdController;
  TextEditingController _idController;
  @override
  void initState()
  {
    _idController = new TextEditingController(text: widget.list[widget.index]['id'].toString());
    _nameController = new TextEditingController(text: widget.list[widget.index]['id'].toString());
    _typeController = new TextEditingController(text: widget.list[widget.index]['name'].toString());
    _opCostController = new TextEditingController(text: widget.list[widget.index]['price'].toString());
    _ownerIdController = new TextEditingController(text: widget.list[widget.index]['description'].toString());
    super.initState();
  }
  @override
  Widget build(BuildContext context)
  {
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
                    controller: _nameController,
                    validator: (value)
                    {
                      if (value.isEmpty) return "Nome";
                    },
                    decoration: new InputDecoration(
                      labelText: "Nome",
                    ),
                  ),
                ),
                new ListTile(
                  title: new TextFormField(
                    controller: _typeController,
                    validator: (value)
                    {
                      if (value.isEmpty) return "Tipo";
                    },
                    decoration: new InputDecoration(
                      labelText: "Tipo",
                    ),
                  ),
                ),
                new ListTile(
                  title: new TextFormField(
                    controller: _opCostController,
                    validator: (value)
                    {
                      if (value.isEmpty) return "Custo Operacional";
                    },
                    decoration: new InputDecoration(
                      labelText: "Custo Operacional",
                    ),
                  ),
                ),
                const Divider(height: 1.0),
                new Padding(padding: const EdgeInsets.all(10.0)),
                new ElevatedButton(
                  child: new Text("Editar"),
                  onPressed: ()
                  {
                    webService.updateMachine(
                      _idController.text.trim(),
                      _nameController.text.trim(),
                      _typeController.text.trim(), 
                      _opCostController.text.trim(),
                      _ownerIdController.text.trim()
                    );
                    Navigator.of(context).push(new MaterialPageRoute(
                      builder: (BuildContext context) => new ListMachines(),
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