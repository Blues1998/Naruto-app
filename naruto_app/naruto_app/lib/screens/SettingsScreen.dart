import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class SettingsScreen extends StatefulWidget {
  final MaterialColor primarySwatchColor;
  final void Function(MaterialColor)? onPrimarySwatchColorChanged;

  SettingsScreen({
    required this.primarySwatchColor,
    this.onPrimarySwatchColorChanged,
  });

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  late MaterialColor _selectedColor;

  @override
  void initState() {
    super.initState();
    _selectedColor = widget.primarySwatchColor;
  }

  void changeColor(Color newColor) {
    setState(() {
      _selectedColor = MaterialColor(newColor.value, {
        50: newColor.withOpacity(0.1),
        100: newColor.withOpacity(0.2),
        200: newColor.withOpacity(0.3),
        300: newColor.withOpacity(0.4),
        400: newColor.withOpacity(0.5),
        500: newColor.withOpacity(0.6),
        600: newColor.withOpacity(0.7),
        700: newColor.withOpacity(0.8),
        800: newColor.withOpacity(0.9),
        900: newColor.withOpacity(1.0),
      });
    });

    if (widget.onPrimarySwatchColorChanged != null) {
      widget.onPrimarySwatchColorChanged!(_selectedColor);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: const Text('Select a color'),
                  content: SingleChildScrollView(
                    child: ColorPicker(
                      pickerColor: _selectedColor[500]!,
                      onColorChanged: (Color color) {
                        changeColor(color);
                      },
                      showLabel: true,
                      pickerAreaHeightPercent: 0.8,
                    ),
                  ),
                  actions: <Widget>[
                    ElevatedButton(
                      child: const Text('OK'),
                      onPressed: () {
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
