import 'package:flutter/material.dart';
import 'MovieDetails.dart';
import 'MovieFormat.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PageController pageController;

  int currentPage = 0;
  List movies;

  @override
  void initState() {
    movies = getAvailMovies();
    super.initState();
    pageController = PageController(
        initialPage: currentPage, viewportFraction: 0.7, keepPage: false);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xff192b44),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 12.0, vertical: 30.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Image(
                      image: new AssetImage('assets/inflix.png'),
                      fit: BoxFit.fill,
                      height: MediaQuery.of(context).size.height * 0.07,
//                    width: MediaQuery.of(context).size.width * 0.5,
                    ),
                    IconButton(
                        icon: Icon(
                          Icons.search,
                          color: Colors.white,
                          size: 30,
                        ),
                        onPressed: () {})
                  ],
                ),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20.0,
                  ),
                  child: Text(
                    "Trending",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 40,
                        letterSpacing: 1.0,
                        fontWeight: FontWeight.w700,
                        shadows: <Shadow>[
                          Shadow(
                            offset: Offset(1.5, 1.5),
                            blurRadius: 3.0,
                            color: Color.fromARGB(255, 0, 0, 0),
                          ),
                        ]),
                  ),
                ),
              ),
              Container(
                  height: 350,
                  color: Color(0xff192b44),
                  child: TrendingMovies(context)),
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20.0,
                  ),
                  child: Text(
                    "Greatest Hits",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 40,
                        letterSpacing: 1.0,
                        fontWeight: FontWeight.w700,
                        shadows: <Shadow>[
                          Shadow(
                            offset: Offset(1.5, 1.5),
                            blurRadius: 3.0,
                            color: Color.fromARGB(255, 0, 0, 0),
                          ),
                        ]),
                  ),
                ),
              ),
              Padding(
                  padding: EdgeInsets.symmetric(vertical: 12.0),
                  child: Container(child: greatestHits(context)))
            ],
          ),
        ),
      ),
    );
  }

  Widget TrendingMovies(BuildContext context) {
    return Container(
      child: PageView.builder(
          onPageChanged: (value) {
            setState(() {
              currentPage = value;
            });
          },
          itemCount: movies.length,
          controller: pageController,
          itemBuilder: (context, index) {
            return cardAnimation(index, context);
          }),
    );
  }

  Widget cardAnimation(int index, BuildContext context) {
    return AnimatedBuilder(
      animation: pageController,
      builder: (context, widget) {
        double value = 1;
        if (pageController.position.haveDimensions) {
          value = pageController.page - index;
          value = (1 - (value.abs() * 0.4)).clamp(0.0, 1.0);
        }
        return Center(
          child: SizedBox(
            height: Curves.easeOut.transform(value) * 300,
            width: Curves.easeOut.transform(value) * 300,
            child: widget,
          ),
        );
      },
      child: GestureDetector(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => Movie(movies[index])));
        },
        child: Container(
          decoration: BoxDecoration(boxShadow: <BoxShadow>[
            BoxShadow(
              offset: Offset(2.0, 2.0),
              blurRadius: 4.0,
              color: Color.fromARGB(200, 0, 0, 0),
            ),
          ], borderRadius: BorderRadius.circular(12.0)),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12.0),
            child: Image(
              image: new AssetImage(movies[index].image),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }

  Widget greatestHits(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.3,
      child: ListView.builder(
          reverse: true,
          itemCount: movies.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Container(
              width: MediaQuery.of(context).size.width * 0.5,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Movie(movies[index])));
                },
                child: Card(
                  elevation: 12.0,
                  shape: new RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0)),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12.0),
                    child: Image(
                      image: AssetImage(movies[index].image),
                      fit: BoxFit.cover,
                      semanticLabel: movies[index].movieName,
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }

  List getAvailMovies() {
    return [
      MovieFormat(
          image: 'assets/bandersnatch.jpg',
          movieName: 'BanderSnatch',
          ratings: 7.2,
          releaseDate: '28/12/2018',
          reviews:
              'A silly attempt at incorporating "choose your own adventure" into a movie, but in reality you do not have a choice, you do go down different paths but they all go nowherewith no real impact on the main story (and don\'t make any sense anyway). And in a lot of situations, the choices give the exact same next outcome.'),
      MovieFormat(
          image: 'assets/birdbox.jpg',
          movieName: 'BirdBox',
          ratings: 6.6,
          releaseDate: '12/11/2018',
          reviews:
              'Personally I believe this was a very intense psychological indepth thriller about how most people live in society today, blind folded and guarded in order to avoid real emotions, real connection, and with perpetual fears that can be real but most of the times are untouchable and all created by the panic and anxieties within of things we will never see. Malorie\'s persona was detached even from the very beginning for fear of feeling anything. '),
      MovieFormat(
          image: 'assets/inception.jpg',
          movieName: "Inception",
          ratings: 8.8,
          releaseDate: '16/07/2010',
          reviews:
              'This one is one of my all time favorites. When I saw this movie first time I didn\'t understood the concept but keep on watching several times you will get addicted with this movie. Inception will broaden your thoughts and change your perspective about movies. It is a racy thriller with a gripping story in depth. I think everyone will love the excellent background score given by Hans Zimmer. This is one of the best creation by Nolan Brothers & Hans Zimmer combo.'),
      MovieFormat(
          image: 'assets/johnwick.jpg',
          movieName: 'JohnWick 3',
          ratings: 7.8,
          releaseDate: '09/05/2019',
          reviews:
              'What I liked best about the movie: ACTION SCENES: Brilliance of the Action scenes (the creative ways every prop & space within the set is utilized is just pure magic). KEANU REEVES as John Wick & his presence. It\'s just amazing to watch Keanu play Wick & to feel his presence every second he occupies the screen. His movement work while performing action is so realistic and refreshing.'),
      MovieFormat(
          image: 'assets/pursuitofhappiness.jpg',
          movieName: 'The Pursuit of Happiness',
          releaseDate: '04/05/2016',
          ratings: 8,
          reviews:
              'Accidentaly I saw thus movei latter only  but good due most of the movie dreaming storey never deal or tell social structure of life from kid to old,wife and husband relation, father to kid and mother to kid ration all sould dealing in love. My experience in life is learning is to avoid Angry it won\'t help but patient need to run the life with smooth. Try, try don\'t let heart Loose one day our hard work come fruit ripe but patient.'),
      MovieFormat(
          image: 'assets/thematrix.jpg',
          movieName: 'The Matrix',
          releaseDate: '31/03/1999',
          ratings: 8.7,
          reviews:
              'A true masterpiece of Science Fiction planting the idea firmly in you head that we may well be in the Matrix already. Is it prophetic? Is it nonsense? We will never really know but like all great Sci Fi it makes you look at the world in a different way and the ideas stay with you forever. The later films, although decent, never quite captured the sheer brilliance and iconic feel of the first, the script is so sharp, the plot so original, the brooding dark humour from the agents who all look like the men from U.N.K.L.E. and of course the original special effects inventions such as bullet time which I believe was created for this movie'),
      MovieFormat(
          image: 'assets/DEADPOOL.jpg',
          movieName: 'Deadpool',
          ratings: 8,
          releaseDate: '12/02/2016',
          reviews:
              'The first thing I noticed was how inventive the storytelling is. The film throws you into the action from the first moment (literally: the very first moment) and then it goes back and forth in brilliant and unexpected ways to slowly unspool the story of this insane - but oddly charming - antihero. Flashbacks and fast-forwards can be annoying as hell, but when done right, they can help render even a somewhat simple story fresh and exciting. And that\'s exactly how Deadpool felt to me right from the start: like a fresh (if somewhat dirty) jolt of energy.')
    ];
  }
}
