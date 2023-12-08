import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:poke_dex_app/model/pokemon_model.dart';

class PokeApi{
  static const String _url='https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json';

 //içinde pokeon modellerin olduğu bir liste veren future   
  static Future<List<PokemonModel>> getPokemonData() async{
    List<PokemonModel> _list=[];
    
    var result = await Dio().get(_url);// şuan veri bize string formatında geldi
    var pokeList=jsonDecode(result.data)['pokemon'];//ilk önce result.data bize map geliyor bizim ilgilendiğimiz alan ['pokemon'] keyindeki alan
    
    if (pokeList is List) {
      //tek tek liste okunuyor bunlar Pokemon modellerine dçnüştürülüyor havada
      _list=pokeList.map((e) => PokemonModel.fromJson(e)).toList();
    }else{
      return [];
    }

     debugPrint(_list.first.toString());




    return _list;
  }
}