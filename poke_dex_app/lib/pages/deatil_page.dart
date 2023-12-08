import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:poke_dex_app/constants/ui_helper.dart';
import 'package:poke_dex_app/model/pokemon_model.dart';
import 'package:poke_dex_app/widgets/poke_information.dart';

import '../widgets/poke_typ_name.dart';

class DetailPage extends StatelessWidget {
  final PokemonModel pokemon;
  const DetailPage({required this.pokemon,super.key});

  @override
  Widget build(BuildContext context) {
    String pokeballImageUrl='images/pokeball_png.png';
    return ScreenUtil().orientation ==Orientation.portrait ?  _buildPortraitBody(context, pokeballImageUrl) : _buildLandscapeBody(context, pokeballImageUrl);
  }

  Scaffold _buildLandscapeBody(BuildContext context, String pokeballImageUrl) {
    return Scaffold(
      backgroundColor: UIHelper.getColorFromType(pokemon.type![0]),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: UIHelper.getIcontPadding(),
              child: IconButton(
                iconSize: 18.w,
                onPressed: () {
                Navigator.of(context).pop();
              }, icon: const Icon(Icons.arrow_back_ios)),
              
            ),
            Expanded(
              child: Row(
              children: [
                   Expanded(
                    flex: 3,
                     child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children: [
                         PokeNameType(pokemon: pokemon),
                         Expanded(
                           child: Hero(
                                                   tag: pokemon.id!,
                                                   child: CachedNetworkImage(
                            imageUrl: pokemon.img ?? '',
                            height: 0.20.sw,
                            fit: BoxFit.fitHeight,
                            ),
                                                 ),
                         ),
                       ],
                     ),
                   ),
                   Expanded(flex: 5,child: Padding(
                     padding: UIHelper.getDefaultPadding(),
                     child: PokeInformation(pokemon: pokemon),
                   )),
              ],
              )
              )
          ]
          ),
      ),
         
    );
}

  Scaffold _buildPortraitBody(BuildContext context, String pokeballImageUrl) {
    return Scaffold(
    backgroundColor: UIHelper.getColorFromType(pokemon.type![0]),
    body: SafeArea( 
      child: Column( 
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: UIHelper.getIcontPadding(),
            child: IconButton(
              iconSize: 18.w,
              onPressed: () {
              Navigator.of(context).pop();
            }, icon: const Icon(Icons.arrow_back_ios)),
            
          ),
          PokeNameType(pokemon:pokemon),
          SizedBox(height: 20.h,),
          Expanded(child: Stack(
            children: [
              Positioned(
                child: Image.asset(pokeballImageUrl,
                height: 0.15.sh,
                fit: BoxFit.fitHeight,),
                right: 0,
                top: 0,),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                top: 0.16.sh,
                child: PokeInformation(pokemon: pokemon)
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: Hero(
                    tag: pokemon.id!,
                    child: CachedNetworkImage(
                      imageUrl: pokemon.img ?? '',
                      height: 0.25.sh,
                      fit: BoxFit.fitHeight,
                      ),
                  ),
                )
            ],
          ))

        ],
      ),
    ),
  );
  }
}