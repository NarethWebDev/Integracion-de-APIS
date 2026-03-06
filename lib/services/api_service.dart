import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/foundation.dart' show kIsWeb;
import '../models/movie_model.dart';

class ApiService {
  // Determine the base URL dynamically depending on platform.
  // - Web: use localhost (browser connects to the host directly).
  // - Android emulator: 10.0.2.2 points to host machine.
  // - Other platforms (iOS simulator, desktop, devices on same network):
  //   adjust manually or use localhost if running locally.
  static String get baseUrl {
    if (kIsWeb) return 'http://localhost:8080';
    // If you need to target a physical device on the same network, replace
    // the following with your PC's IP (ex. 'http://192.168.1.100:8080').
    return 'http://10.0.2.2:8080';
  }

  // Obtener todas las películas
  static Future<List<DisneyContent>> getMovies() async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/api/movies'));

      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);
        return data
            .map((movie) => DisneyContent(
                  id: movie['id'],
                  title: movie['title'],
                  year: movie['year'],
                  poster: movie['poster'],
                  backdrop: movie['backdrop'],
                  type: movie['type'],
                  description: movie['description'],
                  genres: List<String>.from(movie['genres']),
                  rating: (movie['rating'] as num).toDouble(),
                  director: movie['director'],
                ))
            .toList();
      } else {
        throw Exception('Error al cargar películas: ${response.statusCode}');
      }
    } catch (e) {
      print('Error en ApiService.getMovies: $e');
      rethrow;
    }
  }

  // Obtener todos los personajes
  static Future<List<DisneyCharacter>> getCharacters() async {
    try {
      final response =
          await http.get(Uri.parse('https://api.disneyapi.dev/character'));

      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonResponse = jsonDecode(response.body);
        final List<dynamic> data = jsonResponse['data'];
        return data
            .map((character) => DisneyCharacter(
                  id: character['_id'].toString(),
                  name: character['name'] ?? '',
                  imageUrl: character['imageUrl'] ?? '',
                  movieTitle:
                      (character['films'] as List<dynamic>?)?.isNotEmpty == true
                          ? character['films'][0]
                          : 'Sin película',
                  description: 'Personaje de Disney',
                ))
            .toList();
      } else {
        throw Exception('Error al cargar personajes: ${response.statusCode}');
      }
    } catch (e) {
      print('Error en ApiService.getCharacters: $e');
      rethrow;
    }
  }

  // Obtener una película específica
  static Future<DisneyContent> getMovieById(String id) async {
    try {
      final response = await http.get(Uri.parse('https://devsapihub.com/api-movies/$id'));

      if (response.statusCode == 200) {
        final movie = jsonDecode(response.body);
        return DisneyContent(
          id: movie['id'],
          title: movie['title'],
          year: movie['year'],
          poster: movie['poster'],
          backdrop: movie['backdrop'],
          type: movie['type'],
          description: movie['description'],
          genres: List<String>.from(movie['genres']),
          rating: (movie['rating'] as num).toDouble(),
          director: movie['director'],
        );
      } else {
        throw Exception('Error al cargar película: ${response.statusCode}');
      }
    } catch (e) {
      print('Error en ApiService.getMovieById: $e');
      rethrow;
    }
  }
}
