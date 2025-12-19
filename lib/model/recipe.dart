import 'package:recipe_app/model/ingredient.dart';
class Recipe{
  String imgLable ;
  String imageUrl ;
  String description;
  List<Ingredient> ingredient;

  // Constructor
  Recipe(this.imageUrl, this.imgLable, this.description, this.ingredient);

  static List<Recipe> samples =
  [
    Recipe('assets/images/Larb muang.webp', 'Larb muang', 'AAA',
    [
    Ingredient(name: 'Aubergines', quantity: 2 , unit:''),
    Ingredient(name: 'Jungle curry paste', quantity: 2 , unit:'tbsp'),
    Ingredient(name: 'Vegetable stock', quantity: 2 , unit:'cups'),
    Ingredient(name: 'Kaffir lime leaves', quantity: 3 , unit:''),
    Ingredient(name: 'Thai chilies', quantity: 2 , unit:''),
    Ingredient(name: 'Fish sauce', quantity: 1 , unit:'tbsp'),
    Ingredient(name: 'Thai basil', quantity: 1 , unit:'handful'),
    ],
 ),
 Recipe('assets/images/Pad Thai.webp', 'Pad Thai', 'A',
    [
    Ingredient(name: 'Rice noodles', quantity: 200 , unit:'g'),
    Ingredient(name: 'Shrimp', quantity: 6 , unit:'pcs'),
    Ingredient(name: ' Tofu', quantity: 1 , unit:'block'),
    Ingredient(name: 'Bean sprouts', quantity: 1 , unit:'cup'),
    Ingredient(name: 'Peanuts', quantity: 2 , unit:'tbsp'),
    Ingredient(name: 'Pad Thai sauce', quantity: 3 , unit:'tbsp'),
    ],
 ),
 Recipe('assets/images/Thai green fish curry.webp', 'Thai green fish', 'B+',
    [
    Ingredient(name: 'Fish fillet', quantity: 300, unit: 'g'),
    Ingredient(name: 'Green curry paste', quantity: 2, unit: 'tbsp'),
    Ingredient(name: 'Coconut milk', quantity: 2, unit: 'cups'),
    Ingredient(name: 'Sweet basil', quantity: 1, unit: 'handful'),
    Ingredient(name: 'Eggplant', quantity: 4, unit: 'pcs'),
    Ingredient(name: 'Palm sugar', quantity: 1, unit: 'tbsp'),
    ],
 ),
 Recipe('assets/images/Thai pumpkin curry.webp', 'Thai pumpkin curry', 'C-',
    [
    Ingredient(name: 'Pumpkin', quantity: 300, unit: 'g'),
    Ingredient(name: 'Red curry paste', quantity: 2, unit: 'tbsp'),
    Ingredient(name: 'Coconut milk', quantity: 2, unit: 'cups'),
    Ingredient(name: 'Chicken or Tofu', quantity: 150, unit: 'g'),
    Ingredient(name: 'Lime leaves', quantity: 4, unit: 'pcs'),
    Ingredient(name: 'Fish sauce', quantity: 1 , unit:'tbsp'),
    Ingredient(name: 'Red chili', quantity: 2, unit: 'pcs'),
    ],
 ),
];

  
}