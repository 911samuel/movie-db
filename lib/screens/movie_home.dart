import 'package:flutter/material.dart';
import 'package:medica_app/components/constants.dart';
import 'package:medica_app/components/movie.dart';
import 'package:medica_app/components/movie_service.dart';

class MovieHomePage extends StatefulWidget {
  const MovieHomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MovieHomePageState createState() => _MovieHomePageState();
}

class _MovieHomePageState extends State<MovieHomePage> {
  int _selectedIndex = 0;

  final List<String> _categories = [
    Constants.mostPopular,
    Constants.comingSoon,
    Constants.topRated,
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          "Movies",
          style: TextStyle(color: Colors.black),
        ),
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: MovieList(category: _categories[_selectedIndex]),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.movie),
            label: 'Popular',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.upcoming),
            label: 'Upcoming',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Top Rated',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: const Color(0xFF246BFD),
        unselectedItemColor: Colors.black,
        onTap: _onItemTapped,
      ),
    );
  }
}

class MovieList extends StatefulWidget {
  final String category;
  const MovieList({required this.category, super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MovieListState createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {
  late Future<List<Movie>> futureMovies;

  @override
  void initState() {
    super.initState();
    futureMovies = MovieService.fetchMovies(widget.category);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Movie>>(
      future: futureMovies,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
            itemCount: snapshot.data?.length,
            itemBuilder: (context, index) {
              Movie movie = snapshot.data![index];
              return ListTile(
                leading: Image.network(movie.posterUrl),
                title: Text(movie.title),
                subtitle: Text('Release Date: ${movie.releaseDate}'),
              );
            },
          );
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        }

        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
