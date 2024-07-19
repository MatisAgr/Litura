import 'package:flutter/material.dart';
import 'package:litura/api/api_get.dart';
import 'package:litura/common_widgets/custom_book_card.dart';

class Loisir {
  final String type;
  final String nom;
  final String image;
  final double note;
  final String description;
  final String date;

  Loisir({
    required this.type,
    required this.nom,
    required this.image,
    required this.note,
    required this.description,
    required this.date,
  });

  factory Loisir.fromJson(Map<String, dynamic> json) {
    return Loisir(
      type: json['loisir_type'],
      nom: json['loisir_nom'],
      image: json['loisir_image'],
      note: json['loisir_note'].toDouble(),
      description: json['loisir_description'],
      date: json['createdAt'],
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
  List<Loisir> _filteredLoisirs = [];
  String _searchTerm = '';
  String _filterType = 'Nom';

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
      _filteredLoisirs = loisirs;
    });
  }

  void _searchAndFilterLoisirs() {
    List<Loisir> filtered = _loisirs.where((loisir) {
      final searchTermLower = _searchTerm.toLowerCase();
      final nomLower = loisir.nom.toLowerCase();
      final typeLower = loisir.type.toLowerCase();
      return nomLower.contains(searchTermLower) ||
          typeLower.contains(searchTermLower);
    }).toList();

    if (_filterType == 'Note') {
      filtered.sort((a, b) => b.note.compareTo(a.note));
    } else if (_filterType == 'Nom') {
      filtered.sort((a, b) => a.nom.compareTo(b.nom));
    } else if (_filterType == 'Catégorie') {
      filtered.sort((a, b) => a.type.compareTo(b.type));
    } else if (_filterType == 'Date') {
      filtered.sort((a, b) => a.date.compareTo(b.date));
    }

    setState(() {
      _filteredLoisirs = filtered;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff806491),
        title: const Text(
          'Rechercher',
          style: TextStyle(
            fontSize: 32.0,
            fontFamily: 'FiraSans',
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(120.0),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                TextFormField(
                  onChanged: (value) {
                    _searchTerm = value;
                    _searchAndFilterLoisirs();
                  },
                  decoration: InputDecoration(
                    hintText: 'Rechercher...',
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                DropdownButton<String>(
                  dropdownColor: const Color(0xff806491),
                  borderRadius: BorderRadius.circular(12),
                  value: _filterType,
                  onChanged: (value) {
                    if (value != null) {
                      _filterType = value;
                      _searchAndFilterLoisirs();
                    }
                  },
                  items: <String>['Nom', 'Note', 'Catégorie', 'Date']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value,
                          style: const TextStyle(
                            color: Colors.white
                          )
                      )
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        color: const Color(0xFF2f70AF),
        child: _filteredLoisirs.isEmpty
            ? const Center(child: CircularProgressIndicator())
            : ListView.separated(
                itemCount: _filteredLoisirs.length,
                itemBuilder: (context, index) {
                  final loisir = _filteredLoisirs[index];
                  return CustomBookCard(
                    imageUrl: loisir.image,
                    title: loisir.nom,
                    category: loisir.type,
                    rating: loisir.note,
                    date: loisir.date,
                  );
                },
                separatorBuilder: (context, index) => const SizedBox(height: 10),
              ),
      ),
    );
  }
}
