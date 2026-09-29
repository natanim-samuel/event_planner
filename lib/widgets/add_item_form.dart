import 'package:flutter/material.dart';

import '../theme/app_theme.dart';

class FormFieldConfig {
  final String keyName;
  final String label;

  final List<String>? options;

  final bool number;
  final bool multiline;
  final bool date;
  final bool time;

  const FormFieldConfig({
    required this.keyName,
    required this.label,
    this.options,
    this.number = false,
    this.multiline = false,
    this.date = false,
    this.time = false,
  });
}

class AddItemForm extends StatefulWidget {
  final List<FormFieldConfig> fields;
  final void Function(Map<String, dynamic>) onAdd;

  const AddItemForm({
    super.key,
    required this.fields,
    required this.onAdd,
  });

  @override
  State<AddItemForm> createState() =>
      _AddItemFormState();
}

class _AddItemFormState
    extends State<AddItemForm> {
  final Map<String, TextEditingController>
  controllers = {};

  final Map<String, String?>
  selectedValues = {};

  @override
  void initState() {
    super.initState();

    _createControllers();
  }

  @override
  void didUpdateWidget(
      covariant AddItemForm oldWidget,
      ) {
    super.didUpdateWidget(oldWidget);

    _createControllers();
  }

  void _createControllers() {
    final activeKeys =
    widget.fields.map((e) => e.keyName).toSet();

    for (final field in widget.fields) {
      controllers.putIfAbsent(
        field.keyName,
            () => TextEditingController(),
      );

      if (field.options != null &&
          field.options!.isNotEmpty) {
        final options = field.options!
            .map((e) => e.trim())
            .where((e) => e.isNotEmpty)
            .toSet()
            .toList();

        if (options.isNotEmpty &&
            !options.contains(
              selectedValues[field.keyName],
            )) {
          selectedValues[field.keyName] =
              options.first;
        }
      }
    }

    final oldKeys = controllers.keys
        .where((key) => !activeKeys.contains(key))
        .toList();

    for (final key in oldKeys) {
      controllers[key]?.dispose();
      controllers.remove(key);
      selectedValues.remove(key);
    }
  }

  @override
  void dispose() {
    for (final controller
    in controllers.values) {
      controller.dispose();
    }

    super.dispose();
  }

  Future<void> _pickDate(
      FormFieldConfig field,
      ) async {
    final selected = await showDatePicker(
      context: context,
      firstDate: DateTime(2020),
      lastDate: DateTime(2100),
      initialDate: DateTime.now(),
    );

    if (selected == null) return;

    controllers[field.keyName]?.text =
    '${selected.year}-'
        '${selected.month.toString().padLeft(2, '0')}-'
        '${selected.day.toString().padLeft(2, '0')}';

    setState(() {});
  }

  Future<void> _pickTime(
      FormFieldConfig field,
      ) async {
    final selected = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (selected == null) return;

    final hour =
    selected.hour.toString().padLeft(2, '0');

    final minute =
    selected.minute.toString().padLeft(2, '0');

    controllers[field.keyName]?.text =
    '$hour:$minute';

    setState(() {});
  }

  void _clearForm() {
    for (final controller
    in controllers.values) {
      controller.clear();
    }

    for (final field in widget.fields) {
      if (field.options != null) {
        final options = field.options!
            .map((e) => e.trim())
            .where((e) => e.isNotEmpty)
            .toSet()
            .toList();

        selectedValues[field.keyName] =
        options.isEmpty ? null : options.first;
      }
    }

    setState(() {});
  }

  void _submit() {
    final values = <String, dynamic>{};

    for (final field in widget.fields) {
      final controller =
      controllers[field.keyName];

      if (field.options != null &&
          field.options!.isNotEmpty) {
        values[field.keyName] =
        selectedValues[field.keyName];
      } else {
        values[field.keyName] =
            controller?.text.trim() ?? '';
      }
    }

    // Find the first required text field.
    for (final field in widget.fields) {
      if (field.options != null) continue;

      final value =
          values[field.keyName]?.toString() ?? '';

      if (value.isEmpty) {
        ScaffoldMessenger.of(context)
            .showSnackBar(
          SnackBar(
            content: Text(
              '${field.label} is required.',
            ),
          ),
        );

        return;
      }

      break;
    }

    widget.onAdd(values);

    _clearForm();
  }

  Widget _field(FormFieldConfig field) {
    if (field.options != null) {
      final options = field.options!
          .map((option) => option.trim())
          .where((option) => option.isNotEmpty)
          .toSet()
          .toList();

      if (options.isEmpty) {
        return _textField(field);
      }

      String? selected =
      selectedValues[field.keyName];

      if (selected == null ||
          !options.contains(selected)) {
        selected = options.first;
        selectedValues[field.keyName] =
            selected;
      }

      return DropdownButtonFormField<String>(
        initialValue: selected,
        decoration: InputDecoration(
          labelText: field.label,
        ),
        dropdownColor: AppTheme.card,
        items: options.map(
              (option) {
            return DropdownMenuItem<String>(
              value: option,
              child: Text(
                option,
                overflow: TextOverflow.ellipsis,
              ),
            );
          },
        ).toList(),
        onChanged: (value) {
          if (value == null) return;

          setState(() {
            selectedValues[field.keyName] =
                value;
          });
        },
      );
    }

    return _textField(field);
  }

  Widget _textField(
      FormFieldConfig field,
      ) {
    return TextField(
      controller: controllers[field.keyName],
      keyboardType: field.number
          ? TextInputType.number
          : field.multiline
          ? TextInputType.multiline
          : TextInputType.text,
      maxLines: field.multiline ? 3 : 1,
      readOnly: field.date || field.time,
      onTap: field.date
          ? () => _pickDate(field)
          : field.time
          ? () => _pickTime(field)
          : null,
      decoration: InputDecoration(
        labelText: field.label,
        suffixIcon: field.date
            ? const Icon(
          Icons.calendar_month,
        )
            : field.time
            ? const Icon(
          Icons.access_time,
        )
            : null,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (widget.fields.isEmpty) {
      return const SizedBox.shrink();
    }

    return Container(
      margin: const EdgeInsets.only(top: 8),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppTheme.card,
        borderRadius:
        BorderRadius.circular(14),
        border: Border.all(
          color: AppTheme.line,
        ),
      ),
      child: Column(
        children: [
          LayoutBuilder(
            builder: (context, constraints) {
              final width = constraints.maxWidth;

              final fieldWidth =
              width > 700
                  ? (width - 24) / 3
                  : width > 450
                  ? (width - 12) / 2
                  : width;

              return Wrap(
                spacing: 12,
                runSpacing: 12,
                children: widget.fields.map(
                      (field) {
                    return SizedBox(
                      width: fieldWidth,
                      child: _field(field),
                    );
                  },
                ).toList(),
              );
            },
          ),

          const SizedBox(height: 14),

          Row(
            mainAxisAlignment:
            MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: _clearForm,
                child: const Text('Clear'),
              ),
              const SizedBox(width: 8),
              ElevatedButton.icon(
                onPressed: _submit,
                icon: const Icon(
                  Icons.add,
                ),
                label: const Text(
                  'Add item',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}