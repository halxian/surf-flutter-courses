import 'nation.dart';
import 'republic.dart';

class Country{
  final String name;
  List<Republic>? republics;
  List<Nation> nations;

  Country({
    required this.name,
    required this.nations,
    this.republics,
  });

  int get population{
    int sum = 0;
    for (var element in nations) {
      sum += element.population;
    }
    return sum;
  }

  void attack({required Country country,}){
    if(population > country.population){
      print('Вы победили');
    }
    else{
      print("Вы проиграли");
    }
  }

  @override
  String toString(){
    String country = 
      '''
      Страна: $name,
      Нации: ${nations.map((e) => e.toString())},
      Республки: ${republics?.map((e) => e.toString())},
      Население: $population,
      ''';
    
    return country;
    
  }
}