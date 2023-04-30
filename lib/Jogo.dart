import 'dart:math';

import 'package:flutter/material.dart';

class Jogo extends StatefulWidget {
  const Jogo({Key? key}) : super(key: key);

  @override
  State<Jogo> createState() => _JogoState();
}

class _JogoState extends State<Jogo> {
  var imagemApp = AssetImage("images/padrao.png");
  var opcoesUsuario = ["pedra", "papel", "tesoura"];
  var fraseResultado = "Escolha uma opção abaixo";

  void pedraPapelTesoura(String opcao) {
    var valorApp = Random().nextInt(opcoesUsuario.length);
    var opcaoApp = opcoesUsuario[valorApp];
    setState(() {
      imagemApp = AssetImage("images/$opcaoApp.png");
      if ((opcao == "pedra" && opcaoApp == "tesoura") ||
          (opcao == "tesoura" && opcaoApp == "papel") ||
          (opcao == "papel" && opcaoApp == "pedra")) {
        fraseResultado = "Você é o vencedor :)";
      } else if (opcao == opcaoApp) {
        fraseResultado = "Ninguém venceu !";
      } else {
        fraseResultado = "Você é o perdedor :(";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Jokenpo"),
        backgroundColor: Colors.black,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              "Escolha do App",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
          Image(image: imagemApp),
          Padding(
            padding: const EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              fraseResultado,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () => pedraPapelTesoura("pedra"),
                child: Image.asset(
                  "images/pedra.png",
                  height: 100,
                ),
              ),
              GestureDetector(
                onTap: () => pedraPapelTesoura("papel"),
                child: Image.asset(
                  "images/papel.png",
                  height: 100,
                ),
              ),
              GestureDetector(
                onTap: () => pedraPapelTesoura("tesoura"),
                child: Image.asset(
                  "images/tesoura.png",
                  height: 100,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
