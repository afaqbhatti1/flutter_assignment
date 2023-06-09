import 'package:flutter/material.dart';
import 'package:tmdb_api/tmdb_api.dart';

import '../components/searchTextField.dart';
import '../components/text.dart';
import 'movie_detaill_screen.dart';

class MovieSearchScreen extends StatefulWidget {
  const MovieSearchScreen({
    super.key,
  });

  @override
  State<MovieSearchScreen> createState() => _MovieSearchScreenState();
}

class _MovieSearchScreenState extends State<MovieSearchScreen> {
  TextEditingController searchController = TextEditingController();
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
          'Search your favourite movies',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SearchTextField(searchController, context),
            const SizedBox(height: 10),
            Expanded(
              flex: 1,
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: _upComingMovies.length,
                itemBuilder: (context, index) {
                  final movieTitle = _upComingMovies[index]['title'];
                  if(movieTitle != null &&  (searchController.text.isEmpty ||
                    movieTitle
                          .toLowerCase()
                          .trim()
                          .startsWith(
                              searchController.text.toLowerCase().trim()))) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MovieDetailScreen(
                                      name: _upComingMovies[index]['title'],
                                      bannerurl:
                                          'https://image.tmdb.org/t/p/w500' +
                                              _upComingMovies[index]
                                                  ['backdrop_path'],
                                      posterurl:
                                          'https://image.tmdb.org/t/p/w500' +
                                              _upComingMovies[index]
                                                  ['poster_path'],
                                      description: _upComingMovies[index]
                                          ['overview'],
                                      vote: _upComingMovies[index]['vote_average']
                                          .toString(),
                                      launch_on: _upComingMovies[index]
                                          ['release_date'],
                                    )));
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.height * 0.3,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                  image: NetworkImage(
                                      'https://image.tmdb.org/t/p/w500' +
                                          _upComingMovies[index]['poster_path']),
                                  fit: BoxFit.fill),
                            ),
                          ),
                          const SizedBox(height: 3),
                          Container(
                            child: TextWidget(
                              '${_upComingMovies[index]['title'] ?? 'Loading'}',
                              Colors.black,
                              14,
                            ),
                          ),
                          const SizedBox(
                            height: 25,
                          )
                        ],
                      ),
                    );
                  } else {
                    return const SizedBox();
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
