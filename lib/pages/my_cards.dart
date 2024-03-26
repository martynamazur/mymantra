import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mymantra/pages/custom_style/theme.dart';
import '../models/favourite_model.dart';
import '../models/quote_model.dart';
import '../models/category_model.dart';

class MyCards extends StatefulWidget {
  @override
  _MyCardsState createState() => _MyCardsState();
}

class _MyCardsState extends State<MyCards> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late FavouriteModel _favouriteModel;
  late List<Quote> _quotes;

  List<MyCardsCategory> categoryList = [
    MyCardsCategory(1, 'Electronics', 'assets/images/thumbs_up.png'),
    MyCardsCategory(2, 'Clothing', 'assets/images/thumbs_up.png'),
    MyCardsCategory(3, 'Books', 'assets/images/thumbs_up.png'),
    MyCardsCategory(4, 'Furniture', 'assets/images/thumbs_up.png'),
    MyCardsCategory(1, 'Electronics', 'assets/images/thumbs_up.png'),
    MyCardsCategory(2, 'Clothing', 'assets/images/thumbs_up.png'),
    MyCardsCategory(3, 'Books', 'assets/images/thumbs_up.png'),
    MyCardsCategory(4, 'Furniture', 'assets/images/thumbs_up.png'),
    MyCardsCategory(1, 'Electronics', 'assets/images/thumbs_up.png'),
    MyCardsCategory(2, 'Clothing', 'assets/images/thumbs_up.png'),
    MyCardsCategory(3, 'Books', 'assets/images/thumbs_up.png'),
    MyCardsCategory(4, 'Furniture', 'assets/images/thumbs_up.png'),
    // Add more categories as needed
  ];


  @override
  void initState() {
    super.initState();
    _favouriteModel = FavouriteModel();
    _tabController = TabController(length: 3, vsync: this);
    _loadQuotes();
  }

  Future<void> _loadQuotes() async {
    try {
      final quotes = await _favouriteModel.loadQuotes();
      setState(() {
        _quotes = quotes;
      });
    } catch (e) {
      // Obsłuż błąd, jeśli wystąpi
      print('Error loading quotes: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
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
              controller: _tabController,
              tabs: const [
                Tab(text: 'All'),
                Tab(text: 'My folders'),
                Tab(text: 'Favourite'),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                _categoryList(),
                const Center(child: Text("My folders")),
                _favouriteList(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _categoryList(){
    if( categoryList.isEmpty){
      return Center(child: CircularProgressIndicator());
    } else {
      return ListView.builder(
        itemCount: categoryList.length,
        itemBuilder: (context, index) {
          return Container(
            padding: EdgeInsets.all(16),
            margin: EdgeInsets.all(16),
            decoration: AppDecoration.neumorphicBackground,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,

              children: [
                Image.asset(categoryList[index].categoryIconPath),
                SizedBox(width: 16),
                Text(categoryList[index].categoryName)
              ],
            ),
          );
        },
      );
    }
  }


  Widget _favouriteList() {
    if (_quotes == null) {
      // Wyświetl animację ładowania lub komunikat, gdy cytaty są ładowane
      return Center(child: CircularProgressIndicator());
    } else if (_quotes.isEmpty) {
      // Wyświetl komunikat, gdy brak ulubionych cytów
      return Center(child: Text('No favourite quotes.'));
    } else {
      // Wyświetl listę ulubionych cytów
      return ListView.builder(
        itemCount: _quotes.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(_quotes[index].quote_content),
            subtitle: Text('Category: ${_quotes[index].category_id}'),
            // Tutaj możesz dodać więcej informacji z cytatu
            // na przykład autora, datę itp.
          );
        },
      );
    }
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}
