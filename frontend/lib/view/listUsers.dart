import 'dart:async';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:getcommerce/view/detailUser.dart';
import 'package:http/http.dart' as http;

class ListUsers extends StatefulWidget {
  @override
  _ListUsersState createState() => _ListUsersState();
}
class _ListUsersState extends State<ListUsers>
{
  List data;
  Future<List> getData() async
  {
    final response = await http.get(Uri.parse("http://192.168.2.12:4000/users"));
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
        title: new Text("Usuários"),
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
                builder: (BuildContext context) => new DetailUser(
                  list: list,
                  index: i,
                )
              ),
            ),
            child: new Card(
              child: new ListTile(
                title: new Text(
                  list[i]['first_name'].toString().toUpperCase(),
                  style: TextStyle(fontSize: 20.0, color: Colors.black54, fontWeight: FontWeight.bold),
                ),
                subtitle: new Text(
                  list[i]['email'].toString(),
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