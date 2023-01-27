import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';

import 'package:pokemon_api/get_pokemon_number.dart';

import 'download_pokemon.dart';

Future<void> createTextFile(List<dynamic> pokemons) async {
  File file = File('pokemons.txt');
  String contents = pokemons.map((pokemon) => pokemon['name']).join('\n');
  await file.writeAsString(contents);
}

Future<void> readTextFile() async {
  try {
    File file = File('pokemons.txt');
    List<String> lines = await file.readAsLines();
    for (var line in lines) {
      print(line);
    }
  } catch (e) {
    print('Error reading file: $e');
  }
}

Future<List<dynamic>> getPokemons(int qtd) async {
  final response = await http
      .get(Uri.parse('https://pokeapi.co/api/v2/pokemon/?limit=$qtd&offset=0'));
  if (response.statusCode == 200) {
    Map<String, dynamic> jsonResponse = jsonDecode(response.body);
    return jsonResponse['results'];
  } else {
    throw Exception('Failed to load pokemons');
  }
}

void main() async {
  stdout.write('Qual a quantidade de pokemons procurar? ');
  int pokemonqtd = int.parse(stdin.readLineSync()!.trim());
  List<dynamic> pokemons = await getPokemons(pokemonqtd);
  await createTextFile(pokemons);
  print('File created!');
  print('Reading File!');
  await readTextFile();
  stdout.write('Which Pokemon do you want to know the number of? ');
  String pokemonName = stdin.readLineSync()!.trim();
  await getPokemonNumber(pokemonName);
  // Obtém a URL da imagem
  await downloadPokemonImage(pokemonName);
}
