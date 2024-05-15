import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget{
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();

}

class _HomeState extends State<Home>{
  String logradouro = "", bairro = "", cidade = "";
  TextEditingController cepController = TextEditingController();

  void getCep() async {
    String cep = cepController.text;
    String url = "https://viacep.com.br/ws/$cep/json/";
    http.Response response = await http.get(Uri.parse(url));

    print(response.body);
    Map<String, dynamic> ret = jsonDecode(response.body);
    logradouro = ret["logradouro"];
    bairro = ret["bairro"];
    cidade = ret["localidade"];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Via CEP")),
      body: Center(
        child: Column(
          children: [
            TextField(
              keyboardType: TextInputType.text,
              controller: cepController,
              decoration: InputDecoration(
                labelText: "Cep: "
                
              ),
            ),
            Text("Logradouro: ${logradouro}"),
            Text("Bairro: ${bairro}"),
            Text("Cidade: ${cidade}"),
            ElevatedButton(
              onPressed: getCep, 
              child: Text("Buscar"))
          ],
        ),
        ),
    );
  }
}