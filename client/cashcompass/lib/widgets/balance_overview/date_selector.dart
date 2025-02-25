import 'package:flutter/cupertino.dart';
import 'view_option.dart';
import 'view_segmented_control.dart';

/// Custom Widget for selecting a date with additional options
class DateSelectorPopup extends StatefulWidget {
  // Widget required the initial selected date and view
  // also a callback for when a date is selected
  final DateTime initialDate;
  final ViewOption initialViewOption;
  final void Function(DateTime, ViewOption) onDateSelected;

  const DateSelectorPopup({
    super.key,
    required this.initialDate,
    required this.initialViewOption,
    required this.onDateSelected,
  });

  @override
  State<DateSelectorPopup> createState() => _DateSelectorPopupState();
}

class _DateSelectorPopupState extends State<DateSelectorPopup> {
  late DateTime _selectedDate;
  late ViewOption _viewOption;

  @override
  void initState() {
    super.initState();
    _selectedDate = widget.initialDate;
    _viewOption = widget.initialViewOption;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      color: CupertinoColors.white,
      child: Column(
        children: [
          const Spacer(flex: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Text('Focus on:'),
              ViewOptionSegmentedControl(
                selectedSegment: _viewOption,
                onValueChanged: (ViewOption? value) {
                  if (value != null) {
                    setState(
                      () {
                        _viewOption = value;
                      },
                    );
                  }
                },
              )
            ],
          ),
          const Spacer(flex: 12),
          SizedBox(
            height: 200,
            child: CupertinoDatePicker(
              initialDateTime: _selectedDate,
              mode: CupertinoDatePickerMode.date,
              onDateTimeChanged: (DateTime newDate) {
                setState(() {
                  _selectedDate = newDate;
                });
              },
            ),
          ),
          CupertinoButton(
            child: const Text('Done'),
            onPressed: () {
              widget.onDateSelected(_selectedDate, _viewOption);
              Navigator.of(context).pop(_selectedDate);
            },
          ),
        ],
      ),
    );
  }
}
