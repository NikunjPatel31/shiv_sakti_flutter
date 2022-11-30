import 'package:flutter/material.dart';
import 'package:shiv_sakti/Screens/AddCategory.dart';

import '../Components/CategoryItemLayout.dart';
import '../Components/CircularButton.dart';
import '../Components/SearchTextField.dart';

class CompanyScreen extends StatefulWidget {
  const CompanyScreen({Key? key}) : super(key: key);

  @override
  State<CompanyScreen> createState() => _CompanyScreenState();
}

class _CompanyScreenState extends State<CompanyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: ClipRect(
          child: Stack(
            alignment: Alignment.bottomRight,
            children: [
              Column(
                children: [
                  Container(
                    height: 150,
                    margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    color: Colors.transparent,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: const [
                                Text(
                                  "Welcome,",
                                  style: TextStyle(color: Colors.white, fontSize: 22),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "Nikunj",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 22,
                                      fontWeight: FontWeight.w500),
                                )
                              ],
                            ),
                            CircularButton(icons: Icons.logout)
                          ],
                        ),
                        SearchTextField(),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(40), topRight: Radius.circular(40))),
                      child: SizedBox(
                        width: double.infinity,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Padding(
                                padding: EdgeInsets.symmetric(
                                  vertical: 28,
                                ),
                                child: Text(
                                  "Category",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 20),
                                ),
                              ),
                              Expanded(
                                child: ListView.builder(
                                  itemCount: 4,
                                  physics: const BouncingScrollPhysics(),
                                  itemBuilder: (BuildContext context, int index) {
                                    return Material(
                                      color: Colors.transparent,
                                      child: InkWell(
                                        onTap: () {
                                          print("object");
                                        },
                                        child: CategoryItemLayout(
                                          title: "categories[index].name",
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
                child: InkWell(
                    onTap: () async {
                      var test = await Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) => AddCategory()));

                      if (test != null) {
                        print("we are back");
                        setState(() {
                          // categories.add(test);
                        });
                      }
                    },
                    child: const CircularButton(icons: Icons.add)),
              )
            ],
          ),
        ),
      ),
      backgroundColor: const Color(0xff1C2E46),
    );
  }
}
