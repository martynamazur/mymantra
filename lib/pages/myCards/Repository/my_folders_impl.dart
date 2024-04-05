
import 'package:mymantra/database/database_helper.dart';

import 'package:mymantra/pages/myCards/Repository/my_folders_repository.dart';

import '../models/folder.dart';

class MyFoldersImpl extends MyFoldersRepository {
  @override
  Future<List<Folder>> fetchFolders() async {
    final databaseHelper = DatabaseHelper();
    final folderDao = await databaseHelper.getFolderDao();
    return folderDao.getAllFolders();
  }

  @override
  Future<void> createNewFolder(Folder folder) async {
    final databaseHelper = DatabaseHelper();
    final folderDao = await databaseHelper.getFolderDao();
    folderDao.insert(folder);
  }

  @override
  Future<void> deleteFolder(int folderId) async {
    final databaseHelper = DatabaseHelper();
    final folderDao = await databaseHelper.getFolderDao();
    folderDao.delete(folderId);
  }


}
