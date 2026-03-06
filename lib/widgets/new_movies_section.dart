import 'package:flutter/material.dart';
import '../models/movie_model.dart';
import '../constants/colors.dart';

class NewMoviesSection extends StatefulWidget {
  final List<DisneyContent> contents;
  final Function(DisneyContent) onContentSelected;

  const NewMoviesSection({
    Key? key,
    required this.contents,
    required this.onContentSelected,
  }) : super(key: key);

  @override
  State<NewMoviesSection> createState() => _NewMoviesSectionState();
}

class _NewMoviesSectionState extends State<NewMoviesSection> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    if (widget.contents.isEmpty) return const SizedBox.shrink();

    final currentContent = widget.contents[_currentIndex];

    return Container(
      height: 550,
      color: AppColors.darkBg2,
      child: Stack(
        children: [
          // FONDO CON BLUR Y OVERLAY
          Positioned.fill(
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 500),
              child: Container(
                key: ValueKey<String>(currentContent.backdrop),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(currentContent.backdrop),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        AppColors.darkBg2.withOpacity(0.7),
                        AppColors.darkBg2,
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),

          // CONTENIDO CENTRAL
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'NUEVO EN DISNEY+',
                  style: TextStyle(
                    color: AppColors.disney_blue,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 4,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  currentContent.title.toUpperCase(),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 48,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 30),
                // BOTÓN VER AHORA CON CONEXIÓN
                GestureDetector(
                  onTap: () => widget.onContentSelected(currentContent),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                    decoration: BoxDecoration(
                      color: AppColors.disney_blue,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.play_arrow, color: Colors.white),
                        SizedBox(width: 10),
                        Text('VER AHORA', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          // BOTÓN ANTERIOR (IZQUIERDA) - RESTAURADO
          Positioned(
            left: 30,
            top: 250,
            child: IconButton(
              icon: const Icon(Icons.arrow_back_ios, color: Colors.white, size: 30),
              onPressed: () {
                setState(() {
                  _currentIndex = (_currentIndex - 1 + widget.contents.length) % widget.contents.length;
                });
              },
            ),
          ),

          // BOTÓN SIGUIENTE (DERECHA) - RESTAURADO
          Positioned(
            right: 30,
            top: 250,
            child: IconButton(
              icon: const Icon(Icons.arrow_forward_ios, color: Colors.white, size: 30),
              onPressed: () {
                setState(() {
                  _currentIndex = (_currentIndex + 1) % widget.contents.length;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}