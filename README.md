# faabul_color_picker

![Sample image](https://raw.githubusercontent.com/yomio/faabul_color_picker/main/doc/sample.png)
faabul_color_picker is developed and used by [Faabul Live Quizzes][faabul_link]

## Getting Started

Call `showColorPickerDialog` to show the color picker dialog and await the result.

```dart
final color = await showColorPickerDialog(context: context);
```

In most cases you want to specify the currently selected color. If you want to allow the user to unselect the color, set `allowUnselectButton` to `true`.

```dart
final color = await showColorPickerDialog(
  context: context,
  selected: selectedColor,
  allowUnselectButton: true,
);
```
### Custom colors

If you want to use custom colors, pass them to the `colors` parameter.

```dart
final color = await showColorPickerDialog(
  context: context,
  selected: selectedColor,
  colors: [
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
  ],
);
```

### Other exposed classes

`FaabulColorPicker` is the widget that shows inside the `showColorPickerDialog`. It can be used directly if you want to select the color in a different way.

`FaabulColorButton` is the button used to represent an individual `Color`.

`FaabulColorSample` presents the `Color` in a circle.

[faabul_link]: https://faabul.com
