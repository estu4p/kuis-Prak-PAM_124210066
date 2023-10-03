import 'package:flutter/material.dart';
import 'package:kuis_124210066/pokemon_data.dart';
import 'package:kuis_124210066/search_button.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key, required this.poke});

  final PokemonData poke;

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  List<bool> _isSelected = [false];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.poke.name),
        backgroundColor: Colors.red,
        elevation: 0,
        actions: [
          ToggleButtons(
            borderWidth: 0,
            onPressed: (int index) {
              String text = "";
              setState(() {
                _isSelected[index] = !_isSelected[index];
              });
              if (_isSelected[index]) {
                text = "Berhasil menambahkan ke favorit";
              } else {
                text = "Berhasil menghapus dari favorit";
              }
              SnackBar snackBar = SnackBar(
                backgroundColor:
                    (_isSelected[index]) ? Colors.green : Colors.red,
                content: Text(text),
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            },
            isSelected: _isSelected,
            selectedColor: Colors.white,
            children: const [
              Icon(Icons.favorite),
            ],
          ),
        ],
      ),
      body: SearchButton(
        pokeUrl: widget.poke.wikiUrl,
        child: SizedBox(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(height: 60),
                  Image.network(
                    widget.poke.image,
                    width: MediaQuery.of(context).size.width * 0.75,
                  ),
                  Text(
                    widget.poke.name,
                    style: const TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Type',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(widget.poke.type.toString()),
                  const SizedBox(height: 12),
                  const Text(
                    'Weakness',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(widget.poke.weakness.toString()),
                  const SizedBox(height: 12),
                  const Text(
                    'Previous Evolution',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(widget.poke.prevEvolution.toString()),
                  const SizedBox(height: 12),
                  const Text(
                    'Next Evolution',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(widget.poke.nextEvolution.toString()),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
