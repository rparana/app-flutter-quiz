import 'package:flutter/material.dart';
import './resultado.dart';
import './questionario.dart';

main() {
  runApp(PerguntaApp());
}

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;
  var _pontuacaoTotal = 0;
  final _perguntas = const [
    {
      'texto': 'Qual é a sua cor Favorita?',
      'resposta': [
        {'texto': 'Preto', 'pontuacao': 5},
        {'texto': 'Vermelho', 'pontuacao': 3},
        {'texto': 'Laranja', 'pontuacao': 10},
        {'texto': 'Verde', 'pontuacao': 7},
      ],
    },
    {
      'texto': 'Qual é o seu Animal Favorito?',
      'resposta': [
        {'texto': 'Gato', 'pontuacao': 7},
        {'texto': 'Cachorro', 'pontuacao': 10},
        {'texto': 'Coelho', 'pontuacao': 5},
        {'texto': 'Passarinho', 'pontuacao': 3},
      ],
    },
    {
      'texto': 'Qual é o seu Professor Favorito?',
      'resposta': [
        {'texto': 'Rafael', 'pontuacao': 10},
        {'texto': 'Leonardo', 'pontuacao': 3},
        {'texto': 'Bruno', 'pontuacao': 7},
        {'texto': 'Felipe', 'pontuacao': 5},
      ],
    }
  ];

  void _responder(int pontos) {
    if (temPerguntaSelecionada) {
      setState(() {
        _perguntaSelecionada++;
        _pontuacaoTotal += pontos;
      });
    }
    print(_pontuacaoTotal);
  }

  void _reiniciarQuestionario() {
    setState(() {
      _perguntaSelecionada = 0;
      _pontuacaoTotal = 0;
    });
  }

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Quiz'),
          centerTitle: true,
        ),
        body: temPerguntaSelecionada
            ? Questionario(
                perguntaSelecionada: _perguntaSelecionada,
                perguntas: _perguntas,
                responder: _responder,
              )
            : Resultado(_pontuacaoTotal, _reiniciarQuestionario),
      ),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _PerguntaAppState();
  }
}
