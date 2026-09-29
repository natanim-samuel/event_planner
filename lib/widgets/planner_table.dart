import 'package:flutter/material.dart';

class PlannerColumn {
  final String keyName;
  final String label;

  final List<String>? options;
  final bool number;
  final bool multiline;

  const PlannerColumn({
    required this.keyName,
    required this.label,
    this.options,
    this.number = false,
    this.multiline = false,
  });
}

class PlannerTable extends StatelessWidget {
  final List<Map<String, dynamic>> rows;
  final List<PlannerColumn> columns;

  final void Function(
      int index,
      String key,
      dynamic value,
      ) onChanged;

  final void Function(int index) onDelete;

  const PlannerTable({
    super.key,
    required this.rows,
    required this.columns,
    required this.onChanged,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    if (rows.isEmpty) {
      return Container(
        width: double.infinity,
        margin: const EdgeInsets.only(
          top: 16,
        ),
        padding: const EdgeInsets.all(30),
        decoration: BoxDecoration(
          color: const Color(0xFF17161B),
          borderRadius:
          BorderRadius.circular(16),
          border: Border.all(
            color: const Color(0xFF302E36),
          ),
        ),
        child: const Column(
          children: [
            Icon(
              Icons.inbox_outlined,
              size: 42,
              color: Colors.white38,
            ),
            SizedBox(height: 12),
            Text(
              'No items yet',
              style: TextStyle(
                color: Colors.white70,
                fontSize: 16,
              ),
            ),
            SizedBox(height: 4),
            Text(
              'Add an item using the form above.',
              style: TextStyle(
                color: Colors.white38,
                fontSize: 13,
              ),
            ),
          ],
        ),
      );
    }

    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(
        top: 16,
      ),
      decoration: BoxDecoration(
        color: const Color(0xFF17161B),
        borderRadius:
        BorderRadius.circular(16),
        border: Border.all(
          color: const Color(0xFF302E36),
        ),
      ),
      child: ClipRRect(
        borderRadius:
        BorderRadius.circular(16),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: DataTable(
            headingRowHeight: 52,
            dataRowMinHeight: 64,
            dataRowMaxHeight: 100,
            headingRowColor:
            WidgetStateProperty.all(
              const Color(0xFF201F25),
            ),
            columns: [
              ...columns.map(
                    (column) {
                  return DataColumn(
                    label: Text(
                      column.label.toUpperCase(),
                      style: const TextStyle(
                        color: Color(
                          0xFFB9B5AC,
                        ),
                        fontSize: 11,
                        fontWeight:
                        FontWeight.bold,
                        letterSpacing: 1,
                      ),
                    ),
                  );
                },
              ),
              const DataColumn(
                label: Text(
                  'ACTION',
                  style: TextStyle(
                    color: Color(
                      0xFFB9B5AC,
                    ),
                    fontSize: 11,
                    fontWeight:
                    FontWeight.bold,
                    letterSpacing: 1,
                  ),
                ),
              ),
            ],
            rows: List.generate(
              rows.length,
                  (index) {
                final row = rows[index];

                return DataRow(
                  cells: [
                    ...columns.map(
                          (column) {
                        return DataCell(
                          _buildCell(
                            index,
                            row,
                            column,
                          ),
                        );
                      },
                    ),
                    DataCell(
                      IconButton(
                        tooltip: 'Delete',
                        icon: const Icon(
                          Icons.delete_outline,
                          color:
                          Colors.redAccent,
                          size: 20,
                        ),
                        onPressed: () {
                          _confirmDelete(
                            context,
                            index,
                          );
                        },
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCell(
      int index,
      Map<String, dynamic> row,
      PlannerColumn column,
      ) {
    final value = row[column.keyName];

    if (column.options != null &&
        column.options!.isNotEmpty) {
      return _buildDropdown(
        index,
        column,
        value,
      );
    }

    return _EditableTextCell(
      value: value?.toString() ?? '',
      number: column.number,
      multiline: column.multiline,
      onChanged: (newValue) {
        onChanged(
          index,
          column.keyName,
          newValue,
        );
      },
    );
  }

  Widget _buildDropdown(
      int index,
      PlannerColumn column,
      dynamic rawValue,
      ) {
    final options = (column.options ?? [])
        .map((option) => option.trim())
        .where(
          (option) => option.isNotEmpty,
    )
        .toSet()
        .toList();

    if (options.isEmpty) {
      return const SizedBox();
    }

    String currentValue =
        rawValue?.toString() ?? '';

    if (!options.contains(currentValue)) {
      currentValue = options.first;
    }

    return DropdownButtonHideUnderline(
      child: DropdownButton<String>(
        value: currentValue,
        isDense: true,
        dropdownColor:
        const Color(0xFF222127),
        icon: const Icon(
          Icons.keyboard_arrow_down,
          color: Colors.white54,
          size: 18,
        ),
        style: const TextStyle(
          color: Colors.white,
          fontSize: 13,
        ),
        items: options.map(
              (option) {
            return DropdownMenuItem<String>(
              value: option,
              child: Text(
                option,
                overflow:
                TextOverflow.ellipsis,
              ),
            );
          },
        ).toList(),
        onChanged: (newValue) {
          if (newValue == null) return;

          onChanged(
            index,
            column.keyName,
            newValue,
          );
        },
      ),
    );
  }

  Future<void> _confirmDelete(
      BuildContext context,
      int index,
      ) async {
    final result =
    await showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor:
          const Color(0xFF1C1B20),
          title: const Text(
            'Delete item?',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          content: const Text(
            'This item will be permanently removed.',
            style: TextStyle(
              color: Colors.white70,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(
                  context,
                  false,
                );
              },
              child: const Text(
                'Cancel',
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(
                  context,
                  true,
                );
              },
              style:
              ElevatedButton.styleFrom(
                backgroundColor:
                Colors.redAccent,
                foregroundColor:
                Colors.white,
              ),
              child: const Text(
                'Delete',
              ),
            ),
          ],
        );
      },
    );

    if (result == true) {
      onDelete(index);
    }
  }
}

class _EditableTextCell
    extends StatefulWidget {
  final String value;
  final bool number;
  final bool multiline;
  final ValueChanged<String> onChanged;

  const _EditableTextCell({
    required this.value,
    required this.number,
    required this.multiline,
    required this.onChanged,
  });

  @override
  State<_EditableTextCell> createState() =>
      _EditableTextCellState();
}

class _EditableTextCellState
    extends State<_EditableTextCell> {
  late TextEditingController controller;

  @override
  void initState() {
    super.initState();

    controller =
        TextEditingController(
          text: widget.value,
        );
  }

  @override
  void didUpdateWidget(
      covariant _EditableTextCell oldWidget,
      ) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.value != widget.value &&
        controller.text != widget.value) {
      controller.text = widget.value;
    }
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.multiline ? 220 : 150,
      child: TextField(
        controller: controller,
        keyboardType: widget.number
            ? TextInputType.number
            : widget.multiline
            ? TextInputType.multiline
            : TextInputType.text,
        maxLines:
        widget.multiline ? 3 : 1,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 13,
        ),
        decoration:
        const InputDecoration(
          border: InputBorder.none,
          isDense: true,
          contentPadding:
          EdgeInsets.symmetric(
            vertical: 8,
          ),
        ),
        onChanged: widget.onChanged,
      ),
    );
  }
}