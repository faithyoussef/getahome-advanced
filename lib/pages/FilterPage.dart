

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:untitled1/pages/extension.dart';

import '../themes/apptheme.dart';
import '../utils/property.dart';
import '../widgets/buttons.dart';
import '../widgets/custom_selection_fields.dart';
import '../widgets/gap.dart';
import '../widgets/propertyfilter.dart';
import 'BookReport.dart';

class FilterPage extends StatefulWidget {
  const FilterPage({Key? key}) : super(key: key);

  @override
  State<FilterPage> createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  //late PropertyFilter _propertyFilter;
  final _keyForm = GlobalKey<FormState>();
  final _name = TextEditingController();
  final _time = TextEditingController();
  final _email = TextEditingController();
  final _description = TextEditingController();

  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
  //final Provider = context.watch<Property>();

    return Provider<FilterPage>(
        create:(_)=>FilterPage(),
    builder: (context, child) {
      return
     Scaffold(
      appBar: AppBar(
        title: Text(
          'book ',
        ),
        leading: Padding(
          padding: EdgeInsets.fromLTRB( Insets.md, 10, 2, 10),
          child: IconButton(
               icon:  Icon(Icons.arrow_back_rounded),
                  onPressed: (){
                 context.pop();
    // Do something
                },
            ),
         ),
      ),
      body: Form(
    key: _keyForm,
          child: Padding(
           padding: const EdgeInsets.all(20),
            child: ListView(
          children: [
             Container(
             padding: const EdgeInsets.symmetric(vertical: 20),
              child: Text('Book Now', style:Theme.of(context).textTheme.headline2),
    ),
               TextFormField(
             controller: _name,
            decoration: InputDecoration(hintText: 'Insert your name to book now'),
    ),
            TextFormField(
            controller: _time,
             //obscureText: true,
             decoration: InputDecoration(hintText: 'The time to book'),
    ),
                 TextFormField(
            controller: _email,
            decoration: InputDecoration(hintText: 'E-mail for later contact'),
            ),
            TextFormField(
              controller: _description,
              maxLength: 10,
              maxLines: 9,
              decoration: InputDecoration(hintText: 'description of required property'),
            ),
            Scrollbar(child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children:[
               /**   InputSelectionItem(
                    value: 'Type',
                    groupValue:['Smart House', 'villa', 'apartment',
                    'building', 'warehouse','flat', 'other'],
                 )**/

                ]
              )
            )),
            SizedBox(height:20),
            Center(
              child: ElevatedButton(
              onPressed:(){
    //     if(_keyForm.currentState!.validate()){print('valid');}
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return BookReport();
                   },
                 ),
                );
              }, child: Text('submit'),
              ),
            ), ],
        ),
      )
     ),
    );
  });
  }
}

