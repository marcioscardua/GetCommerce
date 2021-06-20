import 'dart:async';
import 'dart:convert';

import 'package:getcommerce/view/detailProduct.dart';
import 'package:getcommerce/controllers/baseController.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ListProducts extends StatefulWidget {
  @override
  _ListProductsState createState() => _ListProductsState();
}

class _ListProductsState extends State<ListProducts> {
  List data; // Para colocar os dados em uma lista
  WebService webService = new WebService();



  @override
  void initState() {
    super.initState();
    //faz um get no servidor e traz os dados
    webService.getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Produtos"),
      ),
      body: new FutureBuilder<List>(
        future: webService.getData(),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);
          //Analisa se o getData trouxe inofrmcaoes caso contratio coloca um circularProgress
          return snapshot.hasData
              ? new ItemList(
                  list: snapshot.data,
                )
              : new Center(
                  child: new CircularProgressIndicator(
                    color: Colors.green,
                  ),
                );
        },
      ),
    );
  }
}

class ItemList extends StatelessWidget {
  final List list;

  ItemList({this.list});

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
      itemCount: list == null ? 0 : list.length,
      itemBuilder: (context, i) {
        return new Container(
          padding: const EdgeInsets.all(10.0),
          child: new GestureDetector(
            onTap: () => Navigator.of(context).push(
              new MaterialPageRoute(
                  builder: (BuildContext context) => new Detail(
                        list: list,
                        index: i,
                      )),
            ),
            //Card do produto
            child: new Card(
              child: new ListTile(
                title: new Text(
                  list[i]['name'].toString().toUpperCase(),
                  style: TextStyle(fontSize: 20.0, color: Colors.black54, fontWeight: FontWeight.bold),
                ),
                subtitle: new Text(
                  list[i]['description'].toString(),
                  style: TextStyle(fontSize: 16, color: Colors.black54),
                  maxLines: 3,
                ),

                trailing: Icon(Icons.more_vert),
                isThreeLine: true,
                //tileColor: Colors.greenAccent,
              ),
            ),
          ),
        );
      },
    );
  }
}
