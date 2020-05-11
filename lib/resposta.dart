import 'package:flutter/material.dart';

class Resposta extends StatelessWidget {
  final String texto;
  final void Function() onSelected;

  Resposta(this.texto, this.onSelected);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
      child: RaisedButton(
        textColor: Colors.white,
        color: Colors.blue,
        child: Text(
          this.texto,
          style: TextStyle(fontSize: 18),
        ),
        onPressed: onSelected,
      ),
    );
  }
}
