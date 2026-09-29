import 'package:flutter/material.dart';

import '../models/drink.dart';
import '../models/equipment.dart';
import '../models/food.dart';
import '../models/guest.dart';
import '../models/ingredient.dart';
import '../models/schedule_item.dart';
import '../models/task.dart';
import '../models/venue_item.dart';

import '../services/storage_service.dart';
import '../theme/app_theme.dart';

import '../widgets/add_item_form.dart';
import '../widgets/planner_table.dart';
import '../widgets/planner_tabs.dart';
import '../widgets/statistics_cards.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() =>
      _HomeScreenState();
}

class _HomeScreenState
    extends State<HomeScreen> {
  final StorageService storage =
  StorageService();

  String eventName =
      'Graduation Celebration';

  String venue = 'Home, Bole';

  DateTime? eventDate =
  DateTime(2026, 11, 14);

  int currentTab = 0;

  List<Guest> guests = [
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
      status: 'Pending',
    ),
  ];

  List<Food> foods = [
    Food(
      name: 'Injera',
      kind: 'Bread',
      type: 'Traditional',
    ),
    Food(
      name: 'Bread',
      kind: 'Bread',
      type: 'Modern',
    ),
    Food(
      name: 'Kocho',
      kind: 'Bread',
      type: 'Traditional',
    ),
    Food(
      name: 'Doro wat',
      kind: 'Main',
      type: 'Traditional',
      status: 'Ordered',
      ingredients:
      'Chicken, Eggs, Onion, Berbere, Niter kibbeh',
    ),
    Food(
      name: 'Key wat',
      kind: 'Main',
      type: 'Traditional',
      status: 'Ordered',
    ),
    Food(
      name: 'Alicha wot',
      kind: 'Main',
      type: 'Traditional',
    ),
    Food(
      name: 'Tibs',
      kind: 'Main',
      type: 'Traditional',
    ),
    Food(
      name: 'Kitfo',
      kind: 'Main',
      type: 'Traditional',
    ),
    Food(
      name: 'Ayib',
      kind: 'Side',
      type: 'Traditional',
    ),
    Food(
      name: 'Gomen',
      kind: 'Side',
      type: 'Traditional',
    ),
    Food(
      name: 'Salad',
      kind: 'Salad',
      type: 'Modern',
    ),
    Food(
      name: 'Misir wot',
      kind: 'Main',
      type: 'Traditional',
      ingredients:
      'Red lentils, Onion, Garlic, Berbere',
    ),
    Food(
      name: 'Alicha kik',
      kind: 'Main',
      type: 'Traditional',
    ),
    Food(
      name: 'Meat ball',
      kind: 'Main',
      type: 'Modern',
    ),
    Food(
      name: 'Potato fries',
      kind: 'Side',
      type: 'Modern',
    ),
    Food(
      name: 'Pasta forno',
      kind: 'Main',
      type: 'Modern',
    ),
    Food(
      name: 'Pizza',
      kind: 'Main',
      type: 'Modern',
    ),
    Food(
      name: 'Cake',
      kind: 'Dessert',
      type: 'Modern',
      status: 'Ordered',
      ingredients:
      'Flour, Eggs, Sugar, Butter',
    ),
  ];

  List<Drink> drinks = [
    Drink(
      drink: 'Beer',
      status: 'Need',
    ),
    Drink(
      drink: 'Cola',
      status: 'Need',
    ),
    Drink(
      drink: '7Up',
      status: 'Need',
    ),
    Drink(
      drink: 'Water',
      status: 'Need',
    ),
  ];

  List<Equipment> equipment = [
    Equipment(
      item: 'Glasses',
      status: 'Need',
    ),
    Equipment(
      item: 'Chairs',
      status: 'Need',
    ),
    Equipment(
      item: 'Tables',
      status: 'Need',
    ),
    Equipment(
      item: 'LED',
      status: 'Need',
    ),
    Equipment(
      item: 'Speaker',
      status: 'Need',
    ),
    Equipment(
      item: 'Lights',
      status: 'Need',
    ),
    Equipment(
      item: 'Inverter',
      status: 'Need',
    ),
    Equipment(
      item: 'PC',
      status: 'Need',
    ),
  ];

  List<Ingredient> ingredients = [];

  List<VenueItem> venueItems = [
    VenueItem(
      item: 'Compound & Shelter',
      category: 'Shelter',
    ),
    VenueItem(
      item: 'Decor',
      category: 'Decor',
      notes: 'Theme & color',
    ),
    VenueItem(
      item: 'Theme',
      category: 'Decor',
    ),
    VenueItem(
      item: 'Color',
      category: 'Decor',
    ),
    VenueItem(
      item: 'Poster',
      category: 'Decor',
    ),
    VenueItem(
      item: 'Layout',
      category: 'Layout',
    ),
    VenueItem(
      item: 'Flowers',
      category: 'Decor',
    ),
    VenueItem(
      item: 'Lights',
      category: 'Light',
    ),
    VenueItem(
      item: 'LED',
      category: 'Light',
    ),
    VenueItem(
      item: 'Speaker',
      category: 'Sound',
    ),
    VenueItem(
      item: 'Inverter',
      category: 'Other',
    ),
    VenueItem(
      item: 'PC',
      category: 'Other',
    ),
  ];

  List<Task> tasks = [
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

  List<ScheduleItem> schedule = [
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

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    final data = await storage.load();

    if (data == null) return;

    if (!mounted) return;

    setState(() {
      eventName =
          data['eventName']?.toString() ??
              'Graduation Celebration';

      venue =
          data['venue']?.toString() ??
              'Home, Bole';

      if (data['eventDate'] != null) {
        eventDate = DateTime.tryParse(
          data['eventDate'].toString(),
        );
      }

      guests = _decodeList(
        data['guests'],
            (item) => Guest.fromJson(item),
      ) ?? guests;

      foods = _decodeList(
        data['foods'],
            (item) => Food.fromJson(item),
      ) ?? foods;

      drinks = _decodeList(
        data['drinks'],
            (item) => Drink.fromJson(item),
      ) ?? drinks;

      equipment = _decodeList(
        data['equipment'],
            (item) => Equipment.fromJson(item),
      ) ?? equipment;

      ingredients = _decodeList(
        data['ingredients'],
            (item) => Ingredient.fromJson(item),
      ) ?? ingredients;

      venueItems = _decodeList(
        data['venueItems'],
            (item) => VenueItem.fromJson(item),
      ) ?? venueItems;

      tasks = _decodeList(
        data['tasks'],
            (item) => Task.fromJson(item),
      ) ?? tasks;

      schedule = _decodeList(
        data['schedule'],
            (item) => ScheduleItem.fromJson(item),
      ) ?? schedule;
    });
  }

  List<T>? _decodeList<T>(
      dynamic value,
      T Function(Map<String, dynamic>) parser,
      ) {
    if (value is! List) return null;

    try {
      return value
          .map(
            (item) => parser(
          Map<String, dynamic>.from(
            item as Map,
          ),
        ),
      )
          .toList();
    } catch (_) {
      return null;
    }
  }

  Future<void> _save() async {
    await storage.save(
      eventName: eventName,
      eventDate: eventDate,
      venue: venue,
      guests: guests,
      foods: foods,
      drinks: drinks,
      equipment: equipment,
      ingredients: ingredients,
      venueItems: venueItems,
      tasks: tasks,
      schedule: schedule,
    );
  }

  int get confirmedGuests {
    return guests
        .where(
          (guest) => guest.status == 'Yes',
    )
        .fold(
      0,
          (total, guest) =>
      total + guest.plus,
    );
  }

  int get totalGuests {
    return guests
        .where(
          (guest) => guest.status != 'No',
    )
        .fold(
      0,
          (total, guest) =>
      total + guest.plus,
    );
  }

  int get itemsNeeded {
    return foods
        .where(
          (food) =>
      food.status == 'To do',
    )
        .length +
        drinks
            .where(
              (drink) =>
          drink.status == 'Need',
        )
            .length +
        equipment
            .where(
              (item) =>
          item.status == 'Need',
        )
            .length +
        ingredients
            .where(
              (item) =>
          item.status == 'Need',
        )
            .length +
        venueItems
            .where(
              (item) =>
          item.status == 'Need',
        )
            .length;
  }

  int get completedTasks {
    return tasks
        .where(
          (task) => task.status == 'Done',
    )
        .length;
  }

  String get daysToGo {
    if (eventDate == null) {
      return '—';
    }

    final now = DateTime.now();

    final today = DateTime(
      now.year,
      now.month,
      now.day,
    );

    final date = DateTime(
      eventDate!.year,
      eventDate!.month,
      eventDate!.day,
    );

    final days =
        date.difference(today).inDays;

    if (days < 0) {
      return 'Passed';
    }

    return days.toString();
  }

  void _changeTab(int index) {
    setState(() {
      currentTab = index;
    });
  }

  List<FormFieldConfig> _formFields() {
    switch (currentTab) {
      case 0:
        return const [
          FormFieldConfig(
            keyName: 'name',
            label: 'Name',
          ),
          FormFieldConfig(
            keyName: 'group',
            label: 'Group',
            options: [
              'Family',
              'Friends',
              'Classmates',
              'Faculty',
            ],
          ),
          FormFieldConfig(
            keyName: 'plus',
            label: 'Guests total',
            number: true,
          ),
          FormFieldConfig(
            keyName: 'others',
            label: 'Other guests',
          ),
          FormFieldConfig(
            keyName: 'status',
            label: 'RSVP',
            options: [
              'Pending',
              'Yes',
              'No',
            ],
          ),
        ];

      case 1:
        return const [
          FormFieldConfig(
            keyName: 'name',
            label: 'Name',
          ),
          FormFieldConfig(
            keyName: 'amount',
            label: 'Amount',
          ),
          FormFieldConfig(
            keyName: 'kind',
            label: 'Kind',
            options: [
              'Main',
              'Side',
              'Salad',
              'Bread',
              'Dessert',
            ],
          ),
          FormFieldConfig(
            keyName: 'type',
            label: 'Type',
            options: [
              'Traditional',
              'Modern',
            ],
          ),
          FormFieldConfig(
            keyName: 'status',
            label: 'Status',
            options: [
              'To do',
              'Ordered',
              'Ready',
            ],
          ),
          FormFieldConfig(
            keyName: 'sourcing',
            label: 'Sourcing',
            options: [
              'Not set',
              'Cook at home',
              'Buy',
              'Order',
            ],
          ),
          FormFieldConfig(
            keyName: 'ingredients',
            label: 'Ingredients',
            multiline: true,
          ),
        ];

      case 2:
        return const [
          FormFieldConfig(
            keyName: 'drink',
            label: 'Drink',
          ),
          FormFieldConfig(
            keyName: 'quantity',
            label: 'Quantity',
            number: true,
          ),
          FormFieldConfig(
            keyName: 'unit',
            label: 'Unit',
            options: [
              'Bottles',
              'Crates',
              'Cases',
              'Litres',
              'Cups',
              'Kg',
            ],
          ),
          FormFieldConfig(
            keyName: 'status',
            label: 'Status',
            options: [
              'Need',
              'Bought',
            ],
          ),
        ];

      case 3:
        return const [
          FormFieldConfig(
            keyName: 'item',
            label: 'Item',
          ),
          FormFieldConfig(
            keyName: 'quantity',
            label: 'Quantity',
            number: true,
          ),
          FormFieldConfig(
            keyName: 'source',
            label: 'Where from',
          ),
          FormFieldConfig(
            keyName: 'status',
            label: 'Status',
            options: [
              'Need',
              'Got',
            ],
          ),
        ];

      case 4:
        return const [
          FormFieldConfig(
            keyName: 'item',
            label: 'Ingredient name',
          ),
          FormFieldConfig(
            keyName: 'amount',
            label: 'Amount',
          ),
          FormFieldConfig(
            keyName: 'dish',
            label: 'From food',
          ),
          FormFieldConfig(
            keyName: 'status',
            label: 'Status',
            options: [
              'Need',
              'Bought',
            ],
          ),
        ];

      case 5:
        return const [
          FormFieldConfig(
            keyName: 'item',
            label: 'Item',
          ),
          FormFieldConfig(
            keyName: 'category',
            label: 'Category',
            options: [
              'Shelter',
              'Decor',
              'Light',
              'Sound',
              'Layout',
              'Other',
            ],
          ),
          FormFieldConfig(
            keyName: 'notes',
            label: 'Notes',
            multiline: true,
          ),
          FormFieldConfig(
            keyName: 'status',
            label: 'Status',
            options: [
              'Need',
              'Got',
            ],
          ),
        ];

      case 6:
        return const [
          FormFieldConfig(
            keyName: 'task',
            label: 'Task',
          ),
          FormFieldConfig(
            keyName: 'owner',
            label: 'Owner',
          ),
          FormFieldConfig(
            keyName: 'due',
            label: 'Due',
            date: true,
          ),
          FormFieldConfig(
            keyName: 'status',
            label: 'Status',
            options: [
              'To do',
              'Doing',
              'Done',
            ],
          ),
        ];

      case 7:
        return const [
          FormFieldConfig(
            keyName: 'time',
            label: 'Time',
            time: true,
          ),
          FormFieldConfig(
            keyName: 'activity',
            label: 'Activity',
          ),
          FormFieldConfig(
            keyName: 'who',
            label: 'Who',
          ),
        ];

      default:
        return [];
    }
  }

  List<PlannerColumn> _columns() {
    switch (currentTab) {
      case 0:
        return const [
          PlannerColumn(
            keyName: 'name',
            label: 'Name',
          ),
          PlannerColumn(
            keyName: 'group',
            label: 'Group',
            options: [
              'Family',
              'Friends',
              'Classmates',
              'Faculty',
            ],
          ),
          PlannerColumn(
            keyName: 'plus',
            label: 'Guests total',
            number: true,
          ),
          PlannerColumn(
            keyName: 'others',
            label: 'Other guests',
          ),
          PlannerColumn(
            keyName: 'status',
            label: 'RSVP',
            options: [
              'Pending',
              'Yes',
              'No',
            ],
          ),
        ];

      case 1:
        return const [
          PlannerColumn(
            keyName: 'name',
            label: 'Name',
          ),
          PlannerColumn(
            keyName: 'amount',
            label: 'Amount',
          ),
          PlannerColumn(
            keyName: 'kind',
            label: 'Kind',
            options: [
              'Main',
              'Side',
              'Salad',
              'Bread',
              'Dessert',
            ],
          ),
          PlannerColumn(
            keyName: 'type',
            label: 'Type',
            options: [
              'Traditional',
              'Modern',
            ],
          ),
          PlannerColumn(
            keyName: 'status',
            label: 'Status',
            options: [
              'To do',
              'Ordered',
              'Ready',
            ],
          ),
          PlannerColumn(
            keyName: 'sourcing',
            label: 'Sourcing',
            options: [
              'Not set',
              'Cook at home',
              'Buy',
              'Order',
            ],
          ),
          PlannerColumn(
            keyName: 'ingredients',
            label: 'Ingredients',
            multiline: true,
          ),
        ];

      case 2:
        return const [
          PlannerColumn(
            keyName: 'drink',
            label: 'Drink',
          ),
          PlannerColumn(
            keyName: 'quantity',
            label: 'Quantity',
            number: true,
          ),
          PlannerColumn(
            keyName: 'unit',
            label: 'Unit',
            options: [
              'Bottles',
              'Crates',
              'Cases',
              'Litres',
              'Cups',
              'Kg',
            ],
          ),
          PlannerColumn(
            keyName: 'status',
            label: 'Status',
            options: [
              'Need',
              'Bought',
            ],
          ),
        ];

      case 3:
        return const [
          PlannerColumn(
            keyName: 'item',
            label: 'Item',
          ),
          PlannerColumn(
            keyName: 'quantity',
            label: 'Quantity',
            number: true,
          ),
          PlannerColumn(
            keyName: 'source',
            label: 'Where from',
          ),
          PlannerColumn(
            keyName: 'status',
            label: 'Status',
            options: [
              'Need',
              'Got',
            ],
          ),
        ];

      case 4:
        return const [
          PlannerColumn(
            keyName: 'item',
            label: 'Ingredient',
          ),
          PlannerColumn(
            keyName: 'amount',
            label: 'Amount',
          ),
          PlannerColumn(
            keyName: 'dish',
            label: 'From food',
          ),
          PlannerColumn(
            keyName: 'status',
            label: 'Status',
            options: [
              'Need',
              'Bought',
            ],
          ),
        ];

      case 5:
        return const [
          PlannerColumn(
            keyName: 'item',
            label: 'Item',
          ),
          PlannerColumn(
            keyName: 'category',
            label: 'Category',
            options: [
              'Shelter',
              'Decor',
              'Light',
              'Sound',
              'Layout',
              'Other',
            ],
          ),
          PlannerColumn(
            keyName: 'notes',
            label: 'Notes',
          ),
          PlannerColumn(
            keyName: 'status',
            label: 'Status',
            options: [
              'Need',
              'Got',
            ],
          ),
        ];

      case 6:
        return const [
          PlannerColumn(
            keyName: 'task',
            label: 'Task',
          ),
          PlannerColumn(
            keyName: 'owner',
            label: 'Owner',
          ),
          PlannerColumn(
            keyName: 'due',
            label: 'Due',
          ),
          PlannerColumn(
            keyName: 'status',
            label: 'Status',
            options: [
              'To do',
              'Doing',
              'Done',
            ],
          ),
        ];

      case 7:
        return const [
          PlannerColumn(
            keyName: 'time',
            label: 'Time',
          ),
          PlannerColumn(
            keyName: 'activity',
            label: 'Activity',
          ),
          PlannerColumn(
            keyName: 'who',
            label: 'Who',
          ),
        ];

      default:
        return [];
    }
  }

  List<Map<String, dynamic>> _rows() {
    switch (currentTab) {
      case 0:
        return guests.map((guest) {
          return {
            'name': guest.name,
            'group': guest.group,
            'plus': guest.plus,
            'others': guest.others,
            'status': guest.status,
          };
        }).toList();

      case 1:
        return foods.map((food) {
          return {
            'name': food.name,
            'amount': food.amount,
            'kind': food.kind,
            'type': food.type,
            'status': food.status,
            'sourcing': food.sourcing,
            'ingredients': food.ingredients,
          };
        }).toList();

      case 2:
        return drinks.map((drink) {
          return {
            'drink': drink.drink,
            'quantity': drink.quantity,
            'unit': drink.unit,
            'status': drink.status,
          };
        }).toList();

      case 3:
        return equipment.map((item) {
          return {
            'item': item.item,
            'quantity': item.quantity,
            'source': item.source,
            'status': item.status,
          };
        }).toList();

      case 4:
        return ingredients.map((item) {
          return {
            'item': item.item,
            'amount': item.amount,
            'dish': item.dish,
            'status': item.status,
          };
        }).toList();

      case 5:
        return venueItems.map((item) {
          return {
            'item': item.item,
            'category': item.category,
            'notes': item.notes,
            'status': item.status,
          };
        }).toList();

      case 6:
        return tasks.map((task) {
          return {
            'task': task.task,
            'owner': task.owner,
            'due': _formatDate(task.due),
            'status': task.status,
          };
        }).toList();

      case 7:
        final rows = schedule.map((item) {
          return {
            'time': item.time,
            'activity': item.activity,
            'who': item.who,
          };
        }).toList();

        rows.sort(
              (a, b) => a['time']
              .toString()
              .compareTo(
            b['time'].toString(),
          ),
        );

        return rows;

      default:
        return [];
    }
  }

  void _addItem(
      Map<String, dynamic> values,
      ) {
    setState(() {
      switch (currentTab) {
        case 0:
          guests.add(
            Guest(
              name:
              values['name']
                  ?.toString() ??
                  '',
              group:
              values['group']
                  ?.toString() ??
                  'Friends',
              plus:
              int.tryParse(
                values['plus']
                    ?.toString() ??
                    '',
              ) ??
                  1,
              others:
              values['others']
                  ?.toString() ??
                  '',
              status:
              values['status']
                  ?.toString() ??
                  'Pending',
            ),
          );
          break;

        case 1:
          foods.add(
            Food(
              name:
              values['name']
                  ?.toString() ??
                  '',
              amount:
              values['amount']
                  ?.toString() ??
                  '',
              kind:
              values['kind']
                  ?.toString() ??
                  'Main',
              type:
              values['type']
                  ?.toString() ??
                  'Traditional',
              status:
              values['status']
                  ?.toString() ??
                  'To do',
              sourcing:
              values['sourcing']
                  ?.toString() ??
                  'Not set',
              ingredients:
              values['ingredients']
                  ?.toString() ??
                  '',
            ),
          );
          break;

        case 2:
          drinks.add(
            Drink(
              drink:
              values['drink']
                  ?.toString() ??
                  '',
              quantity:
              int.tryParse(
                values['quantity']
                    ?.toString() ??
                    '',
              ),
              unit:
              values['unit']
                  ?.toString() ??
                  'Bottles',
              status:
              values['status']
                  ?.toString() ??
                  'Need',
            ),
          );
          break;

        case 3:
          equipment.add(
            Equipment(
              item:
              values['item']
                  ?.toString() ??
                  '',
              quantity:
              int.tryParse(
                values['quantity']
                    ?.toString() ??
                    '',
              ),
              source:
              values['source']
                  ?.toString() ??
                  '',
              status:
              values['status']
                  ?.toString() ??
                  'Need',
            ),
          );
          break;

        case 4:
          ingredients.add(
            Ingredient(
              item:
              values['item']
                  ?.toString() ??
                  '',
              amount:
              values['amount']
                  ?.toString() ??
                  '',
              dish:
              values['dish']
                  ?.toString() ??
                  '',
              status:
              values['status']
                  ?.toString() ??
                  'Need',
            ),
          );
          break;

        case 5:
          venueItems.add(
            VenueItem(
              item:
              values['item']
                  ?.toString() ??
                  '',
              category:
              values['category']
                  ?.toString() ??
                  'Other',
              notes:
              values['notes']
                  ?.toString() ??
                  '',
              status:
              values['status']
                  ?.toString() ??
                  'Need',
            ),
          );
          break;

        case 6:
          DateTime? due;

          final dueValue =
              values['due']?.toString() ?? '';

          if (dueValue.isNotEmpty) {
            due = DateTime.tryParse(
              dueValue,
            );
          }

          tasks.add(
            Task(
              task:
              values['task']
                  ?.toString() ??
                  '',
              owner:
              values['owner']
                  ?.toString() ??
                  '',
              due: due,
              status:
              values['status']
                  ?.toString() ??
                  'To do',
            ),
          );
          break;

        case 7:
          schedule.add(
            ScheduleItem(
              time:
              values['time']
                  ?.toString() ??
                  '',
              activity:
              values['activity']
                  ?.toString() ??
                  '',
              who:
              values['who']
                  ?.toString() ??
                  '',
            ),
          );
          break;
      }
    });

    _save();
  }

  void _updateItem(
      int index,
      String key,
      dynamic value,
      ) {
    setState(() {
      switch (currentTab) {
        case 0:
          final item = guests[index];

          switch (key) {
            case 'name':
              item.name = value.toString();
              break;
            case 'group':
              item.group = value.toString();
              break;
            case 'plus':
              item.plus =
                  int.tryParse(
                    value.toString(),
                  ) ??
                      1;
              break;
            case 'others':
              item.others =
                  value.toString();
              break;
            case 'status':
              item.status =
                  value.toString();
              break;
          }
          break;

        case 1:
          final item = foods[index];

          switch (key) {
            case 'name':
              item.name = value.toString();
              break;
            case 'amount':
              item.amount =
                  value.toString();
              break;
            case 'kind':
              item.kind =
                  value.toString();
              break;
            case 'type':
              item.type =
                  value.toString();
              break;
            case 'status':
              item.status =
                  value.toString();
              break;
            case 'sourcing':
              item.sourcing =
                  value.toString();
              break;
            case 'ingredients':
              item.ingredients =
                  value.toString();
              break;
          }
          break;

        case 2:
          final item = drinks[index];

          switch (key) {
            case 'drink':
              item.drink =
                  value.toString();
              break;
            case 'quantity':
              item.quantity =
                  int.tryParse(
                    value.toString(),
                  );
              break;
            case 'unit':
              item.unit =
                  value.toString();
              break;
            case 'status':
              item.status =
                  value.toString();
              break;
          }
          break;

        case 3:
          final item =
          equipment[index];

          switch (key) {
            case 'item':
              item.item =
                  value.toString();
              break;
            case 'quantity':
              item.quantity =
                  int.tryParse(
                    value.toString(),
                  );
              break;
            case 'source':
              item.source =
                  value.toString();
              break;
            case 'status':
              item.status =
                  value.toString();
              break;
          }
          break;

        case 4:
          final item =
          ingredients[index];

          switch (key) {
            case 'item':
              item.item =
                  value.toString();
              break;
            case 'amount':
              item.amount =
                  value.toString();
              break;
            case 'dish':
              item.dish =
                  value.toString();
              break;
            case 'status':
              item.status =
                  value.toString();
              break;
          }
          break;

        case 5:
          final item =
          venueItems[index];

          switch (key) {
            case 'item':
              item.item =
                  value.toString();
              break;
            case 'category':
              item.category =
                  value.toString();
              break;
            case 'notes':
              item.notes =
                  value.toString();
              break;
            case 'status':
              item.status =
                  value.toString();
              break;
          }
          break;

        case 6:
          final item = tasks[index];

          switch (key) {
            case 'task':
              item.task =
                  value.toString();
              break;
            case 'owner':
              item.owner =
                  value.toString();
              break;
            case 'due':
              item.due =
                  DateTime.tryParse(
                    value.toString(),
                  );
              break;
            case 'status':
              item.status =
                  value.toString();
              break;
          }
          break;

        case 7:
          final item =
          schedule[index];

          switch (key) {
            case 'time':
              item.time =
                  value.toString();
              break;
            case 'activity':
              item.activity =
                  value.toString();
              break;
            case 'who':
              item.who =
                  value.toString();
              break;
          }
          break;
      }
    });

    _save();
  }

  void _deleteItem(int index) {
    setState(() {
      switch (currentTab) {
        case 0:
          guests.removeAt(index);
          break;
        case 1:
          foods.removeAt(index);
          break;
        case 2:
          drinks.removeAt(index);
          break;
        case 3:
          equipment.removeAt(index);
          break;
        case 4:
          ingredients.removeAt(index);
          break;
        case 5:
          venueItems.removeAt(index);
          break;
        case 6:
          tasks.removeAt(index);
          break;
        case 7:
          schedule.removeAt(index);
          break;
      }
    });

    _save();
  }

  void _importIngredients() {
    int added = 0;

    for (final food in foods) {
      final names = food.ingredients
          .split(',')
          .map(
            (item) => item.trim(),
      )
          .where(
            (item) => item.isNotEmpty,
      );

      for (final name in names) {
        final exists = ingredients.any(
              (ingredient) =>
          ingredient.item
              .toLowerCase() ==
              name.toLowerCase() &&
              ingredient.dish ==
                  food.name,
        );

        if (!exists) {
          ingredients.add(
            Ingredient(
              item: name,
              dish: food.name,
              status: 'Need',
            ),
          );

          added++;
        }
      }
    }

    _save();

    setState(() {});

    ScaffoldMessenger.of(context)
        .showSnackBar(
      SnackBar(
        content: Text(
          added == 0
              ? 'No new ingredients found.'
              : '$added ingredients imported.',
        ),
      ),
    );
  }

  String _formatDate(DateTime? date) {
    if (date == null) return '';

    return '${date.year}-'
        '${date.month.toString().padLeft(2, '0')}-'
        '${date.day.toString().padLeft(2, '0')}';
  }

  Future<void> _pickEventDate() async {
    final selected =
    await showDatePicker(
      context: context,
      firstDate: DateTime(2020),
      lastDate: DateTime(2100),
      initialDate:
      eventDate ?? DateTime.now(),
    );

    if (selected == null) return;

    setState(() {
      eventDate = selected;
    });

    _save();
  }

  Widget _eventHeader() {
    return Column(
      crossAxisAlignment:
      CrossAxisAlignment.start,
      children: [
        TextField(
          key: const ValueKey(
            'eventName',
          ),
          controller:
          TextEditingController(
            text: eventName,
          ),
          onChanged: (value) {
            eventName = value;
            _save();
          },
          style: const TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            fontFamily: 'Georgia',
            color: AppTheme.text,
          ),
          decoration:
          const InputDecoration(
            labelText: 'EVENT',
          ),
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: GestureDetector(
                onTap: _pickEventDate,
                child: AbsorbPointer(
                  child: TextField(
                    controller:
                    TextEditingController(
                      text: _formatDate(
                        eventDate,
                      ),
                    ),
                    decoration:
                    const InputDecoration(
                      labelText: 'DATE',
                      suffixIcon: Icon(
                        Icons.calendar_month,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: TextField(
                controller:
                TextEditingController(
                  text: venue,
                ),
                onChanged: (value) {
                  venue = value;
                  _save();
                },
                decoration:
                const InputDecoration(
                  labelText: 'VENUE',
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _tools() {
    if (currentTab != 4) {
      return const SizedBox.shrink();
    }

    return Padding(
      padding:
      const EdgeInsets.only(top: 12),
      child: Wrap(
        crossAxisAlignment:
        WrapCrossAlignment.center,
        spacing: 12,
        children: [
          ElevatedButton.icon(
            onPressed:
            _importIngredients,
            icon: const Icon(
              Icons.download,
            ),
            label: const Text(
              'Import from Food ingredients',
            ),
          ),
          const Text(
            'Fill Ingredients on Food first.',
            style: TextStyle(
              color: AppTheme.muted,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints:
            const BoxConstraints(
              maxWidth: 1100,
            ),
            child: SingleChildScrollView(
              padding:
              const EdgeInsets.fromLTRB(
                16,
                24,
                16,
                48,
              ),
              child: Column(
                crossAxisAlignment:
                CrossAxisAlignment.start,
                children: [
                  _eventHeader(),

                  const SizedBox(
                    height: 16,
                  ),

                  StatisticsCards(
                    days: daysToGo,
                    confirmedGuests:
                    '$confirmedGuests / $totalGuests',
                    itemsNeeded:
                    itemsNeeded.toString(),
                    tasksDone:
                    '$completedTasks / ${tasks.length}',
                  ),

                  const SizedBox(
                    height: 12,
                  ),

                  PlannerTabs(
                    currentIndex: currentTab,
                    onChanged:
                    _changeTab,
                  ),

                  const SizedBox(
                    height: 8,
                  ),

                  AddItemForm(
                    key: ValueKey(
                      currentTab,
                    ),
                    fields: _formFields(),
                    onAdd: _addItem,
                  ),

                  _tools(),

                  PlannerTable(
                    rows: _rows(),
                    columns: _columns(),
                    onChanged:
                    _updateItem,
                    onDelete:
                    _deleteItem,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}