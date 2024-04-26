import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Home extends StatefulWidget{
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();

}

class _HomeState extends State<Home>{

  TextEditingController nomeController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  String dados = "";
  bool? checkbox1 = false;
  bool? checkbox2 = false;
  String? radio1 = "";
  bool switch1 = false;
  double slider1 = 5;
  String _label = "";

  void _save(){
    print("Save: ${nomeController.text}, ${emailController.text}");
    dados = nomeController.text + " , " + emailController.text;
    setState(() {
      
    });
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
        title: Text("Inputs", style: TextStyle(color: Colors.white),
        ),
        backgroundColor: (Colors.black),
    ),
    body: Center( child: Container(
      
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Slider(
            divisions: 10,
            label: _label,
            min: 0, 
            max: 10,
            value: slider1,
            activeColor: Colors.black,
            inactiveColor: Colors.grey,
            onChanged: (double value) {
              print("Value: $value");
              slider1 = value;
              _label = "Valor selecionado: " + value.toString();
              setState(() {
                
              });
            },
            ),

          TextField(
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              labelText: "Digite o nome: ",
              labelStyle: TextStyle(fontSize: 40)
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
            onSubmitted: (String value) {
              print("On submitted: $value");
            },
            controller: nomeController,
          ),
          
          TextField(
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              labelText: "Digite o email: ",
              labelStyle: TextStyle(
                fontSize: 40
              ),
            ),
            style: TextStyle(
              fontSize: 20
            ),
            controller: emailController,
          ),

          Text("Dados Salvos: $dados",
            style: TextStyle(fontSize: 40),
          ),

          CheckboxListTile(
            title: Text("Churrasco"),
            subtitle: Text("carne"),
            activeColor: Colors.black,
            selected: true,
            value: checkbox1,
            secondary: Icon(Icons.add_call),
            onChanged: (bool? value) {
              print("Checkbox1: $value");
              checkbox1 = value;
              setState(() {
                
              });
            }
          ),

          CheckboxListTile(
            title: Text("Churrasco"),
            subtitle: Text("frango"),
            activeColor: Colors.black,
            selected: true,
            value: checkbox2,
            secondary: Icon(Icons.add_call),
            onChanged: (bool? value) {
              print("Checkbox2: $value");
              checkbox2 = value;
              setState(() {
                
              });
            }
          ),

          RadioListTile(
            title: Text("Feminino"),
            value: "f",
            groupValue: radio1,
            onChanged: (String? value){
              print("Radio: $value");
              radio1 = value;
              setState(() {
                
              });
            }),
  

          RadioListTile(
            title: Text("Masculino"),
            value: "m",
            groupValue: radio1,
            onChanged: (String? value) {
              print("Radio: $value");
              radio1 = value;
              setState(() {
                
              });
            }),

          SwitchListTile(
            title: Text("Churrasco"),
            subtitle: Text("frango"),
            activeColor: Colors.black,
            selected: true,
            value: switch1,
            onChanged: (bool value) {
              print("Switch: $value");
              switch1 = value;
              setState(() {
                
              });
            }
          ),

          ElevatedButton(
            onPressed: _save, child: Text("Salvar")
            ),

          ],
      ),
      ),
      ),
    ),
    );
  }

}