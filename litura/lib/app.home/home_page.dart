import 'package:flutter/material.dart';
import 'package:litura/common_widgets/custom_book_card.dart';
import 'package:litura/api/api_get.dart';

class Loisir {
  final String type;
  final String nom;
  final String image;
  final double note;

  Loisir({
    required this.type,
    required this.nom,
    required this.image,
    required this.note,
  });

  factory Loisir.fromJson(Map<String, dynamic> json) {
    return Loisir(
      type: json['loisir_type'],
      nom: json['loisir_nom'],
      image: json['loisir_image'],
      note: json['loisir_note'].toDouble(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Loisir> _loisirs = [];

  @override
  void initState() {
    super.initState();
    _fetchLoisirs();
  }

  void _fetchLoisirs() async {
    final loisirsData = await Gets.getLoisirTopFive();
    final loisirs = loisirsData.map<Loisir>((json) => Loisir.fromJson(json)).toList();
    setState(() {
      _loisirs = loisirs;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff806491),
        title: const Text(
          'Litura',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 32.0,
            fontFamily: 'FiraSans',
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        color: const Color(0xFF2f70AF),
        child: Column(
          children: [
            const SizedBox(height: 20.0),
            const Center(
              child: Text(
                'Top 5 des oeuvres',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 20.0),
            Expanded(
              child: ListView.separated(
                itemCount: _loisirs.length,
                itemBuilder: (context, index) {
                  final loisir = _loisirs[index];
                  return CustomBookCard(
                    imageUrl: loisir.image,
                    title: loisir.nom,
                    category: loisir.type,
                    rating: loisir.note,
                  );
                },
                separatorBuilder: (context, index) => const SizedBox(height: 10),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

