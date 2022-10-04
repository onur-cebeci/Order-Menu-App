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
  FoodModel(
      name: 'Hamburger',
      description:
          't is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout',
      img: 'assets/foods/burger.png',
      value: 20),
  FoodModel(
      name: 'Shot Burger',
      description:
          't is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout',
      img: 'assets/foods/shot_burger.png',
      value: 25),
  FoodModel(
      name: 'Chicken Burger',
      description:
          't is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout',
      img: 'assets/foods/chicken_burger.png',
      value: 18),
  FoodModel(
      name: 'Hot Shot Chicken',
      description:
          't is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout',
      img: 'assets/foods/hot_shot_chicken.png',
      value: 12),
  FoodModel(
      name: 'Cheese Pizza',
      description:
          't is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout',
      img: 'assets/foods/Cheese_Pizza.png',
      value: 14),
  FoodModel(
      name: 'Special Pizza',
      description:
          't is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout',
      img: 'assets/foods/special_pizza.png',
      value: 18),
  FoodModel(
      name: 'Fried Potatoes',
      description:
          't is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout',
      img: 'assets/foods/fried_potatoes.png',
      value: 8),
  FoodModel(
      name: 'Baked Potato',
      description:
          't is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout',
      img: 'assets/foods/baked_potato.png',
      value: 14),
  FoodModel(
      name: '     Toast',
      description:
          't is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout',
      img: 'assets/foods/toast.png',
      value: 12),
];
