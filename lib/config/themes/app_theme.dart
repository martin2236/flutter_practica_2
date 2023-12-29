import 'package:flutter/material.dart';

const Color _customColor = Color(0xFF40A5DD);

const List<Color> _colorTheme= [
  _customColor,
  Colors.teal,
  Colors.red,
  Colors.blue,
  Colors.green,
  Colors.yellow,
  Colors.orange
];

class AppTheme{

final int selectedColor;

    AppTheme({ this.selectedColor = 0})
    : assert(selectedColor >= 0 && 
    selectedColor <= _colorTheme.length - 1,
    'El numero debe ser entre 0 y ${_colorTheme.length}')
    ;
  ThemeData theme(){
    return ThemeData(
      //brightness: Brightness.dark,
      colorSchemeSeed: _colorTheme[selectedColor]
    );
  }
}