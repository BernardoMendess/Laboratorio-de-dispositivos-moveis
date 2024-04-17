import 'dart:math';

import 'package:flutter/material.dart';

class Home extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return HomeState();
  }

}

class HomeState extends State<Home>{

  var random = Random();

  List<String> frases = [
    'A vida é uma jornada, não um destino.',
    'A beleza está nos olhos de quem vê.',
    'A ação fala mais alto que as palavras.',
    'A paciência é uma virtude.',
    'A prática leva à perfeição.',
    'O tempo cura todas as feridas.',
    'A verdade sempre prevalece.',
    'A sabedoria vem com a idade.',
    'A esperança é a última que morre.',
    'A felicidade é uma escolha.',
    'A humildade é a verdadeira chave para o sucesso.',
    'A simplicidade é a maior sofisticação.',
    'A gratidão é a memória do coração.',
    'A gentileza gera gentileza.',
    'A honestidade é a melhor política.',
    'A mudança é a única constante na vida.',
    'A perseverança é a mãe do sucesso.',
    'A educação é a chave para o futuro.',
    'A saúde é a maior riqueza.',
    'A amizade é um tesouro.',
    'A paz começa com um sorriso.',
    'A natureza é a melhor professora.',
    'A música é a linguagem universal da humanidade.',
    'A risada é o melhor remédio.',
    'A imaginação é mais importante que o conhecimento.',
    'A vida é cheia de surpresas.',
    'A fé move montanhas.',
    'A vida é o que fazemos dela.'
  ];


  @override
  Widget build(BuildContext context) { 
    return Container(
    decoration: BoxDecoration(
      border: Border.all(
        color: Colors.white,  // Cor da borda
        width: 4.0,         // Espessura da borda
      ),
    ), child: Scaffold(appBar: AppBar(
        title: Text("Frases Aleatórias", style: TextStyle(color: Colors.white),
        ),
        backgroundColor: (Colors.green),
    ),
    body: Center( child: Container(
      
decoration: BoxDecoration(),
      child: Column(children: [
        Image.asset("images/title.png", 
        width: 400,
        height: 400,),
        Padding(padding: EdgeInsets.all(20)),
        Text("Clique abaixo para gerar uma frase", style: TextStyle(fontSize: 20, color: Colors.orange),),
        Padding(padding: EdgeInsets.all(20)),
        Text(frases[random.nextInt(frases.length)], style: TextStyle(fontSize: 20),),
        Padding(padding: EdgeInsets.all(20)),
        ElevatedButton(onPressed: (){
          setState(() {

            });
        }, 
        child: Text("Clique aqui"),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Colors.green), // Cor do fundo
          foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
        ),),
      ],
      ),
      ),
      ),
    ),
    );
  }

}