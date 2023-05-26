import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  final void Function(MaterialColor, Color) onThemeChanged;

  SettingsScreen({required this.onThemeChanged});

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  MaterialColor _selectedThemeColor = Colors.deepPurple;

  Widget _buildThemeItem(
      String themeName, MaterialColor color, Color containerColor) {
    return ListTile(
      title: Text(
        themeName,
        style: const TextStyle(
          fontSize: 16.0,
          fontWeight: FontWeight.bold,
        ),
      ),
      leading: CircleAvatar(
        backgroundColor: color,
      ),
      trailing: Radio<MaterialColor>(
        value: color,
        groupValue: _selectedThemeColor,
        onChanged: (value) {
          setState(() {
            _selectedThemeColor = value!;
          });
          widget.onThemeChanged(value!, containerColor);
        },
      ),
    );
  }

  Widget _buildThemeList() {
    return ListView(
      children: <Widget>[
        _buildThemeItem(
          'Uchiha',
          Colors.red,
          const Color.fromARGB(255, 100, 100, 100),
        ),
        _buildThemeItem(
          'Akatsuki',
          Colors.deepPurple,
          const Color.fromARGB(255, 200, 200, 200),
        ),
        _buildThemeItem(
          'Leaf Village',
          Colors.green,
          const Color.fromARGB(255, 100, 100, 200),
        ),
        _buildThemeItem(
          'Sand Village',
          Colors.amber,
          const Color.fromARGB(255, 200, 150, 50),
        ),
        _buildThemeItem(
          'Cloud Village',
          Colors.blue,
          const Color.fromARGB(255, 100, 150, 200),
        ),
        // Add more theme items here
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _buildThemeList(),
      ),
    );
  }
}
