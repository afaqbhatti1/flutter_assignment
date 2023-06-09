import 'package:flutter/material.dart';
import 'package:flutter_assignment/routes/routes_name.dart';
import 'package:flutter_assignment/view/dashboard.dart';
import 'package:flutter_assignment/view/movie_list_screen.dart';
import 'package:flutter_assignment/view/seat_mapping_screen.dart';

import '../view/movie_trailer_screen.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case dashBoard:
      return MaterialPageRoute(builder: (context) => DashboardScreen());
    case movieListScreen:
      return MaterialPageRoute(builder: (context) => const MovieListScreen());
    // case movieDetailScreen:
    //   return MaterialPageRoute(builder: (context) =>   MovieDetailScreen(),settings: settings);
    // case movieSearchScreen:
    //   return MaterialPageRoute(builder: (context) =>  MovieSearchScreen());
    // case movieTrailerScreen:
    //   return MaterialPageRoute(builder: (context) =>  MovieTrailerScreen(),settings: settings);
    case seatMappingScreen:
      return MaterialPageRoute(builder: (context) => const SeatMappingScreen());
    default:
      return MaterialPageRoute(
        builder: (_) {
          return const Scaffold(
            body: Center(child: Text('Empty route')),
          );
        },
      );
  }
}
