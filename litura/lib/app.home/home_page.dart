import 'package:flutter/material.dart';
import 'package:litura/common_widgets/custom_art_card.dart';
import 'package:litura/api/api_get.dart';

class Loisir {
  final String type;
  final String nom;
  final String image;
  final double note;
  final String date;

  Loisir({
    required this.type,
    required this.nom,
    required this.image,
    required this.note,
    required this.date,
  });

  factory Loisir.fromJson(Map<String, dynamic> json) {
    return Loisir(
      type: json['loisir_type'],
      nom: json['loisir_nom'],
      image: json['loisir_image'],
      note: json['loisir_note'].toDouble(),
      date: json['createdAt'],
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Loisir> _topLoisirs = [];
  List<Loisir> _filteredLoisirs = [];
  List<String> _loisirTypes = [
    'manga',
    'film',
    'serie',
    'bande_dessine',
    'livre'
  ];
  String _selectedType = 'manga';

  @override
  void initState() {
    super.initState();
    _fetchTopLoisirs();
    _fetchLoisirsType(_selectedType);
  }

  void _fetchTopLoisirs() async {
    final loisirsData = await Gets.getLoisirTopFive();
    final loisirs =
        loisirsData.map<Loisir>((json) => Loisir.fromJson(json)).toList();
    setState(() {
      _topLoisirs = loisirs;
    });
  }

  void _fetchLoisirsType(String type) async {
    final loisirsData = await Gets.getLoisirTopFiveByType(
        type); 
    final loisirs =
        loisirsData.map<Loisir>((json) => Loisir.fromJson(json)).toList();
    setState(() {
      _filteredLoisirs = loisirs;
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
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20.0),
              const Center(
                child: Text(
                  'Top 5 des œuvres',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 20.0),
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: _topLoisirs.length,
                itemBuilder: (context, index) {
                  final loisir = _topLoisirs[index];
                  return CustomArtCard(
                    imageUrl: loisir.image,
                    title: loisir.nom,
                    category: loisir.type,
                    rating: loisir.note,
                    date: loisir.date,
                  );
                },
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 10),
              ),
              const SizedBox(height: 20.0),
              const Center(
                child: Text(
                  'Sélectionner un type',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 20.0),
              Center(
                child: DropdownButton<String>(
                  dropdownColor: const Color(0xff806491),
                  borderRadius: BorderRadius.circular(12),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'FiraSans',
                  ),
                  value: _selectedType,
                  items: _loisirTypes.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: TextStyle(
                          color: Color(0xffffffff),
                        ),
                      ),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      _selectedType = newValue!;
                      _fetchLoisirsType(_selectedType);
                    });
                  },
                ),
              ),
              const SizedBox(height: 20.0),
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: _filteredLoisirs.length,
                itemBuilder: (context, index) {
                  final loisir = _filteredLoisirs[index];
                  return CustomArtCard(
                    imageUrl: loisir.image,
                    title: loisir.nom,
                    category: loisir.type,
                    rating: loisir.note,
                    date: loisir.date,
                  );
                },
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 10),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
