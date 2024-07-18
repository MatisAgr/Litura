import 'package:flutter/material.dart';
import 'package:litura/api/api_get.dart';

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
        child: ListView.builder(
          itemCount: _loisirs.length,
          itemBuilder: (context, index) {
            final loisir = _loisirs[index];
            return ListTile(
              title: Text(loisir.nom, style: const TextStyle(color: Colors.white)),
              subtitle: Text(loisir.description, style: const TextStyle(color: Colors.white70)),
              leading: Image.network(loisir.image, width: 50, height: 50),
              trailing: Text('${loisir.note}/5'),
            );
          },
        ),
      ),
    );
  }
}
