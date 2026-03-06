import 'package:flutter/material.dart';
import 'constants/colors.dart';
import 'widgets/navbar.dart';
import 'package:disney_app/widgets/carousel_section.dart';
import 'package:disney_app/widgets/new_movies_section.dart';
import 'data/disney_data.dart';
import 'models/movie_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Disney App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        primaryColor: AppColors.disney_blue,
        scaffoldBackgroundColor: AppColors.darkBg2,
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.darkBg2,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.white),
        ),
      ),
      home: const HomeScreenWithCarousel(),
    );
  }
}

// ============================================================
// PANTALLA PRINCIPAL
// ============================================================
class HomeScreenWithCarousel extends StatelessWidget {
  const HomeScreenWithCarousel({Key? key}) : super(key: key);

  // Función para navegar a la vista de detalles
  void _navigateToDetails(BuildContext context, DisneyContent movie) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetailsPage(movie: movie),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Obtener películas destacadas y todas las películas del archivo de datos
    final featuredMovies = DisneyData.getFeatured();
    final allMovies = DisneyData.allContent;

    return Scaffold(
      backgroundColor: AppColors.darkBg2,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // BARRA DE NAVEGACIÓN
            Navbar(
              onSearchTap: () {},
              onNavItemTap: (navItem) {},
            ),

            // CARRUSEL SUPERIOR
            CarouselSection(
              contents: featuredMovies,
              onContentSelected: (content) => _navigateToDetails(context, content),
            ),

            // SECCIÓN DE PELÍCULAS NUEVAS (CON FLECHAS)
            NewMoviesSection(
              contents: allMovies,
              onContentSelected: (content) => _navigateToDetails(context, content),
            ),

            // FOOTER O PIE DE PÁGINA
            Container(
              width: double.infinity,
              color: AppColors.darkBg2,
              padding: const EdgeInsets.symmetric(
                horizontal: 60,
                vertical: 60,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'DISNEY',
                    style: TextStyle(
                      color: AppColors.disney_blue,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      letterSpacing: 2,
                    ),
                  ),
                  const SizedBox(height: 15),
                  const Text(
                    '© 2024 Disney. Todos los derechos reservados. El contenido de esta página es para fines de práctica de desarrollo.',
                    style: TextStyle(
                      color: AppColors.grey,
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      _footerLink('Política de Privacidad'),
                      _footerLink('Acuerdo de Suscripción'),
                      _footerLink('Ayuda'),
                      _footerLink('Dispositivos Compatibles'),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _footerLink(String text) {
    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: Text(
        text,
        style: const TextStyle(color: AppColors.lightGrey, fontSize: 11),
      ),
    );
  }
}

// ============================================================
// NUEVA VISTA: PÁGINA DE DETALLES FINALIZADA
// ============================================================
class DetailsPage extends StatelessWidget {
  final DisneyContent movie;

  const DetailsPage({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Stack(
        children: [
          // Imagen de fondo (Backdrop)
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(movie.backdrop),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Capa de degradado para que el texto sea legible
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  Colors.black.withOpacity(0.9),
                  Colors.black.withOpacity(0.3),
                  Colors.transparent,
                ],
              ),
            ),
          ),
          // Contenido de la película
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 60.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  movie.type.toUpperCase(),
                  style: const TextStyle(
                    color: AppColors.disney_blue,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  movie.title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 55,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Text(movie.year, style: const TextStyle(color: Colors.white70)),
                    const SizedBox(width: 15),
                    Container(
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white70),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        "${movie.rating} ★",
                        style: const TextStyle(color: Colors.white70, fontSize: 12),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: 500,
                  child: Text(
                    movie.description,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      height: 1.5,
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                Text(
                  "Director: ${movie.director}",
                  style: const TextStyle(
                    color: AppColors.disney_gold,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 40),
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.play_arrow, size: 30),
                  label: const Text('REPRODUCIR'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
                    padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                    textStyle: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}