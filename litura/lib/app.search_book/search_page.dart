import 'package:flutter/material.dart';
import 'package:litura/api/api_get.dart';
import 'package:litura/common_widgets/custom_book_card.dart';

class Loisir {
  final String type;
  final String nom;
  final String image;
  final double note;
  final String description;

  Loisir({
    required this.type,
    required this.nom,
    required this.image,
    required this.note,
    required this.description,
  });

  factory Loisir.fromJson(Map<String, dynamic> json) {
    return Loisir(
      type: json['loisir_type'],
      nom: json['loisir_nom'],
      image: json['loisir_image'],
      note: json['loisir_note'].toDouble(),
      description: json['loisir_description'],
    );
  }
}

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<Loisir> _loisirs = [];

  @override
  void initState() {
    super.initState();
    _fetchLoisirs();
  }

  void _fetchLoisirs() async {
    final loisirsData = await Gets.getAllLoisir();
    final loisirs =
        loisirsData.map<Loisir>((json) => Loisir.fromJson(json)).toList();
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
          'Rechercher',
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
    );
  }
}
