void main(List<String> args) {
  List<AgriculturalMachinery> listMachinery = [];

  // добовляем в общий массив технику до 2010
  mapBefore2010.forEach((key, listTer) {
    listTer.forEach((ter) {
      ter.machineries.forEach((mach) {
        listMachinery.add(mach);
      });
    });
  });
  // добовляем в общий массив технику после 2010
  mapAfter2010.forEach((key, listTer) {
    listTer.forEach((ter) {
      ter.machineries.forEach((mach) {
        listMachinery.add(mach);
      });
    });
  });

  listMachinery = listMachinery.toSet().toList(); // удаляем повторяюшиеся данные
  List<int> ageOfAlltMachinery = listMachinery.map<int>((e) => (DateTime.now().year - e.releaseDate.year)).toList(); // получем список возрастов всей техники
  int sumAll = 0;

  ageOfAlltMachinery.forEach((element) {
    sumAll+=element; // сумма всех возрастов техники
  });

  ageOfAlltMachinery.sort((a, b) => b.compareTo(a)); // cсортировка от старшего к молодому
  List<int> ageAllHalfMachinery = [];
  for(int i = 0; i < ageOfAlltMachinery.length/2; i++){
    ageAllHalfMachinery.add(ageOfAlltMachinery[i]);
  }

  int sumHalf = 0;
  ageAllHalfMachinery.forEach((element) {
    sumHalf+=element; // сумма ~50% возрастов самой старой техники техники
  });

  /// Вывод данных
  print("Срдений возраст всей техники: ${sumAll/ageOfAlltMachinery.length}");
  print("Срдений возраст ~50% самой старой техники техники: ${sumHalf/ageAllHalfMachinery.length}");
}

enum Countries { brazil, russia, turkish, spain, japan }

class Territory {
  int areaInHectare;
  List<String> crops;
  List<AgriculturalMachinery> machineries;

  Territory(
    this.areaInHectare,
    this.crops,
    this.machineries,
  );
}

class AgriculturalMachinery {
  final String id;
  final DateTime releaseDate;

  AgriculturalMachinery(
    this.id,
    this.releaseDate,
  );

  // Переопределяем оператор "==", что бы сравнивать объекты по значению
  @override
  bool operator ==(Object? other) {
    if (other is! AgriculturalMachinery) return false;
    if (other.id == id && other.releaseDate == releaseDate) return true;

    return false;
  }

  @override
  int get hashCode => id.hashCode ^ releaseDate.hashCode;
}

final mapBefore2010 = <Countries, List<Territory>>{
  Countries.brazil: [
    Territory(
      34,
      ['Кукуруза'],
      [
        AgriculturalMachinery(
          'Трактор Степан',
          DateTime(2001),
        ),
        AgriculturalMachinery(
          'Культиватор Сережа',
          DateTime(2007),
        ),
      ],
    ),
  ],
  Countries.russia: [
    Territory(
      14,
      ['Картофель'],
      [
        AgriculturalMachinery(
          'Трактор Гена',
          DateTime(1993),
        ),
        AgriculturalMachinery(
          'Гранулятор Антон',
          DateTime(2009),
        ),
      ],
    ),
    Territory(
      19,
      ['Лук'],
      [
        AgriculturalMachinery(
          'Трактор Гена',
          DateTime(1993),
        ),
        AgriculturalMachinery(
          'Дробилка Маша',
          DateTime(1990),
        ),
      ],
    ),
  ],
  Countries.turkish: [
    Territory(
      43,
      ['Хмель'],
      [
        AgriculturalMachinery(
          'Комбаин Василий',
          DateTime(1998),
        ),
        AgriculturalMachinery(
          'Сепаратор Марк',
          DateTime(2005),
        ),
      ],
    ),
  ],
};

final mapAfter2010 = {
  Countries.turkish: [
    Territory(
      22,
      ['Чай'],
      [
        AgriculturalMachinery(
          'Каток Кирилл',
          DateTime(2018),
        ),
        AgriculturalMachinery(
          'Комбаин Василий',
          DateTime(1998),
        ),
      ],
    ),
  ],
  Countries.japan: [
    Territory(
      3,
      ['Рис'],
      [
        AgriculturalMachinery(
          'Гидравлический молот Лена',
          DateTime(2014),
        ),
      ],
    ),
  ],
  Countries.spain: [
    Territory(
      29,
      ['Арбузы'],
      [
        AgriculturalMachinery(
          'Мини-погрузчик Максим',
          DateTime(2011),
        ),
      ],
    ),
    Territory(
      11,
      ['Табак'],
      [
        AgriculturalMachinery(
          'Окучник Саша',
          DateTime(2010),
        ),
      ],
    ),
  ],
};
