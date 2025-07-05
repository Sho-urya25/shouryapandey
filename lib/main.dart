import 'package:animate_do/animate_do.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:custom_mouse_cursor/custom_mouse_cursor.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:shouryapandey/animationctrls.dart';
import 'package:shouryapandey/views/contactsection.dart';
import 'package:shouryapandey/views/headersection.dart';
import 'package:shouryapandey/views/homepage.dart';
import 'package:shouryapandey/views/parts/btn.dart';
import 'package:shouryapandey/views/parts/hoverablelogocontainer.dart';
import 'package:shouryapandey/views/skillsection.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:js_interop';
import 'package:web/web.dart' as web;

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Get.put<Animationctrls>(Animationctrls());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Animationctrls _animationController = Get.find<Animationctrls>();
  final ScrollController _scrollController = ScrollController();
  RxDouble widt = Get.width.obs;
  late CustomMouseCursor _cursor;
  @override
  void initState() {
    super.initState();
    // Initialize the custom mouse cursor
    _initCursor();
    // Trigger animation when the widget is first built
    Future.delayed(Duration(milliseconds: 200), () {
      if (mounted) {
        _animationController.animateText();
      }
    });
  }

  // Separate method for async initialization
  Future<void> _initCursor() async {
    _cursor = await CustomMouseCursor.icon(Icons.circle);
    if (mounted) setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        widt.value = constraints.maxWidth;
        double maxWidth = constraints.maxWidth;
        // Calculate responsive sizes based on screen width
        double avatarwidth = maxWidth < 400
            ? maxWidth * 0.1
            : maxWidth < 700
            ? maxWidth * 0.3
            : maxWidth < 1000
            ? maxWidth * 0.27
            : maxWidth * 0.15;
        return Scaffold(
          drawer: Drawer(
            child: Column(
              children: [
                Text(
                  "Drawer Menu",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          backgroundColor: Colors.grey[300],
          body: SizedBox(
            width: maxWidth,
            child: Padding(
              padding: EdgeInsets.only(left: 8.0, right: 8.0, top: 8.0),
              child: Column(
                children: [
                  headerSection(constraints, context, widt),
                  Expanded(
                    child: SingleChildScrollView(
                      controller: _scrollController,
                      child: Column(
                        children: [
                          SizedBox(
                            key: _animationController.homeKey,
                            child: homePage(constraints, avatarwidth, maxWidth,_animationController),
                          ),
                          SizedBox(
                            key: _animationController.skillsKey,
                            child: skillsPage(context, constraints),
                          ),

                          SizedBox(
                            key:_animationController.contactKey,
                            child: contactPage(
                              context,
                              constraints,
                             
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  
  

 
}
