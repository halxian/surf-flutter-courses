class Product {
  final int id;
  final String category;
  final String name;
  final int price;
  final int quantity;

  Product(this.id, this.category, this.name, this.price, this.quantity);

  @override
  String toString() {
    return "$id $category $name $price рублей $quantity шт. \n";
  }
}

abstract class Filter {
  bool apply(Product products);
}

class CategoryFilter implements Filter {
  final String category;

  CategoryFilter(this.category);

  @override
  bool apply(Product products) {
    return products.category == category;
  }
}

class PriceFilter implements Filter {
  final int price;

  PriceFilter(this.price);

  @override
  bool apply(Product products) {
    return products.price <= price;
  }
}

class WarehouseFilter implements Filter {
  final int quantity;
  WarehouseFilter(this.quantity);
  @override
  bool apply(Product products) {
    return products.quantity < quantity;
  }
}

void applyFilter(List<Product> products, Filter filter) {
  final filteredProducts = products.where((e) => filter.apply(e));
  print(filteredProducts);
}

void main() {
  final products = [
    Product(1, 'хлеб', 'Бородинский', 500, 5),
    Product(2, 'хлеб', 'Белый', 200, 15),
    Product(3, 'молоко', 'Полосатый кот', 50, 53),
    Product(4, 'молоко', 'Коровка', 50, 53),
    Product(5, 'вода', 'Апельсин', 25, 100),
    Product(6, 'вода', 'Бородинский', 500, 5),
  ];

  applyFilter(products, CategoryFilter('молоко'));
}
