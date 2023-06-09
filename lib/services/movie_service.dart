import 'dart:convert';

import '../model/movie.dart';
import 'package:http/http.dart' as http;

class MovieService {
  static const String apiKey = 'f8558bbb1d11cb28d9def8734fe57bfb';
  static const String baseUrl = 'https://api.themoviedb.org/3/movie/upcoming';

  static Future<List<Results>?>? fetchUpcomingMovies() async {
    final url = Uri.parse('$baseUrl?api_key=$apiKey');

    final response = await http.get(url);
    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      // final List<dynamic> movieData = jsonData['results'];
      final movie = MovieModel.fromJson(jsonData);
      print('json--------------> $jsonData');
      print(movie.results);
      return movie.results;

      // final List<Movie> movies = List<Movie>.from(
      //     jsonData['results'].map((movieData) => Movie.fromJson(movieData)));
      //     print(response.statusCode);
    } else {
      throw Exception('Failed to load upcoming movies');
    }
  }
}
