import 'package:flutter/material.dart';
// Importación de tus constantes de color
import 'constants/colors.dart';
// Importación de tus widgets personalizados
import 'widgets/navbar.dart';
import 'package:disney_app/widgets/carousel_section.dart';
import 'package:disney_app/widgets/new_movies_section.dart';
// Importación de datos y modelos
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
// 1. PANTALLA PRINCIPAL (HOME)
// ============================================================
class HomeScreenWithCarousel extends StatelessWidget {
  const HomeScreenWithCarousel({Key? key}) : super(key: key);

  // Función para navegar a la vista de detalles de una película
  void _navigateToDetails(BuildContext context, DisneyContent movie) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetailsPage(movie: movie),
      ),
    );
  }

  // Función para navegar al catálogo (Redireccionamiento desde Navbar)
  void _navigateToCatalog(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const CatalogPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final featuredMovies = DisneyData.getFeatured();
    final allMovies = DisneyData.allContent;

    return Scaffold(
      backgroundColor: AppColors.darkBg2,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // BARRA DE NAVEGACIÓN CON LÓGICA DE REDIRECCIÓN
            Navbar(
              onSearchTap: () {},
              onNavItemTap: (navItem) {
                // Si el usuario hace clic en Películas (o Movies según tu idioma en data)
                if (navItem == 'Películas' || navItem == 'Movies') {
                  _navigateToCatalog(context);
                }
              },
            ),

            // SECCIÓN DE CARRUSEL (PRINCIPAL)
            CarouselSection(
              contents: featuredMovies,
              onContentSelected: (content) => _navigateToDetails(context, content),
            ),

            // SECCIÓN DE PELÍCULAS NUEVAS (CON LAS FLECHAS LATERALES)
            NewMoviesSection(
              contents: allMovies,
              onContentSelected: (content) => _navigateToDetails(context, content),
            ),

            // PIE DE PÁGINA (FOOTER)
            _buildFooter(),
          ],
        ),
      ),
    );
  }

  Widget _buildFooter() {
    return Container(
      width: double.infinity,
      color: AppColors.darkBg2,
      padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 60),
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
            '© 2024 Disney. Todos los derechos reservados. Aplicación desarrollada para fines educativos.',
            style: TextStyle(color: AppColors.grey, fontSize: 12),
          ),
        ],
      ),
    );
  }
}

// ============================================================
// 2. VISTA DE CATÁLOGO (CON SINGLE CHILD SCROLL VIEW)
// ============================================================
class CatalogPage extends StatelessWidget {
  const CatalogPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final allMovies = DisneyData.allContent;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "CATÁLOGO COMPLETO",
          style: TextStyle(color: Colors.white, fontSize: 16, letterSpacing: 2),
        ),
      ),
      body: SingleChildScrollView( // <-- Scroll solicitado
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Todas las Películas y Series",
              style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 30),
            // Usamos un Wrap para crear una cuadrícula flexible
            Wrap(
              spacing: 20,
              runSpacing: 30,
              children: allMovies.map((movie) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => DetailsPage(movie: movie)),
                    );
                  },
                  child: Column(
                    children: [
                      Container(
                        width: 170,
                        height: 250,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          image: DecorationImage(
                            image: NetworkImage(movie.poster),
                            fit: BoxFit.cover,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.3),
                              blurRadius: 10,
                              offset: const Offset(0, 5),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        width: 170,
                        child: Text(
                          movie.title,
                          textAlign: TextAlign.center,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}

// ============================================================
// 3. VISTA DE DETALLES (FINALIZADA)
// ============================================================
class DetailsPage extends StatelessWidget {
  final DisneyContent movie;

  const DetailsPage({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(backgroundColor: Colors.transparent),
      body: Stack(
        children: [
          // Fondo de la película (Backdrop)
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
          // Degradado para legibilidad del texto
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  Colors.black.withOpacity(0.9),
                  Colors.black.withOpacity(0.5),
                  Colors.transparent,
                ],
              ),
            ),
          ),
          // Información de la película
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
                Text(
                  movie.description,
                  style: const TextStyle(color: Colors.white70, fontSize: 18, height: 1.5),
                ),
                const SizedBox(height: 30),
                Text(
                  "Director: ${movie.director}",
                  style: const TextStyle(color: AppColors.disney_gold, fontSize: 16),
                ),
                const SizedBox(height: 40),
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.play_arrow, size: 30),
                  label: const Text('REPRODUCIR AHORA'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
                    padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
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