import 'package:duck_gun/pages/signup.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'controllers/user_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginCliente extends StatefulWidget {
  @override
  _LoginClienteState createState() => _LoginClienteState();
}

class _LoginClienteState extends State<LoginCliente> {
  String email = "";
  String senha = "";

  late final userController =
      Provider.of<UserController>(context, listen: false);

  @override
  Widget build(BuildContext context) {
    final textStyles = Theme.of(context).textTheme;
    return Scaffold(
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.all(20),
                color: Colors.transparent,
                child: CircleAvatar(
                  radius: 110,
                  backgroundColor: Color(0xFFA8BFB2),
                  child: CircleAvatar(
                    backgroundImage: AssetImage('images/pato2.png'),
                    backgroundColor: Colors.black,
                    radius: 100,
                  ),
                ),
              ),
              // SizedBox(height: 12),
              Container(
                //  color: Colors.green,
                padding: EdgeInsets.all(10),
                child: Form(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text('Seja Bem-Vindo',
                          style: textStyles.headline5,
                          textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 12),
                      TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          labelText: 'Email',
                          border: OutlineInputBorder(),
                        ),
                        onChanged: (texto) => email = texto,
                      ),
                      SizedBox(height: 8),
                      SizedBox(height: 8),
                      TextFormField(
                        obscureText: true,
                        onChanged: (texto) => senha = texto,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: 'Senha',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(height: 10),
                      Padding(
                        padding: EdgeInsets.only(top: 10),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Color(0xFF4D734F), // background
                            onPrimary: Color(0xFF0D0D0D), // foreground
                          ),
                          onPressed: () async {
                            await userController.login(email, senha);
                          },
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 16.0),
                            child: Text(
                              'Login',
                              style: TextStyle(fontSize: 25),
                            ),
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Text('Se deseja criar conta,', style: TextStyle(
                            color: Color(0xFF4D734F),
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),),
                          Container(
                            margin: EdgeInsets.symmetric(
                              vertical: 10,
                            ),
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => SignupPage(),
                                  ),
                                );
                              },
                              child: Text(" CLIQUE AQUI!", style: TextStyle(
                                color: Color(0xFF4D734F),
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
