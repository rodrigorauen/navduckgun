import 'package:duck_gun/models/user_model.dart';
import 'package:flutter/material.dart';
import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';

class Perfil extends StatefulWidget {
  //final UserModel dados;

 // Perfil({required this.dados});

  @override
  _PerfilState createState() => _PerfilState();

}

 class _PerfilState extends State<Perfil> {
//   late final nomeCont = TextEditingController()..text = widget.dados.nome;
//   late final cpfCont = TextEditingController()..text = widget.dados.cpf;
//   //late Uint8List? file = widget.dados.imagem;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Editar perfil"),
//         actions: [
//           IconButton(
//             onPressed: () async {
//               await FirebaseFirestore.instance
//                   .collection('usuarios')
//                   .doc(widget.dados.key)
//                   .delete();
//               Navigator.pop(context);
//             },
//             icon: Icon(Icons.delete),
//           ),
//         ],
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: EdgeInsets.symmetric(horizontal: 8),
//           child: Column(
//             children: [
//               TextField(
//                 controller: nomeCont,
//                 decoration: InputDecoration(
//                   labelText: "Nome Completo",
//                 ),
//               ),
//               TextField(
//                 controller: cpfCont,
//                 decoration: InputDecoration(
//                   suffixIcon: Icon(Icons.location_on),
//                   labelText: "cpf",
//                 ),
//               ),
//               const SizedBox(height: 8),
//               // ElevatedButton(
//               //   onPressed: () async {
//               //     final result =
//               //     await FilePicker.platform.pickFiles(type: FileType.image);
//               //
//               //     if (result != null) {
//               //       setState(() {
//               //         final bytes = result.files.first.bytes;
//               //         file = bytes;
//               //       });
//               //     }
//               //   },
//               //   child: Row(
//               //     children: [
//               //       Icon(file != null ? Icons.check : Icons.upload),
//               //       Text("Adicionar imagem"),
//               //     ],
//               //   ),
//               // ),
//               //const SizedBox(height: 8),
//               OutlinedButton(
//                 onPressed: () async {
//                   final atualizado = UserModel(
//                     ownerKey: widget.dados.ownerKey,
//                     titulo: nomeCont.text,
//                     cpf: cpfCont.text,
//                     //imagem: file,
//                   ).toMap();
//
//                   await FirebaseFirestore.instance
//                       .collection('usuarios')
//                       .doc(widget.dados.key)
//                       .update(atualizado);
//
//                   Navigator.pop(context);
//                 },
//                 child: Text("Atualizar dados"),
//               )
//             ],
//           ),
//         ),
      ),
    );
  }
}