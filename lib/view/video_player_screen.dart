// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:video_player/video_player.dart';
// import 'package:chewie/chewie.dart';

// import '../model/movie.dart';


// class VideoPlayerScreen extends StatefulWidget {
//   @override
//   _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
// }

// class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
//   List<MovieModel> movies = [];

//   @override
//   void initState() {
//     super.initState();
//     fetchMovies();
//   }

//   Future<void> fetchMovies() async {
//     final apiKey = 'f8558bbb1d11cb28d9def8734fe57bfb';
//     final id = 
//     final response = await http.get(Uri.parse(
//         'https://api.themoviedb.org/3/movie/$id/videos?api_key=$apiKey'));
//     if (response.statusCode == 200) {
//       final jsonData = jsonDecode(response.body);
//       final movieList = jsonData['results'] as List<dynamic>;
//       setState(() {
//         movies = movieList.map((item) => Movie.fromJson(item)).toList();
//       });
//     } else {
//       // Handle error
//     }
//   }

//   void navigateToMovieDetailScreen(Movie movie) {
//     Navigator.push(
//       context,
//       MaterialPageRoute(
//         builder: (context) => MovieDetailScreen(movie),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Movie List'),
//       ),
//       body: ListView.builder(
//         itemCount: movies.length,
//         itemBuilder: (context, index) {
//           final movie = movies[index];
//           return ListTile(
//             title: Text(movie.title),
//             onTap: () => navigateToMovieDetailScreen(movie),
//           );
//         },
//       ),
//     );
//   }
// }

// class MovieDetailScreen extends StatefulWidget {
//   final Movie movie;

//   MovieDetailScreen(this.movie);

//   @override
//   _MovieDetailScreenState createState() => _MovieDetailScreenState();
// }

// class _MovieDetailScreenState extends State<MovieDetailScreen> {
//   VideoPlayerController _videoPlayerController;
//   ChewieController _chewieController;
//   bool _isPlaying = false;

//   @override
//   void initState() {
//     super.initState();
//     fetchMovieTrailer();
//   }

//   Future<void> fetchMovieTrailer() async {
//     final apiKey = '123456abcdefg';
//     final response = await http.get(Uri.parse(
//         'https://api.themoviedb.org/3/movie/${widget.movie.id}/videos?api_key=$apiKey'));
//     if (response.statusCode == 200) {
//       final jsonData = jsonDecode(response.body);
//       final results = jsonData['results'] as List<dynamic>;
//       if (results.isNotEmpty) {
//         final trailerKey = results[0]['key
