// import 'package:flutter/material.dart';
// import 'package:flutter_spinkit/flutter_spinkit.dart';
// import 'package:irl/news_service.dart';
// import 'article_detail_screen.dart';

// class HomeScreen extends StatefulWidget {
//   @override
//   _HomeScreenState createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   late Future<List<dynamic>> futureNews;
//   String? selectedCategory;
//   bool isDarkMode = false;

//   final List<String> categories = [
//     'business',
//     'entertainment',
//     'general',
//     'health',
//     'science',
//     'sports',
//     'technology',
//   ];

//   @override
//   void initState() {
//     super.initState();
//     futureNews = fetchNews();
//   }

//   Future<List<dynamic>> fetchNews() async {
//     return NewsService().fetchNews(category: selectedCategory);
//   }

//   Future<void> _refreshNews() async {
//     setState(() {
//       futureNews = fetchNews();
//     });
//   }

//   void _toggleDarkMode(bool value) {
//     setState(() {
//       isDarkMode = value;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       theme: isDarkMode ? ThemeData.dark() : ThemeData.light(),
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('News App'),
//           actions: [
//             DropdownButton<String>(
//               value: selectedCategory,
//               hint: Text('Category'),
//               onChanged: (String? newValue) {
//                 setState(() {
//                   selectedCategory = newValue;
//                   futureNews = fetchNews();
//                 });
//               },
//               items: categories.map<DropdownMenuItem<String>>((String value) {
//                 return DropdownMenuItem<String>(
//                   value: value,
//                   child: Text(value),
//                 );
//               }).toList(),
//             ),
//             Switch(
//               value: isDarkMode,
//               onChanged: _toggleDarkMode,
//             ),
//           ],
//         ),
//         body: RefreshIndicator(
//           onRefresh: _refreshNews,
//           child: FutureBuilder<List<dynamic>>(
//             future: futureNews,
//             builder: (context, snapshot) {
//               if (snapshot.connectionState == ConnectionState.waiting) {
//                 return Center(
//                   child: SpinKitCircle(
//                     color: Colors.blue,
//                     size: 50.0,
//                   ),
//                 );
//               } else if (snapshot.hasError) {
//                 return Center(
//                   child: Text('Error: ${snapshot.error}'),
//                 );
//               } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
//                 return Center(
//                   child: Text('No news available'),
//                 );
//               } else {
//                 return ListView.builder(
//                   itemCount: snapshot.data!.length,
//                   itemBuilder: (context, index) {
//                     final article = snapshot.data![index];
//                     return Card(
//                       margin: EdgeInsets.all(8.0),
//                       child: ListTile(
//                         contentPadding: EdgeInsets.all(8.0),
//                         leading: article['urlToImage'] != null
//                             ? ClipRRect(
//                                 borderRadius: BorderRadius.circular(8.0),
//                                 child: Image.network(
//                                   article['urlToImage'],
//                                   width: 100,
//                                   height: 100,
//                                   fit: BoxFit.cover,
//                                 ),
//                               )
//                             : Container(
//                                 width: 100,
//                                 height: 100,
//                                 color: Colors.grey[300],
//                                 child: Icon(Icons.image, color: Colors.grey[600]),
//                               ),
//                         title: Text(
//                           article['title'],
//                           style: TextStyle(
//                             fontWeight: FontWeight.bold,
//                             fontSize: 16,
//                           ),
//                         ),
//                         subtitle: Text(
//                           article['description'] ?? 'No description',
//                           maxLines: 2,
//                           overflow: TextOverflow.ellipsis,
//                         ),
//                         onTap: () {
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                               builder: (context) => ArticleDetailScreen(article: article),
//                             ),
//                           );
//                         },
//                       ),
//                     );
//                   },
//                 );
//               }
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:flutter_spinkit/flutter_spinkit.dart';
// import 'package:irl/news_service.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'article_detail_screen.dart';

// class HomeScreen extends StatefulWidget {
//   @override
//   _HomeScreenState createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   late Future<List<dynamic>> futureNews;
//   String? selectedCategory;
//   bool isDarkMode = false;

//   final List<String> categories = [
//     'business',
//     'entertainment',
//     'general',
//     'health',
//     'science',
//     'sports',
//     'technology',
//   ];

//   @override
//   void initState() {
//     super.initState();
//     _loadThemePreference();
//     futureNews = fetchNews();
//   }

//   Future<void> _loadThemePreference() async {
//     final prefs = await SharedPreferences.getInstance();
//     setState(() {
//       isDarkMode = prefs.getBool('isDarkMode') ?? false;
//     });
//   }

//   Future<void> _saveThemePreference(bool value) async {
//     final prefs = await SharedPreferences.getInstance();
//     prefs.setBool('isDarkMode', value);
//   }

//   Future<List<dynamic>> fetchNews() async {
//     return NewsService().fetchNews(category: selectedCategory);
//   }

//   Future<void> _refreshNews() async {
//     setState(() {
//       futureNews = fetchNews();
//     });
//   }

//   void _toggleDarkMode(bool value) {
//     setState(() {
//       isDarkMode = value;
//     });
//     _saveThemePreference(value);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       theme: isDarkMode ? ThemeData.dark() : ThemeData.light(),
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text(
//             'IRL',
//             style: TextStyle(
//               color: Colors.white,
//               fontWeight: FontWeight.bold
//             ),
//           ),
//           actions: [
//             DropdownButton<String>(
//               value: selectedCategory,
//               hint: Text('Category'),
//               onChanged: (String? newValue) {
//                 setState(() {
//                   selectedCategory = newValue;
//                   futureNews = fetchNews();
//                 });
//               },
//               items: categories.map<DropdownMenuItem<String>>((String value) {
//                 return DropdownMenuItem<String>(
//                   value: value,
//                   child: Text(value),
//                 );
//               }).toList(),
//             ),
//             Switch(
//               value: isDarkMode,
//               onChanged: _toggleDarkMode,
//             ),
//           ],
//         ),
//         body: RefreshIndicator(
//           onRefresh: _refreshNews,
//           child: FutureBuilder<List<dynamic>>(
//             future: futureNews,
//             builder: (context, snapshot) {
//               if (snapshot.connectionState == ConnectionState.waiting) {
//                 return Center(
//                   child: SpinKitCircle(
//                     color: Colors.blue,
//                     size: 50.0,
//                   ),
//                 );
//               } else if (snapshot.hasError) {
//                 return Center(
//                   child: Text('Error: ${snapshot.error}'),
//                 );
//               } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
//                 return Center(
//                   child: Text('No news available'),
//                 );
//               } else {
//                 return ListView.builder(
//                   itemCount: snapshot.data!.length,
//                   itemBuilder: (context, index) {
//                     final article = snapshot.data![index];
//                     return Card(
//                       margin: EdgeInsets.all(8.0),
//                       child: ListTile(
//                         contentPadding: EdgeInsets.all(8.0),
//                         leading: article['urlToImage'] != null
//                             ? ClipRRect(
//                                 borderRadius: BorderRadius.circular(8.0),
//                                 child: Image.network(
//                                   article['urlToImage'],
//                                   width: 100,
//                                   height: 100,
//                                   fit: BoxFit.cover,
//                                 ),
//                               )
//                             : Container(
//                                 width: 100,
//                                 height: 100,
//                                 color: Colors.grey[300],
//                                 child:
//                                     Icon(Icons.image, color: Colors.grey[600]),
//                               ),
//                         title: Text(
//                           article['title'],
//                           style: TextStyle(
//                             fontWeight: FontWeight.bold,
//                             fontSize: 16,
//                           ),
//                         ),
//                         subtitle: Text(
//                           article['description'] ?? 'No description',
//                           maxLines: 2,
//                           overflow: TextOverflow.ellipsis,
//                         ),
//                         onTap: () {
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                               builder: (context) =>
//                                   ArticleDetailScreen(article: article),
//                             ),
//                           );
//                         },
//                       ),
//                     );
//                   },
//                 );
//               }
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }
// ------------------------------------------------------------------------------------------
// import 'package:flutter/material.dart';
// import 'package:flutter_spinkit/flutter_spinkit.dart';
// import 'package:irl/news_service.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'article_detail_screen.dart';

// class HomeScreen extends StatefulWidget {
//   @override
//   _HomeScreenState createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   late Future<List<dynamic>> futureNews;
//   String? selectedCategory;
//   bool isDarkMode = false;

//   final List<String> categories = [
//     'business',
//     'entertainment',
//     'general',
//     'health',
//     'science',
//     'sports',
//     'technology',
//   ];

//   @override
//   void initState() {
//     super.initState();
//     _loadThemePreference();
//     futureNews = fetchNews();
//   }

//   Future<void> _loadThemePreference() async {
//     final prefs = await SharedPreferences.getInstance();
//     setState(() {
//       isDarkMode = prefs.getBool('isDarkMode') ?? false;
//     });
//   }

//   Future<void> _saveThemePreference(bool value) async {
//     final prefs = await SharedPreferences.getInstance();
//     prefs.setBool('isDarkMode', value);
//   }

//   Future<List<dynamic>> fetchNews({String? query}) async {
//     return NewsService().fetchNews(category: selectedCategory, query: query);
//   }

//   Future<void> _refreshNews() async {
//     setState(() {
//       futureNews = fetchNews();
//     });
//   }

//   void _toggleDarkMode(bool value) {
//     setState(() {
//       isDarkMode = value;
//     });
//     _saveThemePreference(value);
//   }

//   void _searchNews(String query) {
//     Future.microtask(() {
//       setState(() {
//         futureNews = fetchNews(query: query);
//       });
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       theme: isDarkMode ? ThemeData.dark() : ThemeData.light(),
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('News App'),
//           actions: [
//             IconButton(
//               icon: Icon(Icons.search),
//               onPressed: () {
//                 showSearch(
//                   context: context,
//                   delegate: NewsSearchDelegate(
//                     onSearch: _searchNews,
//                   ),
//                 );
//               },
//             ),
//             DropdownButton<String>(
//               value: selectedCategory,
//               hint: Text('Category'),
//               onChanged: (String? newValue) {
//                 setState(() {
//                   selectedCategory = newValue;
//                   futureNews = fetchNews();
//                 });
//               },
//               items: categories.map<DropdownMenuItem<String>>((String value) {
//                 return DropdownMenuItem<String>(
//                   value: value,
//                   child: Text(value),
//                 );
//               }).toList(),
//             ),
//             Switch(
//               value: isDarkMode,
//               onChanged: _toggleDarkMode,
//             ),
//           ],
//         ),
//         body: RefreshIndicator(
//           onRefresh: _refreshNews,
//           child: FutureBuilder<List<dynamic>>(
//             future: futureNews,
//             builder: (context, snapshot) {
//               if (snapshot.connectionState == ConnectionState.waiting) {
//                 return Center(
//                   child: SpinKitCircle(
//                     color: Colors.blue,
//                     size: 50.0,
//                   ),
//                 );
//               } else if (snapshot.hasError) {
//                 return Center(
//                   child: Text('Error: ${snapshot.error}'),
//                 );
//               } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
//                 return Center(
//                   child: Text('No news available'),
//                 );
//               } else {
//                 return ListView.builder(
//                   itemCount: snapshot.data!.length,
//                   itemBuilder: (context, index) {
//                     final article = snapshot.data![index];
//                     return Card(
//                       margin: EdgeInsets.all(8.0),
//                       child: ListTile(
//                         contentPadding: EdgeInsets.all(8.0),
//                         leading: article['urlToImage'] != null
//                             ? ClipRRect(
//                                 borderRadius: BorderRadius.circular(8.0),
//                                 child: Image.network(
//                                   article['urlToImage'],
//                                   width: 100,
//                                   height: 100,
//                                   fit: BoxFit.cover,
//                                 ),
//                               )
//                             : Container(
//                                 width: 100,
//                                 height: 100,
//                                 color: Colors.grey[300],
//                                 child: Icon(Icons.image, color: Colors.grey[600]),
//                               ),
//                         title: Text(
//                           article['title'],
//                           style: TextStyle(
//                             fontWeight: FontWeight.bold,
//                             fontSize: 16,
//                           ),
//                         ),
//                         subtitle: Text(
//                           article['description'] ?? 'No description',
//                           maxLines: 2,
//                           overflow: TextOverflow.ellipsis,
//                         ),
//                         onTap: () {
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                               builder: (context) => ArticleDetailScreen(article: article),
//                             ),
//                           );
//                         },
//                       ),
//                     );
//                   },
//                 );
//               }
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }

// class NewsSearchDelegate extends SearchDelegate<String> {
//   final Function(String) onSearch;

//   NewsSearchDelegate({required this.onSearch});

//   @override
//   List<Widget> buildActions(BuildContext context) {
//     return [
//       IconButton(
//         icon: Icon(Icons.clear),
//         onPressed: () {
//           query = '';
//         },
//       ),
//     ];
//   }

//   @override
//   Widget buildLeading(BuildContext context) {
//     return IconButton(
//       icon: Icon(Icons.arrow_back),
//       onPressed: () {
//         close(context, ''); // Properly close the search delegate
//       },
//     );
//   }

//   @override
//   Widget buildResults(BuildContext context) {
//     onSearch(query); // Trigger the search
//     return Container(); // Results are shown in the home screen
//   }

//   @override
//   Widget buildSuggestions(BuildContext context) {
//     return Container(); // No suggestions for now
//   }
// }


// ____________________ with just search function, works fine _____________________________
// import 'package:flutter/material.dart';
// import 'news_service.dart'; // Import your news service

// class HomeScreen extends StatefulWidget {
//   @override
//   _HomeScreenState createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   final TextEditingController _searchController = TextEditingController();
//   final NewsService _newsService = NewsService();
//   List<dynamic> _articles = []; // To store fetched news
//   bool _isLoading = false;
//   bool _isSearching = false;

//   @override
//   void initState() {
//     super.initState();
//     _fetchTopHeadlines(); // Fetch top news initially
//   }

//   void _fetchTopHeadlines() async {
//     setState(() => _isLoading = true);
//     try {
//       List<dynamic> news = await _newsService.fetchNews();
//       setState(() {
//         _articles = news;
//         _isLoading = false;
//       });
//     } catch (e) {
//       setState(() => _isLoading = false);
//       print("Error fetching headlines: $e");
//     }
//   }

//   void _searchNews() async {
//     String query = _searchController.text.trim();
//     if (query.isNotEmpty) {
//       setState(() {
//         _isSearching = true;
//         _isLoading = true;
//       });

//       try {
//         List<dynamic> searchResults = await _newsService.fetchNews(query: query);
//         setState(() {
//           _articles = searchResults;
//           _isLoading = false;
//         });
//       } catch (e) {
//         setState(() => _isLoading = false);
//         print("Error searching news: $e");
//       }
//     } else {
//       _fetchTopHeadlines(); // Reset to top headlines if search is cleared
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: TextField(
//           controller: _searchController,
//           decoration: InputDecoration(
//             hintText: 'Search news...',
//             border: InputBorder.none,
//           ),
//           onChanged: (value) {
//             if (value.isEmpty) _fetchTopHeadlines(); // Reset when cleared
//           },
//           onSubmitted: (value) => _searchNews(),
//         ),
//         actions: [
//           IconButton(
//             icon: Icon(Icons.search),
//             onPressed: _searchNews,
//           ),
//         ],
//       ),
//       body: _isLoading
//           ? Center(child: CircularProgressIndicator()) // Show loading spinner
//           : _articles.isEmpty
//               ? Center(child: Text('No news found'))
//               : ListView.builder(
//                   itemCount: _articles.length,
//                   itemBuilder: (context, index) {
//                     final article = _articles[index];
//                     return Card(
//                       margin: EdgeInsets.all(10),
//                       child: ListTile(
//                         leading: article['urlToImage'] != null
//                             ? Image.network(article['urlToImage'], width: 100, fit: BoxFit.cover)
//                             : Icon(Icons.image_not_supported),
//                         title: Text(article['title'] ?? 'No Title'),
//                         subtitle: Text(article['description'] ?? 'No Description'),
//                       ),
//                     );
//                   },
//                 ),
//     );
//   }
// }

// -----------------------------------------------------------------------------------
// import 'package:flutter/material.dart';
// import 'news_service.dart'; 

// class HomeScreen extends StatefulWidget {
//   @override
//   _HomeScreenState createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   final TextEditingController _searchController = TextEditingController();
//   final NewsService _newsService = NewsService();

//   List<dynamic> _articles = [];
//   bool _isLoading = false;
//   bool _isSearching = false;
//   bool _isDarkMode = false;
//   String _selectedCategory = "general"; // Default category

//   final List<String> categories = [
//     "general",
//     "business",
//     "entertainment",
//     "health",
//     "science",
//     "sports",
//     "technology"
//   ];

//   @override
//   void initState() {
//     super.initState();
//     _fetchNews(); // Fetch news on start
//   }

//   void _fetchNews({String? query, String? category}) async {
//     setState(() => _isLoading = true);
//     try {
//       List<dynamic> news = await _newsService.fetchNews(
//         query: query,
//         category: category ?? _selectedCategory,
//       );
//       setState(() {
//         _articles = news;
//         _isLoading = false;
//       });
//     } catch (e) {
//       setState(() => _isLoading = false);
//       print("Error fetching news: $e");
//     }
//   }

//   void _toggleDarkMode() {
//     setState(() {
//       _isDarkMode = !_isDarkMode;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       theme: _isDarkMode ? ThemeData.dark() : ThemeData.light(),
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text("IRL", style: TextStyle(fontWeight: FontWeight.bold)),
//           actions: [
//             IconButton(
//               icon: Icon(_isDarkMode ? Icons.dark_mode : Icons.light_mode),
//               onPressed: _toggleDarkMode,
//             ),
//           ],
//         ),
//         body: Column(
//           children: [
//             // Search Bar
//             Padding(
//               padding: EdgeInsets.all(10),
//               child: TextField(
//                 controller: _searchController,
//                 decoration: InputDecoration(
//                   hintText: 'Search news...',
//                   prefixIcon: Icon(Icons.search),
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                 ),
//                 onSubmitted: (value) => _fetchNews(query: value),
//               ),
//             ),

//             // Category Selector
//             SizedBox(
//               height: 40,
//               child: ListView(
//                 scrollDirection: Axis.horizontal,
//                 children: categories.map((category) {
//                   return GestureDetector(
//                     onTap: () {
//                       setState(() => _selectedCategory = category);
//                       _fetchNews(category: category);
//                     },
//                     child: Container(
//                       padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
//                       margin: EdgeInsets.symmetric(horizontal: 5),
//                       decoration: BoxDecoration(
//                         color: _selectedCategory == category ? Colors.blue : Colors.grey[300],
//                         borderRadius: BorderRadius.circular(20),
//                       ),
//                       child: Text(
//                         category.toUpperCase(),
//                         style: TextStyle(
//                           color: _selectedCategory == category ? Colors.white : Colors.black,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ),
//                   );
//                 }).toList(),
//               ),
//             ),

//             Expanded(
//               child: _isLoading
//                   ? Center(child: CircularProgressIndicator())
//                   : _articles.isEmpty
//                       ? Center(child: Text('No news found'))
//                       : ListView.builder(
//                           itemCount: _articles.length,
//                           itemBuilder: (context, index) {
//                             final article = _articles[index];
//                             return Card(
//                               margin: EdgeInsets.all(10),
//                               child: ListTile(
//                                 leading: article['urlToImage'] != null
//                                     ? Image.network(article['urlToImage'], width: 100, fit: BoxFit.cover)
//                                     : Icon(Icons.image_not_supported),
//                                 title: Text(article['title'] ?? 'No Title'),
//                                 subtitle: Text(article['description'] ?? 'No Description'),
//                               ),
//                             );
//                           },
//                         ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:irl/article_detail_screen.dart';
// import 'package:irl/news_service.dart';
// import 'package:irl/theme_provider.dart';
// import 'package:provider/provider.dart';

// class HomeScreen extends StatefulWidget {
//   @override
//   _HomeScreenState createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   final NewsService _newsService = NewsService();
//   List<dynamic> _articles = [];
//   String _selectedCategory = 'general';
//   String _searchQuery = '';
//   TextEditingController _searchController = TextEditingController();
  
//   int _currentPage = 1;
//   bool _isLoading = false;
//   bool _hasMoreData = true;
//   final ScrollController _scrollController = ScrollController();

//   @override
//   void initState() {
//     super.initState();
//     _fetchNews();

//     // Listen for scroll events
//     _scrollController.addListener(() {
//       if (_scrollController.position.pixels >= _scrollController.position.maxScrollExtent - 200) {
//         _loadMoreNews();
//       }
//     });
//   }

//   Future<void> _fetchNews({bool isLoadMore = false}) async {
//     if (_isLoading) return;

//     setState(() {
//       _isLoading = true;
//     });

//     try {
//       final articles = await _newsService.fetchNews(
//         category: _selectedCategory,
//         query: _searchQuery.isNotEmpty ? _searchQuery : null,
//         page: _currentPage,
//       );

//       setState(() {
//         if (articles.isEmpty) {
//           _hasMoreData = false;
//         } else {
//           if (isLoadMore) {
//             _articles.addAll(articles);
//           } else {
//             _articles = articles;
//           }
//         }
//       });
//     } catch (e) {
//       print('Error fetching news: $e');
//     } finally {
//       setState(() {
//         _isLoading = false;
//       });
//     }
//   }

//   void _loadMoreNews() {
//     if (!_hasMoreData || _isLoading) return;
//     _currentPage++;
//     _fetchNews(isLoadMore: true);
//   }

//   void _onCategoryChanged(String category) {
//     setState(() {
//       _selectedCategory = category;
//       _currentPage = 1;
//       _hasMoreData = true;
//     });
//     _fetchNews();
//   }

//   void _onSearch() {
//     setState(() {
//       _searchQuery = _searchController.text;
//       _currentPage = 1;
//       _hasMoreData = true;
//     });
//     _fetchNews();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final themeProvider = Provider.of<ThemeProvider>(context);

//     return Scaffold(
//       appBar: AppBar(
//         title: Text("IRL", style: TextStyle(fontWeight: FontWeight.bold)),
//         actions: [
//           Switch(
//             value: themeProvider.isDarkMode,
//             onChanged: (value) {
//               themeProvider.toggleTheme();
//             },
//           ),
//         ],
//       ),
//       body: Column(
//         children: [
//           // Search Bar
//           Padding(
//             padding: EdgeInsets.all(8.0),
//             child: TextField(
//               controller: _searchController,
//               decoration: InputDecoration(
//                 hintText: "Search news...",
//                 prefixIcon: Icon(Icons.search),
//                 suffixIcon: IconButton(
//                   icon: Icon(Icons.clear),
//                   onPressed: () {
//                     _searchController.clear();
//                     setState(() {
//                       _searchQuery = '';
//                     });
//                     _fetchNews();
//                   },
//                 ),
//                 border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
//               ),
//               onSubmitted: (value) => _onSearch(),
//             ),
//           ),

//           // Category Selector
//           SingleChildScrollView(
//             scrollDirection: Axis.horizontal,
//             padding: EdgeInsets.symmetric(horizontal: 8),
//             child: Row(
//               children: [
//                 _buildCategoryButton('general'),
//                 _buildCategoryButton('business'),
//                 _buildCategoryButton('technology'),
//                 _buildCategoryButton('entertainment'),
//                 _buildCategoryButton('sports'),
//                 _buildCategoryButton('health'),
//                 _buildCategoryButton('science'),
//               ],
//             ),
//           ),

//           // News List
//           Expanded(
//             child: _articles.isEmpty && !_isLoading
//                 ? Center(child: Text("No news found"))
//                 : ListView.builder(
//                     controller: _scrollController,
//                     itemCount: _articles.length + 1, // Extra item for loading indicator
//                     itemBuilder: (context, index) {
//                       if (index < _articles.length) {
//                         return _buildNewsCard(_articles[index], context);
//                       } else {
//                         return _hasMoreData
//                             ? Center(child: Padding(
//                                 padding: EdgeInsets.all(10),
//                                 child: CircularProgressIndicator(),
//                               ))
//                             : SizedBox.shrink();
//                       }
//                     },
//                   ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildCategoryButton(String category) {
//     return Padding(
//       padding: EdgeInsets.symmetric(horizontal: 4),
//       child: ElevatedButton(
//         onPressed: () => _onCategoryChanged(category),
//         style: ElevatedButton.styleFrom(
//           backgroundColor: _selectedCategory == category ? Colors.blue : Colors.grey,
//         ),
//         child: Text(category.toUpperCase(), style: TextStyle(color: Colors.black)),
//       ),
//     );
//   }

//   Widget _buildNewsCard(Map<String, dynamic> article, BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         Navigator.push(
//           context,
//           MaterialPageRoute(
//             builder: (context) => ArticleDetailScreen(article: article),
//           ),
//         );
//       },
//       child: Card(
//         margin: EdgeInsets.all(10),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             if (article['urlToImage'] != null)
//               ClipRRect(
//                 borderRadius: BorderRadius.vertical(top: Radius.circular(8)),
//                 child: Image.network(
//                   article['urlToImage'],
//                   width: double.infinity,
//                   height: 200,
//                   fit: BoxFit.cover,
//                 ),
//               ),
//             Padding(
//               padding: EdgeInsets.all(8),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     article['title'] ?? 'No Title',
//                     style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                   ),
//                   SizedBox(height: 4),
//                   Text(
//                     article['source']?['name'] ?? 'Unknown Source',
//                     style: TextStyle(color: Colors.grey),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//------------------------------------------------------------------------------------------
// import 'package:flutter/material.dart';
// import 'package:irl/article_detail_screen.dart';
// import 'package:irl/news_service.dart';
// import 'package:irl/theme_provider.dart';
// import 'package:provider/provider.dart';

// class HomeScreen extends StatefulWidget {
//   @override
//   _HomeScreenState createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   final NewsService _newsService = NewsService();
//   List<dynamic> _articles = [];
//   String _selectedCategory = 'general';
//   String _searchQuery = '';
//   TextEditingController _searchController = TextEditingController();
//   ScrollController _scrollController = ScrollController();
//   int _page = 1;
//   bool _isLoadingMore = false;

//   @override
//   void initState() {
//     super.initState();
//     _fetchNews();
//     _scrollController.addListener(_scrollListener);
//   }

//   @override
//   void dispose() {
//     _scrollController.dispose();
//     super.dispose();
//   }

//   Future<void> _fetchNews({bool isLoadMore = false}) async {
//     if (isLoadMore) {
//       setState(() {
//         _isLoadingMore = true;
//       });
//     }
//     try {
//       final articles = await _newsService.fetchNews(
//         category: _selectedCategory,
//         query: _searchQuery.isNotEmpty ? _searchQuery : null,
//         page: _page,
//       );
//       setState(() {
//         if (isLoadMore) {
//           _articles.addAll(articles);
//           _isLoadingMore = false;
//         } else {
//           _articles = articles;
//         }
//       });
//     } catch (e) {
//       print('Error fetching news: $e');
//     }
//   }

//   void _scrollListener() {
//     if (_scrollController.position.pixels >= _scrollController.position.maxScrollExtent - 200 && !_isLoadingMore) {
//       _page++;
//       _fetchNews(isLoadMore: true);
//     }
//   }

//   void _onCategoryChanged(String category) {
//     setState(() {
//       _selectedCategory = category;
//       _page = 1;
//     });
//     _fetchNews();
//   }

//   void _onSearch() {
//     setState(() {
//       _searchQuery = _searchController.text;
//       _page = 1;
//     });
//     _fetchNews();
//   }

//   void _openSettingsDialog(BuildContext context, ThemeProvider themeProvider) {
//     Color selectedColor = themeProvider.accentColor;
//     showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: Text("Settings"),
//           content: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text("Dark Mode"),
//                   Switch(
//                     value: themeProvider.isDarkMode,
//                     onChanged: (value) {
//                       themeProvider.toggleTheme();
//                       Navigator.pop(context);
//                     },
//                   ),
//                 ],
//               ),
//               SizedBox(height: 10),
//               Text("Accent Color"),
//               Wrap(
//                 spacing: 8,
//                 children: [
//                   Colors.red, Colors.green, Colors.blue, Colors.orange, Colors.purple
//                 ].map((color) {
//                   return GestureDetector(
//                     onTap: () {
//                       themeProvider.setAccentColor(color);
//                       setState(() {
//                         selectedColor = color;
//                       });
//                     },
//                     child: Container(
//                       width: 30,
//                       height: 30,
//                       decoration: BoxDecoration(
//                         color: color,
//                         shape: BoxShape.circle,
//                         border: Border.all(
//                           color: selectedColor == color ? Colors.black : Colors.transparent,
//                           width: 2,
//                         ),
//                       ),
//                     ),
//                   );
//                 }).toList(),
//               ),
//             ],
//           ),
//           actions: [
//             TextButton(
//               onPressed: () => Navigator.pop(context),
//               child: Text("Close"),
//             ),
//           ],
//         );
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     final themeProvider = Provider.of<ThemeProvider>(context);

//     return Scaffold(
//       appBar: AppBar(
//         title: Text("IRL News", style: TextStyle(fontWeight: FontWeight.bold)),
//         actions: [
//           IconButton(
//             icon: Icon(Icons.settings),
//             onPressed: () => _openSettingsDialog(context, themeProvider),
//           ),
//         ],
//       ),
//       body: Column(
//         children: [
//           Padding(
//             padding: EdgeInsets.all(8.0),
//             child: TextField(
//               controller: _searchController,
//               decoration: InputDecoration(
//                 hintText: "Search news...",
//                 prefixIcon: Icon(Icons.search),
//                 suffixIcon: IconButton(
//                   icon: Icon(Icons.clear),
//                   onPressed: () {
//                     _searchController.clear();
//                     setState(() {
//                       _searchQuery = '';
//                     });
//                     _fetchNews();
//                   },
//                 ),
//                 border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
//               ),
//               onSubmitted: (value) => _onSearch(),
//             ),
//           ),
//           SingleChildScrollView(
//             scrollDirection: Axis.horizontal,
//             padding: EdgeInsets.symmetric(horizontal: 8),
//             child: Row(
//               children: [
//                 _buildCategoryButton('general'),
//                 _buildCategoryButton('business'),
//                 _buildCategoryButton('technology'),
//                 _buildCategoryButton('entertainment'),
//                 _buildCategoryButton('sports'),
//                 _buildCategoryButton('health'),
//                 _buildCategoryButton('science'),
//               ],
//             ),
//           ),
//           Expanded(
//             child: _articles.isEmpty
//                 ? Center(child: CircularProgressIndicator())
//                 : ListView.builder(
//                     controller: _scrollController,
//                     itemCount: _articles.length + (_isLoadingMore ? 1 : 0),
//                     itemBuilder: (context, index) {
//                       if (index == _articles.length) {
//                         return Center(child: CircularProgressIndicator());
//                       }
//                       final article = _articles[index];
//                       return _buildNewsCard(article, context);
//                     },
//                   ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildCategoryButton(String category) {
//     return Padding(
//       padding: EdgeInsets.symmetric(horizontal: 4),
//       child: ElevatedButton(
//         onPressed: () => _onCategoryChanged(category),
//         style: ElevatedButton.styleFrom(
//           backgroundColor: _selectedCategory == category ? Colors.blue : Colors.grey,
//         ),
//         child: Text(category.toUpperCase(), style: TextStyle(color: Colors.black)),
//       ),
//     );
//   }

//   Widget _buildNewsCard(Map<String, dynamic> article, BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         Navigator.push(
//           context,
//           MaterialPageRoute(
//             builder: (context) => ArticleDetailScreen(article: article),
//           ),
//         );
//       },
//       child: Card(
//         margin: EdgeInsets.all(8),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             if (article['urlToImage'] != null)
//               ClipRRect(
//                 borderRadius: BorderRadius.vertical(top: Radius.circular(8)),
//                 child: Image.network(
//                   article['urlToImage'],
//                   width: double.infinity,
//                   height: 200,
//                   fit: BoxFit.cover,
//                 ),
//               ),
//             Padding(
//               padding: EdgeInsets.all(8),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     article['title'] ?? 'No Title',
//                     style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                   ),
//                   SizedBox(height: 4),
//                   Text(
//                     article['source']?['name'] ?? 'Unknown Source',
//                     style: TextStyle(color: Colors.grey),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
// // -----------------------------------------------------------------
// import 'package:flutter/material.dart';
// import 'package:irl/article_detail_screen.dart';
// import 'package:irl/news_service.dart';
// import 'package:irl/theme_provider.dart';
// import 'package:provider/provider.dart';

// class HomeScreen extends StatefulWidget {
//   @override
//   _HomeScreenState createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   final NewsService _newsService = NewsService();
//   List<dynamic> _articles = [];
//   String _selectedCategory = 'general';
//   String _searchQuery = '';
//   TextEditingController _searchController = TextEditingController();
//   ScrollController _scrollController = ScrollController();
//   int _page = 1;
//   bool _isLoadingMore = false;

//   @override
//   void initState() {
//     super.initState();
//     _fetchNews();
//     _scrollController.addListener(_scrollListener);
//   }

//   @override
//   void dispose() {
//     _scrollController.dispose();
//     super.dispose();
//   }

//   Future<void> _fetchNews({bool isLoadMore = false}) async {
//     if (isLoadMore) {
//       setState(() {
//         _isLoadingMore = true;
//       });
//     }
//     try {
//       final articles = await _newsService.fetchNews(
//         category: _selectedCategory,
//         query: _searchQuery.isNotEmpty ? _searchQuery : null,
//         page: _page,
//       );
//       setState(() {
//         if (isLoadMore) {
//           _articles.addAll(articles);
//           _isLoadingMore = false;
//         } else {
//           _articles = articles;
//         }
//       });
//     } catch (e) {
//       print('Error fetching news: $e');
//     }
//   }

//   void _scrollListener() {
//     if (_scrollController.position.pixels >= _scrollController.position.maxScrollExtent - 200 && !_isLoadingMore) {
//       _page++;
//       _fetchNews(isLoadMore: true);
//     }
//   }

//   void _onCategoryChanged(String category) {
//     setState(() {
//       _selectedCategory = category;
//       _page = 1;
//     });
//     _fetchNews();
//   }

//   void _onSearch() {
//     setState(() {
//       _searchQuery = _searchController.text;
//       _page = 1;
//     });
//     _fetchNews();
//   }

//   void _openSettingsDialog(BuildContext context, ThemeProvider themeProvider) {
//     Color selectedColor = themeProvider.accentColor;
//     showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: Text("Settings"),
//           content: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text("Dark Mode"),
//                   Switch(
//                     value: themeProvider.isDarkMode,
//                     onChanged: (value) {
//                       themeProvider.toggleTheme();
//                       Navigator.pop(context);
//                     },
//                   ),
//                 ],
//               ),
//               SizedBox(height: 10),
//               Text("Accent Color"),
//               Wrap(
//                 spacing: 8,
//                 children: [
//                   Colors.red, Colors.green, Colors.blue, Colors.orange, Colors.purple
//                 ].map((color) {
//                   return GestureDetector(
//                     onTap: () {
//                       themeProvider.setAccentColor(color);
//                       setState(() {
//                         selectedColor = color;
//                       });
//                     },
//                     child: Container(
//                       width: 30,
//                       height: 30,
//                       decoration: BoxDecoration(
//                         color: color,
//                         shape: BoxShape.circle,
//                         border: Border.all(
//                           color: selectedColor == color ? Colors.black : Colors.transparent,
//                           width: 2,
//                         ),
//                       ),
//                     ),
//                   );
//                 }).toList(),
//               ),
//             ],
//           ),
//           actions: [
//             TextButton(
//               onPressed: () => Navigator.pop(context),
//               child: Text("Close"),
//             ),
//           ],
//         );
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     final themeProvider = Provider.of<ThemeProvider>(context);

//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           "IRL News",
//           style: TextStyle(
//             fontWeight: FontWeight.bold,
//             color: themeProvider.accentColor, // Apply accent color to the app name
//           ),
//         ),
//         actions: [
//           IconButton(
//             icon: Icon(Icons.settings, color: themeProvider.accentColor), // Apply accent color to the settings icon
//             onPressed: () => _openSettingsDialog(context, themeProvider),
//           ),
//         ],
//       ),
//       body: Column(
//         children: [
//           Padding(
//             padding: EdgeInsets.all(8.0),
//             child: TextField(
//               controller: _searchController,
//               decoration: InputDecoration(
//                 hintText: "Search news...",
//                 prefixIcon: Icon(Icons.search, color: themeProvider.accentColor), // Apply accent color to the search icon
//                 suffixIcon: IconButton(
//                   icon: Icon(Icons.clear, color: themeProvider.accentColor), // Apply accent color to the clear icon
//                   onPressed: () {
//                     _searchController.clear();
//                     setState(() {
//                       _searchQuery = '';
//                     });
//                     _fetchNews();
//                   },
//                 ),
//                 border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
//               ),
//               onSubmitted: (value) => _onSearch(),
//             ),
//           ),
//           SingleChildScrollView(
//             scrollDirection: Axis.horizontal,
//             padding: EdgeInsets.symmetric(horizontal: 8),
//             child: Row(
//               children: [
//                 _buildCategoryButton('general', themeProvider.accentColor),
//                 _buildCategoryButton('business', themeProvider.accentColor),
//                 _buildCategoryButton('technology', themeProvider.accentColor),
//                 _buildCategoryButton('entertainment', themeProvider.accentColor),
//                 _buildCategoryButton('sports', themeProvider.accentColor),
//                 _buildCategoryButton('health', themeProvider.accentColor),
//                 _buildCategoryButton('science', themeProvider.accentColor),
//               ],
//             ),
//           ),
//           Expanded(
//             child: _articles.isEmpty
//                 ? Center(child: CircularProgressIndicator(color: themeProvider.accentColor)) // Apply accent color to the loading indicator
//                 : ListView.builder(
//                     controller: _scrollController,
//                     itemCount: _articles.length + (_isLoadingMore ? 1 : 0),
//                     itemBuilder: (context, index) {
//                       if (index == _articles.length) {
//                         return Center(child: CircularProgressIndicator(color: themeProvider.accentColor)); // Apply accent color to the loading indicator
//                       }
//                       final article = _articles[index];
//                       return _buildNewsCard(article, context, themeProvider.accentColor); // Pass accent color to the news card
//                     },
//                   ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildCategoryButton(String category, Color accentColor) {
//     return Padding(
//       padding: EdgeInsets.symmetric(horizontal: 4),
//       child: ElevatedButton(
//         onPressed: () => _onCategoryChanged(category),
//         style: ElevatedButton.styleFrom(
//           backgroundColor: _selectedCategory == category ? accentColor : Colors.grey, // Apply accent color to the selected category button
//         ),
//         child: Text(category.toUpperCase(), style: TextStyle(color: Colors.black)),
//       ),
//     );
//   }

//   Widget _buildNewsCard(Map<String, dynamic> article, BuildContext context, Color accentColor) {
//     return GestureDetector(
//       onTap: () {
//         Navigator.push(
//           context,
//           MaterialPageRoute(
//             builder: (context) => ArticleDetailScreen(article: article),
//           ),
//         );
//       },
//       child: Card(
//         margin: EdgeInsets.all(8),
//         color: accentColor.withOpacity(0.1), // Apply accent color with opacity to the card background
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             if (article['urlToImage'] != null)
//               ClipRRect(
//                 borderRadius: BorderRadius.vertical(top: Radius.circular(8)),
//                 child: Image.network(
//                   article['urlToImage'],
//                   width: double.infinity,
//                   height: 200,
//                   fit: BoxFit.cover,
//                 ),
//               ),
//             Padding(
//               padding: EdgeInsets.all(8),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     article['title'] ?? 'No Title',
//                     style: TextStyle(
//                       fontSize: 18,
//                       fontWeight: FontWeight.bold,
//                       color: accentColor, // Apply accent color to the title
//                     ),
//                   ),
//                   SizedBox(height: 4),
//                   Text(
//                     article['source']?['name'] ?? 'Unknown Source',
//                     style: TextStyle(color: Colors.grey),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// ------------------------------ pull down to refresh ----------------------------
import 'package:flutter/material.dart';
import 'package:irl/article_detail_screen.dart';
import 'package:irl/news_service.dart';
import 'package:irl/theme_provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final NewsService _newsService = NewsService();
  List<dynamic> _articles = [];
  String _selectedCategory = 'general';
  String _searchQuery = '';
  TextEditingController _searchController = TextEditingController();
  ScrollController _scrollController = ScrollController();
  int _page = 1;
  bool _isLoadingMore = false;

  @override
  void initState() {
    super.initState();
    _fetchNews();
    _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  Future<void> _fetchNews({bool isLoadMore = false}) async {
    if (isLoadMore) {
      setState(() {
        _isLoadingMore = true;
      });
    }
    try {
      final articles = await _newsService.fetchNews(
        category: _selectedCategory,
        query: _searchQuery.isNotEmpty ? _searchQuery : null,
        page: _page,
      );
      setState(() {
        if (isLoadMore) {
          _articles.addAll(articles);
          _isLoadingMore = false;
        } else {
          _articles = articles;
        }
      });
    } catch (e) {
      print('Error fetching news: $e');
    }
  }

  Future<void> _refreshNews() async {
    setState(() {
      _page = 1;
    });
    await _fetchNews();
  }

  void _scrollListener() {
    if (_scrollController.position.pixels >= _scrollController.position.maxScrollExtent - 200 && !_isLoadingMore) {
      _page++;
      _fetchNews(isLoadMore: true);
    }
  }

  void _onCategoryChanged(String category) {
    setState(() {
      _selectedCategory = category;
      _page = 1;
    });
    _fetchNews();
  }

  void _onSearch() {
    setState(() {
      _searchQuery = _searchController.text;
      _page = 1;
    });
    _fetchNews();
  }

  void _openSettingsDialog(BuildContext context, ThemeProvider themeProvider) {
    Color selectedColor = themeProvider.accentColor;
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Settings"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Dark Mode"),
                  Switch(
                    value: themeProvider.isDarkMode,
                    onChanged: (value) {
                      themeProvider.toggleTheme();
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
              SizedBox(height: 10),
              Text("Accent Color"),
              Wrap(
                spacing: 8,
                children: [
                  Colors.red, Colors.green, Colors.blue, Colors.orange, Colors.purple
                ].map((color) {
                  return GestureDetector(
                    onTap: () {
                      themeProvider.setAccentColor(color);
                      setState(() {
                        selectedColor = color;
                      });
                    },
                    child: Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        color: color,
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: selectedColor == color ? Colors.black : Colors.transparent,
                          width: 2,
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text("Close"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "IRL News",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: themeProvider.accentColor,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.settings, color: themeProvider.accentColor),
            onPressed: () => _openSettingsDialog(context, themeProvider),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: "Search news...",
                prefixIcon: Icon(Icons.search, color: themeProvider.accentColor),
                suffixIcon: IconButton(
                  icon: Icon(Icons.clear, color: themeProvider.accentColor),
                  onPressed: () {
                    _searchController.clear();
                    setState(() {
                      _searchQuery = '';
                    });
                    _fetchNews();
                  },
                ),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
              ),
              onSubmitted: (value) => _onSearch(),
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              children: [
                _buildCategoryButton('general', themeProvider.accentColor),
                _buildCategoryButton('business', themeProvider.accentColor),
                _buildCategoryButton('technology', themeProvider.accentColor),
                _buildCategoryButton('entertainment', themeProvider.accentColor),
                _buildCategoryButton('sports', themeProvider.accentColor),
                _buildCategoryButton('health', themeProvider.accentColor),
                _buildCategoryButton('science', themeProvider.accentColor),
              ],
            ),
          ),
          Expanded(
            child: RefreshIndicator(
              onRefresh: _refreshNews,
              child: _articles.isEmpty
                  ? Center(child: CircularProgressIndicator(color: themeProvider.accentColor))
                  : ListView.builder(
                      controller: _scrollController,
                      itemCount: _articles.length + (_isLoadingMore ? 1 : 0),
                      itemBuilder: (context, index) {
                        if (index == _articles.length) {
                          return Center(child: CircularProgressIndicator(color: themeProvider.accentColor));
                        }
                        final article = _articles[index];
                        return _buildNewsCard(article, context, themeProvider.accentColor);
                      },
                    ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryButton(String category, Color accentColor) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 4),
      child: ElevatedButton(
        onPressed: () => _onCategoryChanged(category),
        style: ElevatedButton.styleFrom(
          backgroundColor: _selectedCategory == category ? accentColor : Colors.grey,
        ),
        child: Text(category.toUpperCase(), style: TextStyle(color: Colors.black)),
      ),
    );
  }

  Widget _buildNewsCard(Map<String, dynamic> article, BuildContext context, Color accentColor) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ArticleDetailScreen(article: article),
          ),
        );
      },
      child: Card(
        margin: EdgeInsets.all(8),
        color: accentColor.withOpacity(0.1),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (article['urlToImage'] != null)
              ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(8)),
                child: Image.network(
                  article['urlToImage'],
                  width: double.infinity,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),
            Padding(
              padding: EdgeInsets.all(8),
              child: Text(
                article['title'] ?? 'No Title',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: accentColor),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
