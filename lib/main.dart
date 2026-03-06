import 'package:flutter/material.dart';
import 'constants/colors.dart';
import 'widgets/navbar.dart';

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
        scaffoldBackgroundColor: AppColors.darkBg,
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.darkBg,
          elevation: 0,
        ),
      ),
      home: const HomeScreenMinimal(),
    );
  }
}

class HomeScreenMinimal extends StatelessWidget {
  const HomeScreenMinimal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkBg,
      body: Column(
        children: [
          Navbar(
            onSearchTap: () {
            },
            onNavItemTap: (navItem) {
            },
          ),

          Expanded(
            child: Container(
              color: AppColors.darkBg,
            ),
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
    );
  }
}