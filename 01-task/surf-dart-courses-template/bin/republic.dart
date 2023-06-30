class Republic {
  final String name;
  final int budget;

  Republic({
    required this.name,
    required this.budget,
  });

  @override
  String toString() {
    String republic = '''
        Название: $name,
        Бюджет: $budget,
      ''';
    return republic;
  }
}
