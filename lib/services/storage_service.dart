import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../models/drink.dart';
import '../models/equipment.dart';
import '../models/food.dart';
import '../models/guest.dart';
import '../models/ingredient.dart';
import '../models/schedule_item.dart';
import '../models/task.dart';
import '../models/venue_item.dart';

class StorageService {
  static const String dataKey =
      'graduation_planner_data';

  static const String versionKey =
      'graduation_planner_version';

  static const int currentVersion = 1;

  Future<void> save({
    required String eventName,
    required DateTime? eventDate,
    required String venue,
    required List<Guest> guests,
    required List<Food> foods,
    required List<Drink> drinks,
    required List<Equipment> equipment,
    required List<Ingredient> ingredients,
    required List<VenueItem> venueItems,
    required List<Task> tasks,
    required List<ScheduleItem> schedule,
  }) async {
    final prefs =
    await SharedPreferences.getInstance();

    final data = {
      'eventName': eventName,
      'eventDate': eventDate?.toIso8601String(),
      'venue': venue,
      'guests': guests.map((e) => e.toJson()).toList(),
      'foods': foods.map((e) => e.toJson()).toList(),
      'drinks': drinks.map((e) => e.toJson()).toList(),
      'equipment':
      equipment.map((e) => e.toJson()).toList(),
      'ingredients':
      ingredients.map((e) => e.toJson()).toList(),
      'venueItems':
      venueItems.map((e) => e.toJson()).toList(),
      'tasks': tasks.map((e) => e.toJson()).toList(),
      'schedule':
      schedule.map((e) => e.toJson()).toList(),
    };

    await prefs.setString(
      dataKey,
      jsonEncode(data),
    );

    await prefs.setInt(
      versionKey,
      currentVersion,
    );
  }

  Future<Map<String, dynamic>?> load() async {
    final prefs =
    await SharedPreferences.getInstance();

    final savedVersion =
    prefs.getInt(versionKey);

    if (savedVersion != currentVersion) {
      await clear();
      return null;
    }

    final raw = prefs.getString(dataKey);

    if (raw == null) {
      return null;
    }

    try {
      final decoded = jsonDecode(raw);

      if (decoded is! Map) {
        return null;
      }

      return Map<String, dynamic>.from(decoded);
    } catch (_) {
      return null;
    }
  }

  Future<void> clear() async {
    final prefs =
    await SharedPreferences.getInstance();

    await prefs.remove(dataKey);
    await prefs.remove(versionKey);
  }
}