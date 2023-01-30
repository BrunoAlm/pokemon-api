// Biblioteca que manipula arquivos
import 'dart:io';

// Responsável por criar o arquivo de texto contendo todos os nomes de pokemons
Future<void> criaTXT({List<dynamic>? nomePokemons, int? qtd}) async {
  // Cria o arquivo .txt
  File file = File('./txt_gerado/${qtd}_pokemons.txt');
  String contents = nomePokemons!.map((pokemon) => pokemon['name']).join('\n');
  await file.writeAsString(contents);
}
