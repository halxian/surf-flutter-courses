import 'nation.dart';
import 'republic.dart';
import 'сountry.dart';

void main() {
  Country c1 = Country(
    name: "Какаята страна",
    nations: [
      Nation(
        name: 'Эльфы',
        population: 400,
        republic: Republic(name: 'Адам', budget: 10000),
      )
    ],
  );
  Country c2 = Country(
    name: "Какаята страна 2",
    nations: [
      Nation(
        name: 'Орки',
        population: 300 ,
        republic: Republic(name: 'Болото', budget: 0),
      )
    ],
  );
  c2.attack(country: c1);
  print(c1);
}
