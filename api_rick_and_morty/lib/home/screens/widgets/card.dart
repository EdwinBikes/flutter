import 'package:flutter/material.dart';
import 'package:api_rick_and_morty/home/models/character.dart';

class MyCard extends StatelessWidget {
  final CharacterDTO characterDTO;
  const MyCard({Key? key, required this.characterDTO}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const textStyleTex = TextStyle(
      fontSize: 18,
    );
    ;
    return Container(
        margin: const EdgeInsets.only(top: 18),
        child: Row(children: [
          Image.network(
            characterDTO.image,
            width: 100,
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      characterDTO.name,
                      style: textStyleTex,
                      softWrap: true,
                    ),
                    Text(
                      characterDTO.gender,
                      style: textStyleTex,
                    ),
                    Text(
                      characterDTO.species,
                      style: textStyleTex,
                    ),
                  ]),
            ),
          )
        ]));
  }
}
