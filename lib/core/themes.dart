import 'package:flutter/material.dart';

const colors = {
  "primary": Color.fromARGB(255, 103, 80, 164),
  "onPrimary": Color.fromARGB(255, 255, 255, 255),
  "secondary": Color.fromARGB(255, 229, 192, 255),  
  "onSecondary": Color.fromARGB(255, 255, 255, 255),
  "error": Color.fromARGB(255, 255, 0, 0),
  "onError": Color.fromARGB(255, 241, 241, 241),
  "surface": Color.fromARGB(255, 244, 246, 255),
  "onSurface": Color.fromARGB(255, 255, 255, 255),
};

const darkColors = {
  "primary": Color.fromARGB(255, 229, 192, 255), 
  "onPrimary": Color.fromARGB(255, 0, 0, 0),  
  "secondary": Color.fromARGB(255, 23, 33, 43), 
  "onSecondary": Color.fromARGB(255, 241, 241, 241),  
  "error": Color.fromARGB(255, 255, 0, 0),
  "onError": Color.fromARGB(255, 241, 241, 241),
  "surface": Color.fromARGB(255, 29, 27, 32),
  "onSurface": Color.fromARGB(255, 0, 0, 0),  
};


final lightTheme = ThemeData(
  brightness: Brightness.light,
  colorScheme: ColorScheme(
    brightness: Brightness.light, 
    primary: colors["primary"]!, 
    onPrimary: colors["onPrimary"]!, 
    secondary: colors["secondary"]!, 
    onSecondary: colors["onSecondary"]!, 
    error: colors["error"]!, 
    onError: colors["onError"]!, 
    surface: colors["surface"]!, 
    onSurface: colors["onSurface"]!
    )
);

final darkTheme = ThemeData(
  brightness: Brightness.dark,
  colorScheme: ColorScheme(
    brightness: Brightness.dark, 
    primary: darkColors["primary"]!, 
    onPrimary: darkColors["onPrimary"]!, 
    secondary: darkColors["secondary"]!, 
    onSecondary: darkColors["onSecondary"]!, 
    error: darkColors["error"]!, 
    onError: darkColors["onError"]!, 
    surface: darkColors["surface"]!, 
    onSurface: darkColors["onSurface"]!
    )
);
