import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CategoryFilter extends StatelessWidget {
  late final List<String> categories;
  late final List<String> selected;
  late final Function(String, bool) callback;


  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: ListView.builder(
          itemCount: categories.length,
          itemBuilder: (BuildContext context, int index) {
            return CheckboxListTile(
              value: selected.contains(categories[index]),
              onChanged: (bool? selected) {
                callback(categories[index], selected!);
              },
              title: Text(categories[index]),
            );
          }),
    );
  }
}