import 'package:flutter/material.dart';
import 'package:naruto_app/screens/AboutScreen.dart';
import 'package:naruto_app/screens/GalleryScreen.dart';
import 'package:naruto_app/screens/QuoteScreen.dart';
import 'package:naruto_app/screens/SettingsScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  MaterialColor _primarySwatchColor = Colors.deepPurple;
  Color _containerColor = Colors.white;

  void _changeTheme(MaterialColor color, Color containerColor) {
    setState(() {
      _primarySwatchColor = color;
      _containerColor = containerColor;
    });
    // Perform any other theme-related actions
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Naruto Flutter App',
      theme: ThemeData(
        primarySwatch: _primarySwatchColor,
      ),
      home: HomeScreen(
        primaryColor: Colors.red,
        onPrimarySwatchColorChanged: _changeTheme,
        containerColor: _containerColor,
      ),
    );
  }
}

class HomeScreen extends StatefulWidget {
  final Color primaryColor;
  final void Function(MaterialColor, Color) onPrimarySwatchColorChanged;
  final Color containerColor;

  HomeScreen({
    required this.primaryColor,
    required this.onPrimarySwatchColorChanged,
    required this.containerColor,
  });

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late Color _primaryColor;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this, initialIndex: 0);
    _primaryColor = widget.primaryColor;
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.face),
        title: const Text(
          'Naruto Flutter App',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        elevation: 0.7,
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Colors.lightBlue,
          indicatorWeight: 4.0,
          tabs: const <Widget>[
            Tab(
              child: Text(
                'Quotes',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
            ),
            Tab(
              child: Text(
                'Gallery',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
            ),
            Tab(
              child: Text(
                'About',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
            ),
            Tab(
              child: Text(
                'Settings',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          QuoteScreen(
            primaryColor: _primaryColor,
            containerColor: widget.containerColor,
          ),
          GalleryScreen(),
          AboutScreen(),
          Builder(
            builder: (context) => SettingsScreen(
              onThemeChanged: widget.onPrimarySwatchColorChanged,
            ),
          ),
        ],
      ),
    );
  }
}
