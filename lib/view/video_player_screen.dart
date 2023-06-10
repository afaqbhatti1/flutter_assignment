import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_assignment/view/dashboard.dart';
import 'package:http/http.dart' as http;
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';

import '../model/movie.dart';

class VideoPlayerScreen extends StatefulWidget {
  const VideoPlayerScreen({super.key});

  @override
  _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  List<MovieModel> movies = [];
  int? id;

  @override
  void initState() {
    super.initState();
    fetchMovies();
  }

  Future<void> fetchMovies() async {
    const apiKey = 'f8558bbb1d11cb28d9def8734fe57bfb';
    final response = await http.get(Uri.parse(
        'https://api.themoviedb.org/3/movie/$id/videos?api_key=$apiKey'));
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      final movieList = jsonData['results'] as List<dynamic>;
      setState(() {
        movies = movieList.map((item) => MovieModel.fromJson(item)).toList();
      });
    } else {
      const CircularProgressIndicator();
    }
  }

  void MovieDetailScreen(MovieModel movie) {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Movie List'),
      ),
      body: ListView.builder(
        itemCount: movies.length,
        itemBuilder: (context, index) {
          final movie = movies[index];
          return ListTile(
            title: const Text("Name"),
            onTap: () => DashboardScreen(),
          );
        },
      ),
    );
  }
}
