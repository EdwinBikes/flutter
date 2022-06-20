class CharacterDTO {
  int id;
  String name;
  String image;
  String status;
  String species;
  String gender;

  CharacterDTO.fromJson(Map<dynamic, dynamic> json)
      : id = json['id'],
        name = json['name'],
        species = json['species'],
        status = json['status'],
        image = json['image'],
        gender = json['gender'];
}
