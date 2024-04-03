import 'package:sqflite/sqflite.dart';
import '../models/folder.dart';

class FolderDao {
  final Database _database;

  FolderDao(this._database);

  Future<int> insert(Folder folder) async {
    return await _database.insert('Folders', folder.toMap());
  }

  Future<void> delete(int folderId) async {
    await _database.delete(
      'Folders',
      where: 'folder_id = ?',
      whereArgs: [folderId],
    );
  }

  Future<List<Folder>> getAllFolders() async {
    final List<Map<String, dynamic>> foldersMapList =
        await _database.query('Folders');
    return List.generate(foldersMapList.length, (index) {
      return Folder(
        foldersMapList[index]['folder_id'],
        foldersMapList[index]['folder_name'],
        foldersMapList[index]['folder_color']
      );
    });
  }
}
