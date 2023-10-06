import 'package:faabul_color_picker/faabul_color_picker.dart';
import 'package:flutter/material.dart';

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
      theme: ThemeData(colorSchemeSeed: Colors.purple, useMaterial3: true),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Color? _selectedColor;
  bool _allowUnselectButton = false;
  bool _customColors = false;

  static const _kCustomColors = [
    FaabulColorShades(color: Colors.red, shades: [
      Colors.red,
      Colors.redAccent,
    ]),
    FaabulColorShades(color: Colors.green, shades: [
      Colors.lightGreen,
      Colors.green,
      Colors.lightGreenAccent,
      Colors.greenAccent,
    ]),
    FaabulColorShades(color: Colors.blue, shades: [
      Colors.lightBlue,
      Colors.blue,
      Colors.lightBlueAccent,
      Colors.blueAccent,
    ]),
  ];

  @override
  Widget build(BuildContext context) {
    final theme = ThemeData.from(
      colorScheme:
          ColorScheme.fromSeed(seedColor: _selectedColor ?? Colors.purple),
      useMaterial3: true,
    );
    return Theme(
      data: theme,
      child: Scaffold(
        backgroundColor: _selectedColor,
        body: Center(
          child: SizedBox(
            width: 400,
            height: 400,
            child: Card(
              child: Column(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          if (_selectedColor == null)
                            const Text('No color selected')
                          else
                            Wrap(
                              spacing: 4,
                              children: [
                                const Text('Selected color:'),
                                FaabulColorSample(color: _selectedColor!),
                              ],
                            ),
                          FilledButton(
                              onPressed: _handlePickColor,
                              child: const Text('Pick a color')),
                        ],
                      ),
                    ),
                  ),
                  SwitchListTile.adaptive(
                    title: const Text('Allow unselect button'),
                    value: _allowUnselectButton,
                    onChanged: (value) =>
                        setState(() => _allowUnselectButton = value),
                  ),
                  SwitchListTile.adaptive(
                    title: const Text('Custom colors'),
                    value: _customColors,
                    onChanged: (value) => setState(() => _customColors = value),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _handlePickColor() async {
    final color = await showColorPickerDialog(
      context: context,
      selected: _selectedColor,
      allowUnselectButton: _allowUnselectButton,
      colors: _customColors ? _kCustomColors : null,
    );
    if (!mounted) return;
    setState(() => _selectedColor = color);
  }
}
