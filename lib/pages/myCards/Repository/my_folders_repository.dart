
import '../../../models/folder.dart';

abstract class MyFoldersRepository {
  Future<List<Folder>> fetchFolders();
  void createNewFolder(Folder folder);
  void deleteFolder(int folderId);
}