import 'package:flutter/material.dart';
import 'constants/colors.dart';
import 'widgets/navbar.dart';
import 'package:disney_app/widgets/carousel_section.dart';
import 'package:disney_app/widgets/new_movies_section.dart';
import 'data/disney_data.dart';

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
        ),
      ),
      home: const HomeScreenWithCarousel(),
    );
  }
}

// ============================================================
// PANTALLA CON CARRUSEL Y PELÍCULAS NUEVAS
// ============================================================

class HomeScreenWithCarousel extends StatelessWidget {
  const HomeScreenWithCarousel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Obtener películas destacadas y todas las películas
    final featuredMovies = DisneyData.getFeatured();
    final allMovies = DisneyData.allContent;

    return Scaffold(
      backgroundColor: AppColors.darkBg2,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Navbar(
              onSearchTap: () {
              },
              onNavItemTap: (navItem) {
              },
            ),

            CarouselSection(
              contents: featuredMovies,
              onContentSelected: (content) {
              },
            ),

            NewMoviesSection(
              contents: allMovies,
              onContentSelected: (content) {
              },
            ),

            Container(
              width: double.infinity,
              color: AppColors.darkBg2,
              padding: const EdgeInsets.symmetric(
                horizontal: 60,
                vertical: 30,
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'DISNEY',
                    style: TextStyle(
                      color: AppColors.disney_blue,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      letterSpacing: 2,
                    ),
                  ),
                  SizedBox(height: 15),
                  Text(
                    '© 2024 Disney. Todos los derechos reservados.',
                    style: TextStyle(
                      color: AppColors.darkGrey,
                      fontSize: 10,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}