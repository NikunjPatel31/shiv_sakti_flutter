import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shiv_sakti/Components/InputTextField.dart';
import 'package:shiv_sakti/Components/PrimaryButton.dart';
import 'package:shiv_sakti/Model/Category.dart';

import '../Database Helper/DatabaseHelper.dart';

class AddCategory extends StatelessWidget {
  final dbHelper = DatabaseHelper.instance;
  AddCategory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController categoryNameController = TextEditingController();
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              title: Text("Add Category"),
            ),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  InputTextField(hintText: "Name", controller: categoryNameController),
                  const SizedBox(height: 30),
                  PrimaryButton(
                    title: "ADD",
                    onTap: () async {
                      if (categoryNameController.text.length > 0) {
                        Map<String, dynamic> row = {
                          DatabaseHelper.CATEGORY_NAME: categoryNameController.text,
                        };
                        Category category = new Category();
                        category.name = categoryNameController.text;
                        final id = await dbHelper.insert(category);
                        Fluttertoast.showToast(
                            msg: "inserted row: $id",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.SNACKBAR,
                            timeInSecForIosWeb: 1,
                            textColor: Colors.black,
                            backgroundColor: Color(0xffECECEC),
                            fontSize: 16.0);

                        if (Navigator.canPop(context)) {
                          Navigator.pop(context, category);
                        } else {
                          SystemNavigator.pop();
                        }
                      } else {
                        Fluttertoast.showToast(
                            msg: "Fill required fields",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.SNACKBAR,
                            timeInSecForIosWeb: 1,
                            textColor: Colors.black,
                            backgroundColor: Color(0xffECECEC),
                            fontSize: 16.0);
                      }
                    },
                  )
                ],
              ),
            )));
  }
}
