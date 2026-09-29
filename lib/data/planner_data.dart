import '../models/guest.dart';
import '../models/food.dart';
import '../models/drink.dart';
import '../models/equipment.dart';
import '../models/ingredient.dart';
import '../models/venue_item.dart';
import '../models/task.dart';
import '../models/schedule_item.dart';

class PlannerData {
  // ============================================================
  // GUESTS
  // ============================================================

  static List<Guest> guests() {
    return [
      Guest(
        name: 'Selam',
        group: 'Friends',
        plus: 2,
        others: 'Her brother',
        status: 'Yes',
      ),

      Guest(
        name: 'Dr. Alemu',
        group: 'Faculty',
        plus: 1,
        others: '',
        status: 'Pending',
      ),
    ];
  }

  // ============================================================
  // FOOD
  // ============================================================

  static List<Food> foods() {
    return [
      Food(
        name: 'Injera',
        amount: '',
        kind: 'Bread',
        type: 'Traditional',
        status: 'To do',
        sourcing: 'Not set',
        ingredients: '',
      ),

      Food(
        name: 'Bread',
        amount: '',
        kind: 'Bread',
        type: 'Modern',
        status: 'To do',
        sourcing: 'Not set',
        ingredients: '',
      ),

      Food(
        name: 'Kocho',
        amount: '',
        kind: 'Bread',
        type: 'Traditional',
        status: 'To do',
        sourcing: 'Not set',
        ingredients: '',
      ),

      Food(
        name: 'Doro wat',
        amount: '',
        kind: 'Main',
        type: 'Traditional',
        status: 'To do',
        sourcing: 'Not set',
        ingredients:
        'Chicken, Eggs, Onion, Berbere, Niter kibbeh',
      ),

      Food(
        name: 'Key wat',
        amount: '',
        kind: 'Main',
        type: 'Traditional',
        status: 'To do',
        sourcing: 'Not set',
        ingredients: '',
      ),

      Food(
        name: 'Alicha wot',
        amount: '',
        kind: 'Main',
        type: 'Traditional',
        status: 'To do',
        sourcing: 'Not set',
        ingredients: '',
      ),

      Food(
        name: 'Tibs',
        amount: '',
        kind: 'Main',
        type: 'Traditional',
        status: 'To do',
        sourcing: 'Not set',
        ingredients: '',
      ),

      Food(
        name: 'Kitfo',
        amount: '',
        kind: 'Main',
        type: 'Traditional',
        status: 'To do',
        sourcing: 'Not set',
        ingredients: '',
      ),

      Food(
        name: 'Ayib',
        amount: '',
        kind: 'Side',
        type: 'Traditional',
        status: 'To do',
        sourcing: 'Not set',
        ingredients: '',
      ),

      Food(
        name: 'Gomen',
        amount: '',
        kind: 'Side',
        type: 'Traditional',
        status: 'To do',
        sourcing: 'Not set',
        ingredients: '',
      ),

      Food(
        name: 'Salad',
        amount: '',
        kind: 'Salad',
        type: 'Modern',
        status: 'To do',
        sourcing: 'Not set',
        ingredients: '',
      ),

      Food(
        name: 'Misir wot',
        amount: '',
        kind: 'Main',
        type: 'Traditional',
        status: 'To do',
        sourcing: 'Not set',
        ingredients:
        'Red lentils, Onion, Garlic, Berbere',
      ),

      Food(
        name: 'Alicha kik',
        amount: '',
        kind: 'Main',
        type: 'Traditional',
        status: 'To do',
        sourcing: 'Not set',
        ingredients: '',
      ),

      Food(
        name: 'Meat ball',
        amount: '',
        kind: 'Main',
        type: 'Modern',
        status: 'To do',
        sourcing: 'Not set',
        ingredients: '',
      ),

      Food(
        name: 'Potato fries',
        amount: '',
        kind: 'Side',
        type: 'Modern',
        status: 'To do',
        sourcing: 'Not set',
        ingredients: '',
      ),

      Food(
        name: 'Pasta forno',
        amount: '',
        kind: 'Main',
        type: 'Modern',
        status: 'To do',
        sourcing: 'Not set',
        ingredients: '',
      ),

      Food(
        name: 'Pizza',
        amount: '',
        kind: 'Main',
        type: 'Modern',
        status: 'To do',
        sourcing: 'Not set',
        ingredients: '',
      ),

      Food(
        name: 'Cake',
        amount: '',
        kind: 'Dessert',
        type: 'Modern',
        status: 'To do',
        sourcing: 'Not set',
        ingredients:
        'Flour, Eggs, Sugar, Butter',
      ),
    ];
  }

  // ============================================================
  // DRINKS
  // ============================================================

  static List<Drink> drinks() {
    return [
      Drink(
        drink: 'Beer',
        quantity: null,
        unit: 'Bottles',
        status: 'Need',
      ),

      Drink(
        drink: 'Cola',
        quantity: null,
        unit: 'Bottles',
        status: 'Need',
      ),

      Drink(
        drink: '7Up',
        quantity: null,
        unit: 'Bottles',
        status: 'Need',
      ),

      Drink(
        drink: 'Water',
        quantity: null,
        unit: 'Bottles',
        status: 'Need',
      ),
    ];
  }

  // ============================================================
  // EQUIPMENT
  // ============================================================

  static List<Equipment> equipment() {
    return [
      Equipment(
        item: 'Glasses',
        quantity: null,
        source: '',
        status: 'Need',
      ),

      Equipment(
        item: 'Chairs',
        quantity: null,
        source: '',
        status: 'Need',
      ),

      Equipment(
        item: 'Tables',
        quantity: null,
        source: '',
        status: 'Need',
      ),

      Equipment(
        item: 'LED',
        quantity: null,
        source: '',
        status: 'Need',
      ),

      Equipment(
        item: 'Speaker',
        quantity: null,
        source: '',
        status: 'Need',
      ),

      Equipment(
        item: 'Lights',
        quantity: null,
        source: '',
        status: 'Need',
      ),

      Equipment(
        item: 'Inverter',
        quantity: null,
        source: '',
        status: 'Need',
      ),

      Equipment(
        item: 'PC',
        quantity: null,
        source: '',
        status: 'Need',
      ),
    ];
  }

  // ============================================================
  // INGREDIENTS
  // ============================================================

  static List<Ingredient> ingredients() {
    return [];
  }

  // ============================================================
  // VENUE
  // ============================================================

  static List<VenueItem> venueItems() {
    return [
      VenueItem(
        item: 'Compound & Shelter',
        category: 'Shelter',
        notes: '',
        status: 'Need',
      ),

      VenueItem(
        item: 'Decor',
        category: 'Decor',
        notes: 'Theme & color',
        status: 'Need',
      ),

      VenueItem(
        item: 'Theme',
        category: 'Decor',
        notes: '',
        status: 'Need',
      ),

      VenueItem(
        item: 'Color',
        category: 'Decor',
        notes: '',
        status: 'Need',
      ),

      VenueItem(
        item: 'Poster',
        category: 'Decor',
        notes: '',
        status: 'Need',
      ),

      VenueItem(
        item: 'Layout',
        category: 'Layout',
        notes: '',
        status: 'Need',
      ),

      VenueItem(
        item: 'Flower',
        category: 'Decor',
        notes: '',
        status: 'Need',
      ),

      VenueItem(
        item: 'Lights',
        category: 'Light',
        notes: '',
        status: 'Need',
      ),

      VenueItem(
        item: 'LED',
        category: 'Light',
        notes: '',
        status: 'Need',
      ),

      VenueItem(
        item: 'Speaker',
        category: 'Sound',
        notes: '',
        status: 'Need',
      ),

      VenueItem(
        item: 'Inverter',
        category: 'Other',
        notes: '',
        status: 'Need',
      ),

      VenueItem(
        item: 'PC',
        category: 'Other',
        notes: '',
        status: 'Need',
      ),
    ];
  }

  // ============================================================
  // TASKS
  // ============================================================

  static List<Task> tasks() {
    return [
      Task(
        task: 'Send invitations',
        owner: 'Me',
        due: DateTime(2026, 10, 30),
        status: 'To do',
      ),

      Task(
        task: 'Book venue',
        owner: 'Me',
        due: DateTime(2026, 10, 20),
        status: 'Doing',
      ),
    ];
  }

  // ============================================================
  // SCHEDULE
  // ============================================================

  static List<ScheduleItem> schedule() {
    return [
      ScheduleItem(
        time: '16:00',
        activity: 'Guests arrive',
        who: 'Everyone',
      ),

      ScheduleItem(
        time: '17:00',
        activity: 'Coffee ceremony',
        who: 'Family',
      ),

      ScheduleItem(
        time: '18:30',
        activity: 'Dinner & speeches',
        who: 'Everyone',
      ),
    ];
  }
}