import 'package:duck_gun/pages/controllers/filter_controller.dart';
import 'package:flutter/material.dart';

class FilterWidget extends StatefulWidget {
  @override
  _FilterWidgetState createState() => _FilterWidgetState();
}

class _FilterWidgetState extends State<FilterWidget> {
  @override
  Widget build(BuildContext context) {
    var deviceData = MediaQuery.of(context).size;
    double caixaFiltros = deviceData.width / 2.2;
    return Container(
      width: deviceData.width,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // Categoria
              Container(
                width: caixaFiltros,
                child: DropdownButton<String>(
                  isExpanded: true,
                  value: filterController.dropdownValue1,
                  icon: Icon(
                    Icons.military_tech_outlined,
                    color: Colors.green,
                  ),
                  iconSize: 26,
                  elevation: 16,
                  underline: Container(
                    height: 2,
                    color: Colors.black,
                  ),
                  onChanged: (String? newValue) {
                    setState(() {
                      filterController.categorias(newValue!);
                    });
                  },
                  items: <String>[
                    'Fuzil',
                    'Pistola',
                    'Aéreo',
                    'Tanque',
                    'Granadas',
                    'Diversos',
                  ].map<DropdownMenuItem<String>>(
                    (String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    },
                  ).toList(),
                ),
              ),
              // Preço
              Container(
                width: caixaFiltros,
                child: DropdownButton<String>(
                  isExpanded: true,
                  value: filterController.dropdownValue2,
                  icon: const Icon(
                    Icons.military_tech_outlined,
                    color: Colors.green,
                  ),
                  iconSize: 26,
                  elevation: 16,
                  style: TextStyle(color: Color(0xFF36402C)),
                  underline: Container(
                    height: 2,
                    color: Colors.black,
                  ),
                  onChanged: (String? newValue) {
                    setState(() {
                      filterController.filtrar(newValue!);
                    });
                  },
                  items: <String>[
                    'produto',
                    'preco',
                  ].map<DropdownMenuItem<String>>(
                    (String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    },
                  ).toList(),
                ),
              ),
            ],
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: (deviceData.width - 40.0),
                  height: 30,
                  child: TextField(
                    onChanged: (text) {
                      setState(() {
                        filterController.search(text);
                      });
                    },
                    decoration: InputDecoration(
                      labelText: 'Buscar',
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      hintStyle: TextStyle(color: Color(0xFFA8BFB2)),
                      suffixIcon: IconButton(
                        icon: Icon(
                          Icons.saved_search,
                          color: Colors.green,
                        ),
                        onPressed: () {},
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
