import 'package:api_rick_and_morty/home/controllers/home_controller.dart';
import 'package:api_rick_and_morty/home/models/character.dart';
import 'package:flutter/material.dart';
// import 'package:api_rick_and_morty/utils/widgets/my_drawer.dart';

import '../widgets/card.dart';

class MyHome extends StatelessWidget {
  const MyHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("API Rick & Morty"),
        ),
        // drawer: Drawer(child: MyDrawer()),
        body: SingleChildScrollView(
            child: Column(
          children: [getCharacters()],
        )));
  }

  FutureBuilder<List<CharacterDTO>> getCharacters() =>
      FutureBuilder<List<CharacterDTO>>(
          future: homeController.getCharacters(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Container(
                height: 300,
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            }

            final List<CharacterDTO> characters = snapshot.data ?? [];
            final bool characterCounter = characters.isNotEmpty;
            if (characterCounter) {
              return _buildMyCharacters(characters);
            } else {
              return Container();
            }
          });

  Widget _buildMyCharacters(List<CharacterDTO> characters) {
    return ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: characters.length,
        itemBuilder: (context, index) {
          return MyCard(characterDTO: characters[index]);
        });
  }
}
