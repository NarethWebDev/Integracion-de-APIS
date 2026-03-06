import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
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
    if (widget.contents.isEmpty) {
      return Container(
        height: 500,
        color: AppColors.darkBg2,
        child: const Center(
          child: Text(
            'No hay contenido disponible',
            style: TextStyle(color: AppColors.white, fontSize: 18),
          ),
        ),
      );
    }

    final DisneyContent currentContent = widget.contents[_currentIndex];

    return Container(
      height: 550,
      color: AppColors.darkBg2,
      child: Stack(
        children: [
          // ============================================================
          // FONDO CON IMAGEN Y OVERLAY
          // ============================================================
          ShaderMask(
            shaderCallback: (bounds) {
              return LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  Colors.black.withOpacity(0.95),
                  Colors.black.withOpacity(0.7),
                  Colors.black.withOpacity(0.5),
                  Colors.transparent,
                ],
                stops: const [0.0, 0.2, 0.4, 1.0],
              ).createShader(bounds);
            },
            child: CachedNetworkImage(
              imageUrl: currentContent.poster,
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
              placeholder: (context, url) => Container(
                color: AppColors.darkGrey,
              ),
              errorWidget: (context, url, error) => Container(
                color: AppColors.darkGrey,
              ),
            ),
          ),

          // ============================================================
          // CONTENIDO A LA IZQUIERDA (TEXTO)
          // ============================================================
          Positioned(
            left: 60,
            top: 80,
            child: SizedBox(
              width: 500,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Etiqueta de fecha
                  const Text(
                    'PRÓXIMAMENTE',
                    style: TextStyle(
                      color: AppColors.disney_gold,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2,
                    ),
                  ),
                  const SizedBox(height: 10),

                  // Título
                  Text(
                    currentContent.title,
                    style: const TextStyle(
                      color: AppColors.white,
                      fontSize: 48,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1,
                      height: 1.2,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 20),

                  // Descripción
                  SizedBox(
                    width: 450,
                    child: Text(
                      currentContent.description,
                      style: const TextStyle(
                        color: AppColors.lightGrey,
                        fontSize: 15,
                        height: 1.5,
                      ),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(height: 30),

                  // Botón de promoción
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 30,
                      vertical: 12,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.disney_blue,
                      borderRadius: BorderRadius.circular(4),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.disney_blue.withOpacity(0.5),
                          blurRadius: 15,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.play_arrow,
                          color: AppColors.white,
                          size: 20,
                        ),
                        SizedBox(width: 10),
                        Text(
                          'VER AHORA',
                          style: TextStyle(
                            color: AppColors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 13,
                            letterSpacing: 1,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          // ============================================================
          // IMAGEN GRANDE A LA DERECHA
          // ============================================================
          Positioned(
            right: 60,
            top: 50,
            child: Container(
              width: 300,
              height: 450,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.5),
                    blurRadius: 20,
                    offset: const Offset(10, 10),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: CachedNetworkImage(
                  imageUrl: currentContent.poster,
                  fit: BoxFit.cover,
                  placeholder: (context, url) => Container(
                    color: AppColors.darkGrey,
                  ),
                  errorWidget: (context, url, error) => Container(
                    color: AppColors.darkGrey,
                  ),
                ),
              ),
            ),
          ),

          // ============================================================
          // INDICADORES ABAJO
          // ============================================================
          Positioned(
            bottom: 30,
            left: 60,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: List.generate(
                widget.contents.length,
                (index) => GestureDetector(
                  onTap: () {
                    setState(() {
                      _currentIndex = index;
                    });
                  },
                  child: Container(
                    width: _currentIndex == index ? 30 : 10,
                    height: 8,
                    margin: const EdgeInsets.symmetric(horizontal: 5),
                    decoration: BoxDecoration(
                      color: _currentIndex == index
                          ? AppColors.disney_blue
                          : AppColors.grey.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ),
              ),
            ),
          ),

          // ============================================================
          // BOTÓN SIGUIENTE (DERECHA)
          // ============================================================
          Positioned(
            right: 30,
            top: 250,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  _currentIndex = (_currentIndex + 1) % widget.contents.length;
                });
              },
              child: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: AppColors.disney_blue,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.disney_blue.withOpacity(0.5),
                      blurRadius: 15,
                    ),
                  ],
                ),
                child: const Icon(
                  Icons.arrow_forward,
                  color: AppColors.white,
                  size: 24,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}