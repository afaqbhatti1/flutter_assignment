import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:http/http.dart' as http;

import '../model/video_play_model.dart';

class MovieTrailerScreen extends StatefulWidget {
  int? movieId;
  MovieTrailerScreen({this.movieId, super.key});

  @override
  State<MovieTrailerScreen> createState() => _MovieTrailerScreenState();
}

class _MovieTrailerScreenState extends State<MovieTrailerScreen> {
  VideoPlayerController? _videoPlayerController;
  late Future _initializeVideoPlayerFuture;

  @override
  void initState() {
    super.initState();
    fetchVideoDetails();
    print('id-------->${widget.movieId}');
  }

  @override
  void dispose() {
    _videoPlayerController!.dispose();
    super.dispose();
  }

  Future<void> fetchVideoDetails() async {
    const apiKey = 'f8558bbb1d11cb28d9def8734fe57bfb';
    final url =
        'https://api.themoviedb.org/3/movie/${widget.movieId}/videos?api_key=$apiKey';
    print(widget.movieId);

    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final videoData = json.decode(response.body);
        final videoResults = VedioPlayModel.fromJson(videoData).results;
        print('vediodata------------->$videoData');
        print('vediodata------------->$videoResults');

        if (videoResults != null && videoResults.isNotEmpty) {
          print('vediodata------------->$videoResults');
          final videoKey = videoResults[0].key;
          print('videoKey------------->$videoKey');
          final videoUrl = 'https://www.youtube.com/watch?v=$videoKey';

          // _videoPlayerController = VideoPlayerController.network(videoUrl);
          // _initializeVideoPlayerFuture = _videoPlayerController!.initialize();
          // _videoPlayerController!.setLooping(true);
          // _videoPlayerController!.play();

          _videoPlayerController = VideoPlayerController.network(videoUrl);
          _initializeVideoPlayerFuture = _videoPlayerController!.initialize();
          print('play vedio 1 ---> $_videoPlayerController');
          _videoPlayerController!.setLooping(true);
          _videoPlayerController!.play();
          print('play vedio 1 ---> $_videoPlayerController');
          setState(() {});
        }
      } else {
        throw Exception('Failed to fetch video details');
      }
    } catch (error) {
      throw Exception('Error:-----------> $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_videoPlayerController != null &&
        _videoPlayerController!.value.isInitialized) {
      return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          automaticallyImplyLeading: false,
          title: const Text(
            'trailer Screen',
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: FutureBuilder(
          builder: (context, snapshot) {
            print('snapshot ------->$snapshot');
            print('controller outer ------->$_videoPlayerController');
            if (snapshot.connectionState == ConnectionState.done) {
              print('controller inner ------->$_videoPlayerController');
              return AspectRatio(
                  aspectRatio: _videoPlayerController!.value.aspectRatio);
            } else {
              return const CircularProgressIndicator();
            }
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              if (_videoPlayerController!.value.isPlaying) {
                _videoPlayerController!.pause();
              } else {
                _videoPlayerController!.play();
              }
            });
          },
          child: Icon(
            _videoPlayerController!.value.isPlaying
                ? Icons.pause
                : Icons.play_arrow,
          ),
        ),
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Video Player'),
        ),
        body: const Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
  }
}
