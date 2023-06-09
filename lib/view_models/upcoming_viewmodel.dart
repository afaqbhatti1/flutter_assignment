import 'package:flutter/material.dart';
import 'package:tmdb_api/tmdb_api.dart';

class upComingMovieListViewModel extends ChangeNotifier {
  List upComingMovies = [];
  String apikey = 'f8558bbb1d11cb28d9def8734fe57bfb';
  String readaccesstoken =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJmODU1OGJiYjFkMTFjYjI4ZDlkZWY4NzM0ZmU1N2JmYiIsInN1YiI6IjY0ODBkNzk3ZDJiMjA5MDEyZGZiM2FhYyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.Da6AJkLBAU4monPpDrBElHPSoXEvK6cAc6IUHB8JFCY';

  Future<void> fetchMovies() async {
    TMDB tmdbcustomlog = TMDB(ApiKeys(apikey, readaccesstoken));
    Map upComingResult = await tmdbcustomlog.v3.trending.getTrending();
    
    upComingMovies = upComingResult['results'];
    
    notifyListeners();
  }
}
