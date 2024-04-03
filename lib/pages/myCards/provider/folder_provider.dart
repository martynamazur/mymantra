
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mymantra/models/folder.dart';
import 'package:mymantra/pages/myCards/Repository/my_folders_impl.dart';
import 'package:mymantra/pages/myCards/Repository/my_folders_repository.dart';

final myFoldersRepositoryProvider = Provider<MyFoldersRepository>((ref) {
  return MyFoldersImpl();
});

final fetchFolderProvider = FutureProvider<AsyncValue<List<Folder>>>((ref) async {
  final repository = ref.watch(myFoldersRepositoryProvider);
  try {
    final folders = await repository.fetchFolders();
    return AsyncValue.data(folders);
  } catch (error) {
    return AsyncValue.error(error, StackTrace.current);
  }
});
