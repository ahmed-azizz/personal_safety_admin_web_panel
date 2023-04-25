import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:simple_sidebar/simple_sidebar.dart';
import 'package:simple_sidebar/simple_sidebar_item.dart';
import 'package:simple_sidebar/simple_sidebar_theme.dart';

import 'add_news.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: 'AIzaSyDV9RwdyzQnCV7k8qiUJt4ToQ8en5SPk5E',
          appId: '1:182004088407:web:c3ab0dc2e6c1d2999fed12',
          messagingSenderId: '182004088407',
          projectId: 'women-project-2f331'));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Admin panel',
      theme: ThemeData(
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Color.fromRGBO(246, 121, 82, 0.1),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide.none,
          ),
        ),
        fontFamily: 'Gordita',
        appBarTheme: AppBarTheme(
          elevation: 0,
          backgroundColor: Color(0xFFD688DD),
        ),
        iconTheme: IconThemeData(
          color: Color(0xFFD688DD),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(title: 'Admin panel'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final List<SimpleSidebarItem> sidebarItems = [
    SimpleSidebarItem(
      title: "Map",
      iconFront: Icons.map,
      child: Container(),
    ),
    SimpleSidebarItem(
      title: "Add",
      iconFront: Icons.add_circle_outline_sharp,
      child: NewsAddScreen(),
    ),
  ];
  final String title;

  MyHomePage({super.key, required this.title});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int selected = 0;
  bool isVisible = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Row(
          children: [
            SimpleSidebar(
              simpleSidebarTheme: SimpleSidebarTheme(
                selectedIconColor: Colors.white,
                collapsedBackgroundColor: Colors.purple,
                expandedBackgroundColor:Colors.purple,
                titleTextTheme: const TextStyle(
                  color: Colors.purple,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),

              initialExpanded: false,
              sidebarItems: widget.sidebarItems,
              onTapped: (value) => onTapped(value),
              toggleSidebar: (value) {
                log("Sidebar is now $value");
              },
            ),
            Expanded(
              child: AnimatedOpacity(
                opacity: isVisible ? 1 : 0,
                duration: const Duration(milliseconds: 400),
                child: Container(
                    margin: const EdgeInsets.all(8),
                    child: widget.sidebarItems.elementAt(selected).child),
              ),
            )
          ],
        ));
  }

  void onTapped(int value) {
    setState(() {
      isVisible = false;
    });
    Future.delayed(const Duration(milliseconds: 400), () {
      setState(() {
        selected = value;
      });
    }).then((value) {
      setState(() {
        isVisible = true;
      });
    });
  }
}