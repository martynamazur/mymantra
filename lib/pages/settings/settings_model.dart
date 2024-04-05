import 'package:flutter/cupertino.dart';

class SettingsModel extends ChangeNotifier{
  bool autoscroll = true;
  bool voiceAssistant = false;
  int fontType = 0;
  int textSize = 0;

  void updateAutoscroll(){
    autoscroll = ! autoscroll;
    notifyListeners();
}
  void updateVoiceAssistant(){
    voiceAssistant = !voiceAssistant;
    notifyListeners();
  }

  void updateFontSize(int choice){
    fontType = choice;
    notifyListeners();
  }
  void updateTextSize(int choice){
    textSize = choice;
    notifyListeners();
  }

}