import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mymantra/config/custom_style/theme.dart';


import '../generate_quotes/provider/generate_quotes_provider.dart';

class SaveQuote extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final List<String> quoteList = ref.watch(generatedQuotesProvider);
    List<bool> checked = List<bool>.filled(quoteList.length, true);

    return Scaffold(
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 64),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                    child: ElevatedButton(
                        onPressed: () {}, child: Text('Select all'))),
                SizedBox(width: 32),
                Expanded(
                    child: ElevatedButton(
                        onPressed: () {}, child: Text('Deselect all')))
              ],
            ),
            Expanded(
              child: ListView.builder(
                itemCount: quoteList.length,
                itemBuilder: (context, index) {
                  return Container(
                    decoration: AppDecoration.neumorphicBackground,
                    margin: EdgeInsets.all(32),
                    child: CheckboxListTile(
                      title: Text(quoteList[index]),
                      value: checked[index],
                      onChanged: (bool? value) {
                        checked[index] = value!;
                      },
                    ),
                  );
                },
              ),
            ),
            ElevatedButton(
                onPressed: () {
            }, child: Text('Save'))
          ],
        ),
      ),
    );
  }
}
