import 'republic.dart';

class Nation {
  final String name;
  int population;
  final Republic republic;

  Nation({
    required this.name,
    required this.population,
    required this.republic,
  });

  @override
  String toString() {
    String nation = '''
        Название: $name,
        Место проживания: ${republic.toString()},
        Население: $population,
      ''';

    return nation;
  }
}
