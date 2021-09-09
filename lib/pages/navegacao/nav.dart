import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import 'package:duck_gun/pages/controllers/user_controller.dart';
import 'package:duck_gun/pages/navegacao/perfil.dart';
import 'package:duck_gun/pages/navegacao/produtos.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import '../my_flutter_app_icons.dart';
import 'historico.dart';

class Nav extends StatefulWidget {
  const Nav({Key? key}) : super(key: key);

  @override
  _NavState createState() => _NavState();
}

class _NavState extends State<Nav> {
  late final userController = Provider.of<UserController>(
    context,
    listen: false,
  );

  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    Historico(),
    Perfil(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color(0xFFA8BFB2),
      appBar: AppBar(
        backgroundColor: Color(0xFF4D734F),
        centerTitle: true,
        title: Text('Duck Gun'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.shopping_cart,
              size: 28,
            ),
          ),
        ],
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        backgroundColor: Color(0xFF4D734F),
        selectedItemColor: Color(0xFFFFFFFF),
        unselectedItemColor: Color(0xFF0D0D0D),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              MyFlutterApp.mp5,
              size: 35,
            ),
            label: 'Produtos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history, size: 35),
            label: 'Histórico',
          ),
          BottomNavigationBarItem(
            icon: Icon(Ionicons.person_circle_outline, size: 35),
            label: 'Perfil',
          ),
        ],
      ),
    );
  }
}
