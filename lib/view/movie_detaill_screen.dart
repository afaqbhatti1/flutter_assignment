import 'package:flutter/material.dart';
import 'package:flutter_assignment/components/text.dart';
import 'package:flutter_assignment/routes/routes_name.dart';

import 'movie_trailer_screen.dart';

class MovieDetailScreen extends StatelessWidget {
  String? name, description, bannerurl, posterurl, vote, launch_on;
  int? id;

  MovieDetailScreen(
      {super.key,
      this.id,
      this.name,
      this.description,
      this.bannerurl,
      this.posterurl,
      this.vote,
      this.launch_on});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
        title: TextWidget('Detail Screen', Colors.black, 18),
      ),
      body: Container(
        child: ListView(children: [
          SizedBox(
            height: 250,
            child: Stack(children: [
              Positioned(
                child: SizedBox(
                  height: 250,
                  width: MediaQuery.of(context).size.width,
                  child: Image.network(
                    bannerurl!,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                  bottom: 10,
                  child:
                      TextWidget('⭐ Average Rating - $vote', Colors.white, 12)),
            ]),
          ),
          const SizedBox(height: 15),
          Container(
              padding: const EdgeInsets.all(10),
              child: TextWidget(name ?? 'Not Loaded', Colors.black, 24)),
          Container(
              padding: const EdgeInsets.only(left: 10),
              child: TextWidget('Releasing On - $launch_on', Colors.black, 14)),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                SizedBox(
                  height: 200,
                  width: 100,
                  child: Image.network(posterurl!),
                ),
                Flexible(
                  child: Container(
                      padding: const EdgeInsets.all(10),
                      child: TextWidget(description!, Colors.black, 12)),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40.0),
            child: InkWell(
              onTap: () => Navigator.pushNamed(context, seatMappingScreen),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.07,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: const Color(0xFF61C3F2),
                ),
                child: Center(
                    child: TextWidget('Proceed to Ticket', Colors.white, 14.0)),
              ),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 40.0, vertical: 10.0),
            child: InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MovieTrailerScreen(movieId: id),
                    ));
                // Navigator.pushNamed(context, movieTrailerScreen, arguments: id);
              },
              child: Container(
                  height: MediaQuery.of(context).size.height * 0.07,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border:
                        Border.all(color: const Color(0xFF61C3F2), width: 2.0),
                    color: Colors.transparent,
                  ),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.play_arrow,
                          color: Colors.blue,
                        ),
                        const SizedBox(width: 10),
                        TextWidget(
                            'Watch Trailer', const Color(0xFF61C3F2), 16.0)
                      ])),
            ),
          ),
        ]),
      ),
    );
  }
}
