class VenueItem {
  String item;
  String category;
  String notes;
  String status;

  VenueItem({
    required this.item,
    this.category = 'Other',
    this.notes = '',
    this.status = 'Need',
  });

  Map<String, dynamic> toJson() {
    return {
      'item': item,
      'category': category,
      'notes': notes,
      'status': status,
    };
  }

  factory VenueItem.fromJson(Map<String, dynamic> json) {
    return VenueItem(
      item: json['item']?.toString() ?? '',
      category: json['category']?.toString() ?? 'Other',
      notes: json['notes']?.toString() ?? '',
      status: json['status']?.toString() ?? 'Need',
    );
  }
}