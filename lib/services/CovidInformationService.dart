import 'dart:convert';
import 'package:http/http.dart' as http;

class CovidInformationService {
  var baseUrl = 'https://api.kawalcorona.com/indonesia/';

  Future<List<dynamic>> getCovidInformation() async {
    final response = await http.get(Uri.parse(baseUrl));

    if(response.statusCode == 200) return jsonDecode(response.body);
    else throw Exception('Gagal mengambil data');
  }
}