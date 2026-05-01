import 'package:flutter/material.dart';

class AdditionPage extends StatefulWidget {
  @override
  _AdditionPageState createState() => _AdditionPageState();
}

class _AdditionPageState extends State<AdditionPage> {
  TextEditingController ctrl1 = TextEditingController();
  TextEditingController ctrl2 = TextEditingController();

  double resultat = 0;

  void addition() {
    double a = double.parse(ctrl1.text);
    double b = double.parse(ctrl2.text);

    setState(() {
      resultat = a + b;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(controller: ctrl1),
        TextField(controller: ctrl2),
        ElevatedButton(
          onPressed: addition,
          child: Text("Additionner"),
        ),
        Text("Résultat: $resultat"),
      ],
    );
  }
}