import 'package:flutter/material.dart';
import 'package:litura/common_widgets/navbar.dart';
import 'package:litura/app.home/main_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mon app de fou',
      theme: ThemeData(
        // primaryColor: Colors.orange,
      ),
      home: MainPage(), // Utilisez MainScreen comme nouvelle page d'accueil
    );
  }
}

// Un nouveau widget qui contient votre Navbar et peut afficher différents écrans
class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0; // Index pour suivre l'onglet sélectionné

  // Liste des widgets à afficher pour chaque onglet
  final List<Widget> _widgetOptions = [
    MainPage(),
    // Ajoutez d'autres pages ici
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex), // Affiche le widget sélectionné
      ),
      bottomNavigationBar: Navbar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}

