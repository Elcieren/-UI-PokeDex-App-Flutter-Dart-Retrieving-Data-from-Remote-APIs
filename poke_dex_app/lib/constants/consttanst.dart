import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Constants{
  Constants._();//kimse bundan nesne üretemez gizli yapmış olduk
  static const String title='PokeDex';
  
  static TextStyle getTittleTextStyle(){
    return TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontSize: _calculateFonstSize(48),
    );
  }

   static TextStyle getPokemonNameTextStyle(){
    return TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontSize: _calculateFonstSize(24),
    );
  }
  static TextStyle getTypChipTextStyle(){
    return TextStyle(
      color: Colors.white,
      fontSize: _calculateFonstSize(20),
    );
  }

  static _calculateFonstSize(int size){
    if (ScreenUtil().orientation==Orientation.portrait) {
      return size.sp;
    }else{
      return (size*0.55).sp;
    }
  }
   static getPokeInfoLabelStyle(){
    return TextStyle(fontSize: _calculateFonstSize(20),fontWeight: FontWeight.bold,color: Colors.black);
  }
  
  static getPokeInfoTextStyle(){
    return TextStyle(fontSize: _calculateFonstSize(16),color: Colors.black);
  }
}