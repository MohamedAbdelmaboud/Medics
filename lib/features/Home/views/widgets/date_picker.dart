import 'package:datepicker_dropdown/datepicker_dropdown.dart';
import 'package:datepicker_dropdown/order_format.dart';
import 'package:flutter/material.dart';
import 'package:medical_expert_app/core/componants/colors.dart';

class DatePicker extends StatefulWidget {
  final String title, subtitle;

  const DatePicker({super.key, required this.title, required this.subtitle});

  @override
  State<DatePicker> createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  int _selectedYear = 1993;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
            child: Text(
              widget.title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Row(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.57,
                child: DropdownDatePicker(
                  showDay: false,
                  showMonth: false,
                  locale: "en",
                  dateformatorder: OrderFormat.YDM,
                  inputDecoration: InputDecoration(
                    isDense: true,
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: kSecondary2),
                      borderRadius: BorderRadius.circular(35),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: kPrimary),
                      borderRadius: BorderRadius.circular(35),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(35),
                      borderSide: const BorderSide(color: Colors.red),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(35),
                      borderSide: const BorderSide(
                        color: Colors.red,
                      ),
                    ),
                    filled: true,
                    fillColor: kSecondary,
                  ),
                  isDropdownHideUnderline: true,
                  isFormValidator: true,
                  startYear: 1900,
                  selectedYear: _selectedYear,
                  onChangedYear: (value) {
                    _selectedYear = int.parse(value!);
                  },
                  hintYear: 'Year',
                ),
              ),
              const Spacer(),
              Text(
                widget.subtitle,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
