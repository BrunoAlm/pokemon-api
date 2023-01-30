import 'dart:io';
import 'package:pokemon_api/services/get_pokemon_number.dart';
import 'package:pokemon_api/services/cria_txt.dart';
import 'package:pokemon_api/services/ler_txt.dart';
import 'package:pokemon_api/services/procura_pokemon.dart';
import 'services/download_pokemon.dart';

void main() async {
  stdout.write('Pokédex super bolada');
  stdout.write('\n');
  stdout.write('Qual a quantidade de pokemon procurar? ');
  int qtdPokemon = int.parse(stdin.readLineSync()!.trim());
  // Pega a quantidade de pokémon pra pesquisar na lista
  List<dynamic> listaPokemon = await procuraPokemon(qtdPokemon);
  // Cria um TXT com os pokémon
  await criaTXT(nomePokemons: listaPokemon, qtd: qtdPokemon);
  // Lê o TXT com os pokémon
  await lerTXT(qtd: qtdPokemon);
  stdout.write('Deseja saber o número de qual pokemon?');
  String nomePokemon = stdin.readLineSync()!.trim();
  // Pega o nome do pokémon que deseja saber o número na pokédex
  await pegaNumeroPokemon(nomePokemon);
  // Faz o download da imagem
  await downloadPokemonImage(nomePokemon);
}
