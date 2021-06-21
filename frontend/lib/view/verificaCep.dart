import 'package:getcommerce/controllers/baseController.dart';
import 'package:getcommerce/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class verificaCep extends StatefulWidget {
  verificaCep({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _VerificaCepState createState() => _VerificaCepState();
}

class _VerificaCepState extends State<verificaCep> {
  WebService webService = new WebService();

  final TextEditingController _cepController = new TextEditingController();



  Future<String> getCep() async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'token';
    final value = prefs.get(key) ?? 0;
    final cep = _cepController.text.trim();

    if(cep == "" ){
      return "";
    }

    http.Response response = await http.get(Uri.parse("http://192.168.2.12:4000/verifica-cep/${cep}"), headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer $value'
    });
    final end = json.decode(response.body);
    if(end['cep'] == null){
      return "Inválido";
    }
    if(end['cep'] == "restrito"){
      return "RESTRITO - Entre em Contato";
    }
    //print('O endereço é ${end['logradouro']},${end['localidade']}-${end['uf']}');
    return ('O endereço é ${end['logradouro']} | ${end['localidade']}-${end['uf']}') ;
  }

  Future<String> getFutureDados() async =>
      await Future.delayed(Duration(seconds: 3), () {
        return 'Dados recebidos...';
      });

  void initState() {
    super.initState();
   // this.getCep();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.lightGreen,
      ),
      home: Scaffold(
          appBar: AppBar(
            title: Text('Verifica CEP'),
          ),
          body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            //padding: const EdgeInsets.all(13.0),
            child: Container(
              height: MediaQuery
                  .of(context)
                  .size
                  .width,
              child: ListView(
                padding: const EdgeInsets.only(top: 25, bottom: 12.0),
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.all(10),
                    child: Text('Realize a consulta completa de um CEP'),
                  ),
                  Container(
                    height: 50,
                    margin: EdgeInsets.all(10),
                    child: new TextFormField(
                      controller: _cepController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'CEP*',
                        //hintText: 'Product name',
                      ),
                    ),
                  ),
                  Container(
                    child: FutureBuilder(
                        future: getCep(),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            print(snapshot.data);
                            return  Center(
                              child: new ListTile(
                                title: new Text(
                                  snapshot.data,
                                  style: TextStyle(fontSize: 20.0, color: Colors.black54, fontWeight: FontWeight.bold),
                                ),

                              ),
                            );
                          } else {
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                        }),
                  ),
                  new Padding(
                    padding: new EdgeInsets.only(top: 44.0),
                  ),
                  Container(
                    height: 50,
                    margin: EdgeInsets.all(10),
                    child: new ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.green, // background
                        onPrimary: Colors.white, // foreground
                      ),
                      onPressed: () {
                        setState(() {

                        });
                      },
                      child: new Text(
                        'CONSULTAR',
                        textScaleFactor: 1.6,
                        style: new TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
