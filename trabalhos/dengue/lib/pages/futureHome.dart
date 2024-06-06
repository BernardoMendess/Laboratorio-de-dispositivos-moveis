import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class FutureHome extends StatelessWidget {
  final String disease;
  final String geocode;
  final DateTime date;
  final int ewStart;
  final int ewEnd;
  final int eyStart;
  final int eyEnd;

  FutureHome({
    required this.disease,
    required this.geocode,
    required this.date,
    required this.ewStart,
    required this.ewEnd,
    required this.eyStart,
    required this.eyEnd,
  });

  Future<List<dynamic>> fetchData() async {
    final response = await http.get(
      Uri.parse(
          'https://info.dengue.mat.br/api/alertcity?geocode=$geocode&disease=$disease&format=json&ew_start=$ewStart&ew_end=$ewEnd&ey_start=$eyStart&ey_end=$eyEnd'),
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Resultados')),
      body: FutureBuilder<List<dynamic>>(
        future: fetchData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            final data = snapshot.data!;
            return ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                final item = data[index];
                return ListTile(
                  title: Text('Semana ${index + 1}'),
                  subtitle: Text(
                      'Casos Previstos: ${item['casos_est']}\nCasos notificados: ${item['casos']}\nNivel: ${item['nivel']}\nTemperatura: ${item['tempmin']} - ${item['tempmax']}'),
                );
              },
            );
          }
        },
      ),
    );
  }
}
