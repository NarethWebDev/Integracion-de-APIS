import 'dart:async';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../models/movie_model.dart';
import '../constants/colors.dart';

class CarouselSection extends StatefulWidget {
  final List<DisneyContent> contents;
  final Function(DisneyContent) onContentSelected;

  const CarouselSection({
    Key? key,
    required this.contents,
    required this.onContentSelected,
  }) : super(key: key);

  @override
  State<CarouselSection> createState() => _CarouselSectionState();
}

class _CarouselSectionState extends State<CarouselSection> {
  late PageController _pageController;
  int _currentIndex = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
    // Iniciar auto-play
    _startTimer();
  }

  @override
  void dispose() {
    _pageController.dispose();
    _timer?.cancel();
    super.dispose();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 5), (timer) {
      if (_currentIndex < widget.contents.length - 1) {
        _currentIndex++;
      } else {
        _currentIndex = 0;
      }
      _pageController.animateToPage(
        _currentIndex,
        duration: const Duration(milliseconds: 800),
        curve: Curves.easeInOutCubic,
      );
    });
  }

  void _onPageChanged(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

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

    return Container(
      height: 550,
      color: AppColors.darkBg2,
      child: Stack(
        children: [
          // ============================================================
          // NUEVO: FONDO CON IMAGEN DIFERENTE Y POCA OPACIDAD
          // ============================================================
          Positioned.fill(
            child: Opacity(
              opacity: 0.2, // <--- Ajusta aquí la opacidad (0.0 a 1.0)
              child: CachedNetworkImage(
                imageUrl: widget.contents[_currentIndex].backdrop, // Usamos la imagen de fondo
                fit: BoxFit.cover,
                errorWidget: (context, url, error) => Container(color: Colors.black),
              ),
            ),
          ),

          // OVERLAY GRADIENTE (Para asegurar que el texto se vea bien)
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                    AppColors.darkBg2.withOpacity(0.9),
                    AppColors.darkBg2.withOpacity(0.4),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ),
          // CARRUSEL DE PELÍCULAS
          PageView.builder(
            controller: _pageController,
            onPageChanged: _onPageChanged,
            itemCount: widget.contents.length,
            itemBuilder: (context, index) {
              final movie = widget.contents[index];
              final isActive = index == _currentIndex;
              return _buildCarouselItem(movie, isActive);
            },
          ),  
        ],
      ),
    );


  }

  Widget _buildCarouselItem(DisneyContent movie, bool isActive) {
    return Stack(
      children: [
        // FONDO DIFUMINADO
        ShaderMask(
          shaderCallback: (bounds) {
            return LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                Colors.black.withOpacity(0.95),
                Colors.black.withOpacity(0.7),
                Colors.black.withOpacity(0.4),
                Colors.transparent,
              ],
              stops: const [0.0, 0.3, 0.6, 1.0],
            ).createShader(bounds);
          },
          child: CachedNetworkImage(
            imageUrl: movie.poster,
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
        ),

        // TEXTO ANIMADO
        AnimatedPositioned(
          duration: const Duration(milliseconds: 600),
          left: isActive ? 60 : 20, // Efecto de desplazamiento al entrar
          top: 80,
          child: AnimatedOpacity(
            duration: const Duration(milliseconds: 600),
            opacity: isActive ? 0.5 : 0.0,
            child: SizedBox(
              width: 500,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'PRÓXIMAMENTE',
                    style: TextStyle(
                      color: Colors.amber, // He usado amber por AppColors.disney_gold
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    movie.title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 48,
                      fontWeight: FontWeight.bold,
                      height: 1.2,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    movie.description,
                    style: const TextStyle(color: Colors.white70, fontSize: 16),
                    maxLines: 3,
                  ),
                  const SizedBox(height: 30),
                  ElevatedButton.icon(
                    onPressed: () => widget.onContentSelected(movie),
                    icon: const Icon(Icons.play_arrow),
                    label: const Text('VER AHORA'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.disney_blue,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),

        // POSTER DERECHO ANIMADO
        AnimatedPositioned(
          duration: const Duration(milliseconds: 800),
          right: isActive ? 60 : -100, // Entra desde la derecha
          top: 50,
          child: AnimatedOpacity(
            duration: const Duration(milliseconds: 800),
            opacity: isActive ? 1.0 : 0.0,
            child: Container(
              width: 300,
              height: 450,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                boxShadow: [BoxShadow(color: Colors.black54, blurRadius: 20)],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: CachedNetworkImage(imageUrl: movie.poster, fit: BoxFit.cover),
              ),
            ),
          ),
        ),
      ],
    );
  }
}