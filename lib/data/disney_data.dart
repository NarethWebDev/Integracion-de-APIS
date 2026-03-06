import '../models/movie_model.dart';

class DisneyData {
  static final List<DisneyContent> allContent = [
    DisneyContent(
      id: '1',
      title: 'Frozen: El reino del hielo',
      year: '2013',
      poster: 'https://image.tmdb.org/t/p/w500/wBVJI3lh9e9qlKZE4P5Y7ZrPIGY.jpg',
      type: 'movie',
      description: 'Anna, una reina de corazón abierto, debe salvar su reino del invierno eterno.',
      genres: ['Animación', 'Aventura', 'Fantasía'],
      rating: 8.8,
      director: 'Chris Buck',
    ),
    DisneyContent(
      id: '2',
      title: 'Encanto',
      year: '2021',
      poster: 'https://image.tmdb.org/t/p/w500/6zHLcVPV78VVLZ5A3Xq7MUCVyqw.jpg',
      type: 'movie',
      description: 'Una familia toca instrumentos mágicos. Cuando el milagro desaparece, Mirabel debe salvarlo.',
      genres: ['Animación', 'Aventura', 'Comedia'],
      rating: 8.2,
      director: 'Byron Howard',
    ),
    DisneyContent(
      id: '3',
      title: 'Aladdin',
      year: '1992',
      poster: 'https://image.tmdb.org/t/p/w500/0tSxR4Hg2q0Ufzn2PdU2Hk2JVxO.jpg',
      type: 'movie',
      description: 'Un joven ladrón descubre una lámpara mágica que cambiará su vida para siempre.',
      genres: ['Animación', 'Aventura', 'Fantasía'],
      rating: 8.0,
      director: 'Ron Clements',
    ),
    DisneyContent(
      id: '4',
      title: 'La Reina de Hielo 2',
      year: '2019',
      poster: 'https://image.tmdb.org/t/p/w500/xPfRr5vZ2kLhKN7n5d5YiCmJfzL.jpg',
      type: 'movie',
      description: 'Elsa descubre el origen de sus poderes mágicos en un viaje junto a sus amigos.',
      genres: ['Animación', 'Aventura', 'Fantasía'],
      rating: 8.1,
      director: 'Chris Buck',
    ),
    DisneyContent(
      id: '5',
      title: 'Moana',
      year: '2016',
      poster: 'https://image.tmdb.org/t/p/w500/7WJjFvCI0Eb1nwAxj1EFcVyKc1V.jpg',
      type: 'movie',
      description: 'Una joven navegante se lanza al océano en una audaz misión de salvación.',
      genres: ['Animación', 'Aventura', 'Comedia'],
      rating: 8.3,
      director: 'Ron Clements',
    ),
    DisneyContent(
      id: '6',
      title: 'Coco',
      year: '2017',
      poster: 'https://image.tmdb.org/t/p/w500/gGEsBPAijhVUGiGm334Sw8MGZjl.jpg',
      type: 'movie',
      description: 'Un joven descubre el secreto detrás de la próspera dinastía musical de su familia.',
      genres: ['Animación', 'Aventura', 'Familia'],
      rating: 8.4,
      director: 'Lee Unkrich',
    ),

    DisneyContent(
      id: '7',
      title: 'The Mandalorian',
      year: '2019',
      poster: 'https://image.tmdb.org/t/p/w500/eU8rjM34Ib1nwCGo1nkFDn-PAgc.jpg',
      type: 'series',
      description: 'Un cazarrecompensas solitario navega por los márgenes de la galaxia.',
      genres: ['Acción', 'Aventura', 'Drama'],
      rating: 8.7,
      director: 'Dave Filoni',
    ),
    DisneyContent(
      id: '8',
      title: 'Loki',
      year: '2021',
      poster: 'https://image.tmdb.org/t/p/w500/rTQ4xisjnJ0jRSwMaKjXlUTXlJJ.jpg',
      type: 'series',
      description: 'El dios del engaño es capturado y obligado a ayudar a restaurar el tiempo.',
      genres: ['Acción', 'Aventura', 'Misterio'],
      rating: 8.4,
      director: 'Kate Herron',
    ),
  ];

  static final List<ContentFilter> filters = [
    ContentFilter(name: 'Todo', value: 'all'),
    ContentFilter(name: 'Películas', value: 'movie'),
    ContentFilter(name: 'Series', value: 'series'),
    ContentFilter(name: 'Animación', value: 'Animación'),
    ContentFilter(name: 'Aventura', value: 'Aventura'),
    ContentFilter(name: 'Familia', value: 'Familia'),
  ];

  static List<DisneyContent> getContentByType(String type) {
    if (type == 'all') return allContent;
    return allContent.where((c) => c.type == type).toList();
  }

  static List<DisneyContent> getContentByGenre(String genre) {
    if (genre == 'all') return allContent;
    return allContent.where((c) => c.genres.contains(genre)).toList();
  }

  static List<DisneyContent> searchContent(String query) {
    if (query.isEmpty) return allContent;
    return allContent
        .where((c) =>
            c.title.toLowerCase().contains(query.toLowerCase()) ||
            c.director.toLowerCase().contains(query.toLowerCase()))
        .toList();
  }

  static List<DisneyContent> getFeatured() {
    return allContent.where((c) => c.rating >= 8.0).toList();
  }
}