class Ingredient {
  String item;
  String amount;
  String dish;
  String status;

  Ingredient({
    required this.item,
    this.amount = '',
    this.dish = '',
    this.status = 'Need',
  });

  Map<String, dynamic> toJson() {
    return {
      'item': item,
      'amount': amount,
      'dish': dish,
      'status': status,
    };
  }

  factory Ingredient.fromJson(Map<String, dynamic> json) {
    return Ingredient(
      item: json['item']?.toString() ?? '',
      amount: json['amount']?.toString() ?? '',
      dish: json['dish']?.toString() ?? '',
      status: json['status']?.toString() ?? 'Need',
    );
  }
}