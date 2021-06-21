import 'package:getcommerce/controllers/baseController.dart';
import 'package:getcommerce/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddDataMachine extends StatefulWidget
{
  final String title;
  AddDataMachine({this.title});
  @override
  _AddDataMachineState createState() => _AddDataMachineState();
}
class _AddDataMachineState extends State<AddDataMachine>
{
  WebService webService = new WebService();
  final TextEditingController _infoController = new TextEditingController();
  final TextEditingController _nameController = new TextEditingController();
  final TextEditingController _typeController = new TextEditingController();
  final TextEditingController _opcostController = new TextEditingController();
  final TextEditingController _owneridController = new TextEditingController();
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(title: Text('Adicionar Produtos')),
      body: Container(
        child: ListView(
          padding: const EdgeInsets.only(top: 25, bottom: 12.0),
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(10),
              child: Text('Preencha com os dados do seu produto. * Obrigatório'),
            ),
            Container(
              height: 50,
              margin: EdgeInsets.all(10),
              child: new TextFormField(
                controller: _nameController,
                keyboardType: TextInputType.name,
                decoration: InputDecoration(border: OutlineInputBorder(),labelText: 'Nome*'),
              ),
            ),
            Container(
              height: 50,
              margin: EdgeInsets.all(10),
              child: new TextField(
                controller: _typeController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(border: OutlineInputBorder(),labelText: 'Tipo'),
              ),
            ),
            Container(
              height: 50,
              margin: EdgeInsets.all(10),
              child: new TextField(
                controller: _opcostController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(border: OutlineInputBorder(),labelText: 'Custo Operacional'),
              ),
            ),
            Container(
              height: 50,
              margin: EdgeInsets.all(10),
              child: new TextField(
                controller: _owneridController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(border: OutlineInputBorder(),labelText: 'Identificador do Usuário'),
              ),
            ),
            new Padding(padding: new EdgeInsets.only(top: 44.0)),
            Container(
              height: 50,
              margin: EdgeInsets.all(10),
              child: new ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.green,
                  onPrimary: Colors.white,
                ),
                onPressed: ()
                {
                  debugPrint(_nameController.text.trim());
                  debugPrint(_typeController.text.trim());
                  debugPrint(_opcostController.text.trim());
                  debugPrint(_owneridController.text.trim());
                  if (_nameController.text.isNotEmpty)
                  {
                    webService.addMachine(
                      _nameController.text.trim(),
                      _typeController.text.trim(),
                      _opcostController.text.trim(),
                      _owneridController.text.trim()
                    );
                    Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new MainPage()));
                  }
                  else
                  {
                    _infoController.text = "Atenção aos campos Obrigatórios!".trim();
                  }
                },
                child: new Text(
                  'ADICIONAR',
                  textScaleFactor: 1.6,
                  style: new TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}