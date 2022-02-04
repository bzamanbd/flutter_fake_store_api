import 'dart:convert';
Fruit fruitFromJson(String str) => Fruit.fromJson(json.decode(str));
String fruitToJson(Fruit data) => json.encode(data.toJson());

class Fruit {
  int id;
  String genus, name, family, order;
  Nutritions nutritions;
  Fruit({
    required this.id,
    required this.genus,
    required this.name,
    required this.family,
    required this.order,
    required this.nutritions,
  });


  factory Fruit.fromJson(Map<String, dynamic> json) => Fruit(
        id: json["id"],
        genus: json["genus"],
        name: json["name"],
        family: json["family"],
        order: json["order"],
        nutritions: Nutritions.fromJson(json["nutritions"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "genus": genus,
        "name": name,
        "family": family,
        "order": order,
        "nutritions": nutritions.toJson(),
      };
}

class Nutritions {
  int calories;
  double carbohydrates, protein, fat,sugar;
  Nutritions({
    required this.calories,
    required this.carbohydrates,
    required this.protein,
    required this.fat,
    required this.sugar,
  });




  factory Nutritions.fromJson(Map<String, dynamic> json) => Nutritions(
        calories: json["calories"],
        carbohydrates: json["carbohydrates"].toDouble(),
        protein: json["protein"].toDouble(),
        fat: json["fat"].toDouble(),
        sugar: json["sugar"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "carbohydrates": carbohydrates,
        "protein": protein,
        "fat": fat,
        "calories": calories,
        "sugar": sugar,
      };
}
