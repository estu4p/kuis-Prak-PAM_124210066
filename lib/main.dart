import 'package:flutter/material.dart';
import 'package:kuis_124210066/detail_page.dart';
import './pokemon_data.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Pokedex'),
        backgroundColor: Colors.red,
        // actions: [

        // ],
      ),
      body: SizedBox(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        child: GridView.count(
            crossAxisCount: 2,
            children: List.generate(listPokemon.length, (index) {
              final PokemonData pokemon = listPokemon[index];
              return InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return DetailPage(
                      poke: pokemon,
                    );
                  }));
                },
                child: Container(
                    padding: const EdgeInsets.all(5),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 150,
                          height: 130,
                          color: Colors.amber,
                          child: Image.network(
                            pokemon.image,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Text(
                          pokemon.name,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    )),
              );
            })),
      ),
    );
  }
}
