import 'package:flutter/material.dart';
import 'MovieFormat.dart';

class Movie extends StatelessWidget {
  MovieFormat movies;
  Movie(this.movies);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff192b44),
      body: Stack(children: <Widget>[
        SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.6,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(40),
                        bottomLeft: Radius.circular(40))),
                child: Stack(
                  alignment: Alignment.center,
                  children: <Widget>[
                    ClipRRect(
                      borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(20),
                          bottomLeft: Radius.circular(20)),
                      child: Image(
                        image: AssetImage(movies.image),
                        fit: BoxFit.cover,
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.6,
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(0, 0, 0, 0.5),
                          borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(20),
                              bottomLeft: Radius.circular(20))),
                    ),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Text(
                          movies.movieName,
                          overflow: TextOverflow.visible,
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontSize: 45),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    children: <Widget>[
                      Text('Ratings: ',
                          style: TextStyle(
                              color: Colors.white70,
                              fontSize: 20.0,
                              fontWeight: FontWeight.w500)),
                      Text('✩ ',
                          style:
                              TextStyle(color: Colors.orange, fontSize: 20.0)),
                      Text(movies.ratings.toString(),
                          style: TextStyle(
                              color: Colors.white70,
                              fontSize: 20.0,
                              fontWeight: FontWeight.w300))
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    children: <Widget>[
                      Text('Release Date: ',
                          style: TextStyle(
                              color: Colors.white70,
                              fontSize: 20.0,
                              fontWeight: FontWeight.w500)),
                      Text(
                        movies.releaseDate,
                        style: TextStyle(
                            color: Colors.white70,
                            fontSize: 20.0,
                            fontWeight: FontWeight.w300),
                      )
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text('Reviews: ',
                      style: TextStyle(
                          color: Colors.white70,
                          fontSize: 20.0,
                          fontWeight: FontWeight.w500)),
                ),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 12.0, vertical: 4.0),
                  child: Text(movies.reviews,
                      overflow: TextOverflow.visible,
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                          color: Colors.white70,
                          fontSize: 20.0,
                          fontWeight: FontWeight.w300)),
                ),
              )
            ],
          ),
        ),
        Align(
          alignment: Alignment.topLeft,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 8.0),
            child: IconButton(
                color: Colors.white,
                icon: Icon(Icons.arrow_back_ios),
                onPressed: () {
                  Navigator.pop(context);
                }),
          ),
        )
      ]),
    );
  }
}
