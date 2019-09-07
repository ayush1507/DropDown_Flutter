import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<DropdownMenuItem<String>> _dropDownMenuItems;
  List _pokemon = ["Pikachu", "Eevee", "Ditto", "Charizard", "Squirtle"];
  String _selectedpokemon;

  @override
  void initState() {
    _dropDownMenuItems = buildAndGetDropDownMenuItems(_pokemon);
   _selectedpokemon = _dropDownMenuItems[0].value;
    super.initState();
  }

  List<DropdownMenuItem<String>> buildAndGetDropDownMenuItems(List pokemons) {
    List<DropdownMenuItem<String>> items = List();
    for (String pokemon in pokemons) {
      items.add(DropdownMenuItem(value: pokemon, child: Text(pokemon)));
    }
    return items;
  }

  void changedDropDownItem(String selectedPokemon) {
    setState(() {
     _selectedpokemon = selectedPokemon;
    });
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('DropDown Button Flutter'),
        ),
        body: Container(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("Select One"),
                DropdownButton(items: _dropDownMenuItems, value:_selectedpokemon,
                  onChanged:changedDropDownItem,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}

