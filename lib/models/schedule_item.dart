class ScheduleItem {
  String time;
  String activity;
  String who;

  ScheduleItem({
    required this.time,
    required this.activity,
    this.who = '',
  });

  Map<String, dynamic> toJson() {
    return {
      'time': time,
      'activity': activity,
      'who': who,
    };
  }

  factory ScheduleItem.fromJson(Map<String, dynamic> json) {
    return ScheduleItem(
      time: json['time'] ?? '',
      activity: json['activity'] ?? '',
      who: json['who'] ?? '',
    );
  }
}