import 'package:flutter/material.dart';
import '../constants/colors.dart';

class Navbar extends StatefulWidget {
  final VoidCallback onSearchTap;
  final Function(String) onNavItemTap;

  const Navbar({
    Key? key,
    required this.onSearchTap,
    required this.onNavItemTap,
  }) : super(key: key);

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  String _selectedNav = 'Home';

  @override
  Widget build(BuildContext context) {
    final isDesktop = MediaQuery.of(context).size.width > 900;

    return Container(
      height: 70,
      color: AppColors.darkBg,
      padding: EdgeInsets.symmetric(
        horizontal: isDesktop ? 40 : 20,
        vertical: 10,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            flex: 1,
            child: Row(
              children: [
                Container(
                  width: 100, 
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Image.network(

                    'https://upload.wikimedia.org/wikipedia/commons/3/3e/Disney%2B_logo.svg',
                    fit: BoxFit.contain,
                    errorBuilder: (context, error, stackTrace) {
                      return Image.network(
                        'https://upload.wikimedia.org/wikipedia/commons/thumb/3/3e/Disney%2B_logo.svg/1280px-Disney%2B_logo.svg.png',
                        fit: BoxFit.contain,
                      );
                    },
                  ),
                ),
              ],
            ),
          ),

          if (isDesktop)
            Flexible(
              flex: 3,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildNavItem('Home'),
                  const SizedBox(width: 30),
                  _buildNavItem('Películas'),
                  const SizedBox(width: 30),
                  _buildNavItem('Series'),
                  const SizedBox(width: 30),
                  _buildNavItem('Música'),
                  const SizedBox(width: 30),
                  _buildNavItem('Espectáculos'),
                ],
              ),
            ),

          Flexible(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  width: 45,
                  height: 45,
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.grey, width: 1),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () {
                        widget.onSearchTap(); 
                      },
                      child: const Icon(
                        Icons.search,
                        color: AppColors.white,
                        size: 20,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 15),

                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.disney_blue,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () {
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: const [
                          Icon(
                            Icons.card_membership,
                            color: AppColors.white,
                            size: 16,
                          ),
                          SizedBox(width: 5),
                          Text(
                            'SUSCRIBIRSE',
                            style: TextStyle(
                              color: AppColors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 11,
                              letterSpacing: 0.5,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem(String label) {
    final isSelected = _selectedNav == label;

    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedNav = label;
        });
        widget.onNavItemTap(label); 
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            label,
            style: TextStyle(
              color: isSelected ? AppColors.disney_blue : AppColors.lightGrey,
              fontWeight: FontWeight.bold,
              fontSize: 13,
              letterSpacing: 0.5,
            ),
          ),
          if (isSelected)
            Container(
              width: 30,
              height: 2,
              margin: const EdgeInsets.only(top: 5),
              color: AppColors.disney_blue,
            ),
        ],
      ),
    );
  }
}