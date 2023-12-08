import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:poke_dex_app/constants/consttanst.dart';
import 'package:poke_dex_app/constants/ui_helper.dart';
import 'package:poke_dex_app/model/pokemon_model.dart';

class PokeInformation extends StatelessWidget {
  final PokemonModel pokemon;
  const PokeInformation({required this.pokemon,super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10.w)),color: Colors.white
        ),
        child: Padding(
          padding: UIHelper.getIcontPadding(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
            _buildInformationRow('Name', pokemon.name),
            _buildInformationRow('Height', pokemon.height),
            _buildInformationRow('Weight', pokemon.weight),
            _buildInformationRow('Spawn Time', pokemon.spawnTime),
            _buildInformationRow('Weakness', pokemon.weaknesses),
            _buildInformationRow('Pre Evolution', pokemon.prevEvolution.toString()),
            _buildInformationRow('Next Evolution', pokemon.nextEvolution.toString()),
            ],
           ),
        ),
    );
  }
  _buildInformationRow(String label,dynamic value){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
         children: [
          Text(label,style: Constants.getPokeInfoLabelStyle(),),
          if(value is List && value.isNotEmpty)
          Text(value.join(' , '),style: Constants.getPokeInfoTextStyle(),)
          else if(value==null)
          const Text('Not available')
          else Text(value)
          ],
    );
  }
}