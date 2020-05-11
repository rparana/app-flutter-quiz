import 'package:flutter/material.dart';
import './questao.dart';
import './resposta.dart';

class Questionario extends StatelessWidget {
  final int perguntaSelecionada;
  final void Function(int) responder;

  final List<Map<String, Object>> perguntas;

  Questionario({
    @required this.perguntaSelecionada,
    @required this.perguntas,
    @required this.responder,
  });

  bool get temPerguntaSelecionada {
    return this.perguntaSelecionada < this.perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, Object>> respostas = this.temPerguntaSelecionada
        ? this.perguntas[this.perguntaSelecionada]['resposta']
        : null;
    return Column(
      children: <Widget>[
        Questao(this.perguntas[this.perguntaSelecionada]['texto']),
        ...respostas
            .map((resp) => Resposta(
                  resp['texto'],
                  () => this.responder(resp['pontuacao']),
                ))
            .toList(),
      ],
    );
  }
}
