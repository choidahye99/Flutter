import 'package:flutter/material.dart';
import 'package:img_search/data/photo_provider.dart';
import 'package:img_search/model/ui/home_screen.dart';
import 'package:img_search/model/ui/home_view_model.dart';

import 'data/api.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PhotoProvider(
          viewModel: HomeViewModel(PixabayApi()),
          child: const HomeScreen()),
    );
  }
}

