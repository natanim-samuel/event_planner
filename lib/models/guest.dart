class Guest {
  String name;
  String group;
  int plus;
  String others;
  String status;

  Guest({
    required this.name,
    this.group = 'Friends',
    this.plus = 1,
    this.others = '',
    this.status = 'Pending',
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'group': group,
      'plus': plus,
      'others': others,
      'status': status,
    };
  }

  factory Guest.fromJson(Map<String, dynamic> json) {
    return Guest(
      name: json['name']?.toString() ?? '',
      group: json['group']?.toString() ?? 'Friends',
      plus: int.tryParse(
        json['plus']?.toString() ?? '',
      ) ??
          1,
      others: json['others']?.toString() ?? '',
      status: json['status']?.toString() ?? 'Pending',
    );
  }
}