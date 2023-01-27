import 'package:http/http.dart' as http;
import 'dart:convert';

Future<void> getPokemonNumber(String pokemon) async {
  final response = await http.get(Uri.parse('https://pokeapi.co/api/v2/pokemon/$pokemon'));
  if (response.statusCode == 200) {
    Map<String, dynamic> jsonResponse = jsonDecode(response.body);
    int number = jsonResponse['id'];
    print('The number of $pokemon is $number');
  } else {
    print('Pokemon not found');
  }
}