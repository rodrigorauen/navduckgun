import 'package:duck_gun/widgets/destaques_widget.dart';
import 'package:duck_gun/widgets/display_prod.dart';
import 'package:duck_gun/widgets/filter.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final estiloTextoPromo = TextStyle(
    color: Colors.green,
    fontWeight: FontWeight.bold,
    letterSpacing: 1.0,
    fontSize: 18,
  );
  final estiloTexto =
      TextStyle(color: Colors.black, letterSpacing: 1.0, fontSize: 18);
  final estiloTitle =
      TextStyle(color: Colors.black, letterSpacing: 1.5, fontSize: 25);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(child: FilterWidget()),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                      child: Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    child: Text(
                      'Itens em destaque',
                      style: estiloTitle,
                    ),
                  )),
                  PromoPage(),
                ],
              ),
              Container(child: DisplayWidget()),
            ],
          ),
        ],
      ),
    );
  }
}
