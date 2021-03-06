import 'package:flutter/material.dart';

class AppColors {
  static const Color primaryElement = Color.fromARGB(255, 255, 255, 255);
}

class Borders {
  static const BorderSide primaryBorder = BorderSide(
    color: Color.fromARGB(255, 229, 229, 229),
    width: 1,
    style: BorderStyle.solid,
  );
}

class Radii {
  static const BorderRadiusGeometry k3pxRadius =
      BorderRadius.all(Radius.circular(5));
}

class TimeWidget extends StatelessWidget {
  final DateTime date;
  final String timeUnit;
  final TextStyle? timeTextStyle;
  final TextStyle? selectedTimeTextStyle;
  final VoidCallback? onTap;
  final VoidCallback? onLongTap;
  final Decoration defaultDecoration;
  final Decoration selectedDecoration;
  final Decoration disabledDecoration;
  final bool isSelected;
  final bool isDisabled;
  final EdgeInsetsGeometry? padding;

  const TimeWidget({
    Key? key,
    required this.date,
    required this.timeUnit,
    this.onTap,
    this.onLongTap,
    this.isSelected = false,
    this.isDisabled = false,
    this.timeTextStyle,
    this.selectedTimeTextStyle,
    this.defaultDecoration = const BoxDecoration(
      color: Colors.red,
      border: Border.fromBorderSide(Borders.primaryBorder),
      borderRadius: Radii.k3pxRadius,
    ),
    this.selectedDecoration = const BoxDecoration(
      color: Colors.red,
      border: Border.fromBorderSide(Borders.primaryBorder),
      borderRadius: Radii.k3pxRadius,
    ),
    this.disabledDecoration = const BoxDecoration(
      color: Colors.red,
      border: Border.fromBorderSide(Borders.primaryBorder),
      borderRadius: Radii.k3pxRadius,
    ),
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Decoration decoration = defaultDecoration;
    TextStyle timeStyle = timeTextStyle!;
    if (isSelected) {
      timeStyle = selectedTimeTextStyle!;
      decoration = selectedDecoration;
    } else if (isDisabled) {
      decoration = disabledDecoration;
    }
    return GestureDetector(
      onTap: isDisabled ? null : onTap,
      onLongPress: isDisabled ? null : onLongTap,
      child: Container(
        decoration: decoration,
        child: Padding(
          padding: padding!,
          child: Center(
            child: Text(
              timeUnit,
              textAlign: TextAlign.center,
              style: timeStyle,
            ),
          ),
        ),
      ),
    );
  }
}
