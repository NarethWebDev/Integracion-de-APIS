// views/characters_page.dart (o donde guardes tus páginas)
import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../data/disney_data.dart';
import '../models/movie_model.dart';
import 'package:cached_network_image/cached_network_image.dart';

class CharactersPage extends StatelessWidget {
  const CharactersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final characters = DisneyData.allCharacters;

    return Scaffold(
      backgroundColor: AppColors.darkBg2,
      appBar: AppBar(
        title: const Text(
          "PERSONAJES DISNEY+",
          style: TextStyle(color: Colors.white, fontSize: 16, letterSpacing: 2),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      extendBodyBehindAppBar: true, // Para que el Hero suba hasta arriba
      body: SingleChildScrollView( // <-- Habilitamos scroll para toda la página
        child: Column(
          children: [
            // ============================================================
            // 1. HERO DE PROMOCIONES (Inspirado en Imagen 1/3)
            // ============================================================
            Container(
              height: 500, // Altura similar a tu carrusel
              width: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  // Imagen de fondo promocional (ej: Daredevil)
                  image: NetworkImage('https://images.marvel.com/content/1x/004dsh_ons_crd_02.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Stack(
                children: [
                  // Degradado para legibilidad del texto
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [
                          Colors.black.withOpacity(0.9),
                          Colors.transparent,
                        ],
                      ),
                    ),
                  ),
                  // Contenido de la promo
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 60.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(4),
                          color: Colors.white,
                          child: const Text(
                            'PRÓXIMAMENTE',
                            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 12),
                          ),
                        ),
                        const SizedBox(height: 15),
                        const Text(
                          'DAREDEVIL: BORN AGAIN',
                          style: TextStyle(color: Colors.white, fontSize: 50, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 15),
                        const Text(
                          'No te pierdas el regreso del Hombre sin Miedo. Suscríbete ahora para ver el tráiler.',
                          style: TextStyle(color: Colors.white70, fontSize: 18),
                        ),
                        const SizedBox(height: 30),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(backgroundColor: AppColors.disney_blue, padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15)),
                          child: const Text('SUSCRÍBETE AHORA', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 40),

            // ============================================================
            // 2. CUADRÍCULA DE PERSONAJES (Inspirado en Imagen 2)
            // ============================================================
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Wrap(
                spacing: 20, // Espacio horizontal entre tarjetas
                runSpacing: 20, // Espacio vertical entre filas
                children: characters.map((character) {
                  return _buildCharacterCard(character);
                }).toList(),
              ),
            ),
            const SizedBox(height: 60), // Margen inferior
          ],
        ),
      ),
    );
  }

  // Widget para cada tarjeta de personaje
  Widget _buildCharacterCard(DisneyCharacter character) {
    return Container(
      width: 170, // Ancho de la tarjeta
      decoration: BoxDecoration(
        color: const Color(0xFF232938), // Un gris ligeramente más claro que el fondo
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 10,
            offset: const Offset(0, 5),
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Imagen del personaje con ClipRRect para esquinas redondeadas
          ClipRRect(
            borderRadius: const BorderRadius.only(topLeft: Radius.circular(8), topRight: Radius.circular(8)),
            child: CachedNetworkImage(
              imageUrl: character.imageUrl,
              height: 250, // Altura de la imagen
              width: double.infinity,
              fit: BoxFit.cover,
              placeholder: (context, url) => Container(color: AppColors.darkGrey),
              errorWidget: (context, url, error) => const Icon(Icons.person, color: Colors.white, size: 50),
            ),
          ),
          // Info del personaje
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  character.name,
                  style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 5),
                Text(
                  character.movieTitle.toUpperCase(),
                  style: const TextStyle(color: AppColors.lightGrey, fontSize: 12, letterSpacing: 1),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}