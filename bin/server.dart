// Servidor Dart para API usando shelf, shelf_router y shelf_cors_headers
// Asegúrate de tener las dependencias en el pubspec.yaml:
//   shelf
//   shelf_router
//   shelf_cors_headers
// las puedes añadir con:
//   dart pub add shelf shelf_router shelf_cors_headers
//
// Ejecuta el servidor con:
//   dart run bin/server.dart

import 'dart:io';
import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as io;
import 'package:shelf_router/shelf_router.dart';
import 'package:shelf_cors_headers/shelf_cors_headers.dart';

// Datos mockup de películas
final List<Map<String, dynamic>> movies = [
  {
    'id': '1',
    'title': 'Frozen II',
    'year': '2019',
    'poster':
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSNbm28EZhooHofMhqRbjqYXm58jMZo87-n1A&s',
    'backdrop':
        'https://los40.com/resizer/v2/GMVVEZP26VMD5JQXDYU3JL5MZQ.jpg?auth=4a012cab3376474029128855b4473d2a5d3044d1f2774325ab9bb4c864b45032&quality=70&width=1200&height=675&smart=true',
    'type': 'movie',
    'description':
        'Elsa, Anna, Kristoff, Olaf y Sven viajan más allá de Arendelle.',
    'genres': ['Animación', 'Aventura', 'Familia'],
    'rating': 7.2,
    'director': 'Chris Buck',
  },
  {
    'id': '3',
    'title': 'Encanto',
    'year': '2021',
    'poster':
        'https://lumiere-a.akamaihd.net/v1/images/encanto_ka_las_pay1_92ad7410.jpeg',
    'backdrop':
        'https://www.infobae.com/resizer/v2/TGR7MGNDXBHG3BOOTPWKEY6WRA.png?auth=2f23fc348ab5ef1e08d34e19739e45f64b3d732b95464375009d7b6d2ec896fa&smart=true&width=1024&height=512&quality=85',
    'type': 'movie',
    'description': 'La historia de los Madrigal, una familia extraordinaria.',
    'genres': ['Animación', 'Familia', 'Musical'],
    'rating': 7.7,
    'director': 'Byron Howard',
  },
];

// Datos mockup de personajes
final List<Map<String, dynamic>> characters = [
  {
    'id': 'c1',
    'name': 'Elsa',
    'imageUrl': 'https://static.wikia.nocookie.net/disney/images/f/f5/Elsa.png',
    'movieTitle': 'Frozen II',
  },
  {
    'id': 'c2',
    'name': 'Anna',
    'imageUrl':
        'https://static.wikia.nocookie.net/disney/images/1/1a/Anna_Frozen.png',
    'movieTitle': 'Frozen II',
  },
];

Future<void> main() async {
  final router = Router();

  // Ruta principal
  router.get('/', (Request request) {
    return Response.ok(
      jsonEncode({
        'message': '¡Servidor Disney API activo!',
        'endpoints': ['/api/movies', '/api/characters']
      }),
      headers: {'Content-Type': 'application/json'},
    );
  });

  // Endpoint para películas
  router.get('/api/movies', (Request request) {
    return Response.ok(
      jsonEncode(movies),
      headers: {'Content-Type': 'application/json'},
    );
  });

  // Endpoint para personajes
  router.get('/api/characters', (Request request) {
    return Response.ok(
      jsonEncode(characters),
      headers: {'Content-Type': 'application/json'},
    );
  });

  // Endpoint para una película específica
  router.get('/api/movies/<id>', (Request request, String id) {
    try {
      final movie = movies.firstWhere((m) => m['id'] == id);
      return Response.ok(
        jsonEncode(movie),
        headers: {'Content-Type': 'application/json'},
      );
    } catch (e) {
      return Response.notFound(
        jsonEncode({'error': 'Película no encontrada'}),
        headers: {'Content-Type': 'application/json'},
      );
    }
  });

  // Middleware para logging y CORS
  final handler = const Pipeline()
      .addMiddleware(logRequests())
      .addMiddleware(corsHeaders())
      .addHandler(router);

  final server = await io.serve(handler, InternetAddress.anyIPv4, 8080);
  print('Servidor escuchando en http://${server.address.host}:${server.port}');
  print('Endpoints disponibles:');
  print('  GET /api/movies');
  print('  GET /api/characters');
  print('  GET /api/movies/<id>');
}
