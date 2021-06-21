import 'dart:async';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:getcommerce/view/detailMachine.dart';
import 'package:getcommerce/view/detailMachine.dart';
import 'package:http/http.dart' as http;

class ListMachines extends StatefulWidget {
  @override
  _ListMachinesState createState() => _ListMachinesState();
}
class _ListMachinesState extends State<ListMachines>
{
  List data;
  Future<List> getData() async
  {
    final response = await http.get(Uri.parse("http://192.168.2.12:4000/machines"));
    return json.decode(response.body);
  }
  @override
  void initState()
  {
    super.initState();
    this.getData();
  }
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Máquinas"),
      ),
      body: new FutureBuilder<List>(
        future: getData(),
        builder: (context, snapshot)
        {
          if (snapshot.hasError) print(snapshot.error);
          return snapshot.hasData ? new ItemList(
            list: snapshot.data,
          ) : new Center(
            child: new CircularProgressIndicator(backgroundColor: Colors.green),
          );
        },
      ),
    );
  }
}
class ItemList extends StatelessWidget
{
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
                builder: (BuildContext context) => new DetailMachine(
                  list: list,
                  index: i,
                )
              ),
            ),
            child: new Card(
              child: new ListTile(
                title: new Text(
                  list[i]['name'].toString().toUpperCase(),
                  style: TextStyle(fontSize: 20.0, color: Colors.black54, fontWeight: FontWeight.bold),
                ),
                subtitle: new Text(
                  list[i]['type'].toString(),
                  style: TextStyle(fontSize: 16, color: Colors.black54),
                  maxLines: 3,
                ),
                trailing: Icon(Icons.more_vert),
                isThreeLine: true,
              ),
            ),
          ),
        );
      },
    );
  }
}