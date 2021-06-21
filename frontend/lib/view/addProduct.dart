import 'package:getcommerce/controllers/baseController.dart';
import 'package:getcommerce/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddDataProduct extends StatefulWidget
{
  final String title;
  AddDataProduct({this.title});
  @override
  _AddDataProductState createState() => _AddDataProductState();
}
class _AddDataProductState extends State<AddDataProduct>
{
  WebService webService = new WebService();
  final TextEditingController _infoController = new TextEditingController();
  final TextEditingController _nameController = new TextEditingController();
  final TextEditingController _priceController = new TextEditingController();
  final TextEditingController _timeController = new TextEditingController();
  final TextEditingController _weightController = new TextEditingController();
  final TextEditingController _colorController = new TextEditingController();
  final TextEditingController _fontController = new TextEditingController();
  final TextEditingController _descriptionController = new TextEditingController();
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
                controller: _nameController,
                keyboardType: TextInputType.name,
                decoration: InputDecoration(border: OutlineInputBorder(),labelText: 'Nome*'),
              ),
            ),
            Container(
              height: 50,
              margin: EdgeInsets.all(10),
              child: new TextField(
                controller: _priceController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(border: OutlineInputBorder(),labelText: 'Preço*'),
              ),
            ),
            Container(
              height: 50,
              margin: EdgeInsets.all(10),
              child: new TextField(
                controller: _timeController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(border: OutlineInputBorder(),labelText: 'Tempo'),
              ),
            ),
            Container(
              height: 50,
              margin: EdgeInsets.all(10),
              child: new TextField(
                controller: _weightController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(border: OutlineInputBorder(),labelText: 'Peso*'),
              ),
            ),
            Container(
              height: 50,
              margin: EdgeInsets.all(10),
              child: new TextField(
                controller: _colorController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(border: OutlineInputBorder(), labelText: 'Cor'),
              ),
            ),
            Container(
              height: 50,
              margin: EdgeInsets.all(10),
              child: new TextField(
                controller: _fontController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(border: OutlineInputBorder(), labelText: 'Fonte'),
              ),
            ),
            new Padding(padding: new EdgeInsets.only(top: 10.0)),
            Container(
              height: 150,
              margin: EdgeInsets.all(10),
              child: new TextField(
                controller: _descriptionController,
                keyboardType: TextInputType.text,
                maxLines: 8,
                decoration: InputDecoration(border: OutlineInputBorder(), labelText: 'Resumo*'),
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
                  debugPrint(_nameController.text.trim());
                  debugPrint(_priceController.text.trim());
                  debugPrint(_timeController.text.trim());
                  debugPrint(_weightController.text.trim());
                  debugPrint(_colorController.text.trim());
                  debugPrint(_fontController.text.trim());
                  debugPrint(_descriptionController.text.trim());
                  if (_nameController.text.isNotEmpty)
                  {
                    webService.addProduct(
                      _nameController.text.trim(),
                      _priceController.text.trim().replaceAll(",", "."),
                      _timeController.text.trim(),
                      _weightController.text.trim(),
                      _colorController.text.trim(),
                      _fontController.text.trim(),
                      _descriptionController.text.trim());
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