import 'dart:convert';

import 'dataclass.dart';

import 'package:http/http.dart' as http;

class apiService {
  Future<Welcome> getAllData() async {
    final response = await http.get(
        Uri.parse('https://api-berita-indonesia.vercel.app/cnbc/terbaru/'));
    if (response.statusCode == 200) {
      Welcome jsonResponse = Welcome.fromJson(json.decode(response.body));
      return jsonResponse;
    } else {
      throw Exception('Failed to load Data');
    }
  }

  Future postPData(String plink, String ptitle, String ppubdate,
      String pdescription, String pthumbnail) async {
    final response = await http.post(
        Uri.parse('https://api-berita-indonesia.vercel.app/cnbc/terbaru/'),
        body: {
          "link": plink,
          "title": ptitle,
          "pubDate": ppubdate,
          "description": pdescription,
          "thumbnail": pthumbnail
        });
    if (response.statusCode == 201) {
      return true;
    } else {
      throw Exception('Failed to push Data');
    }
  }
}
