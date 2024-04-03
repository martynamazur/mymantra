import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mymantra/models/folder.dart';
import 'package:mymantra/pages/myCards/Repository/my_folders_impl.dart';
import 'package:mymantra/pages/myCards/provider/category_provider.dart';
import 'package:mymantra/pages/myCards/provider/folder_provider.dart';

import 'package:mymantra/providers/providers.dart';

import '../../models/category_model.dart';
import '../custom_style/theme.dart';

class MyCards extends StatefulWidget {
  const MyCards({Key? key}) : super(key: key);

  @override
  _MyCardsState createState() => _MyCardsState();
}

class _MyCardsState extends State<MyCards> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return MyCardsWidget(tabController: _tabController);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}

class MyCardsWidget extends ConsumerWidget {
  final TabController tabController;

  const MyCardsWidget({Key? key, required this.tabController})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final foldersList = ref.watch(fetchFolderProvider);
    final categoriesList = ref.watch(fetchCategoryListProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'My Cards',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.black,
            letterSpacing: 0.8,
          ),
        ),
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          Container(
            child: TabBar(
              controller: tabController,
              tabs: const [
                Tab(text: 'All'),
                Tab(text: 'My folders'),
                Tab(text: 'Favourite'),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: tabController,
              children: [
                _categoryList(categoriesList, context, ref),
                _myFoldersList(foldersList, context, ref),
                //_favouriteList(),
              ],
            ),
          ),
          Text(foldersList.isLoading.toString()),
        ],
      ),
    );
  }

  Widget _myFoldersList(AsyncValue<AsyncValue<List<Folder>>> foldersList,
      BuildContext context, WidgetRef ref) {
    return foldersList.when(
      data: (asyncFolders) {
        return asyncFolders.when(
          data: (folders) {
            if (folders.isEmpty) {
              return Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                    Icon(Icons.folder_outlined, size: 40),
                Text('Empty', style: TextStyle(fontSize: 18)),
                _actionButton(context, ref)
                ],
              ),
            );
            } else {
            return Container(
              child: Column(
                children: [
                  Expanded(
                  child: ListView.builder(
                  itemCount: folders.length,
                  itemBuilder: (context, index) {
                  return Container(
                  padding: const EdgeInsets.all(16),
                  margin: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(15),
                  ),
                  child: Text(folders[index].folderName),
                  );
                  },
                  ),
                  ),
                  _actionButton(context, ref),
                ],
              ),
            );

            }
          },
          loading: () => Center(child: CircularProgressIndicator()),
          error: (error, stackTrace) => Center(child: Text('Error: $error')),
        );
      },
      loading: () => Center(child: CircularProgressIndicator()),
      error: (error, stackTrace) => Center(child: Text('Error: $error')),
    );
  }

  Widget _actionButton(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return _createFolderDialog(context, ref);
              },
            );
          },
          child: Text('Create a new folder'),
        ),
        ElevatedButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return _addNewQuoteDialog(context);
              },
            );
          },
          child: Text('Add new quote'),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, '/AiQuoteGenerator');
          },
          child: Text('Create quotes with Ai generator'),
        ),
      ],
    );
  }


  Widget _createFolderDialog(BuildContext context, WidgetRef ref) {
    return Dialog(
      child: Container(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Create a new folder',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            const TextField(
              decoration: InputDecoration(labelText: 'Folder Name'),
            ),
            const SizedBox(height: 16),
            const Text('Choose folder color'),
            ElevatedButton(
              onPressed: () {
                Folder folder = Folder(3, "test2", "testcolor2");
                //MyFoldersImpl().createNewFolder(folder);
                ref.read(myFoldersRepositoryProvider).createNewFolder(folder);
                ref.refresh(fetchFolderProvider);
                Navigator.pop(context);
              },
              child: const Text('Create'),
            ),
          ],
        ),
      ),
    );
  }


  Widget _addNewQuoteDialog(BuildContext context) {
    String _selectedItem = '1';

    return Dialog(
      insetPadding: EdgeInsets.zero,
      child: Container(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.close_rounded),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                const Text(
                  'Add New Quote',
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 16),
            const TextField(
              decoration: InputDecoration(
                labelText: 'Quote',
                labelStyle: TextStyle(fontSize: 16),
                contentPadding: EdgeInsets.symmetric(vertical: 20),
              ),
              style: TextStyle(fontSize: 18),
              maxLines: null,
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                const Text('Move to folder'),
                Expanded(
                  child: DropdownButton<String>(
                    value: _selectedItem,
                    onChanged: (String? newValue) {
                      /*
                      setState(() {
                        _selectedItem = newValue!;
                      });

                       */
                    },
                    items: <String>[
                      'Option 1',
                      'Option 2',
                      'Option 3',
                      'Option 4'
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Add'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _categoryList(AsyncValue<AsyncValue<List<MyCardsCategory>>> categories, BuildContext context, WidgetRef ref) {
    return categories.when(
      data: (asyncCategories) {
        return asyncCategories.when(
          data: (categoryList) {
            if (categoryList.isEmpty) {
              return const Center(child: CircularProgressIndicator());
            } else {
              return ListView.builder(
                itemCount: categoryList.length,
                itemBuilder: (context, index) {
                  return Container(
                    padding: const EdgeInsets.all(16),
                    margin: const EdgeInsets.all(25),
                    decoration: AppDecoration.neumorphicBackground,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        //Image.asset(categoryList[index].categoryIconPath),
                        const SizedBox(width: 16),
                        Text(categoryList[index].categoryName),
                      ],
                    ),
                  );
                },
              );
            }
          },
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (error, stackTrace) => Center(child: Text('Error: $error')),
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stackTrace) => Center(child: Text('Error: $error')),
    );
  }

/*
  Widget _favouriteList() {
    if (_quotes == null) {
      return const Center(child: CircularProgressIndicator());
    } else if (_quotes.isEmpty) {
      return const Center(child: Text('No favourite quotes.'));
    } else {
      return ListView.builder(
        itemCount: _quotes.length,
        itemBuilder: (context, index) {
          return Stack(
            children: [
              Container(
                decoration: AppDecoration.neumorphicBackground,
                padding: EdgeInsets.all(8),
                margin: EdgeInsets.all(20.0),
                child: ListTile(
                  title: Text(_quotes[index].quote_content),
                  subtitle: Text('Category: ${_quotes[index].category_id}'),
                ),
              ),
              Positioned(
                right: -10,
                top: 0,
                bottom: 0,
                child: IconButton(
                  icon: SvgPicture.asset(
                    "assets/icons/heart.svg",
                    width: 44,
                    height: 42,
                  ),
                  onPressed: () {},
                ),
              ),
            ],
          );
        },
      );
    }
  }

 */


}
