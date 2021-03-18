import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterapp/core/store.dart';
import 'package:flutterapp/models/cart.dart';
import 'package:flutterapp/models/catalog.dart';
import 'package:flutterapp/utils/routes.dart';
import 'package:flutterapp/widgets/home_widgets/catalog_headers.dart';
import 'package:flutterapp/widgets/home_widgets/catalog_list.dart';
import 'dart:convert';
import 'package:velocity_x/velocity_x.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final int days = 30;

  final String name = "Abhishek";

  final url = "https://api.jsonbin.io/b/604dbddb683e7e079c4eefd3";

  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(Duration(seconds: 2));
    // var catalogJson = await rootBundle.loadString("assets/files/catalog.json");
    final response = await http.get(Uri.parse(url));
    final catalogJson = response.body;
    var decodeData = jsonDecode(catalogJson);
    var productsData = decodeData["products"];
    CatalogModel.items = List.from(productsData)
        .map<Item>((item) => Item.fromMap(item))
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final _cart = (VxState.store as MyStore).cart;
    return Scaffold(
      backgroundColor: context.canvasColor,
      floatingActionButton: VxBuilder(
          mutations: {AddMutation, RemoveMutation},
          builder: (ctx, _) => FloatingActionButton(
                onPressed: () =>
                    Navigator.pushNamed(context, MyRoutes.cartRoute),
                child: Icon(
                  CupertinoIcons.cart,
                  color: Colors.white,
                ),
                backgroundColor: context.theme.buttonColor,
              ).badge(
                  color: Vx.red500,
                  size: 20,
                  count: _cart.items.length,
                  textStyle: TextStyle(color: Colors.white))),
      body: SafeArea(
        child: Container(
          padding: Vx.m32,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            CatalogHeader(),
            if (CatalogModel.items != null && CatalogModel.items.isNotEmpty)
              CatalogList().py16().expand()
            else
              CircularProgressIndicator().py16().centered().expand(),
          ]),
        ),
      ),
    );
  }
}
