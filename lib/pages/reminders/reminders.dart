import 'dart:ui';

import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter_material_pickers/flutter_material_pickers.dart';
import 'package:flutter_onboarding_slider/flutter_onboarding_slider.dart';

final today = DateUtils.dateOnly(DateTime.now());

class Reminders extends StatefulWidget {
  const Reminders({Key? key}) : super(key: key);

  @override
  State<Reminders> createState() => _RemindersState();
}

class _RemindersState extends State<Reminders> {
  List<DateTime?> _multiDatePickerValueWithDefaultValue = [
    DateTime(today.year, today.month, 1),
    DateTime(today.year, today.month, 5),
    DateTime(today.year, today.month, 14),
    DateTime(today.year, today.month, 17),
    DateTime(today.year, today.month, 25),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OnBoardingSlider(
        totalPage: 3,
        headerBackgroundColor: Colors.transparent,
        background: [
          Image.asset('assets/backgrounds/background0.png'),
          Image.asset('assets/backgrounds/background0.png'),
          Image.asset('assets/backgrounds/background0.png'),

        ],
        speed: 0.4,
        pageBodies: [
          _buildChoiceQuoteSetPage(),
          _buildChoiceDaysPage(),
          _buildSummaryPage()
        ],
      ),
    );
  }

  List<String> _getValueText(
    CalendarDatePicker2Type datePickerType,
    List<DateTime?> values,
  ) {
    List<String> result = [];
    values = values.map((e) => e!= null ? DateUtils.dateOnly(e) : null).toList();

    if(datePickerType == CalendarDatePicker2Type.multi || datePickerType == CalendarDatePicker2Type.range){
      for( var value in values){
        if( value!= null){
          result.add(value.toString().replaceAll('00:00:00.000', ''));
        }
      }
    }
    return result;

  }


  Widget _buildDefaultMultiDatePickerWithValue() {
    final config = CalendarDatePicker2Config(
      calendarType: CalendarDatePicker2Type.multi,
      selectedDayHighlightColor: Colors.indigo,
    );
    return Container(
      child: Column(
        //mainAxisSize: MainAxisSize.min,
        //mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 10),
          const Text('Pick days', style: TextStyle(fontSize: 24, fontWeight: FontWeight.w400)),
          CalendarDatePicker2(
            config: config,
            value: _multiDatePickerValueWithDefaultValue,
            onValueChanged: (dates) =>
                setState(() => _multiDatePickerValueWithDefaultValue = dates),
          ),
          const SizedBox(height: 10),

        ],
      ),
    );
  }

  Widget _buildChoiceQuoteSetPage() {
    return Center(
      child: SizedBox(
        width: 375,
        child: ListView(
          children: <Widget>[
            _buildDefaultMultiDatePickerWithValue(),
          ],
        ),
      ),
    );
  }

  Widget _buildChoiceDaysPage() {
    return Center(
      child: Column(
        children: [Text('3 screen')],
      ),
    );
  }

  Widget _buildSummaryPage() {
    return Center(
      child: Column(
        children: [
          Text('Success'),
          Text('Do you want to set another notification ?'),
          OutlinedButton(onPressed: (){

          }, child: Text('Add new'))
        ],
      ),
    );
  }
}
