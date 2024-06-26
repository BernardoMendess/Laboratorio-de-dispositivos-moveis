import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:navegacao/pages/arguments.dart';
import 'package:navegacao/pages/tela3.dart';

class Tela2 extends StatefulWidget{
  String name = "";
  static const String routeName = "/tela2";

  Tela2();

  Tela2.name(this.name);

  @override
  State<Tela2> createState() => _Tela2State();

}

class _Tela2State extends State<Tela2>{
  @override
  Widget build(BuildContext context){
    Arguments args = ModalRoute.of(context)!.settings.arguments as Arguments;
    return Scaffold(
          appBar: AppBar(title: Text("Tela 2"),
          backgroundColor: Colors.red),
          body: Center(
            child: Container(
              child: Column(
                children: [
                  Text(args.name, style: TextStyle(fontSize: 20),),

                  ElevatedButton(onPressed: (){
                  Navigator.push(context, 
                  MaterialPageRoute(
                    builder: (context) => Tela3.name(widget.name)));
              },  
                  child: Text("Próximo"))
                ],
              ),
            ),
          ),
        );  
  }
}