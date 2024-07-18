import 'dart:convert';
import 'package:http/http.dart' as http;

class Gets {
  static String baseUrl = "http://10.0.2.2:8000";

  static Future<List> postArt() async {
    try {
      var response = await http.get(Uri.parse('$baseUrl/loisir/create'));
      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        throw Exception('Erreur serveur');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  
}