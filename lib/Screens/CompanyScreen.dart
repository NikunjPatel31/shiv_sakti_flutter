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
      appBar: AppBar(
        toolbarHeight: 60,
        actions: [
          Padding(
            padding: const EdgeInsets.only(
              right: 20,
              top: 10,
            ),
            child: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color(0xff37495C),
              ),
              child: const Icon(
                Icons.edit,
                color: Colors.white,
              ),
            ),
          ),
        ],
        elevation: 0,
        title: Row(
          children: const [
            Text(
              "hchgc,",
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
      ),
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: ClipRect(
          child: Stack(
            alignment: Alignment.bottomRight,
            children: [
              Column(
                children: [
                  Container(
                    height: 100,
                    margin: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    color: Colors.transparent,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [],
                        ),
                        const SearchTextField(),
                      ],
                    ),
                  ),
                  Expanded(
                      flex: 4,
                      child: Container(
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(40),
                                topRight: Radius.circular(40))),
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
                                    "Company",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 20),
                                  ),
                                ),
                                Expanded(
                                  child: ListView.builder(
                                    itemCount: 2,
                                    physics: const BouncingScrollPhysics(),
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return Material(
                                        color: Colors.transparent,
                                        child: InkWell(
                                          onTap: () {
                                            print("object");
                                          },
                                          child: CategoryItemLayout(
                                            title: "",
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
                      ))
                ],
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
                child: InkWell(
                    onTap: () async {
                      var test = await Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) => AddCategory()));

                      // if (test != null) {
                      //   print("we are back");
                      //   setState(() {
                      //     categories.add(test);
                      //   });
                      // }
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
