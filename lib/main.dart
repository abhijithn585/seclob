import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:seclob/bottom_bar.dart';
import 'package:seclob/controllers/api_provider.dart';
import 'package:seclob/view/home_screen.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ApiProvider(),
        )
      ],
      child: MaterialApp(
        home: BottomBar(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
