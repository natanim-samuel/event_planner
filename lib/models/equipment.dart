class Equipment {
  String item;
  int? quantity;
  String source;
  String status;

  Equipment({
    required this.item,
    this.quantity,
    this.source = '',
    this.status = 'Need',
  });

  Map<String, dynamic> toJson() {
    return {
      'item': item,
      'quantity': quantity,
      'source': source,
      'status': status,
    };
  }

  factory Equipment.fromJson(Map<String, dynamic> json) {
    return Equipment(
      item: json['item']?.toString() ?? '',
      quantity: json['quantity'] == null
          ? null
          : int.tryParse(
        json['quantity'].toString(),
      ),
      source: json['source']?.toString() ?? '',
      status: json['status']?.toString() ?? 'Need',
    );
  }
}