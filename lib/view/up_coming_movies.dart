import 'package:flutter/material.dart';

import '../components/text.dart';
import 'movie_detaill_screen.dart';

class UpcomingMovies extends StatelessWidget {
  final List upcoming;
  const UpcomingMovies({super.key, required this.upcoming});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10),
          SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: upcoming.length,
                  itemBuilder: (context, index) {
                   
                    return InkWell(
                      
                      onTap: () {
                         print(upcoming[index]['id']);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MovieDetailScreen(
                                      name: upcoming[index]['title'],
                                    id: upcoming[index]['id'],
                                      bannerurl:
                                          'https://image.tmdb.org/t/p/w500' +
                                              upcoming[index]['backdrop_path'],
                                      posterurl:
                                          'https://image.tmdb.org/t/p/w500' +
                                              upcoming[index]['poster_path'],
                                      description: upcoming[index]['overview'],
                                      vote: upcoming[index]['vote_average']
                                          .toString(),
                                      launch_on: upcoming[index]
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
                                          upcoming[index]['poster_path']),
                                  fit: BoxFit.fill),
                            ),
                          ),
                          const SizedBox(height: 3),
                          Container(
                            child: TextWidget(
                              '${upcoming[index]['title'] ?? 'Loading'}',
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
                  }))
        ],
      ),
    );
  }
}
