import 'dart:convert';

import 'package:http/http.dart' as http;

class RestClient {
  final String baseUrl;

  RestClient([this.baseUrl = '']);

  Future<dynamic> get(String url, [bool jsonDecode = true]) async {
    http.Response res;

    try {
      res = await http.get(baseUrl + url);
    } catch (e) {
      print(e);
      throw e;
    }

    if (res.statusCode < 200 || res.statusCode >= 300) {
      throw new Exception('Request to $url unsuccessful: ${res.statusCode}');
    }

    if (res.body.isEmpty) {
      throw new Exception('Response body is empty');
    }

    if (!jsonDecode) {
      return res.body;
    }

    dynamic decoded = json.decode(res.body);

    if (decoded == null) {
      throw new Exception('Unable to decode JSON response');
    }

    return decoded;
  }
}
