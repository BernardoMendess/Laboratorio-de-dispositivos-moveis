import 'package:flutter/material.dart';
import 'dart:math';

class Game extends StatefulWidget {
  final String dados;
  final String radio1;
  final String simbolo;

  Game({required this.dados, required this.radio1, required this.simbolo});

  @override
  State<StatefulWidget> createState() {
    return GameState();
  }
}

class GameState extends State<Game> {
  var random = Random();

  String jogador = "";
  String maquina = "";
  String jogadorAtual = "";
  late int tamanho;
  late bool terminou;
  late List<String> ocupado;

  @override
  void initState() {
    iniciarJogo();
    super.initState();
  }

  void iniciarJogo() {
    if (widget.simbolo == "X") {
      jogador = "X";
      maquina = "O";
    } else {
      jogador = "O";
      maquina = "X";
    }
    jogadorAtual = jogador;
    terminou = false;
    int? radio1Int = int.tryParse(widget.radio1);
    tamanho = radio1Int ?? 3;
    ocupado = List<String>.filled(tamanho * tamanho, "");
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.white,
          width: 4.0,
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Jogo da Velha",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.black,
        ),
        body: Center(
          child: Container(
            height: MediaQuery.of(context).size.height / 2,
            width: MediaQuery.of(context).size.width / 2,
            margin: const EdgeInsets.all(8),
            decoration: BoxDecoration(),
            child: Column(
              children: [
                Expanded(
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: tamanho,
                    ),
                    itemCount: tamanho * tamanho,
                    itemBuilder: (context, int index) {
                      return InkWell(
                        onTap: () {
                          if (terminou || ocupado[index].isNotEmpty) {
                            return;
                          }

                          setState(() {
                            ocupado[index] = jogadorAtual;
                            jogadorAtual = jogadorAtual == jogador ? maquina : jogador;
                            checarVencedor();
                            if (!terminou && jogadorAtual == maquina) {
                              jogadaComputador();
                            }
                          });
                        },
                        child: Container(
                          color: Colors.black,
                          margin: EdgeInsets.all(4),
                          child: Center(
                            child: Text(
                              ocupado[index],
                              style: TextStyle(fontSize: 50, color: Colors.white),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                terminou
                    ? ElevatedButton(
                        onPressed: () {
                          setState(() {
                            iniciarJogo();
                          });
                        },
                        child: Text('Reiniciar'),
                      )
                    : Container(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void checarVencedor() {
    bool venceu = false;
    // Verifica linhas
    for (int i = 0; i < tamanho; i++) {
      int contador = 0;
      for (int j = 0; j < tamanho; j++) {
        if (ocupado[i * tamanho + j] == jogadorAtual) {
          contador++;
        }
      }
      if (contador == tamanho) {
        venceu = true;
        mostrarResultado();
        return;
      }
    }

    // Verifica colunas
    for (int i = 0; i < tamanho; i++) {
      int contador = 0;
      for (int j = 0; j < tamanho; j++) {
        if (ocupado[j * tamanho + i] == jogadorAtual) {
          contador++;
        }
      }
      if (contador == tamanho) {
        venceu = true;
        mostrarResultado();
        return;
      }
    }

    // Verifica diagonal principal
    int contadorDiagonalPrincipal = 0;
    for (int i = 0; i < tamanho; i++) {
      if (ocupado[i * tamanho + i] == jogadorAtual) {
        contadorDiagonalPrincipal++;
      }
    }
    if (contadorDiagonalPrincipal == tamanho) {
      venceu = true;
      mostrarResultado();
      return;
    }

    // Verifica diagonal secundária
    int contadorDiagonalSecundaria = 0;
    for (int i = 0; i < tamanho; i++) {
      if (ocupado[i * tamanho + (tamanho - 1 - i)] == jogadorAtual) {
        contadorDiagonalSecundaria++;
      }
    }
    if (contadorDiagonalSecundaria == tamanho) {
      venceu = true;
      mostrarResultado();
      return;
    }

    // Verifica empate
    if (!ocupado.contains('') && venceu == false) {
      mostrarEmpate();
      return;
    }
  }

  void mostrarResultado() {
    String mensagem =
        jogadorAtual == jogador ? "Jogador ${widget.dados} venceu!" : "Computador venceu!";
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(mensagem)));
    terminou = true;
  }

  void mostrarEmpate() {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Empate!")));
    terminou = true;
  }

  void jogadaComputador() {
    int indiceAleatorio = random.nextInt(tamanho * tamanho);
    while (ocupado[indiceAleatorio].isNotEmpty) {
      indiceAleatorio = random.nextInt(tamanho * tamanho);
    }
    setState(() {
      
      ocupado[indiceAleatorio] = jogadorAtual;
      jogadorAtual = jogadorAtual == jogador ? maquina : jogador;
      checarVencedor();
    });
  }
}
