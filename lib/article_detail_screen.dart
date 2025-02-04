// import 'package:flutter/material.dart';
// import 'package:url_launcher/url_launcher.dart';

// class ArticleDetailScreen extends StatelessWidget {
//   final Map<String, dynamic> article;

//   ArticleDetailScreen({required this.article});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(article['title']),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             if (article['urlToImage'] != null)
//               Image.network(article['urlToImage']),
//             SizedBox(height: 16),
//             Text(
//               article['title'],
//               style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//             ),
//             SizedBox(height: 8),
//             Text(article['description'] ?? 'No description'),
//             SizedBox(height: 16),
//             ElevatedButton(
//               onPressed: () async {
//                 final url = article['url'];
//                 if (await canLaunch(url)) {
//                   await launch(url);
//                 } else {
//                   throw 'Could not launch $url';
//                 }
//               },
//               child: Text('Read More'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// -------------------------------------------------------------------------------

// import 'package:flutter/material.dart';
// import 'package:url_launcher/url_launcher.dart';

// class ArticleDetailScreen extends StatelessWidget {
//   final Map<String, dynamic> article;

//   ArticleDetailScreen({required this.article});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(article['title']),
//       ),
//       body: SingleChildScrollView(
//         padding: EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             if (article['urlToImage'] != null)
//               ClipRRect(
//                 borderRadius: BorderRadius.circular(8.0),
//                 child: Image.network(
//                   article['urlToImage'],
//                   width: double.infinity,
//                   height: 200,
//                   fit: BoxFit.cover,
//                 ),
//               ),
//             SizedBox(height: 16),
//             Text(
//               article['title'],
//               style: TextStyle(
//                 fontSize: 24,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             SizedBox(height: 8),
//             Text(
//               article['publishedAt'] ?? '',
//               style: TextStyle(
//                 color: Colors.grey,
//                 fontSize: 14,
//               ),
//             ),
//             SizedBox(height: 16),
//             Text(
//               article['description'] ?? 'No description',
//               style: TextStyle(
//                 fontSize: 16,
//               ),
//             ),
//             SizedBox(height: 16),
//             ElevatedButton(
//               onPressed: () async {
//                 final url = article['url'];
//                 if (await canLaunch(url)) {
//                   await launch(url);
//                 } else {
//                   throw 'Could not launch $url';
//                 }
//               },
//               child: Text('Read More'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// ------------------------------------------------------------------------
// import 'package:flutter/material.dart';
// import 'package:url_launcher/url_launcher.dart';

// class ArticleDetailScreen extends StatelessWidget {
//   final Map<String, dynamic> article;

//   ArticleDetailScreen({required this.article});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(article['title']),
//       ),
//       body: SingleChildScrollView(
//         padding: EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             if (article['urlToImage'] != null)
//               ClipRRect(
//                 borderRadius: BorderRadius.circular(8.0),
//                 child: Image.network(
//                   article['urlToImage'],
//                   width: double.infinity,
//                   height: 200,
//                   fit: BoxFit.cover,
//                 ),
//               ),
//             SizedBox(height: 16),
//             Text(
//               article['title'],
//               style: TextStyle(
//                 fontSize: 24,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             SizedBox(height: 8),
//             Text(
//               article['publishedAt'] ?? '',
//               style: TextStyle(
//                 color: Colors.grey,
//                 fontSize: 14,
//               ),
//             ),
//             SizedBox(height: 16),
//             Text(
//               article['description'] ?? 'No description',
//               style: TextStyle(
//                 fontSize: 16,
//               ),
//             ),
//             SizedBox(height: 16),
//             ElevatedButton(
//               onPressed: () async {
//                 final url = article['url'];
//                 if (await canLaunchUrl(url)) {
//                   await launchUrl(url);
//                 } else {
//                   throw 'Could not launch $url';
//                 }
//               },
//               child: Text('Read More'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:url_launcher/url_launcher.dart';

// class ArticleDetailScreen extends StatelessWidget {
//   final Map<String, dynamic> article;

//   ArticleDetailScreen({required this.article});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(article['title'] ?? 'No Title'),
//       ),
//       body: SingleChildScrollView(
//         padding: EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             if (article['urlToImage'] != null)
//               ClipRRect(
//                 borderRadius: BorderRadius.circular(8.0),
//                 child: Image.network(
//                   article['urlToImage'],
//                   width: double.infinity,
//                   height: 200,
//                   fit: BoxFit.cover,
//                   loadingBuilder: (context, child, loadingProgress) {
//                     if (loadingProgress == null) return child;
//                     return Center(
//                       child: CircularProgressIndicator(
//                         value: loadingProgress.expectedTotalBytes != null
//                             ? loadingProgress.cumulativeBytesLoaded /
//                                 (loadingProgress.expectedTotalBytes ?? 1)
//                             : null,
//                       ),
//                     );
//                   },
//                 ),
//               ),
//             SizedBox(height: 16),
//             Text(
//               article['title'] ?? 'No Title',
//               style: TextStyle(
//                 fontSize: 24,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             SizedBox(height: 8),
//             Text(
//               article['publishedAt'] ?? 'No date available',
//               style: TextStyle(
//                 color: Colors.grey,
//                 fontSize: 14,
//               ),
//             ),
//             SizedBox(height: 16),
//             Text(
//               article['description'] ?? 'No description available',
//               style: TextStyle(
//                 fontSize: 16,
//               ),
//             ),
//             SizedBox(height: 16),
//             ElevatedButton(
//               onPressed: () async {
//                 final url = article['url'];
//                 if (url != null && await canLaunchUrl(Uri.parse(url))) {
//                   await launchUrl(Uri.parse(url));
//                 } else {
//                   throw 'Could not launch $url';
//                 }
//               },
//               child: Text('Read More'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
// ---------------------------------- with asccent color feature, ----------------------------------------
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:provider/provider.dart';
import 'package:irl/theme_provider.dart'; // Import your ThemeProvider

class ArticleDetailScreen extends StatelessWidget {
  final Map<String, dynamic> article;

  ArticleDetailScreen({required this.article});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context); // Access ThemeProvider

    return Scaffold(
      appBar: AppBar(
        title: Text(
          article['title'] ?? 'No Title',
          style: TextStyle(
            color: themeProvider.accentColor, // Apply accent color to the app bar title
          ),
        ),
        iconTheme: IconThemeData(
          color: themeProvider.accentColor, // Apply accent color to the back button
        ),
        backgroundColor: themeProvider.isDarkMode ? Colors.black : Colors.white, // Match app bar background with theme
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (article['urlToImage'] != null)
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.network(
                  article['urlToImage'],
                  width: double.infinity,
                  height: 200,
                  fit: BoxFit.cover,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;
                    return Center(
                      child: CircularProgressIndicator(
                        value: loadingProgress.expectedTotalBytes != null
                            ? loadingProgress.cumulativeBytesLoaded /
                                (loadingProgress.expectedTotalBytes ?? 1)
                            : null,
                        color: themeProvider.accentColor, // Apply accent color to the loading indicator
                      ),
                    );
                  },
                ),
              ),
            SizedBox(height: 16),
            Text(
              article['title'] ?? 'No Title',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: themeProvider.accentColor, // Apply accent color to the title
              ),
            ),
            SizedBox(height: 8),
            Text(
              article['publishedAt'] ?? 'No date available',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 14,
              ),
            ),
            SizedBox(height: 16),
            Text(
              article['description'] ?? 'No description available',
              style: TextStyle(
                fontSize: 16,
                color: themeProvider.isDarkMode ? Colors.white : Colors.black, // Adjust text color based on theme
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () async {
                final url = article['url'];
                if (url != null && await canLaunchUrl(Uri.parse(url))) {
                  await launchUrl(Uri.parse(url));
                } else {
                  throw 'Could not launch $url';
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: themeProvider.accentColor, // Apply accent color to the button background
              ),
              child: Text(
                'Read More',
                style: TextStyle(
                  color: themeProvider.isDarkMode ? Colors.black : Colors.white, // Adjust button text color based on theme
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// -------------------------- with the share feature-------------------------
// import 'package:flutter/material.dart';
// import 'package:url_launcher/url_launcher.dart';
// import 'package:provider/provider.dart';
// import 'package:share_plus/share_plus.dart'; // Import the share_plus package
// import 'package:irl/theme_provider.dart'; // Import your ThemeProvider

// class ArticleDetailScreen extends StatelessWidget {
//   final Map<String, dynamic> article;

//   ArticleDetailScreen({required this.article});

//   // Function to handle sharing the news link
//   void _shareNewsLink(BuildContext context) {
//     final String newsLink = article['url'] ?? 'No link available';
//     final String newsTitle = article['title'] ?? 'Check out this news!';

//     Share.share(
//       '$newsTitle\n$newsLink', // Text to share
//       subject: 'News Article', // Optional subject for the share dialog
//     );
//   }

// //   void _shareNewsLink(BuildContext context) {
// //   final String newsLink = article['url'] ?? 'No link available';
// //   final String newsTitle = article['title'] ?? 'Check out this news!';

// //   Share.share('$newsTitle\n$newsLink');
// // }

//   @override
//   Widget build(BuildContext context) {
//     final themeProvider = Provider.of<ThemeProvider>(context); // Access ThemeProvider

//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           article['title'] ?? 'No Title',
//           style: TextStyle(
//             color: themeProvider.accentColor, // Apply accent color to the app bar title
//           ),
//         ),
//         iconTheme: IconThemeData(
//           color: themeProvider.accentColor, // Apply accent color to the back button
//         ),
//         backgroundColor: themeProvider.isDarkMode ? Colors.black : Colors.white, // Match app bar background with theme
//         // actions: [
//         //   IconButton(
//         //     icon: Icon(Icons.share, color: themeProvider.accentColor), // Share button with accent color
//         //     onPressed: () => _shareNewsLink(context), // Trigger the share functionality
//         //   ),
//         // ],
//       ),
//       body: SingleChildScrollView(
//         padding: EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             if (article['urlToImage'] != null)
//               ClipRRect(
//                 borderRadius: BorderRadius.circular(8.0),
//                 child: Image.network(
//                   article['urlToImage'],
//                   width: double.infinity,
//                   height: 200,
//                   fit: BoxFit.cover,
//                   loadingBuilder: (context, child, loadingProgress) {
//                     if (loadingProgress == null) return child;
//                     return Center(
//                       child: CircularProgressIndicator(
//                         value: loadingProgress.expectedTotalBytes != null
//                             ? loadingProgress.cumulativeBytesLoaded /
//                                 (loadingProgress.expectedTotalBytes ?? 1)
//                             : null,
//                         color: themeProvider.accentColor, // Apply accent color to the loading indicator
//                       ),
//                     );
//                   },
//                 ),
//               ),
//             SizedBox(height: 16),
//             Text(
//               article['title'] ?? 'No Title',
//               style: TextStyle(
//                 fontSize: 24,
//                 fontWeight: FontWeight.bold,
//                 color: themeProvider.accentColor, // Apply accent color to the title
//               ),
//             ),
//             SizedBox(height: 8),
//             Text(
//               article['publishedAt'] ?? 'No date available',
//               style: TextStyle(
//                 color: Colors.grey,
//                 fontSize: 14,
//               ),
//             ),
//             SizedBox(height: 16),
//             Text(
//               article['description'] ?? 'No description available',
//               style: TextStyle(
//                 fontSize: 16,
//                 color: themeProvider.isDarkMode ? Colors.white : Colors.black, // Adjust text color based on theme
//               ),
//             ),
//             SizedBox(height: 16),
//             ElevatedButton(
//               onPressed: () async {
//                 final url = article['url'];
//                 if (url != null && await canLaunchUrl(Uri.parse(url))) {
//                   await launchUrl(Uri.parse(url));
//                 } else {
//                   throw 'Could not launch $url';
//                 }
//               },
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: themeProvider.accentColor, // Apply accent color to the button background
//               ),
//               child: Text(
//                 'Read More',
//                 style: TextStyle(
//                   color: themeProvider.isDarkMode ? Colors.black : Colors.white, // Adjust button text color based on theme
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }