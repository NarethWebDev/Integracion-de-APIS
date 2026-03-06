import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

// Importaciones de tus archivos locales
import 'constants/colors.dart';
import 'widgets/navbar.dart';
import 'widgets/carousel_section.dart';
import 'widgets/new_movies_section.dart';
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
      title: 'Disney+ Clone',
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

  void _navigateToDetails(BuildContext context, DisneyContent movie) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => DetailsPage(movie: movie)),
    );
  }

  void _navigateToCatalog(BuildContext context, String type) {
    if (type == 'Personajes') {
      Navigator.push(context, MaterialPageRoute(builder: (context) => const CharactersPage()));
    } else {
      Navigator.push(context, MaterialPageRoute(builder: (context) => GenericCatalogPage(type: type)));
    }
  }

  @override
  Widget build(BuildContext context) {
    final featuredMovies = DisneyData.getFeatured();
    final allContent = DisneyData.allContent;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // NAVBAR CON LÓGICA DE NAVEGACIÓN COMPLETA
            Navbar(
              onSearchTap: () {},
              onNavItemTap: (navItem) {
                if (navItem == 'Películas' || navItem == 'Series' || navItem == 'Personajes') {
                  _navigateToCatalog(context, navItem);
                }
              },
            ),

            // CARRUSEL DE DESTACADOS
            CarouselSection(
              contents: featuredMovies,
              onContentSelected: (content) => _navigateToDetails(context, content),
            ),

            // SECCIÓN DE NOVEDADES
            NewMoviesSection(
              contents: allContent,
              onContentSelected: (content) => _navigateToDetails(context, content),
            ),

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
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('DISNEY+', style: TextStyle(color: AppColors.disney_blue, fontWeight: FontWeight.bold, fontSize: 18, letterSpacing: 3)),
          SizedBox(height: 15),
          Text('© 2024 Disney. Todos los derechos reservados. Aplicación de Práctica Profesional.', 
          style: TextStyle(color: AppColors.grey, fontSize: 12)),
        ],
      ),
    );
  }
}

// ============================================================
// 2. VISTA DE PERSONAJES (CON HERO PROMOCIONAL)
// ============================================================
class CharactersPage extends StatelessWidget {
  const CharactersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final characters = DisneyData.allCharacters;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(title: const Text("PERSONAJES", style: TextStyle(letterSpacing: 2, fontSize: 14))),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // HERO DE PROMOCIONES
            _buildPromoHero(),
            const SizedBox(height: 40),
            // GRID DE PERSONAJES
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Wrap(
                spacing: 20,
                runSpacing: 25,
                children: characters.map((char) => _buildCharacterCard(char)).toList(),
              ),
            ),
            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }

  Widget _buildPromoHero() {
    return Container(
      height: 500,
      width: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: NetworkImage('https://wallpaperaccess.com/full/1125206.jpg'), // Daredevil Promo
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [AppColors.darkBg2, Colors.transparent],
          ),
        ),
        padding: const EdgeInsets.all(60),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('PRÓXIMAMENTE', style: TextStyle(color: AppColors.disney_blue, fontWeight: FontWeight.bold)),
            const Text('DAREDEVIL: BORN AGAIN', style: TextStyle(color: Colors.white, fontSize: 45, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            const Text('La nueva serie original llega este año a Disney+.', style: TextStyle(color: Colors.white70, fontSize: 18)),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(backgroundColor: Colors.white, foregroundColor: Colors.black),
              child: const Text('MÁS INFORMACIÓN'),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildCharacterCard(DisneyCharacter char) {
    return Container(
      width: 160,
      decoration: BoxDecoration(color: const Color(0xFF232938), borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
            child: Image.network(char.imageUrl, height: 200, width: 160, fit: BoxFit.cover),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Text(char.name, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold), textAlign: TextAlign.center),
          ),
        ],
      ),
    );
  }
}

// ============================================================
// 3. CATÁLOGO GENÉRICO (PELÍCULAS O SERIES)
// ============================================================
class GenericCatalogPage extends StatelessWidget {
  final String type;
  const GenericCatalogPage({Key? key, required this.type}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String typeKey = type == 'Películas' ? 'movie' : 'series';
    final items = DisneyData.allContent.where((c) => c.type == typeKey).toList();

    return Scaffold(
      appBar: AppBar(title: Text(type.toUpperCase())),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(30),
        child: Wrap(
          spacing: 20,
          runSpacing: 30,
          children: items.map((item) => _buildMovieCard(context, item)).toList(),
        ),
      ),
    );
  }

  Widget _buildMovieCard(BuildContext context, DisneyContent item) {
    return GestureDetector(
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => DetailsPage(movie: item))),
      child: Column(
        children: [
          Container(
            width: 150,
            height: 220,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              image: DecorationImage(image: NetworkImage(item.poster), fit: BoxFit.cover),
            ),
          ),
          const SizedBox(height: 8),
          SizedBox(width: 150, child: Text(item.title, style: const TextStyle(color: Colors.white), textAlign: TextAlign.center, overflow: TextOverflow.ellipsis)),
        ],
      ),
    );
  }
}

// ============================================================
// 4. DETALLES Y REPRODUCTOR
// ============================================================
class DetailsPage extends StatelessWidget {
  final DisneyContent movie;
  const DetailsPage({Key? key, required this.movie}) : super(key: key);

  void _showPlayer(BuildContext context) {
    showDialog(
      context: context,
      barrierColor: Colors.black,
      builder: (context) => Dialog.fullscreen(
        backgroundColor: Colors.black,
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: IconButton(icon: const Icon(Icons.close, color: Colors.white, size: 40), onPressed: () => Navigator.pop(context)),
            ),
            Expanded(
              child: Center(
                child: AspectRatio(
                  aspectRatio: 16 / 9,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      CachedNetworkImage(imageUrl: movie.backdrop, fit: BoxFit.cover, width: double.infinity),
                      Container(color: Colors.black45),
                      const CircularProgressIndicator(color: AppColors.disney_blue),
                      const Positioned(bottom: 20, child: Text("REPRODUCIENDO CONTENIDO...", style: TextStyle(color: Colors.white, letterSpacing: 2))),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(backgroundColor: Colors.transparent),
      body: Stack(
        children: [
          Image.network(movie.backdrop, width: double.infinity, height: double.infinity, fit: BoxFit.cover),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [Colors.black.withOpacity(0.9), Colors.transparent],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 60),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(movie.type.toUpperCase(), style: const TextStyle(color: AppColors.disney_blue, fontWeight: FontWeight.bold)),
                Text(movie.title, style: const TextStyle(color: Colors.white, fontSize: 50, fontWeight: FontWeight.bold)),
                const SizedBox(height: 20),
                SizedBox(width: 500, child: Text(movie.description, style: const TextStyle(color: Colors.white70, fontSize: 18))),
                const SizedBox(height: 40),
                ElevatedButton.icon(
                  onPressed: () => _showPlayer(context),
                  icon: const Icon(Icons.play_arrow),
                  label: const Text("VER AHORA"),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.white, foregroundColor: Colors.black, padding: const EdgeInsets.all(20)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}