import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  // Fetch some data from the API
  Future<List<dynamic>> fetchData() async {
    final url = Uri.parse('https://jsonplaceholder.typicode.com/posts'); // Example API endpoint

    final response = await http.get(url);

    if (response.statusCode == 200) {
      // If the server returns a 200 OK response, parse the JSON.
      return json.decode(response.body);
    } else {
      // If the server does not return a 200 OK response, throw an exception.
      throw Exception('Failed to load data');
    }
  }
}
