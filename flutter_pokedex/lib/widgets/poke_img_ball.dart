import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pokedex/constants/ui_helper.dart';
import 'package:flutter_pokedex/model/pokemon_model.dart';

class PokeImgBall extends StatelessWidget {
  final PokemonModel pokemon;
  const PokeImgBall({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    String pokeBallImgUrl = "images/pokeball.png";
    return Stack(
      children: [
        Align(
          alignment: Alignment.bottomRight,
          child: Image.asset(
            pokeBallImgUrl,
            width: UIHelper.calculatedPokeImgBallSize(),
            height: UIHelper.calculatedPokeImgBallSize(),
            fit: BoxFit.fitHeight,
          ),
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: Hero(
            tag: pokemon.id!,
            child: CachedNetworkImage(
              imageUrl: pokemon.img ?? "",
              errorWidget: (context, url, error) => Icon(Icons.ac_unit),
              width: UIHelper.calculatedPokeImgBallSize(),
              height: UIHelper.calculatedPokeImgBallSize(),
              fit: BoxFit.fitHeight,
              placeholder: (context, url) => const CircularProgressIndicator(
                color: Colors.black,
              ),
            ),
          ),
        )
      ],
    );
  }
}
