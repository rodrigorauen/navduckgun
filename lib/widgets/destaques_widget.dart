import 'package:carousel_slider/carousel_slider.dart';
import 'package:duck_gun/models/produto_model.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class PromoPage extends StatefulWidget {
  @override
  _PromoPageState createState() => _PromoPageState();
}

class _PromoPageState extends State<PromoPage> {
  final estiloTextoPromo = TextStyle(
    color: Colors.green,
    fontWeight: FontWeight.bold,
    letterSpacing: 1.0,
    fontSize: 18,
  );
  final estiloTexto =
      TextStyle(color: Colors.black, letterSpacing: 1.0, fontSize: 18);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
      stream: FirebaseFirestore.instance
          .collection('produtos')
          .where('promocao', isEqualTo: true)
          .snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        final promo = snapshot.data!.docs.map((map) {
          final data = map.data();
          return ProdutoModel.fromMap(data, map.id);
        }).toList();
        return CarouselSlider.builder(
          options: CarouselOptions(
            aspectRatio: 9 / 3,
            autoPlay: true,
          ),
          itemCount: promo.length,
          itemBuilder: (context, index, pageIndex) {
            final item = promo[index];
            return item.imagem != null
                ? Container(
                    width: 500,
                    height: 300,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: MemoryImage(item.imagem!),
                            fit: BoxFit.fill)),
                    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          child: Text(
                            item.produto,
                            style: estiloTexto,
                          ),
                        ),
                        Container(
                          child: Text(
                            'R\$${item.preco}',
                            style: estiloTexto,
                          ),
                        ),
                        Container(
                          child: Text(
                            item.categoria,
                            style: estiloTexto,
                          ),
                        ),
                      ],
                    ),
                  )
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        child: Text(
                          item.produto,
                          style: estiloTexto,
                        ),
                      ),
                      Container(
                        child: Text(
                          'R\$${item.preco}',
                          style: estiloTexto,
                        ),
                      ),
                      Container(
                        child: Text(
                          item.categoria,
                          style: estiloTexto,
                        ),
                      ),
                    ],
                  );
          },
        );
      },
    );
  }
}
