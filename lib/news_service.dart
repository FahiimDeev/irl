// import 'dart:convert';
// import 'package:http/http.dart' as http;

// class NewsService {
//   final String apiKey = '34bc6949ec914acb86c49b4f9ed93ad3';
//   final String baseUrl = 'https://newsapi.org/v2/top-headlines?country=us&apiKey=';

//   Future<List<dynamic>> fetchNews() async {
//     final response = await http.get(Uri.parse('$baseUrl$apiKey'));

//     if (response.statusCode == 200) {
//       final data = json.decode(response.body);
//       return data['articles'];
//     } else {
//       throw Exception('Failed to load news');
//     }
//   }
// }

// ---------------------------------------------------------------------------

// class NewsService {
//   final String apiKey = '34bc6949ec914acb86c49b4f9ed93ad3'; // Replace with your API key
//   final String baseUrl = 'https://newsapi.org/v2/top-headlines?country=us&apiKey=';

//   Future<List<dynamic>> fetchNews({String? category}) async {
//     final url = category != null
//         ? '$baseUrl$apiKey&category=$category'
//         : '$baseUrl$apiKey';

//     final response = await http.get(Uri.parse(url));

//     if (response.statusCode == 200) {
//       final data = json.decode(response.body);
//       return data['articles'];
//     } else {
//       throw Exception('Failed to load news');
//     }
//   }
// }

// --------------------------------------------------------------------------------------------------------
// class NewsService {
//   final String apiKey = '34bc6949ec914acb86c49b4f9ed93ad3'; // Replace with your API key
//   final String baseUrl = 'https://newsapi.org/v2/';

//   Future<List<dynamic>> fetchNews({String? category, String? query}) async {
//     final url = query != null
//         ? '${baseUrl}everything?q=$query&apiKey=$apiKey'
//         : '${baseUrl}top-headlines?country=us&apiKey=$apiKey${category != null ? '&category=$category' : ''}';

//     final response = await http.get(Uri.parse(url));

//     if (response.statusCode == 200) {
//       final data = json.decode(response.body);
//       return data['articles'];
//     } else {
//       throw Exception('Failed to load news');
//     }
//   }
// }
// ----------------------------------------------------------------------------------------------------
// class NewsService {
//   final String apiKey = '34bc6949ec914acb86c49b4f9ed93ad3'; // Replace with your API key
//   final String baseUrl = 'https://newsapi.org/v2/';

//   Future<List<dynamic>> fetchNews({String? category, String? query}) async {
//     final url = query != null
//         ? '${baseUrl}everything?q=$query&apiKey=$apiKey'
//         : '${baseUrl}top-headlines?country=us&apiKey=$apiKey${category != null ? '&category=$category' : ''}';

//     final response = await http.get(Uri.parse(url));

//     if (response.statusCode == 200) {
//       final data = json.decode(response.body);
//       return data['articles'];
//     } else {
//       throw Exception('Failed to load news');
//     }
//   }
// }

import 'dart:convert';
import 'package:http/http.dart' as http;

class NewsService {
  final String apiKey = '34bc6949ec914acb86c49b4f9ed93ad3'; // Replace with your API key
  final String baseUrl = 'https://newsapi.org/v2/';
  final int pageSize = 10; // Number of articles per page

  Future<List<dynamic>> fetchNews({String? category, String? query, int page = 1}) async {
    final String url = query != null
        ? '${baseUrl}everything?q=${Uri.encodeComponent(query)}&page=$page&pageSize=$pageSize&apiKey=$apiKey'
        : '${baseUrl}top-headlines?country=us&page=$page&pageSize=$pageSize&apiKey=$apiKey${category != null ? '&category=$category' : ''}';

    print('Fetching news from: $url'); // Debugging: Check final API URL

    try {
      final response = await http.get(Uri.parse(url));
      print('Response Status Code: ${response.statusCode}'); // Debugging: Check API status

      if (response.statusCode == 200) {
        final data = json.decode(response.body);

        if (data.containsKey('articles') && data['articles'] != null) {
          print('Articles Found: ${data['articles'].length}'); // Debugging: Check articles count
          return data['articles'];
        } else {
          print('No articles found.');
          return [];
        }
      } else {
        print('Error: ${response.body}'); // Print API error response
        throw Exception('Failed to load news. Status Code: ${response.statusCode}');
      }
    } catch (e) {
      print('Exception: $e'); // Catch and print any errors
      throw Exception('An error occurred while fetching news');
    }
  }
}
