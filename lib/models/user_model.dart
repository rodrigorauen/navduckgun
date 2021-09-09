// a key ta nula pq antes do cadastro nao existe..no controller a gente vai fazer o uid virar a key

class UserModel {
  final String nome;
  final String? key;
  final String cpf;
  final String registro;
  final String endereco;
  final String numero;
  final String bairro;
  final String cidade;
  final String estado;
  final String cep;

  UserModel({
    required this.nome,
    this.key,
    required this.cpf,
    required this.registro,
    required this.endereco,
    required this.numero,
    required this.bairro,
    required this.cidade,
    required this.estado,
    required this.cep,
  });

  static UserModel fromMap(Map<String, dynamic> map) {
    return UserModel(
      nome: map['nome'],
      key: map['key'],
      cpf: map['cpf'],
      registro: map['registro'],
      endereco: map['endereco'],
      numero: map['numero'],
      bairro: map['bairro'],
      cidade: map['cidade'],
      estado: map['estado'],
      cep: map['cep'],

    );
  }

  Map<String, dynamic> toMap() {
    return {
      'nome': nome,
      'key': key,
      'cpf': cpf,
      'registro': registro,
      'endereco': endereco,
      'numero': numero,
      'bairro': bairro,
      'cidade': cidade,
      'estado': estado,
      'cep': cep,

    };
  }
}