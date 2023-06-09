import 'package:flutter/material.dart';
import 'package:flutter_assignment/routes/routes.dart';
import 'package:flutter_assignment/routes/routes_name.dart';
import 'package:flutter_assignment/view_models/dashboard_viewmodel.dart';
import 'package:flutter_assignment/view_models/movie_list_viewmodel.dart';
import 'package:flutter_assignment/view_models/upcoming_viewmodel.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => MovieListViewModel()),
        ChangeNotifierProvider(create: (context) => DashBoardViewModel()),
        ChangeNotifierProvider<upComingMovieListViewModel>(
            create: (context) => upComingMovieListViewModel()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Movie App',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        initialRoute: dashBoard,
        onGenerateRoute: generateRoute,
      ),
    );
  }
}
