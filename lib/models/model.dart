class FoodModel {
  final String name;
  final String description;
  final String img;
  final int value;
  FoodModel(
      {required this.name,
      required this.description,
      required this.img,
      required this.value});
}

final foodList = <FoodModel>[
  FoodModel(name: 'Hamburger', description: 'Lorem Lipsum', img: '', value: 20)
];
