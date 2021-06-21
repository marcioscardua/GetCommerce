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
      appBar: AppBar(title: Text('Adicionar Usuários')),
      body: Container(
        child: ListView(
          padding: const EdgeInsets.only(top: 25, bottom: 12.0),
          children: <Widget>[
            Container(
              height: 50,
              margin: EdgeInsets.all(10),
              child: new TextFormField(
                controller: _firstNameController,
                keyboardType: TextInputType.name,
                decoration: InputDecoration(border: OutlineInputBorder(),labelText: 'Primeiro Nome'),
              ),
            ),
            Container(
              height: 50,
              margin: EdgeInsets.all(10),
              child: new TextField(
                controller: _lastNameController,
                keyboardType: TextInputType.name,
                decoration: InputDecoration(border: OutlineInputBorder(),labelText: 'Sobrenome'),
              ),
            ),
            Container(
              height: 50,
              margin: EdgeInsets.all(10),
              child: new TextField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(border: OutlineInputBorder(),labelText: 'E-mail'),
              ),
            ),
            Container(
              height: 50,
              margin: EdgeInsets.all(10),
              child: new TextField(
                controller: _passwordController,
                keyboardType: TextInputType.visiblePassword,
                decoration: InputDecoration(border: OutlineInputBorder(),labelText: 'Senha'),
              ),
            ),
            Container(
              height: 50,
              margin: EdgeInsets.all(10),
              child: new TextField(
                controller: _cepController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(border: OutlineInputBorder(), labelText: 'CEP'),
              ),
            ),
            Container(
              height: 50,
              margin: EdgeInsets.all(10),
              child: new TextField(
                controller: _typeUserController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(border: OutlineInputBorder(), labelText: 'Tipo de Usuário'),
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