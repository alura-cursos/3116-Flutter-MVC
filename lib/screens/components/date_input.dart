import 'package:flutter/material.dart';

import '../../theme.dart';

class DateInput extends StatefulWidget {
  const DateInput({super.key, required this.textController, required this.label});

  final TextEditingController textController;
  final String label;

  @override
  State<DateInput> createState() => _DateInputState();
}

class _DateInputState extends State<DateInput> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.textController,
      keyboardType: TextInputType.datetime,
      decoration: InputDecorationProperties.newInputDecoration(
        "dd/mm/aaaa",
        widget.label,
      ).copyWith(
        suffix: InkWell(
          onTap: () => _getDate(context, widget.textController),
          child: const Icon(Icons.calendar_month),
        ),
      ),
    );
  }

  Future<void> _getDate(BuildContext context, TextEditingController textController) async {
    DateTime? selectedDate =
        await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1990),
      lastDate: DateTime.now(),
    );
    setState(() {
      if(selectedDate != null){
        textController.text = "${selectedDate.day}/${selectedDate.month}/${selectedDate.year}";
      }
    });
  }
}
