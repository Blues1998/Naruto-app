import 'package:flutter/material.dart';
import 'package:web_flutter_app/screens/AboutScreen.dart';
import 'package:web_flutter_app/screens/GalleryScreen.dart';
import 'package:web_flutter_app/screens/QuoteScreen.dart';

class Homescreen extends StatefulWidget {
  @override
  _HomescreenState createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = new TabController(length: 3, vsync: this, initialIndex: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: new Icon(Icons.face),
          title: Text('Naruto Flutter App',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          elevation: 0.7,
          bottom: new TabBar(
              controller: _tabController,
              indicatorColor: Colors.lightBlue,
              indicatorWeight: 4.0,
              tabs: <Widget>[
                new Tab(
                  child: Text('Quotes',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                ),
                new Tab(
                  child: Text('Gallery',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                ),
                new Tab(
                  child: Text('About',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                )
              ]),
        ),
        body: new TabBarView(controller: _tabController, children: <Widget>[
          new QuoteScreen(),
          new GalleryScreen(),
          new AboutScreen()
        ]));
  }
}

// SafeArea(
//     child: Scaffold(
//         backgroundColor: Colors.grey[700],
//         appBar: AppBar(
//           backgroundColor: Colors.deepPurple,
//           title: Text(
//             'Naruto Popular Quotes',
//             style: TextStyle(color: Colors.blue[100]),
//           ),
//           centerTitle: true,
//         ),
//         body: Padding(
//           padding: const EdgeInsets.all(10.0),
//           child: ListView(
//             children: const <Widget>[
//               Card(
//                 child: ExpansionTile(
//                   leading: Image(
//                     image: AssetImage('assets/images/img.png'),
//                   ),
//                   title: Text(
//                     'Itachi Uchiha',
//                     style: TextStyle(fontSize: 30),
//                   ),
//                   subtitle: Text(
//                     'The True Shinobi',
//                     style: TextStyle(fontSize: 20.0, color: Colors.white70),
//                   ),
//                   trailing: Icon(
//                     Icons.face,
//                     size: 30.0,
//                   ),
//                   children: [
//                     ExpansionTile(
//                       title: Text(
//                           '1. People live their lives bound by what they accept ...'),
//                       children: [
//                         Padding(
//                           padding: EdgeInsets.all(16.0),
//                           child: Text(
//                               'People live their lives bound by what they accept as correct and true. That\'s how they define "reality". But what does it mean to be "correct" or "true"? Merely vague concepts... Their "reality" may all be a mirage. Can we consider them to simply be living in their own world, shaped by their beliefs?'),
//                         )
//                       ],
//                     ),
//                     ExpansionTile(
//                       title: Text(
//                           '2. It is not wise to judge others based on your own ...'),
//                       children: [
//                         Padding(
//                           padding: EdgeInsets.all(16.0),
//                           child: Text(
//                               'It is not wise to judge others based on your own preconceptions and by their appearances.'),
//                         )
//                       ],
//                     ),
//                     ExpansionTile(
//                       title: Text(
//                           '3. Those who cannot acknowledge themselves, will ...'),
//                       children: [
//                         Padding(
//                           padding: EdgeInsets.all(16.0),
//                           child: Text(
//                               'Those who cannot acknowledge themselves, will eventually fail.'),
//                         )
//                       ],
//                     ),
//                     ExpansionTile(
//                       title: Text(
//                           '4. Those who forgive themselves, and are able to accept ...'),
//                       children: [
//                         Padding(
//                           padding: EdgeInsets.all(16.0),
//                           child: Text(
//                               'Those who forgive themselves, and are able to accept their true nature... They are the strong ones!'),
//                         )
//                       ],
//                     ),
//                     ExpansionTile(
//                       title: Text(
//                           '5. You and I are flesh and blood. I\'m always going ...'),
//                       children: [
//                         Padding(
//                           padding: EdgeInsets.all(16.0),
//                           child: Text(
//                               'You and I are flesh and blood. I\'m always going to be there for you, even if it\'s only as an obstacle for you to overcome. Even if you do hate me. That\'s what big brothers are for.'),
//                         )
//                       ],
//                     )
//                   ],
//                 ),
//               ),
//               Card(
//                 child: ExpansionTile(
//                   leading: Image(
//                     image: AssetImage('assets/images/madara.png'),
//                   ),
//                   title: Text(
//                     'Madara Uchiha',
//                     style: TextStyle(fontSize: 30),
//                   ),
//                   subtitle: Text(
//                     'Ghost of the Uchiha',
//                     style: TextStyle(fontSize: 20.0, color: Colors.white70),
//                   ),
//                   trailing: Icon(
//                     Icons.face,
//                     size: 30.0,
//                   ),
//                   children: [
//                     ExpansionTile(
//                       title: Text(
//                           '1. People live their lives bound by what they accept ...'),
//                       children: [
//                         Padding(
//                           padding: EdgeInsets.all(16.0),
//                           child: Text(
//                               'People live their lives bound by what they accept as correct and true. That\'s how they define "reality". But what does it mean to be "correct" or "true"? Merely vague concepts... Their "reality" may all be a mirage. Can we consider them to simply be living in their own world, shaped by their beliefs?'),
//                         )
//                       ],
//                     ),
//                     ExpansionTile(
//                       title: Text(
//                           '2. It is not wise to judge others based on your own ...'),
//                       children: [
//                         Padding(
//                           padding: EdgeInsets.all(16.0),
//                           child: Text(
//                               'It is not wise to judge others based on your own preconceptions and by their appearances.'),
//                         )
//                       ],
//                     ),
//                     ExpansionTile(
//                       title: Text(
//                           '3. Those who cannot acknowledge themselves, will ...'),
//                       children: [
//                         Padding(
//                           padding: EdgeInsets.all(16.0),
//                           child: Text(
//                               'Those who cannot acknowledge themselves, will eventually fail.'),
//                         )
//                       ],
//                     ),
//                     ExpansionTile(
//                       title: Text(
//                           '4. Those who forgive themselves, and are able to accept ...'),
//                       children: [
//                         Padding(
//                           padding: EdgeInsets.all(16.0),
//                           child: Text(
//                               'Those who forgive themselves, and are able to accept their true nature... They are the strong ones!'),
//                         )
//                       ],
//                     ),
//                     ExpansionTile(
//                       title: Text(
//                           '5. You and I are flesh and blood. I\'m always going ...'),
//                       children: [
//                         Padding(
//                           padding: EdgeInsets.all(16.0),
//                           child: Text(
//                               'You and I are flesh and blood. I\'m always going to be there for you, even if it\'s only as an obstacle for you to overcome. Even if you do hate me. That\'s what big brothers are for.'),
//                         )
//                       ],
//                     )
//                   ],
//                 ),
//               ),
//               Card(
//                 child: ExpansionTile(
//                   leading: Image(
//                     image: AssetImage('assets/images/kakashi.png'),
//                   ),
//                   title: Text(
//                     'Kakashi Hatake',
//                     style: TextStyle(fontSize: 30),
//                   ),
//                   subtitle: Text(
//                     'The Copy Ninja',
//                     style: TextStyle(fontSize: 20.0, color: Colors.white70),
//                   ),
//                   trailing: Icon(
//                     Icons.face,
//                     size: 30.0,
//                   ),
//                   children: [
//                     ExpansionTile(
//                       title: Text(
//                           '1. People live their lives bound by what they accept ...'),
//                       children: [
//                         Padding(
//                           padding: EdgeInsets.all(16.0),
//                           child: Text(
//                               'People live their lives bound by what they accept as correct and true. That\'s how they define "reality". But what does it mean to be "correct" or "true"? Merely vague concepts... Their "reality" may all be a mirage. Can we consider them to simply be living in their own world, shaped by their beliefs?'),
//                         )
//                       ],
//                     ),
//                     ExpansionTile(
//                       title: Text(
//                           '2. It is not wise to judge others based on your own ...'),
//                       children: [
//                         Padding(
//                           padding: EdgeInsets.all(16.0),
//                           child: Text(
//                               'It is not wise to judge others based on your own preconceptions and by their appearances.'),
//                         )
//                       ],
//                     ),
//                     ExpansionTile(
//                       title: Text(
//                           '3. Those who cannot acknowledge themselves, will ...'),
//                       children: [
//                         Padding(
//                           padding: EdgeInsets.all(16.0),
//                           child: Text(
//                               'Those who cannot acknowledge themselves, will eventually fail.'),
//                         )
//                       ],
//                     ),
//                     ExpansionTile(
//                       title: Text(
//                           '4. Those who forgive themselves, and are able to accept ...'),
//                       children: [
//                         Padding(
//                           padding: EdgeInsets.all(16.0),
//                           child: Text(
//                               'Those who forgive themselves, and are able to accept their true nature... They are the strong ones!'),
//                         )
//                       ],
//                     ),
//                     ExpansionTile(
//                       title: Text(
//                           '5. You and I are flesh and blood. I\'m always going ...'),
//                       children: [
//                         Padding(
//                           padding: EdgeInsets.all(16.0),
//                           child: Text(
//                               'You and I are flesh and blood. I\'m always going to be there for you, even if it\'s only as an obstacle for you to overcome. Even if you do hate me. That\'s what big brothers are for.'),
//                         )
//                       ],
//                     )
//                   ],
//                 ),
//               ),
//               Card(
//                 child: ExpansionTile(
//                   leading: Image(
//                     image: AssetImage('assets/images/nagato.png'),
//                   ),
//                   title: Text(
//                     'Nagato Uzumaki',
//                     style: TextStyle(fontSize: 30),
//                   ),
//                   subtitle: Text(
//                     'Pain',
//                     style: TextStyle(fontSize: 20.0, color: Colors.white70),
//                   ),
//                   trailing: Icon(
//                     Icons.face,
//                     size: 30.0,
//                   ),
//                   children: [
//                     ExpansionTile(
//                       title: Text(
//                           '1. People live their lives bound by what they accept ...'),
//                       children: [
//                         Padding(
//                           padding: EdgeInsets.all(16.0),
//                           child: Text(
//                               'People live their lives bound by what they accept as correct and true. That\'s how they define "reality". But what does it mean to be "correct" or "true"? Merely vague concepts... Their "reality" may all be a mirage. Can we consider them to simply be living in their own world, shaped by their beliefs?'),
//                         )
//                       ],
//                     ),
//                     ExpansionTile(
//                       title: Text(
//                           '2. It is not wise to judge others based on your own ...'),
//                       children: [
//                         Padding(
//                           padding: EdgeInsets.all(16.0),
//                           child: Text(
//                               'It is not wise to judge others based on your own preconceptions and by their appearances.'),
//                         )
//                       ],
//                     ),
//                     ExpansionTile(
//                       title: Text(
//                           '3. Those who cannot acknowledge themselves, will ...'),
//                       children: [
//                         Padding(
//                           padding: EdgeInsets.all(16.0),
//                           child: Text(
//                               'Those who cannot acknowledge themselves, will eventually fail.'),
//                         )
//                       ],
//                     ),
//                     ExpansionTile(
//                       title: Text(
//                           '4. Those who forgive themselves, and are able to accept ...'),
//                       children: [
//                         Padding(
//                           padding: EdgeInsets.all(16.0),
//                           child: Text(
//                               'Those who forgive themselves, and are able to accept their true nature... They are the strong ones!'),
//                         )
//                       ],
//                     ),
//                     ExpansionTile(
//                       title: Text(
//                           '5. You and I are flesh and blood. I\'m always going ...'),
//                       children: [
//                         Padding(
//                           padding: EdgeInsets.all(16.0),
//                           child: Text(
//                               'You and I are flesh and blood. I\'m always going to be there for you, even if it\'s only as an obstacle for you to overcome. Even if you do hate me. That\'s what big brothers are for.'),
//                         )
//                       ],
//                     )
//                   ],
//                 ),
//               ),
//               Card(
//                 child: ExpansionTile(
//                   leading: Image(
//                     image: AssetImage('assets/images/minato.png'),
//                   ),
//                   title: Text(
//                     'Minato Namikaze',
//                     style: TextStyle(fontSize: 30),
//                   ),
//                   subtitle: Text(
//                     'Yellow Flash of the Leaf',
//                     style: TextStyle(fontSize: 20.0, color: Colors.white70),
//                   ),
//                   trailing: Icon(
//                     Icons.face,
//                     size: 30.0,
//                   ),
//                   children: [
//                     ExpansionTile(
//                       title: Text(
//                           '1. People live their lives bound by what they accept ...'),
//                       children: [
//                         Padding(
//                           padding: EdgeInsets.all(16.0),
//                           child: Text(
//                               'People live their lives bound by what they accept as correct and true. That\'s how they define "reality". But what does it mean to be "correct" or "true"? Merely vague concepts... Their "reality" may all be a mirage. Can we consider them to simply be living in their own world, shaped by their beliefs?'),
//                         )
//                       ],
//                     ),
//                     ExpansionTile(
//                       title: Text(
//                           '2. It is not wise to judge others based on your own ...'),
//                       children: [
//                         Padding(
//                           padding: EdgeInsets.all(16.0),
//                           child: Text(
//                               'It is not wise to judge others based on your own preconceptions and by their appearances.'),
//                         )
//                       ],
//                     ),
//                     ExpansionTile(
//                       title: Text(
//                           '3. Those who cannot acknowledge themselves, will ...'),
//                       children: [
//                         Padding(
//                           padding: EdgeInsets.all(16.0),
//                           child: Text(
//                               'Those who cannot acknowledge themselves, will eventually fail.'),
//                         )
//                       ],
//                     ),
//                     ExpansionTile(
//                       title: Text(
//                           '4. Those who forgive themselves, and are able to accept ...'),
//                       children: [
//                         Padding(
//                           padding: EdgeInsets.all(16.0),
//                           child: Text(
//                               'Those who forgive themselves, and are able to accept their true nature... They are the strong ones!'),
//                         )
//                       ],
//                     ),
//                     ExpansionTile(
//                       title: Text(
//                           '5. You and I are flesh and blood. I\'m always going ...'),
//                       children: [
//                         Padding(
//                           padding: EdgeInsets.all(16.0),
//                           child: Text(
//                               'You and I are flesh and blood. I\'m always going to be there for you, even if it\'s only as an obstacle for you to overcome. Even if you do hate me. That\'s what big brothers are for.'),
//                         )
//                       ],
//                     )
//                   ],
//                 ),
//               ),
//               // Image(
//               //   image: AssetImage('assets/images/itachi.png'),
//               // )
//             ],
//           ),
// )));
