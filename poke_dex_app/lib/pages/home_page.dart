import 'package:flutter/material.dart';
import 'package:poke_dex_app/widgets/app_title.dart';
import 'package:poke_dex_app/widgets/pokemon_list.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: OrientationBuilder(
        builder: (context, orientation) => Column(
          children: [
            AppTittle(),
            Expanded(
              child:  PokemonList()),
          ],
        ),
      ),
    );
  }
}