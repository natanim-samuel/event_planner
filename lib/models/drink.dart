class Drink {
  String drink;
  int? quantity;
  String unit;
  String status;

  Drink({
    required this.drink,
    this.quantity,
    this.unit = '',
    this.status = 'Need',
  });

  Map<String, dynamic> toJson() {
    return {
      'drink': drink,
      'quantity': quantity,
      'unit': unit,
      'status': status,
    };
  }

  factory Drink.fromJson(Map<String, dynamic> json) {
    return Drink(
      drink: json['drink']?.toString() ?? '',
      quantity: json['quantity'] == null
          ? null
          : int.tryParse(
        json['quantity'].toString(),
      ),
      unit: json['unit']?.toString() ?? '',
      status: json['status']?.toString() ?? 'Need',
    );
  }
}