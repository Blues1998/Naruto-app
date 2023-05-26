import 'package:flutter/material.dart';
import 'package:naruto_app/screens/AboutScreen.dart';
import 'package:naruto_app/screens/GalleryScreen.dart';
import 'package:naruto_app/screens/QuoteScreen.dart';
import 'package:naruto_app/screens/SettingsScreen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this, initialIndex: 0);
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
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          QuoteScreen(),
          GalleryScreen(),
          AboutScreen(),
        ],
      ),
    );
  }
}
