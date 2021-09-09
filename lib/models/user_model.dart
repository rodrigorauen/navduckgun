// a key ta nula pq antes do cadastro nao existe..no controller a gente vai fazer o uid virar a key

class UserModel {
  final String nome;
  final String? key;
  final String cpf;
  final String registro;

  UserModel({
    required this.nome,
    this.key,
    required this.cpf,
    required this.registro,
  });

  static UserModel fromMap(Map<String, dynamic> map) {
    return UserModel(
      nome: map['nome'],
      key: map['key'],
      cpf: map['cpf'],
      registro: map['registro'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'nome': nome,
      'key': key,
      'cpf': cpf,
      'registro': registro,
    };
  }
}