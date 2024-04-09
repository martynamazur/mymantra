import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mymantra/pages/reminders/provider/notification_provider.dart';

import '../../config/custom_style/primary_app_bar.dart';

class Notifications extends ConsumerWidget {
  const Notifications({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Column(
      children: [

        PrimaryAppBar(title: 'Notifications'),
        SwitchListTile(
            title: Text('Turn off all'),
            value: ref.watch(switchTurnNotifications),
            onChanged: (newValue) {
              ref.read(switchTurnNotifications.notifier).state = newValue;
            }),
        ElevatedButton(onPressed: (){
          Navigator.pushNamed(context, '/Reminders');
        }, child: Text('Add new noti'))

      ],
    )));
  }
}
