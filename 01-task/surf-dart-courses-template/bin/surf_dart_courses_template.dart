enum PersonType { player, coach, judge }

abstract class Person {
  final String name;
  Person({
    required this.name,
  });
}

class Player extends Person {
  final PersonType personType = PersonType.player;

  Player({
    required super.name,
  });
  void startGame() {
    print('Начал играть');
  }

  void needWater() {
    print('Дайте что нибудь с таурином');
  }

  void iwin() {
    print("Я выиграл");
  }

  @override
  String toString() => '$name\n$personType';
}

class Coach extends Person {
  final PersonType personType = PersonType.coach;

  final List<Player> students;

  Coach({
    required super.name,
    required this.students,
  });
  void startTraining() {
    print('Они начали тренироваться: $students');
  }

  @override
  String toString() => 'Имя: $name\nУченини: ${students.map<String>((element) {
        return element.name;
      })}';
}

class Judge extends Person {
  final PersonType personType = PersonType.judge;
  final List<Player> players;

  Judge({
    required super.name,
    required this.players,
  });

  void removePlayer(Player player) {
    print('Игрок ${player.name} удален');
    players.remove(player);
  }

  @override
  String toString() => 'Имя: $name\nИгроки: ${players.map<String>((element) {
        return element.name;
      })}';
}

void main(List<String> args) {
  Player player = Player(name: 'Kevin');
  Player player1 = Player(name: 'Йцукен');
  Player player2 = Player(name: 'Qwerty');
  Coach coach = Coach(name: 'Trener', students: [player, player1, player2]);
  Judge judge = Judge(
    name: 'Судья',
    players: [player, player1, player2],
  );
  judge.removePlayer(player1);
  print(judge);
}
