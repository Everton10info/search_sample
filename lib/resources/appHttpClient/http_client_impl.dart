import 'dart:convert';
import 'package:http/http.dart' as http;
import 'http_client_interface.dart';

class HtttpClientImpl implements AppHttpClient {
  final urlBase = 'https://jsonplaceholder.typicode.com/users';
  @override
  Future<List> getList() async {
    final response = await http.get(Uri.parse(urlBase));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception(response.statusCode);
    }
  }
}
