import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diario_viagens/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

// enum = cria constantes /para gerir os estados do usuario - ver se esta logado, deslogado e carregando
enum AuthState { signed, unsigned, loading }

//crio uma classe para emitir mudancas no meu usercotroller
class UserController extends ChangeNotifier {
  //pra definir que vai comecar com o estado de carregando
  AuthState authState = AuthState.loading;

  //classe que tem mtas funcoes relacionadas a login
  final _auth = FirebaseAuth.instance;
  // importando a instancia do firestore pra poder usar
  final _db = FirebaseFirestore.instance;

  //to dizendo que toda vez que chamar o get ele vai retornar o usuario atual, se nao tiver logado - vai ser nulo
  User? get user => _auth.currentUser;

//preciso de algo que fique cuidando (ouvindo) se o usuario esta logado, deslogado, para isso criamos um construtor vazio -
// funcao de escuta, o listen recebe a funcao e vai fazer algo emitido pela funcao authchanges, esse user vai me dizer se tem
// usuario logado ou nao, só que ele nao vai ter valor assim q inicia. Aqui dentro posso ver se o email é valido tbm..
  UserController() {
    _auth.authStateChanges().listen((user) {
      if (user != null) {
        authState = AuthState.signed;
      } else {
        authState = AuthState.unsigned;
      }
      //para informar a mudanca
      notifyListeners();
    });
  }

//crio uma funcao para fazer o login, como ela é uma ação futura, coloco o await que obriga a funcao a ser assicrona - por isso o async
  Future<void> login(String email, String senha) async {
    await _auth.signInWithEmailAndPassword(
      email: email,
      password: senha,
    );
  }

  //crio uma funcao logout, que nao retorna nada, vai ser assincrona, pq ela vai esperar - pra voltar a pagina de login
  Future<void> logout() async {
    await _auth.signOut();
  }

  //crio a funcao de signup - para quando o usuario se cadastrar ele ja passar as coisas para o autentication e firestore.
  //passo um map - esse payload vai me trazer as outras informacoes (endereco, telefone..). o credentials vai ter a chave key,
  // essa funcao vai tentar criar o usuario, dando certo ela retorna a key.
  Future<void> signup(
      String email,
      String senha,
      UserModel payload,
      // o UserModel na linha de cima substitui o parenteses na linha abaixo
      // no caso de ser dado simples.. ler o que escrevi no user_model (Map<String, dynamic> payload,
      // depois ver pagina do signup - tem uma linha comentada
      ) async {
    final credentials = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: senha);
    // até aqui vai salvar no autentication. O professor vai passar nas proximas aulas o comando para salvar os campos no firestore.
    // a chave key vai receber o uid:

    // o uid vai ser criado
    final uid = credentials.user?.uid;
    //data vai receber o map com as informcoes extras, no caso nome
    final data = payload.toMap();
    // a key recebe o user uid
    data['key'] = uid;
    //crio um doc, na colecao de usuarios usando a colcao com o uid
    final doc = _db.collection('usuarios').doc(uid);
    //pra mandar pro firebase
    await doc.set(data);

  }
}
