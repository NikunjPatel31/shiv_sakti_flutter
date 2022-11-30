import 'package:flutter/material.dart';
import 'package:shiv_sakti/Components/CircularButton.dart';
import 'package:shiv_sakti/Components/SearchTextField.dart';
import 'package:shiv_sakti/Model/Category.dart';
import 'package:shiv_sakti/Screens/AddCategory.dart';
import 'package:shiv_sakti/Screens/CompanyScreen.dart';

import '../Components/CategoryItemLayout.dart';
import '../Database Helper/DatabaseHelper.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with WidgetsBindingObserver {
  late List<Category> categories;
  final database = DatabaseHelper.instance;

  @override
  void initState() {
    super.initState();
    print("initState");
    categories = [];
    WidgetsBinding.instance.addObserver(this);
    refreshNotes();

    setState(() {
      print("object");
      refreshNotes();
    });
  }

  @override
  void didPopNext() {
    // TODO: query DB again
    print("didPopNext");
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    print("didChangeDependencies");
  }

  @override
  void didUpdateWidget(covariant HomeScreen oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    print("didUpdateWidget");
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // TODO: implement didChangeAppLifecycleState

    print("object: onResumed");
    if (state == AppLifecycleState.resumed) {
      print("onResumed");
      setState(() {
        refreshNotes();
      });
    }
  }

  Future refreshNotes() async {
    print("we are inside the refresh");
    this.categories = (await database.queryAllRows())!;
  }

  @override
  Widget build(BuildContext context) {
    // print(list);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Stack(
          alignment: Alignment.bottomRight,
          children: [
            Column(
              children: [
                Container(
                  height: 150,
                  margin:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
                                style: TextStyle(
                                    color: Colors.white, fontSize: 22),
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
                          Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: const Color(0xff37495C),
                            ),
                            child: const Icon(
                              Icons.logout,
                              color: Colors.white,
                            ),
                          ),
                        ],
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
                                  "Category",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 20),
                                ),
                              ),
                              Expanded(
                                child: ListView.builder(
                                  itemCount: categories.length,
                                  physics: const BouncingScrollPhysics(),
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return Material(
                                      color: Colors.transparent,
                                      child: InkWell(
                                        onTap: () {
                                          Navigator.of(context).push(
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      CompanyScreen()));
                                        },
                                        child: CategoryItemLayout(
                                          title: categories[index].name,
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
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
              child: InkWell(
                  onTap: () async {
                    var test = await Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => AddCategory()));

                    if (test != null) {
                      print("we are back");
                      setState(() {
                        categories.add(test);
                      });
                    }
                  },
                  child: const CircularButton(icons: Icons.add)),
            )
          ],
        ),
      ),
      backgroundColor: const Color(0xff1C2E46),
    );
  }
}
