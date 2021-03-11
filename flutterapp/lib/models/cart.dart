import 'package:flutterapp/core/store.dart';
import 'package:flutterapp/models/catalog.dart';
import 'package:velocity_x/velocity_x.dart';

class CartModel {
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

class AddMutation extends VxMutation<MyStore> {
  final Item item;

  AddMutation(this.item);
  @override
  perform() {
    store.cart._itemIds.add(item.id);
  }
}
