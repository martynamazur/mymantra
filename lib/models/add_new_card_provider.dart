
import 'package:flutter/material.dart';

import '../database/database_helper.dart';

import '../pages/myCards/models/folder.dart';

class AddNewCardProvider extends ChangeNotifier{
  String quoteContent = "";
  int selectedFolderId = 0;
  List<Folder> folders = [];

  Future<void> loadAllFolders() async {
    try {
      final databaseHelper = DatabaseHelper();
      final folderDao = await databaseHelper.getFolderDao();
      final loadedFolders= await folderDao.getAllFolders();

      folders.addAll(loadedFolders);
      notifyListeners();
    } catch (e) {
      print('Error loading quotes: $e');
    }
  }

  void updateSelectedFolders(int folderId){
    selectedFolderId = folderId;
    notifyListeners();
  }

  void updateQuoteContent(String content){
    quoteContent = content;
    notifyListeners();
  }

}