import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class WebService {
  var status;
  var token;
  String serverUrlproducts = "http://192.168.2.10:4000/products";

  //Metodos Produtos
  void addProduct(String _nameController,
      String _priceController,
      String _timeController,
      String _weightController,
      String _colorController,
      String _fontController,
      String _descriptionController) async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'token';
    final value = prefs.get(key) ?? 0;

    String myUrl = "http://192.168.2.10:4000/products";
    final response = await http.post(Uri.parse(myUrl), headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer $value'
    }, body: {
      "name": "$_nameController",
      "price": "$_priceController",
      "description": "$_descriptionController",
      "weight": "$_weightController",
      "time_to_print": "$_timeController",
      "color_id": "$_colorController",
      "text_position": "esquerda", //padrao
      "type_font": "$_fontController"
    });
    status = response.body.contains('error');

    var data = json.decode(response.body);

    if (status) {
      print('data : ${data["error"]}');
    } else {
      print('data : ${data["token"]}');
      _save(data["token"]);
    }
  }

  Future<List> getData() async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'token';
    final value = prefs.get(key) ?? 0;

    String myUrl = "http://192.168.2.10:4000/products";
    http.Response response = await http.get(Uri.parse(myUrl), headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer $value'
    });
    print(response.body);
    return json.decode(response.body);
  }

  void updateProduct(String id, String name, String price, String description, String font, String color, String weight, String time) async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'token';
    final value = prefs.get(key) ?? 0;


    String myUrl = "http://192.168.2.10:4000/products/$id";
    http.put(Uri.parse(myUrl),  headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer $value'
    } , body: {
    "name": "$name",
    "price": "$price",
    "description": "$description",
    "weight" : "$weight",
    "time_to_print": "$time",
    "color_id": "$color",
    "type_font": "$font",
    }).then((response) {
      print('Response status : ${response.statusCode}');
      print('Response body : ${response.body}');
    });
  }

  Future<void> removeProduct(String id) async {
    String myUrl = "http://192.168.2.10:4000/products/$id";
    final prefs = await SharedPreferences.getInstance();
    final key = 'token';
    final value = prefs.get(key) ?? 0;

    Response res = await http.delete(Uri.parse(myUrl),  headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer $value'
    });

    if (res.statusCode == 200) {
      print("DELETED");
    } else {
      throw "Can't delete post.";
    }
  }

  //function save
  _save(String token) async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'token';
    final value = token;
    prefs.setString(key, value);
  }

//function read
  read() async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'token';
    final value = prefs.get(key) ?? 0;
    print('read : $value');
  }
}
