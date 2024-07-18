import 'dart:convert';
import 'package:http/http.dart' as http;

class Posts {
  static String baseUrl = "http://localhost:8001";

  static Future<List> createUser(user_nom, user_prenom, user_email, user_pass, user_type) async {
    try {
      var response = await http.post(
        Uri.parse('$baseUrl/user/create'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode(
          {
            'user_nom': user_nom,
            'user_prenom': user_prenom,
            'user_email': user_email,
            'user_pass': user_pass,
            'user_type': user_type,
          },
        ),
      );
      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        throw Exception('Erreur lors de la création du user');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  static Future<List> createLoisir(loisir_type, loisir_nom, loisir_image, loisir_note, loisir_description) async {
    try {
      var response = await http.post(
        Uri.parse('$baseUrl/loisir/create'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode(
          {
            'loisir_type': loisir_type,
            'loisir_nom': loisir_nom,
            'loisir_image': loisir_image,
            'loisir_note': loisir_note,
            'loisir_description': loisir_description,
          },
        ),
      );
      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        throw Exception('Erreur lors de la création du Loisir');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

}