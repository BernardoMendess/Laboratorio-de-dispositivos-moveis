import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:navegacao/pages/arguments.dart';
import 'package:navegacao/pages/tela2.dart';

class Home extends StatefulWidget{
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();

}

class _HomeState extends State<Home>{
  TextEditingController nomeController = TextEditingController();


  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text("Home"),
        backgroundColor: Colors.blue,),
        body: Center(
        child: Container(
          child: Column(
            children: [

              TextField(
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: "Nome: "
                ),
                style: TextStyle(fontSize: 20),
                controller: nomeController
              ),

              ElevatedButton(onPressed: (){
                  //Navigator.push(context, 
                  //MaterialPageRoute(
                  //  builder: (context) => Tela2.name(nomeController.text)));
                  Navigator.pushNamed(context, 
                  Tela2.routeName, 
                  arguments: Arguments(nomeController.text));
              }, 
              child: Text("Próximo"))
            ],
          ),
        ),
      ),
    );
  }
}