// movie_service.dart
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:medica_app/components/movie.dart';
import 'constants.dart'; // Import the Constants class

class MovieService {
  static Future<List<Movie>> fetchMovies(String category) async {
    final url = '${Constants.baseUrl}$category?api_key=${Constants.apiKey}';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      Map<String, dynamic> jsonResponse = json.decode(response.body);
      List moviesJson = jsonResponse['results'];
      return moviesJson.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      throw Exception('Failed to load movies');
    }
  }
}