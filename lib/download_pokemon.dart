import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

Future<void> downloadPokemonImage(String pokemonName) async {
// Faz uma requisição GET para a API
  final response = await http
      .get(Uri.parse("https://pokeapi.co/api/v2/pokemon/$pokemonName"));

// Verifica se a resposta é OK
  if (response.statusCode == 200) {
    // Deserializa a resposta para um Map
    Map<String, dynamic> pokemonData = jsonDecode(response.body);

    // Obtém a URL da imagem
    String imageUrl = pokemonData["sprites"]["front_default"];

    //  aqui você pode usar a url para baixar a imagem
    var responseImg = await http.get(Uri.parse(imageUrl));
    var file = File('$pokemonName.jpg');
    await file.writeAsBytes(responseImg.bodyBytes);
  } else {
    print("Erro ao buscar Pokemon: ${response.statusCode}");
  }
}
