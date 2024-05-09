import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jogo_da_velha/pages/game.dart';

class Home extends StatefulWidget{
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();

}

class _HomeState extends State<Home>{

  TextEditingController nomeController = TextEditingController();
  String dados = "";
  String? radio1 = "";
  String? simbolo = "";

  void _save() {
  print("Save: ${nomeController.text}");
  dados = nomeController.text;
}

void _jogar() {
  _save(); // Salva o nome antes de navegar para a próxima tela
  if (dados.isNotEmpty && radio1 != null) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Game(dados: dados, radio1: radio1!, simbolo: simbolo!),
      ),
    );
  } else {
    // Trate o caso em que dados ou radio1 são nulos ou vazios
  }
}


  @override
  Widget build(BuildContext context) { 
    return Container(
    decoration: BoxDecoration(
      border: Border.all(
        color: Colors.white,  // Cor da borda
        width: 4.0,         // Espessura da borda
      ),
    ), child: Scaffold(appBar: AppBar(
        title: Text("Jogo da Velha", style: TextStyle(color: Colors.white),
        ),
        backgroundColor: (Colors.black),
    ),
    body: Center( child: Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          TextField(
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              labelText: "Digite o nome: ",
              labelStyle: TextStyle(fontSize: 30)
            ),
            enabled: true,
            maxLength: 20,
            maxLengthEnforcement: MaxLengthEnforcement.none,
            style: TextStyle(
              fontSize: 20
            ),
            obscureText: false,
            onChanged: (String value) {
              print("OnChanged: $value");
            },
            controller: nomeController,
          ),
          
          
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
          Radio(
            value: "3",
            groupValue: radio1,
            onChanged: (String? value){
              print("Radio: $value");
              radio1 = value;
              setState(() {
                
              });
            }),
            Text("3X3"),
  
          Radio(
            value: "4",
            groupValue: radio1,
            onChanged: (String? value) {
              print("Radio: $value");
              radio1 = value;
              setState(() {
                
              });
            }),
            Text("4X4"),
            ],
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Radio(
                value: "O",
                groupValue: simbolo,
                onChanged: (String? value) {
                  print("Radio: $value");
                  simbolo = value;
                  setState(() {
                    
                  });
                }),
              Text("O"),

              Radio(
                value: "X",
                groupValue: simbolo,
                onChanged: (String? value) {
                  print("Radio: $value");
                  simbolo = value;
                  setState(() {
                    
                  });
                }),
              Text("X"),
        ],),

          ElevatedButton(
            onPressed: _jogar, 
            child: Text("Jogar"),
            style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Colors.black), // Cor do fundo
          foregroundColor: MaterialStateProperty.all<Color>(Colors.white),),
            ),
          ],
      ),
      ),
      ),
    ),
    );
  }

}