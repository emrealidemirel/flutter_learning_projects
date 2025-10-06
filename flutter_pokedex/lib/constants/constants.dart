import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Constants {
  Constants._();

  static const String title = "Pokedex";
  static TextStyle getTitleStyle() {
    return TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: _calculatedFontSize(48));
  }

  static const String pokeballImgUrl = "images/pokeball.png";

  static TextStyle getPokemonNameStyle() {
    return TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: _calculatedFontSize(24));
  }

  static TextStyle getTypeChipStyle() {
    return TextStyle(color: Colors.white, fontSize: _calculatedFontSize(15));
  }

  static _calculatedFontSize(int size) {
    if (ScreenUtil().orientation == Orientation.portrait) {
      return size.sp;
    } else {
      return size.sp;
    }
  }

  static getPokemonInfoStyle() {
    return TextStyle(fontSize: _calculatedFontSize(16), color: Colors.black);
  }

  static getPokemonInfoLabelStyle() {
    return TextStyle(
        fontSize: _calculatedFontSize(20),
        color: Colors.black,
        fontWeight: FontWeight.bold);
  }
}
