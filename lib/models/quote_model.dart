import 'package:sqflite/sqflite.dart';



class Quote {
  final int? quote_id;
  final String quote_content;
  final int? category_id;
  final int? is_created;
  int? is_favourite;

  Quote(
      this.quote_id,
      this.quote_content,
      this.category_id,
      this.is_created,
      this.is_favourite);

  Map<String, dynamic> toMap(){
    return{
      'quote_id': quote_id,
      'quote_content': quote_content,
      'category_id': category_id,
      'is_created' : is_created,
      'is_favourite': is_favourite,
    };
  }
}