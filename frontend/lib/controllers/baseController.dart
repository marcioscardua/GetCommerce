import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class WebService
{
  var status;
  var token;
  String serverUrlproducts = "http://192.168.2.12:4000/products";
  
  void addProduct(String _nameController,String _priceController,String _timeController,String _weightController,String _colorController,String _fontController,String _descriptionController) async
  {
    final prefs = await SharedPreferences.getInstance();
    final key = 'token';
    final value = prefs.get(key) ?? 0;
    String myUrl = "http://192.168.2.10:4000/products";
    final response = await http.post(Uri.parse(myUrl), headers:
    {
      'Accept': 'application/json'
    }, body:
    {
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
    if (status)
    {
      print('data : ${data["error"]}');
    }
    else
    {
      print('data : ${data["token"]}');
      _save(data["token"]);
    }
  }
  void addMachine(String _nameController, String _typeController, String _opCostController, String _ownerIdController) async
  {
    final prefs = await SharedPreferences.getInstance();
    final key = 'token';
    final value = prefs.get(key) ?? 0;
    String myUrl = "http://192.168.2.12:4000/machines";
    final response = await http.post(Uri.parse(myUrl), headers:
    {
      'Accept': 'application/json'
    }, body:
    {
      "name": "$_nameController",
      "type": "$_typeController",
      "op_cost": "$_opCostController",
      "owner_id": "$_ownerIdController"
    });
    status = response.body.contains('error');
    var data = json.decode(response.body);
    if (status)
    {
      print('data : ${data["error"]}');
    }
    else
    {
      print('data : ${data["token"]}');
      _save(data["token"]);
    }
  }
  void addUser(String _firstNameController, String _lastNameController, String _emailController, String _passwordController, String _cepController, String _typeUserController) async
  {
    final prefs = await SharedPreferences.getInstance();
    final key = 'token';
    final value = prefs.get(key) ?? 0;
    String myUrl = "http://192.168.2.12:4000/users";
    final response = await http.post(Uri.parse(myUrl), headers:
    {
      'Accept': 'application/json'
    }, body:
    {
      "first_name": "$_firstNameController",
      "last_name": "$_lastNameController",
      "email": "$_emailController",
      "password": "$_passwordController",
      "cep": "$_cepController",
      "type_user": "$_typeUserController"
    });
    status = response.body.contains('error');
    print( json.decode(response.body));
    var data = json.decode(response.body);
    if (status)
    {
      print('data : ${data["error"]}');
    }
    else
    {
      print('data : ${data["token"]}');
      _save(data["token"]);
    }
  }
  Future<List> getData() async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'token';
    final value = prefs.get(key) ?? 0;

    String myUrl = "$serverUrlproducts";
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
    String myUrl = "http://192.168.2.12:4000/products/$id";
    http.put(Uri.parse(myUrl), body:
    {
      "name": "$name",
      "price": "$price",
      "description": "$description",
      "weight" : "$weight",
      "time_to_print": "$time",
      "color_id": "$color",
      "type_font": "$font",
    }).then((response) 
    {
      print('Response status : ${response.statusCode}');
      print('Response body : ${response.body}');
    });
  }
  void updateMachine(String _id, String _nameController, String _typeController, String _opCostController, String _ownerIdController) async
  {
    final prefs = await SharedPreferences.getInstance();
    final key = 'token';
    final value = prefs.get(key) ?? 0;
    String myUrl = "http://192.168.2.12:4000/machines/$_id";
    http.put(Uri.parse(myUrl), body:
    {
      "name": "$_nameController",
      "type": "$_typeController",
      "op_cost": "$_opCostController",
      "owner_id": "$_ownerIdController"
    }).then((response) 
    {
      print('Response status : ${response.statusCode}');
      print('Response body : ${response.body}');
    });
  }
  void updateUser(String _id, String _firstNameController, String _lastNameController, String _emailController, String _passwordController, String _cepController, String _typeUserController)async
  {
    final prefs = await SharedPreferences.getInstance();
    final key = 'token';
    final value = prefs.get(key) ?? 0;
    String myUrl = "http://192.168.2.12:4000/users/$_id";
    http.put(Uri.parse(myUrl), body:
    {
      "first_name": "$_firstNameController",
      "last_name": "$_lastNameController",
      "email": "$_emailController",
      "password": "$_passwordController",
      "cep": "$_cepController",
      "type_user": "$_typeUserController"
    }).then((response) 
    {
      print('Response status : ${response.statusCode}');
      print('Response body : ${response.body}');
    });
  }
  Future<void> removeProduct(String id) async
  {
    String myUrl = "http://192.168.2.12:4000/products/$id";
    Response res = await http.delete(Uri.parse(myUrl));
    print(id);

    if (res.statusCode == 200) {
      print("DELETED");
    } else {
      throw "Can't delete post.";
    }
  }
  Future<void> removeMachine(String id) async
  {
    String myUrl = "http://192.168.2.12:4000/machines/$id";
    Response res = await http.delete(Uri.parse(myUrl));
    print(id);

    if (res.statusCode == 200) {
      print("DELETED");
    } else {
      throw "Can't delete post.";
    }
  }
  Future<void> removeUser(String id) async
  {
    String myUrl = "http://192.168.2.12:4000/users/$id";
    Response res = await http.delete(Uri.parse(myUrl));
    print(id);

    if (res.statusCode == 200) {
      print("DELETED");
    } else {
      throw "Can't delete post.";
    }
  }
  _save(String token) async
  {
    final prefs = await SharedPreferences.getInstance();
    final key = 'token';
    final value = token;
    prefs.setString(key, value);
  }
  read() async
  {
    final prefs = await SharedPreferences.getInstance();
    final key = 'token';
    final value = prefs.get(key) ?? 0;
    print('read : $value');
  }
}