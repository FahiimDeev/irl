import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:irl/home_screen.dart';
import 'package:irl/theme_provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: NewsApp(),
    ),
  );
}

class NewsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return MaterialApp(
      title: 'IRL News',
      debugShowCheckedModeBanner: false,
      // theme: ThemeData.light(), // Light theme
      // darkTheme: ThemeData.dark(), // Dark theme
      // themeMode: themeProvider.isDarkMode ? ThemeMode.dark : ThemeMode.light,
      theme: themeProvider.themeData,
      home: HomeScreen(),
    );
  }
}
