

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
class BookReport extends StatefulWidget {
  const BookReport({Key? key}) : super(key: key);

  @override
  State<BookReport> createState() => _BookReportState();
}
late String _description;
 late String _name;
 late String _time;
 late String _email;
const String initialRoute = '/datatable2';

//SharedPreferences prefs  = await SharedPreferences.getInstance();
//final prefs = await SharedPreferences.getInstance();

class _BookReportState extends State<BookReport> {
  String _getCurrentRoute(BuildContext context) {
  return ModalRoute.of(context) != null &&
      ModalRoute.of(context)!.settings.name != null
      ? ModalRoute.of(context)!.settings.name!
      : initialRoute;
}
  /**
  Scaffold _getScaffold(BuildContext context, Widget body,
  [List<String>? options]) {
  var defaultOption = getCurrentRouteOption(context);
  if (defaultOption.isEmpty && options != null && options.isNotEmpty) {
  defaultOption = options[0];
  }
**/
  bool _sortAscending = true;

  @override
Stream<void> initState()async*{
  super.initState();
  _loadData();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  final keys = prefs.getKeys();

}
   late final keys;

  _loadData() async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  setState(() {
    _name = (prefs.getString(keys) ?? '');
    _time = (prefs.getString(keys) ?? '');
    _description = (prefs.getString(keys) ?? '');
    _email = (prefs.getString(keys) ?? '');

  });
}

  // the list of products
  final List<Map<String, dynamic>> _products = [
    {'id': 1, 'name': 'Dragon Robot', 'price': 19.99,
    'description': "this is a big villa"},
    {'id': 2, 'name': 'Turtle Toy', 'price': 15.99,'time':'now','description': "this is a big villa" },
    {'id': 3, 'name': 'White Board', 'price': 12.99,'time':'in a week', 'description': "this is a small apartment but in new york"},
    {'id': 4, 'name': 'Kinda home', 'price': 24.99,'time':'in two weeks','description': "this is a medium sized farm " },
    {'id': 5, 'name': 'Travel Bag', 'price': 17.99, 'time':'in a day or two','description': "this is a flat in a tower"},
  ];

// the function that sorts the list of products
// this function is called when the user taps the sort button
  void _sortProducts(bool ascending) {
    setState(() {
      _sortAscending = ascending;
      _products.sort((a, b) => ascending
          ? a['price'].compareTo(b['price'])
          : b['price'].compareTo(a['price']));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Book Report'),
      ),
      body: Column(
        children: [
          // The header of the list
          Container(
            padding: const EdgeInsets.symmetric(vertical: 29, horizontal: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  _sortAscending ? 'Price Low to High' : 'Price High to Low',
                  style: const TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                // the sort button
                InkWell(
                  onTap: () => _sortProducts(!_sortAscending),
                  child: Row(
                    children: [
                      const Text(
                        'Price',
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                        ),
                      ),
                      // the up/down arrow that indicates the sort order
                      Icon(
                        _sortAscending
                            ? Icons.arrow_drop_down
                            : Icons.arrow_drop_up,
                        color: Colors.blue,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // The list of products
          Expanded(
            child: ListView.builder(
              itemCount: _products.length,
              itemBuilder: (context, index) {
                // the list item - product
                return Container(
                  padding: const EdgeInsets.all(16),
                  margin: const EdgeInsets.only(bottom: 3),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${_products[index]["name"]}',
                        style: const TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '${_products[index]["id"]}',
                        style: const TextStyle(
                          fontSize: 16.0,
                        ),
                      ),
                      Text(
                        '\$${_products[index]['price']}',
                        style: const TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                        ),
                      ),
                      Text(
                        '\$${_products[index]["time"]}',
                        style: const TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                        ),
                      ),
                      Text(
                        '\$${_products[index]['price']}',
                        style: const TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}