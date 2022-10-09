class ContextModel {
  final String name;
  final String description;
  final String img;
  final int value;
  ContextModel(
      {required this.name,
      required this.description,
      required this.img,
      required this.value});
}

final coffeesList = <ContextModel>[
  ContextModel(
      name: 'Americano',
      description: '* Context 1     Context 2 *\n* Context 3    Context 4 *',
      img: 'assets/coffees/americano.png',
      value: 20),
  ContextModel(
      name: 'Black Tea Latte',
      description: '* Context 1     Context 2 *\n* Context 3    Context 4 *',
      img: 'assets/coffees/black_tea_latte.png',
      value: 25),
  ContextModel(
      name: 'Cappuccino',
      description: '* Context 1     Context 2 *\n* Context 3    Context 4 *',
      img: 'assets/coffees/capuchino.png',
      value: 18),
  ContextModel(
      name: 'Caramel Cold Drink',
      description: '* Context 1     Context 2 *\n* Context 3    Context 4 *',
      img: 'assets/coffees/caramel_cold_drink.png',
      value: 12),
  ContextModel(
      name: 'Caramel Macchiato',
      description: '* Context 1     Context 2 *\n* Context 3    Context 4 *',
      img: 'assets/coffees/caramel_macchiato.png',
      value: 14),
  ContextModel(
      name: 'Caramelized Pecan Latte',
      description: '* Context 1     Context 2 *\n* Context 3    Context 4 *',
      img: 'assets/coffees/caramelized_pecan_latte.png',
      value: 18),
  ContextModel(
      name: 'Classic Irish Coffee',
      description: '* Context 1     Context 2 *\n* Context 3    Context 4 *',
      img: 'assets/coffees/classic_irish_coffee.png',
      value: 8),
  ContextModel(
      name: 'Iced Coffee Mocha',
      description: '* Context 1     Context 2 *\n* Context 3    Context 4 *',
      img: 'assets/coffees/iced_coffee_mocha.png',
      value: 14),
  ContextModel(
      name: 'Toffee Nut Crunch Latte',
      description: '* Context 1     Context 2 *\n* Context 3    Context 4 *',
      img: 'assets/coffees/toffee_nut_crunch_latte.png',
      value: 12),
  ContextModel(
      name: 'Toffee Nut Iced Latte',
      description: '* Context 1     Context 2 *\n* Context 3    Context 4 *',
      img: 'assets/coffees/toffee_nut_iced_latte.png',
      value: 12),
  ContextModel(
      name: 'Toffee Nut Latte',
      description: '* Context 1     Context 2 *\n* Context 3    Context 4 *',
      img: 'assets/coffees/toffee_nut_latte.png',
      value: 14),
  ContextModel(
      name: 'Vietnamese Style Iced Coffee',
      description: '* Context 1     Context 2 *\n* Context 3    Context 4 *',
      img: 'assets/coffees/vietnamese_style_iced_coffee.png',
      value: 18),
];

final foodList = <ContextModel>[
  ContextModel(
      name: 'Hamburger',
      description: '* Context 1     Context 2 *\n* Context 3    Context 4 *',
      img: 'assets/foods/burger.png',
      value: 20),
  ContextModel(
      name: 'Shot Burger',
      description: '* Context 1     Context 2 *\n* Context 3    Context 4 *',
      img: 'assets/foods/shot_burger.png',
      value: 25),
  ContextModel(
      name: 'Chicken Burger',
      description: '* Context 1     Context 2 *\n* Context 3    Context 4 *',
      img: 'assets/foods/chicken_burger.png',
      value: 18),
  ContextModel(
      name: 'Hot Shot Chicken',
      description: '* Context 1     Context 2 *\n* Context 3    Context 4 *',
      img: 'assets/foods/hot_shot_chicken.png',
      value: 12),
  ContextModel(
      name: 'Cheese Pizza',
      description: '* Context 1     Context 2 *\n* Context 3    Context 4 *',
      img: 'assets/foods/Cheese_Pizza.png',
      value: 14),
  ContextModel(
      name: 'Special Pizza',
      description: '* Context 1     Context 2 *\n* Context 3    Context 4 *',
      img: 'assets/foods/special_pizza.png',
      value: 18),
  ContextModel(
      name: 'Fried Potatoes',
      description: '* Context 1     Context 2 *\n* Context 3    Context 4 *',
      img: 'assets/foods/fried_potatoes.png',
      value: 8),
  ContextModel(
      name: 'Baked Potato',
      description: '* Context 1     Context 2 *\n* Context 3    Context 4 *',
      img: 'assets/foods/baked_potato.png',
      value: 14),
  ContextModel(
      name: '     Toast',
      description: '* Context 1     Context 2 *\n* Context 3    Context 4 *',
      img: 'assets/foods/toast.png',
      value: 12),
];
