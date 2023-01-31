import 'dart:io';

Future<void> lerTXT({int? qtd}) async {
  try {
    File file = File('./txt_gerado/${qtd}_pokemons.txt');
    List<String> lines = await file.readAsLines();
    for (var line in lines) {
      print(line);
    }
    print('Lista com $qtd pokémon gerada!');
  } catch (e) {
    print('Error reading file: $e');
  }
}
