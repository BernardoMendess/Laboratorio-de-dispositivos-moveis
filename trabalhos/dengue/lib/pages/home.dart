import 'package:dengue/pages/futureHome.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String selectedDisease = 'dengue';
  String selectedState = '3304557';
  DateTime selectedDate = DateTime.now();
  int ewStart = 1;
  int ewEnd = 1;
  int eyStart = DateTime.now().year;
  int eyEnd = DateTime.now().year;

  final Map<String, String> stateCodes = {
    'Rio Branco - AC': '1200401',
    'Maceió - AL': '2704302',
    'Manaus - AM': '1302603',
    'Macapá - AP': '1600303',
    'Salvador - BA': '2927408',
    'Fortaleza - CE': '2304400',
    'Brasília - DF': '5300108',
    'Vitória - ES': '3205309',
    'Goiânia - GO': '5208707',
    'São Luís - MA': '2111300',
    'Belo Horizonte - MG': '3106200',
    'Campo Grande - MS': '5002704',
    'Cuiabá - MT': '5103403',
    'Belém - PA': '1501402',
    'João Pessoa - PB': '2507507',
    'Recife - PE': '2611606',
    'Teresina - PI': '2211001',
    'Curitiba - PR': '4106902',
    'Rio de Janeiro - RJ': '3304557',
    'Natal - RN': '2408102',
    'Porto Velho - RO': '1100205',
    'Boa Vista - RR': '1400100',
    'Porto Alegre - RS': '4314902',
    'Florianópolis - SC': '4205407',
    'Aracaju - SE': '2800308',
    'São Paulo - SP': '3550308',
    'Palmas - TO': '1721000',
  };

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Alerta Dengue')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: SizedBox(
                width: double.infinity,
                child: DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    labelText: 'Doença',
                    border: OutlineInputBorder(),
                  ),
                  value: selectedDisease,
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedDisease = newValue!;
                    });
                  },
                  items: <String>['dengue', 'chikungunya', 'zika']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: SizedBox(
                width: double.infinity,
                child: DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    labelText: 'Local',
                    border: OutlineInputBorder(),
                  ),
                  value: selectedState,
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedState = newValue!;
                    });
                  },
                  items: stateCodes.keys
                      .map<DropdownMenuItem<String>>((String key) {
                    return DropdownMenuItem<String>(
                      value: stateCodes[key],
                      child: Text(key),
                    );
                  }).toList(),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: SizedBox(
                width: double.infinity,
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'Semana Epidemiológica Início',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    setState(() {
                      ewStart = int.tryParse(value) ?? 1;
                    });
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: SizedBox(
                width: double.infinity,
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'Semana Epidemiológica Fim',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    setState(() {
                      ewEnd = int.tryParse(value) ?? 1;
                    });
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: SizedBox(
                width: double.infinity,
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'Ano de Início',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    setState(() {
                      eyStart = int.tryParse(value) ?? DateTime.now().year;
                    });
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: SizedBox(
                width: double.infinity,
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'Ano de Fim',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    setState(() {
                      eyEnd = int.tryParse(value) ?? DateTime.now().year;
                    });
                  },
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FutureHome(
                      disease: selectedDisease,
                      geocode: selectedState,
                      date: selectedDate,
                      ewStart: ewStart,
                      ewEnd: ewEnd,
                      eyStart: eyStart,
                      eyEnd: eyEnd,
                    ),
                  ),
                );
              },
              child: Text('Consultar'),
            ),
          ],
        ),
      ),
    );
  }
}