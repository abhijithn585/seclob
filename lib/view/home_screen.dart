import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:seclob/controllers/api_provider.dart';
import 'package:seclob/view/widget/custom_button_phone.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<ApiProvider>(context, listen: false).fetchData();
  }

  @override
  Widget build(BuildContext context) {
    final pro = Provider.of<ApiProvider>(context, listen: true);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
        child: FutureBuilder(
            future: pro.fetchData(),
            builder: (context, snapshot) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Color.fromARGB(255, 219, 236, 237)),
                        child: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              FontAwesomeIcons.share,
                              color: Colors.black,
                            )),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Color.fromARGB(255, 219, 236, 237)),
                        child: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.more_horiz_outlined,
                              color: Colors.black,
                            )),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Consumer<ApiProvider>(builder: (context, value, child) {
                          final userData = value.datas![1];
                          print('daaaata${value.datas!.length}');

                          return Container(
                            height: 100,
                            width: 100,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(50),
                              child: Image.asset(
                                '${userData.profilePic}',
                                fit: BoxFit.cover,
                              ),
                            ),
                          );
                        }),
                        Padding(
                          padding: const EdgeInsets.only(left: 30, right: 10),
                          child: Column(
                            children: [
                              Text(
                                '50',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text('post')
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          child: Column(
                            children: [
                              Text('564',
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                              Text('Followers')
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          child: Column(
                            children: [
                              Text('564',
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                              Text('Following')
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text('Rayan Moon'),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text('Photographer'),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text('You are beautiful, and'),
                  ),
                  Row(
                    children: [
                      CustomButtonPhone(
                        height: 55,
                        width: 130,
                        onPressed: () {},
                        buttonname: "Edit Profile",
                      ),
                      CustomButtonPhone(
                        height: 55,
                        width: 130,
                        onPressed: () {},
                        buttonname: "Wallet",
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10, left: 20),
                        child: Container(
                            decoration: BoxDecoration(
                                color: Color.fromARGB(255, 0, 72, 131),
                                borderRadius: BorderRadius.circular(20)),
                            child: IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.call,
                                color: Colors.white,
                              ),
                            )),
                      )
                    ],
                  ),
                  Expanded(child: Consumer<ApiProvider>(
                    builder: (context, value, child) {
                      return GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            crossAxisSpacing: 1,
                            mainAxisSpacing: 8),
                        itemCount: value.datas!.length,
                        itemBuilder: (context, index) {
                          final data = value.datas![index];
                          return Stack(
                            children: [
                              Container(
                                height: 300,
                                width: 300,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.network(
                                    '${data.profilePic}',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.favorite_border_sharp,
                                        color: Colors.white,
                                      ),
                                      Container(
                                        child: Text(
                                          '${data.likeCount}',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.mode_comment_outlined,
                                        color: Colors.white,
                                      ),
                                      Container(
                                        child: Text(
                                          '${data.commentCount}',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          );
                        },
                      );
                    },
                  ))
                ],
              );
            }),
      ),
    );
  }
}
