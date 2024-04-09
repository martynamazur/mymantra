import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mymantra/pages/generator/generate_quotes/service/chat_service.dart';



import '../model/prompt.dart';
import '../provider/generate_quotes_provider.dart';

class AiQuoteGenerator extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    TextEditingController promptController =
        TextEditingController();

    return Scaffold(
      backgroundColor: Colors.grey[200],
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  padding: EdgeInsets.all(18),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: Colors.deepPurple),
                  child: ColorFiltered(
                    colorFilter:
                        ColorFilter.mode(Colors.white, BlendMode.srcIn),
                    child: Image.asset('assets/icons/bot.png'),
                  )),
              SizedBox(height: 8),
              Text(
                'Create original quotes with AI at your fingertips',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w300,
                ),
              ),
              SizedBox(height: 18),
              TextFormField(
                controller: promptController,
                maxLines: 1,
                decoration: const InputDecoration(
                    labelText: "Prompt",
                    hintText: "Enter your prompt here",
                    border: OutlineInputBorder()),
              ),
              SizedBox(height: 8),
              _settings(ref),

              ElevatedButton(
                  style: ButtonStyle(
                      padding: MaterialStateProperty.all(
                          const EdgeInsets.symmetric(
                              horizontal: 80, vertical: 20)),
                      backgroundColor:
                          MaterialStateProperty.all(Colors.deepPurple)),
                  onPressed: () async {

                    //move it somewhere else
                    String? response = await ChatService().request(QuotePrompt(6, true, 1).createPrompt(promptController.text));
                    List<String> quotes = response?.split(".") ?? [];
                    ref.read(generatedQuotesProvider.notifier).state = quotes;

                    //ref.read(responseProvider.notifier).state = response!;
                    Navigator.pushNamed(context, '/SaveQuote');
                  },
                  child: const Text(
                    "Submit",
                    style: TextStyle(color: Colors.white),
                  )),
              //_quotestView()
            ],
          ),
        ),
      ),
    );
  }

  Widget _settings(WidgetRef ref) {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 6, vertical: 6),
          decoration: BoxDecoration(
            border: Border.all(),
          ),
          child: DropdownButton<int>(
            value: ref.watch(selectedQuoteAmountProvider),
            items: ref.watch(dropdownMenuEntriesProvider).map((int value) {
              return DropdownMenuItem<int>(
                value: value,
                child: Text(value.toString()),
              );
            }).toList(),
            onChanged: (int? newValue) {
              ref.read(selectedQuoteAmountProvider.notifier).state = newValue!;
            },
          ),
        ),
        SizedBox(width: 12),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 6, vertical: 6),
          decoration: BoxDecoration(border: Border.all()),
          child: Row(
            children: [
              Text('Short'),
              Switch(
                  value: ref.watch(isQuoteShortProvider),
                  onChanged: (bool newValue) {
                    ref.read(isQuoteShortProvider.notifier).state = newValue;
                  }),
              Text('Long'),
            ],
          ),
        ),
      ],
    );
  }
}
