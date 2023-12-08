import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:poke_dex_app/constants/ui_helper.dart';
import 'package:poke_dex_app/model/pokemon_model.dart';

class PokeImageAndBall extends StatelessWidget {
  final PokemonModel pokemon;
  const PokeImageAndBall({required this.pokemon,super.key});

  @override
  Widget build(BuildContext context) {
    String pokeballImageUrl='images/pokeball_png.png';
    return Stack(
      children: [
        Align(
          alignment: Alignment.bottomRight,
          child: Image.asset(pokeballImageUrl,width: UIHelper.calculatePokeImaheAndBallSize(),height: UIHelper.calculatePokeImaheAndBallSize(),
          fit: BoxFit.fitHeight,),
        ),
        
        Align(
          alignment: Alignment.bottomRight,
          child: Hero(
            tag: pokemon.id!,
            child: CachedNetworkImage(
              imageUrl: pokemon.img ?? '',
              errorWidget: (context, url, error) => Icon(Icons.ac_unit),
              width: UIHelper.calculatePokeImaheAndBallSize(),height: UIHelper.calculatePokeImaheAndBallSize(),
              fit: BoxFit.fitHeight,
              placeholder: (context, url) =>  CircularProgressIndicator(
                color:UIHelper.getColorFromType(pokemon.type![0]),
              ),
              ),
          ),
        ),
      ],
    );
  }
}