import 'package:flutter/material.dart';
import '../models/movie_model.dart';
import '../data/disney_data.dart';
import '../main.dart'; // para poder navegar hacia DetailsPage

/// Página sencilla que muestra únicamente las películas de la lista de
/// contenido. Se puede utilizar directamente o sustituir al
/// `GenericCatalogPage` si prefieres tener una vista dedicada.
class MoviesPage extends StatelessWidget {
  const MoviesPage({super.key});

  @override
  Widget build(BuildContext context) {
    // filtramos por tipo "movie"
    final List<DisneyContent> movies =
        DisneyData.allContent.where((c) => c.type == 'movie').toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('PELICULAS'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(30),
        child: Wrap(
          spacing: 20,
          runSpacing: 30,
          children:
              movies.map((movie) => _buildMovieCard(context, movie)).toList(),
        ),
      ),
    );
  }

  Widget _buildMovieCard(BuildContext context, DisneyContent movie) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => DetailsPage(movie: movie)),
      ),
      child: Column(
        children: [
          Container(
            width: 150,
            height: 220,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              image: DecorationImage(
                image: NetworkImage(movie.poster),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 8),
          SizedBox(
            width: 150,
            child: Text(
              movie.title,
              style: const TextStyle(color: Colors.white),
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
