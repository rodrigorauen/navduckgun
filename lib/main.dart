import 'package:duck_gun/pages/cadastro_cliente.dart';
import 'package:duck_gun/pages/login_cliente.dart';
import 'package:duck_gun/pages/splash_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      title: 'Duck Gun',
      theme: ThemeData(
        // primaryColor: Color(0xFFA8BFB2),
        accentColor: Color(0xFF4D734F),
        appBarTheme: AppBarTheme(backgroundColor: Color(0x36402C)),
      ),
      // #A8BFB2 - verde mais clarinho
      // #6C8C74 - verde musgo
      // #4D734F- verde militar
      // #36402C- verde acinzentado 
      // #0D0D0D- preto



      // home: CadastroCliente(),
      // home: CadastroVendedor(),
      home: SplashPage(),
      // home: LoginCliente(),
      // home: LoginVendedor(),
      debugShowCheckedModeBanner: false,
    );
  }
}
