import 'package:flutterapp/models/catalog.dart';

class CartModel {
  static final cartModel = CartModel._iternal();

  CartModel._iternal();

  factory CartModel() => cartModel;

  // Catalog Field
  CatalogModel _catalog;

  //Collection of IDs & Stores all IDs of each item
  final List<int> _itemIds = [];

  CatalogModel get catalog => _catalog;

  set catalog(CatalogModel newCatalog) {
    assert(newCatalog != null);
    _catalog = newCatalog;
  }

  // Get Items in the cart
  List<Item> get items => _itemIds.map((id) => _catalog.getById(id)).toList();
 
  // Adds the total price
  num get totalPrice =>
      items.fold(0, (total, current) => total + current.price);

  // Add Items
  void add(Item item) {
    _itemIds.add(item.id);
  }

  // Remove Items
  void remove(Item item) {
    _itemIds.remove(item.id);
  }
}
