// import 'package:flutter/material.dart';

// class SettingsScreen extends StatefulWidget {
//   final ColorTheme? currentTheme;
//   final void Function(ColorTheme?)? onChanged;

//   SettingsScreen({
//     this.currentTheme,
//     this.onChanged,
//   });

//   @override
//   _SettingsScreenState createState() => _SettingsScreenState();
// }

// class _SettingsScreenState extends State<SettingsScreen> {
//   ColorTheme? selectedTheme; // Nullable selected theme

//   void changeTheme(ColorTheme? theme) {
//     setState(() {
//       selectedTheme = theme;
//     });
//     if (widget.onChanged != null) {
//       widget.onChanged!(theme);
//     }
//   }

//   @override
//   void initState() {
//     super.initState();
//     selectedTheme = widget.currentTheme; // Initialize selected theme
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Settings'),
//       ),
//       body: ListView.builder(
//         itemCount: colorThemes.length,
//         itemBuilder: (context, index) {
//           final theme = colorThemes[index];
//           return ListTile(
//             title: Text(theme.name),
//             leading: Radio<ColorTheme>(
//               value: theme,
//               groupValue: selectedTheme,
//               onChanged: changeTheme,
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

// class ColorTheme {
//   final String name;
//   final Color primaryColor;
//   final Color secondaryColor;

//   ColorTheme({
//     required this.name,
//     required this.primaryColor,
//     required this.secondaryColor,
//   });
// }

// List<ColorTheme> colorThemes = [
//   ColorTheme(
//     name: 'Hokage Red',
//     primaryColor: Color(0xFFE53E3E),
//     secondaryColor: Color(0xFFF56565),
//   ),
//   ColorTheme(
//     name: 'Sharingan Crimson',
//     primaryColor: Color(0xFFD6304A),
//     secondaryColor: Color(0xFFF79F1F),
//   ),
//   ColorTheme(
//     name: 'Uchiha Black',
//     primaryColor: Color(0xFF30336B),
//     secondaryColor: Color(0xFFEE5A24),
//   ),
//   ColorTheme(
//     name: 'Sage Green',
//     primaryColor: Color(0xFF2EC4B6),
//     secondaryColor: Color(0xFF011627),
//   ),
//   ColorTheme(
//     name: 'Byakugan White',
//     primaryColor: Color(0xFFFFFFFF),
//     secondaryColor: Color(0xFFE9C46A),
//   ),
//   ColorTheme(
//     name: 'Rinnegan Purple',
//     primaryColor: Color(0xFF7209B7),
//     secondaryColor: Color(0xFF3A0CA3),
//   ),
//   ColorTheme(
//     name: 'Akatsuki Black',
//     primaryColor: Color(0xFF000000),
//     secondaryColor: Color(0xFFFF0000),
//   ),
//   ColorTheme(
//     name: 'Jinchuriki Orange',
//     primaryColor: Color(0xFFFF9F00),
//     secondaryColor: Color(0xFFFF2D00),
//   ),
//   ColorTheme(
//     name: 'Senju Green',
//     primaryColor: Color(0xFF27AE60),
//     secondaryColor: Color(0xFFD4AC0D),
//   ),
//   ColorTheme(
//     name: 'Raikage Yellow',
//     primaryColor: Color(0xFFEDE510),
//     secondaryColor: Color(0xFF28334A),
//   ),
// ];
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class SettingsScreen extends StatefulWidget {
  final void Function(Color)? onColorChanged;

  SettingsScreen({this.onColorChanged});

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Color newColor = Colors.orange; // Define the newColor variable

            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: const Text('Select a color'),
                  content: SingleChildScrollView(
                    child: ColorPicker(
                      pickerColor:
                          newColor, // Use the defined newColor variable
                      onColorChanged: (Color color) {
                        newColor = color; // Update the newColor variable
                      },
                      showLabel: true,
                      pickerAreaHeightPercent: 0.8,
                    ),
                  ),
                  actions: <Widget>[
                    ElevatedButton(
                      child: const Text('OK'),
                      onPressed: () {
                        if (widget.onColorChanged != null) {
                          widget.onColorChanged!(newColor);
                        }
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                );
              },
            );
          },
          child: const Text('Change Color'),
        ),
      ),
    );
  }
}
