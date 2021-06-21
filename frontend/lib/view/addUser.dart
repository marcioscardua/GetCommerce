import 'package:getcommerce/controllers/baseController.dart';
import 'package:getcommerce/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddDataUser extends StatefulWidget
{
  final String title;
  AddDataUser({this.title});
  @override
  _AddDataUserState createState() => _AddDataUserState();
}
class _AddDataUserState extends State<AddDataUser>
{
  WebService webService = new WebService();
  final TextEditingController _infoController = new TextEditingController();
  final TextEditingController _firstNameController = new TextEditingController();
  final TextEditingController _lastNameController = new TextEditingController();
  final TextEditingController _emailController = new TextEditingController();
  final TextEditingController _passwordController = new TextEditingController();
  final TextEditingController _cepController = new TextEditingController();
  final TextEditingController _typeUserController = new TextEditingController();
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
                controller: _firstNameController,
                keyboardType: TextInputType.name,
                decoration: InputDecoration(border: OutlineInputBorder(),labelText: 'Nome*'),
              ),
            ),
            Container(
              height: 50,
              margin: EdgeInsets.all(10),
              child: new TextField(
                controller: _lastNameController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(border: OutlineInputBorder(),labelText: 'Preço*'),
              ),
            ),
            Container(
              height: 50,
              margin: EdgeInsets.all(10),
              child: new TextField(
                controller: _emailController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(border: OutlineInputBorder(),labelText: 'Tempo'),
              ),
            ),
            Container(
              height: 50,
              margin: EdgeInsets.all(10),
              child: new TextField(
                controller: _passwordController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(border: OutlineInputBorder(),labelText: 'Peso*'),
              ),
            ),
            Container(
              height: 50,
              margin: EdgeInsets.all(10),
              child: new TextField(
                controller: _cepController,
                keyboardType: TextInputType.name,
                decoration: InputDecoration(border: OutlineInputBorder(), labelText: 'Cor'),
              ),
            ),
            Container(
              height: 50,
              margin: EdgeInsets.all(10),
              child: new TextField(
                controller: _typeUserController,
                keyboardType: TextInputType.name,
                decoration: InputDecoration(border: OutlineInputBorder(), labelText: 'Fonte'),
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
                  debugPrint(_firstNameController.text.trim());
                  debugPrint(_lastNameController.text.trim());
                  debugPrint(_emailController.text.trim());
                  debugPrint(_passwordController.text.trim());
                  debugPrint(_cepController.text.trim());
                  debugPrint(_typeUserController.text.trim());
                  if (_firstNameController.text.isNotEmpty)
                  {
                    webService.addUser(
                      _firstNameController.text.trim(),
                      _lastNameController.text.trim(),
                      _emailController.text.trim(),
                      _passwordController.text.trim(),
                      _cepController.text.trim(),
                      _typeUserController.text.trim()
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