import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:seclob/controllers/api_provider.dart';
import 'package:seclob/view/photos_screen.dart';
import 'package:seclob/view/video_screen.dart';
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

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: const Color.fromARGB(255, 219, 236, 237)),
                    child: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          FontAwesomeIcons.share,
                          color: Colors.black,
                        )),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: const Color.fromARGB(255, 219, 236, 237)),
                    child: IconButton(
                        onPressed: () {},
                        icon: const Icon(
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
                      print(
                          '${value.datas!.map((e) => e.profilePic).toList()}');
                      // final userData = value.datas![0];
                      final profile =
                          value.datas!.map((e) => e.profilePic).toList();
                      // print('${a[0]}');
                      return profile.length == 0
                          ? SizedBox(
                              height: 100,
                              width: 100,
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(50),
                                  child: Image.asset(
                                    'assets/images/blank-profile-picture-973460_1280.png',
                                    fit: BoxFit.cover,
                                  )

                                  //  const Text('')

                                  //
                                  ),
                            )
                          : SizedBox(
                              height: 100,
                              width: 100,
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(50),
                                  child: Image.network(
                                    '${profile[0]}',
                                    fit: BoxFit.cover,
                                  )

                                  //  const Text('')

                                  //
                                  ),
                            );

                      // return CircleAvatar(
                      //   backgroundImage: a.isNotEmpty
                      //       ? Image.network(
                      //           '${a[0]}',
                      //           fit: BoxFit.cover,
                      //         )
                      //       : null,
                      // );
                    }),
                    const Padding(
                      padding: EdgeInsets.only(left: 30, right: 10),
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
                    const Padding(
                      padding: EdgeInsets.only(left: 10, right: 10),
                      child: Column(
                        children: [
                          Text('564',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          Text('Followers')
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 10, right: 10),
                      child: Column(
                        children: [
                          Text('564',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          Text('Following')
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Consumer<ApiProvider>(builder: (context, value, child) {
                  final name = value.datas!.map((e) => e.firstName).toList();
                  return name.length == 0
                      ? Text('')
                      : Text(
                          '${name[0]}',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        );
                }),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 10),
                child: Text('Photographer'),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 10),
                child: Text('You are beautiful, and'),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 10),
                child: Text('Im here to capture it'),
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
                            color: const Color.fromARGB(255, 0, 72, 131),
                            borderRadius: BorderRadius.circular(20)),
                        child: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.call,
                            color: Colors.white,
                          ),
                        )),
                  )
                ],
              ),
              const TabBar(tabs: [
                Tab(
                  text: 'Photos',
                ),
                Tab(
                  text: 'Videos',
                )
              ]),
              const Expanded(
                  child: TabBarView(children: [PhotosScreen(), VideoScreen()]))
            ],
          ),
        ),
      ),
    );
  }
}
