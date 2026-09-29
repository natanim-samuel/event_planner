class Food {
  String name;
  String amount;
  String kind;
  String type;
  String status;
  String sourcing;
  String ingredients;

  Food({
    required this.name,
    this.amount = '',
    this.kind = 'Main',
    this.type = 'Traditional',
    this.status = 'To do',
    this.sourcing = 'Not set',
    this.ingredients = '',
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'amount': amount,
      'kind': kind,
      'type': type,
      'status': status,
      'sourcing': sourcing,
      'ingredients': ingredients,
    };
  }

  factory Food.fromJson(Map<String, dynamic> json) {
    return Food(
      name: json['name']?.toString() ?? '',
      amount: json['amount']?.toString() ?? '',
      kind: json['kind']?.toString() ?? 'Main',
      type: json['type']?.toString() ?? 'Traditional',
      status: json['status']?.toString() ?? 'To do',
      sourcing: json['sourcing']?.toString() ?? 'Not set',
      ingredients: json['ingredients']?.toString() ?? '',
    );
  }
}