import 'package:getcommerce/controllers/baseController.dart';
import 'package:flutter/material.dart';
import 'package:getcommerce/view/listUsers.dart';

class EditUser extends StatefulWidget
{
  final List list;
  final int index;
  EditUser({this.list, this.index});
  @override
  _EditUserState createState() => _EditUserState();
}
class _EditUserState extends State<EditUser>
{
  WebService webService = new WebService();
  TextEditingController _firstNameController = new TextEditingController();
  TextEditingController _lastNameController = new TextEditingController();
  TextEditingController _emailController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();
  TextEditingController _cepController = new TextEditingController();
  TextEditingController _typeUserController = new TextEditingController();
  TextEditingController _idController = new TextEditingController();
  @override
  void initState()
  {
    _firstNameController = new TextEditingController(text: widget.list[widget.index]['first_name'].toString());
    _lastNameController = new TextEditingController(text: widget.list[widget.index]['last_name'].toString());
    _emailController = new TextEditingController(text: widget.list[widget.index]['email'].toString().replaceAll(".", ","));

    _cepController = new TextEditingController(text: widget.list[widget.index]['cep'].toString());

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
                    controller: _firstNameController,
                    keyboardType: TextInputType.name,
                    validator: (value)
                    {
                      if (value.isEmpty) return "Primeiro Nome";
                    },
                    decoration: new InputDecoration(
                      labelText: "Primeiro Nome",
                    ),
                  ),
                ),
                new ListTile(
                  title: new TextFormField(
                    controller: _lastNameController,
                    keyboardType: TextInputType.name,
                    validator: (value)
                    {
                      if (value.isEmpty) return "Sobrenome";
                    },
                    decoration: new InputDecoration(
                      labelText: "Sobrenome",
                    ),
                  ),
                ),
                new ListTile(
                  title: new TextFormField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    validator: (value)
                    {
                      if (value.isEmpty) return "E-mail";
                    },
                    decoration: new InputDecoration(
                      labelText: "E-mail",
                    ),
                  ),
                ),

                new ListTile(
                  title: new TextFormField(
                    controller: _cepController,
                    keyboardType: TextInputType.number,
                    validator: (value)
                    {
                      if (value.isEmpty) return "CEP";
                    },
                    decoration: new InputDecoration(
                      labelText: "CEP",
                    ),
                  ),
                ),

                const Divider(height: 1.0),
                new Padding(padding: const EdgeInsets.all(10.0)),
                new ElevatedButton(
                  child: new Text("Editar"),
                  onPressed: ()
                  {
                    webService.updateUser(
                      _idController.text.trim(), 
                      _firstNameController.text.trim(), 
                      _lastNameController.text.trim(),
                      _emailController.text.trim(), 
                      _passwordController.text.trim(), 
                      _cepController.text.trim(), 
                      _typeUserController.text.trim() 
                    );
                    Navigator.of(context).push(new MaterialPageRoute(
                      builder: (BuildContext context) => new ListUsers(),
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