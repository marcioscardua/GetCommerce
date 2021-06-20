import 'dart:convert';


import 'package:getcommerce/view/addProducts.dart';
import 'package:getcommerce/view/listProducts.dart';
import 'package:getcommerce/view/loginPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "GetCommerce",
      debugShowCheckedModeBanner: false,
      home: MainPage(),
      theme: ThemeData(
          primaryColor: Colors.lightGreen,
        accentColor: Colors.white70
      ),
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  String _nome;

  Future<List> getData() async {

    //Fazer uma dashboard

    final response = await http.get(Uri.parse("http://192.168.2.10:4000/products"));
    debugPrint(response.body);
    return json.decode(response.body);
  }

  SharedPreferences sharedPreferences;

  @override
  void initState() {
    super.initState();
    checkLoginStatus();



  }

  checkLoginStatus() async {
    sharedPreferences = await SharedPreferences.getInstance();
    _nome =  sharedPreferences.getString("email");
    if(sharedPreferences.getString("token") == null) {

      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (BuildContext context) => LoginPage()), (Route<dynamic> route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("DASHBOARD", style: TextStyle(color: Colors.white)),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              sharedPreferences.clear();
              sharedPreferences.commit();
              Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (BuildContext context) => LoginPage()), (Route<dynamic> route) => false);
            },
            child: Text("Sair", style: TextStyle(color: Colors.black54)),
          ),
        ],
      ),
      body: Center(child: Text("Dashboard")),
      drawer:     Drawer(
        child: new ListView(
              children: <Widget>[
                new UserAccountsDrawerHeader(

                  //Colocar de form dinamica

                  accountName: new Text('GetCommerce',style: (TextStyle( fontSize: 20)),),
                 // accountEmail: new Text( _nome ?? " "),
                ),
               new ListTile(
                  title: new Text("Lista de Produtos"),
                  trailing: new Icon(Icons.list),
                  onTap: () => Navigator.of(context).push(new MaterialPageRoute(
                    builder: (BuildContext context) => ListProducts(),
                  )),
                  ),
                new ListTile(
                  title: new Text("Lista de Usuários"),
                  trailing: new Icon(Icons.list),
                  onTap: () => Navigator.of(context).push(new MaterialPageRoute(
                    builder: (BuildContext context) => ListProducts(),
                  )),
                  enabled: false,
                ),
                new ListTile(
                  title: new Text("Lista de Máquinas"),
                  trailing: new Icon(Icons.list),
                  onTap: () => Navigator.of(context).push(new MaterialPageRoute(
                    builder: (BuildContext context) => ListProducts(),
                  )),
                  enabled: false,
                ),

                 new Divider(),

                new ListTile(
                  title: new Text("Adicionar Produtos"),
                  trailing: new Icon(Icons.add_box_outlined),
                  onTap: () => Navigator.of(context).push(new MaterialPageRoute(
                    builder: (BuildContext context) => AddDataProduct(),
                  )),
                  enabled: true,
                ),
                new ListTile(
                  title: new Text("Adicionar Usuários"),
                  trailing: new Icon(Icons.add_box_outlined),
                  onTap: () => Navigator.of(context).push(new MaterialPageRoute(
                    builder: (BuildContext context) => AddDataProduct(),
                  )),
                  enabled: false,
                ),
                new ListTile(
                  title: new Text("Adicionar Máquinas"),
                  trailing: new Icon(Icons.add_box_outlined),
                  onTap: () => Navigator.of(context).push(new MaterialPageRoute(
                    builder: (BuildContext context) => AddDataProduct(),
                  )),
                  enabled: false,
                ),
                new Divider(),
                new ListTile(
                  title: new Text("Verificar CEP"),
                  trailing: new Icon(Icons.streetview),
                  onTap: () => Navigator.of(context).push(new MaterialPageRoute(
                    builder: (BuildContext context) => AddDataProduct(),
                  )),
                  enabled: false,
                ),
                new ListTile(
                  title: new Text("Calcular Frete"),
                  trailing: new Icon(Icons.local_shipping_outlined),
                  onTap: () => Navigator.of(context).push(new MaterialPageRoute(
                    builder: (BuildContext context) => AddDataProduct(),
                  )),
                  enabled: false,
                ),



              ],
      ),
      ),
    );
  }
}
