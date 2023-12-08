import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:poke_dex_app/constants/consttanst.dart';
import 'package:poke_dex_app/constants/ui_helper.dart';

class AppTittle extends StatefulWidget {
  const AppTittle({super.key});

  @override
  State<AppTittle> createState() => _AppTittleState();
}

class _AppTittleState extends State<AppTittle> {
  String pokeballImageUrl='images/pokeball_png.png';
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      height: UIHelper.getAppTitleWidgetHeight(),
      child: Stack(
        children: [
           Padding(
             padding: UIHelper.getDefaultPadding(),
             child: Align(
              alignment:Alignment.centerLeft,
              child:Text(
                Constants.title, 
                style: Constants.getTittleTextStyle(),)),
           ),
          Align(
            alignment: Alignment.topRight,
            child: Image.asset(
              pokeballImageUrl,
              width: ScreenUtil().orientation==Orientation.portrait 
              ? 0.2.sh 
              : 0.2.sw,
              
              fit: BoxFit.fitWidth,
              ),
          ),
        ],
      ),
    );
  }
}