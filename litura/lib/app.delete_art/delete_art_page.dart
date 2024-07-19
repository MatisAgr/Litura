import 'package:flutter/material.dart';
import 'package:litura/api/api_get.dart';
import 'package:litura/common_widgets/custom_text_button.dart';

class DeleteArtPage extends StatefulWidget {
  const DeleteArtPage({super.key});

  @override
  _DeleteArtPageState createState() => _DeleteArtPageState();
}

class _DeleteArtPageState extends State<DeleteArtPage> {
  final _formKey = GlobalKey<FormState>();
  String? _selectedLoisir;
  List _loisirs = [];

  @override
  void initState() {
    super.initState();
    _fetchLoisirs();
  }

  Future<void> _fetchLoisirs() async {
    try {
      var loisirs = await Gets.getAllLoisir();
      if (loisirs.isNotEmpty &&
          loisirs[0] is Map &&
          loisirs[0].containsKey('loisir_nom')) {
        setState(() {
          _loisirs = loisirs;
        });
      } else {
        print("La structure des données n'est pas celle attendue.");
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff806491),
        title: const Text(
          'Supprimer',
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
        color: Colors.black,
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Container(
                width: double.infinity,
                child: DropdownButtonFormField<String>(
                  value: _selectedLoisir,
                  isExpanded: true,
                  decoration: const InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(4.0)),
                    ),
                  ),
                  hint: const Text('Sélectionnez un loisir'),
                  items: _loisirs.map<DropdownMenuItem<String>>((loisir) {
                    return DropdownMenuItem<String>(
                      value: loisir['loisir_nom'],
                      child: Text(
                        loisir['loisir_nom'],
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 16.0,
                          fontFamily: 'Numans',
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      _selectedLoisir = value;
                    });
                  },
                  icon: const Icon(Icons.arrow_drop_down, color: Colors.black),
                  iconSize: 24,
                ),
              ),
              const SizedBox(height: 16.0),
              CustomTextButton(
                backgroundColor: const Color(0xff806491),
                txt: 'Supprimer',
                iconData: Icons.delete,
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
