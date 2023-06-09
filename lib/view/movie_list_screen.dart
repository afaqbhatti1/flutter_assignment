import 'package:flutter/material.dart';
import 'package:flutter_assignment/components/text.dart';
import 'package:flutter_assignment/view/up_coming_movies.dart';
import 'package:tmdb_api/tmdb_api.dart';

class MovieListScreen extends StatefulWidget {
  const MovieListScreen({
    super.key,
  });

  @override
  State<MovieListScreen> createState() => _MovieListScreenState();
}

class _MovieListScreenState extends State<MovieListScreen> {
  List _upComingMovies = [];

  String apikey = 'f8558bbb1d11cb28d9def8734fe57bfb';

  String readaccesstoken =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJmODU1OGJiYjFkMTFjYjI4ZDlkZWY4NzM0ZmU1N2JmYiIsInN1YiI6IjY0ODBkNzk3ZDJiMjA5MDEyZGZiM2FhYyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.Da6AJkLBAU4monPpDrBElHPSoXEvK6cAc6IUHB8JFCY';

  @override
  void initState() {
    fetchMovies();
    super.initState();
  }

  fetchMovies() async {
    TMDB tmdbcustomlog = TMDB(ApiKeys(apikey, readaccesstoken));
    // logConfig:
    // const ConfigLogger(
    //   showLogs: true,
    //   showErrorLogs: true,
    // );
    Map upComingResult = await tmdbcustomlog.v3.trending.getTrending();
    print(upComingResult);
    setState(() {
      _upComingMovies = upComingResult['results'];
    });
    print(_upComingMovies);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          automaticallyImplyLeading: false,
          title: const Text(
            'Movies List',
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextWidget(
                'Upcoming Movies',
                Colors.black,
                26,
              ),
              const SizedBox(height: 10),
              Expanded(
                child: ListView(
                  children: [UpcomingMovies(upcoming: _upComingMovies)],
                ),
              ),
            ],
          ),
        )
        );
  }
}
        //  Consumer<MovieListViewModel>(
        //   builder: (context, movieListViewModel, child) {
        //     return

        // FutureBuilder(
        //   future: movieListViewModel.fetchMovies(),
        //   builder: (context, snapshot) {
        //     print('snapshot// data-------->${snapshot.data}');
        //     print('snapshot-------->${snapshot.hasData}');
        //     if (snapshot.hasData) {
        //       return ListView.builder(
        //         itemCount: snapshot.data.length,
        //         itemBuilder: (context, index) {
        //           final movie = snapshot.data[index];
        //           // final imageUrl =
        //           //     movie.posterUrl ?? 'your_default_image_url';
        //           print(movie[index].title);
        //           return ListTile(
        //             title: Text(movie[index].title),
        //           );
        //         },
        //       );
        //     } else {
        //       {
        //         return const Center(child: CircularProgressIndicator());
        //       }
        //     }
        //   },
        // );


