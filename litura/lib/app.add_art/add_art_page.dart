import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:litura/api/api_post.dart';

class AddArtPage extends StatefulWidget {
  const AddArtPage({  
    super.key});

  @override
  _AddArtPageState createState() => _AddArtPageState();
}

class _AddArtPageState extends State<AddArtPage> {
  final _formKey = GlobalKey<FormState>();
  String _title = '';
  String _image = '';
  String _category = '';
  String _description = '';
  double? _rating;

  Future<void> _submitForm() async {
    if (_formKey.currentState?.validate() ?? false) {
      _formKey.currentState?.save();

      final Map<String, dynamic> formData = {
        'loisir_type': _category,
        'loisir_nom': _title,
        'loisir_image': _image,
        'loisir_note': _rating,
        'loisir_description': _description,
      };

      try {
        var response = await Posts.createLoisir(
          formData['loisir_type'],
          formData['loisir_nom'],
          formData['loisir_image'],
          formData['loisir_note'],
          formData['loisir_description'],
        );

        if (response != null) {
          print('Données envoyées avec succès');
        } else {
          print('Erreur serveur lors de la création du Loisir');
        }
      } catch (e) {
        print('Erreur: $e');
      }
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff806491),
        title: const Text(
          'Ajouter une oeuvre',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 32.0,
            fontFamily: 'FiraSans',
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Titre',
                  border: OutlineInputBorder(),
                  hintText: "Email",
                ),
                onSaved: (value) {
                  _title = value!;
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez entrer un titre';
                  }
                  return null;
                },
              ),
              DropdownButtonFormField<String>(
                decoration: InputDecoration(labelText: 'Catégorie'),
                items: ['Film', 'Série', 'Roman', 'Manga'].map((String category) {
                  return DropdownMenuItem<String>(
                    value: category,
                    child: Text(category),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _category = value!;
                  });
                },
                onSaved: (value) {
                  _category = value!;
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez sélectionner une catégorie';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Description'),
                onSaved: (value) {
                  _description = value!;
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez entrer une description';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Note /5'),
                keyboardType: TextInputType.number,
                onSaved: (value) {
                  _rating = double.tryParse(value ?? '');
                },
                validator: (value) {
                  final rating = double.tryParse(value ?? '');
                  if (rating == null || rating < 0 || rating > 5) {
                    return 'Note valide entre 0 et 5';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'URL de \'image'),
                onSaved: (value) {
                  _image = value!;
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Entrer une URL d\'image';
                  }
                  return null;
                },
              ),
              ElevatedButton(
                onPressed: _submitForm,
                child: Text('Valider'),
              ),
            ],)
        )
      ),
    );
  }
}