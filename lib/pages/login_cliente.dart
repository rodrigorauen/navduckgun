import 'package:duck_gun/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:validadores/validador.dart';

class LoginCliente extends StatefulWidget {
  @override
  _LoginClienteState createState() => _LoginClienteState();
}

class _LoginClienteState extends State<LoginCliente> {
  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final textStyles = Theme.of(context).textTheme;
    return Scaffold(
        // backgroundColor: Color(0xFFA8BFB2),
        appBar: AppBar( 
          backgroundColor: Color(0xFF4D734F),
          title: Text('DUCK GUN',
              style: GoogleFonts.pressStart2p(
                  textStyle: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w300,
                      letterSpacing: -1.5))),
        ),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Container(
            // color: Color(0xFFA8BFB2),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.all(20),
                    color: Colors.transparent,
                    child: CircleAvatar(
                      radius: 150,
                      backgroundColor: Color(0xFFA8BFB2),
                      child: CircleAvatar(
                        backgroundImage: AssetImage('images/pato2.png'),
                        backgroundColor: Colors.black,
                        radius: 140,
                      ),
                    ),
                  ),
                  SizedBox(height: 12),
                  Container(
                      //  color: Colors.green, 
                      padding: EdgeInsets.all(20),
                      child: Form(
                        key: _formkey,
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Text('Seja Bem-Vindo', style: textStyles.headline5, textAlign: TextAlign.center),
                              SizedBox(height: 12),
                              Row(
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: TextFormField(
                                      validator: (String? texto) {
                                        if (texto != null && texto.isNotEmpty) {
                                          if (texto.length < 2)
                                            return 'Digite seu nome';
                                        } else {
                                          return 'Campo Obrigatório';
                                        }
                                      },
                                      keyboardType: TextInputType.name,
                                      decoration: InputDecoration(
                                        labelText: 'Nome',
                                        border: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Colors.green,
                                            ),
                                        ),
                                        errorStyle: TextStyle(
                                            color: Colors.red.shade700),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 8),
                                ],
                              ),
                              SizedBox(height: 8),
                              TextFormField(
                                validator: (String? texto) {
                                  if (texto != null && texto.isNotEmpty) {
                                    if (!texto.contains('@') ||
                                        texto.length < 8 ||
                                        !texto.contains('.com'))
                                      return 'Digite um e-mail válido.';
                                  } else {
                                    return 'Campo Obrigatório';
                                  }
                                },
                                keyboardType: TextInputType.emailAddress,
                                decoration: InputDecoration(
                                  labelText: 'Email',
                                  border: OutlineInputBorder(),
                                  errorStyle:
                                      TextStyle(color: Colors.red.shade700),
                                ),
                              ),
                              SizedBox(height: 16),
                                                           
                              Padding(
                                  padding: EdgeInsets.only(top: 18),
                                  child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        primary:
                                            Color(0xFF4D734F), // background
                                        onPrimary:
                                            Color(0xFF0D0D0D), // foreground
                                      ),
                                      onPressed: () {
                                        if (_formkey.currentState?.validate() ??
                                            false) {
                                          Navigator.of(context).pushReplacement(
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      HomePage()));
                                          // print('Login feito!');
                                        }
                                      },
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 16.0),
                                        child: Text(
                                          'Login',
                                          style: TextStyle(fontSize: 25),
                                        ),
                                      )))
                            ]),
                      ))
                ]),
          ),
        ));
  }
}
