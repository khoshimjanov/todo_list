import 'package:hive/hive.dart';
part 'category_model.g.dart';

@HiveType(typeId: 1)
enum Category {
  @HiveField(0)
  nocategory('No category'),
  @HiveField(1)
  wishlist('Wishlist'),
  @HiveField(2)
  work('Work'),
  @HiveField(3)
  birthday('Birthday'),
  @HiveField(4)
  personal('Personal'),
  @HiveField(5)
  daily('Daily');

  const Category(this.value);
  final String value;
}
