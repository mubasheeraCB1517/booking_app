library horizontal_time_picker;

import 'package:flutter/material.dart';

import 'time_picker_util.dart';
import 'time_widget.dart';

typedef DateSelectionCallBack = void Function(DateTime dateTime);

class HorizontalTimePicker extends StatefulWidget {
  final int startTimeInHour;
  final int endTimeInHour;
  final DateTime dateForTime;
  final int timeIntervalInMinutes;
  final double height;
  final TextStyle? timeTextStyle;
  final TextStyle? selectedTimeTextStyle;
  final DateSelectionCallBack? onTimeSelected;
  final DateSelectionCallBack? onTimeUnSelected;
  final Decoration? defaultDecoration;
  final Decoration? selectedDecoration;
  final Decoration? disabledDecoration;
  final List<DateTime>? initialSelectedDates;
  final ScrollController? scrollController;
  final double spacingBetweenDates;
  final EdgeInsetsGeometry padding;
  final int maxSelectedDateCount;
  final bool showDisabled;

  const HorizontalTimePicker({
    Key? key,
    this.height = 250,
    this.timeIntervalInMinutes = 60,
    required this.startTimeInHour,
    required this.endTimeInHour,
    required this.dateForTime,
    this.scrollController,
    this.onTimeSelected,
    this.onTimeUnSelected,
    this.maxSelectedDateCount = 1,
    this.timeTextStyle,
    this.selectedTimeTextStyle,
    this.defaultDecoration,
    this.selectedDecoration,
    this.disabledDecoration,
    this.initialSelectedDates,
    this.spacingBetweenDates = 8.0,
    this.showDisabled = true,
    this.padding = const EdgeInsets.all(12.0),
  })  : assert(startTimeInHour != null),
        assert(dateForTime != null),
        assert(endTimeInHour != null),
        assert(
          endTimeInHour == startTimeInHour || startTimeInHour < endTimeInHour,
        ),
        super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _HorizontalTimePickerState createState() => _HorizontalTimePickerState();
}

class TimeUnit {
  int _hour;
  int _minute;
  final String _time;
  int _hour24;

  TimeUnit(this._hour, this._minute, this._time, this._hour24);

  int get hour => _hour;

  set hour(int value) {
    _hour = value;
  }

  int get hour24 => _hour24;

  set hour24(int value) {
    _hour24 = value;
  }

  String get time => (_hour < 10 ? '0' : '') + _hour.toString();

  int get minute => _minute;

  set minute(int value) {
    _minute = value;
  }
}

class _HorizontalTimePickerState extends State<HorizontalTimePicker> {
  final List<TimeUnit> allDateTimeSlots = [];
  List<TimeUnit> selectedDateTimeSlots = [];

  @override
  void initState() {
    super.initState();
    allDateTimeSlots.addAll(getDateTimeSlotList(
        widget.startTimeInHour,
        widget.endTimeInHour,
        widget.timeIntervalInMinutes,
        widget.dateForTime));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 30,top: 5),
      padding: const EdgeInsets.only(left: 10),
      height: 190,
      child: GridView.builder(
       // shrinkWrap: true,
        controller: widget.scrollController ?? ScrollController(),
        scrollDirection: Axis.horizontal,
        itemCount: allDateTimeSlots.length,
        itemBuilder: (context, index) {
          final timeSlotIterated = allDateTimeSlots[index];
          String time =
              "${allDateTimeSlots[index].time} ${allDateTimeSlots[index]._time} - ${index + 1 != 15 ? "${allDateTimeSlots[index + 1].time} ${allDateTimeSlots[index]._time}" : "12 AM"}";
          if (!widget.showDisabled &&
              isTimeSlotDisabled(widget.dateForTime, timeSlotIterated)) {
            return Container();
          }
          return TimeWidget(
            key: Key(timeSlotIterated._time),
            padding: widget.padding,
            isSelected:
                isTimeSlotSelected(selectedDateTimeSlots, timeSlotIterated),
            isDisabled:
                isTimeSlotDisabled(widget.dateForTime, timeSlotIterated),
            date: widget.dateForTime,
            timeUnit: time,
            timeTextStyle: widget.timeTextStyle,
            selectedTimeTextStyle: widget.selectedTimeTextStyle,
            defaultDecoration: widget.defaultDecoration!,
            selectedDecoration: widget.selectedDecoration!,
            disabledDecoration: widget.disabledDecoration!,
          );
        },
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 0.5,
          mainAxisSpacing: 10.0,
          crossAxisSpacing: 10.0,
          crossAxisCount: 3,
        ),
      ),
    );
  }
}
