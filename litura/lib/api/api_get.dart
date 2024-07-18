import 'dart:convert';
import 'package:http/http.dart' as http;

class Gets {
  static String baseUrl = "http://192.168.1.39:8001";

  static Future<List> getAllLoisir() async {
    try {
      var response = await http.get(Uri.parse('$baseUrl/loisir/all'));
      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        throw Exception('Erreur serveur');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  static Future<List> getLoisirById(id) async {
    try {
      var response = await http.get(Uri.parse('$baseUrl/loisir/$id'));
      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        throw Exception('Erreur serveur');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  static Future<List> getLoisirTopFive() async {
    try {
      var response = await http.get(Uri.parse('$baseUrl/loisir/topfive'));
      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        throw Exception('Erreur serveur');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  } 

  static Future<List> getLoisirTopFiveByType(type) async {
    try {
      var response = await http.get(Uri.parse('$baseUrl/loisir/topfive/$type'));
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