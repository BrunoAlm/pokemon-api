import 'package:http/http.dart' as http;
import 'dart:convert';

Future<List<dynamic>> procuraPokemon(int qtd) async {
  final response = await http
      .get(Uri.parse('https://pokeapi.co/api/v2/pokemon/?limit=$qtd&offset=0'));
  if (response.statusCode == 200) {
    Map<String, dynamic> jsonResponse = jsonDecode(response.body);
    return jsonResponse['results'];
  } else {
    throw Exception('Failed to load pokemons');
  }
}
