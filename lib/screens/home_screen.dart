
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_screen/screens/HomeScreenUSer.dart';
import 'package:login_screen/screens/login_screen/login_screen.dart';

class HomeUser extends StatefulWidget {
  final int selectedIndex;
  const HomeUser({Key? key, this.selectedIndex = 4}) : super(key: key);

  @override
  State<HomeUser> createState() => _HomeUserState();
}

class _HomeUserState extends State<HomeUser> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  late int _selectedIndex;
  DateTime? currentBackPressTime;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.selectedIndex;
  }

  void _onTappedItem(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
            icon: Icon(
              CupertinoIcons.text_aligncenter,
              color: Colors.black87,
              size: 30,
            ),
            splashRadius: 24,
            onPressed: () {
              _scaffoldKey.currentState!.openDrawer();
            }),
        actions: [

          IconButton(
              icon: Icon(
                Icons.notifications_none_rounded,
                color: Colors.black87,
                size: 26,
              ),
              onPressed: () {
                Get.to(() => LoginScreen());
              }),
        ],
      ),
      drawer: _drawer(),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.grey[50],
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.green[900],
        onTap: _onTappedItem,
        currentIndex: _selectedIndex,
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.w500),
        unselectedLabelStyle: TextStyle(fontWeight: FontWeight.w500),
        items: [
          BottomNavigationBarItem(
              label: "HOME",
              icon: Icon(Icons.home)
          ),
          BottomNavigationBarItem(
            label: "ATTENDENCE",
            icon: Icon(Icons.note_alt_outlined)
          ),
          BottomNavigationBarItem(
            label: "ACADEMY",
            icon:  Icon(Icons.home_filled)
          ),

          BottomNavigationBarItem(
            label: "ALERTS",
            icon:  Icon(Icons.interpreter_mode_rounded)
          ),
          BottomNavigationBarItem(
              label: "Profile",
              icon: Icon(Icons.account_circle_sharp)
          ),
        ],
      ),
      floatingActionButton: new FloatingActionButton(
          elevation: 0.0,
          child: Icon(Icons.message),
          backgroundColor: Colors.green[900],
          onPressed: () {
            _showModalSheet();
          }),
      body: WillPopScope(
        onWillPop: ()
        {

          DateTime now = DateTime.now();
          if (currentBackPressTime == null ||
              now.difference(currentBackPressTime!) > Duration(seconds: 2)) {
            currentBackPressTime = now;
          //  Fluttertoast.showToast(msg:"Double press back to exit");
            return Future.value(false);
          }
          return Future.value(true);
        },

        child: _selectedIndex == 4
            ? LoginScreen()
            : _selectedIndex == 3
            ? LoginScreen()
            : _selectedIndex == 2
            ? LoginScreen()
            : _selectedIndex == 1
            ? LoginScreen()
            : _selectedIndex == 0
            ? HomeScreenUser()
            : Center(child: Text("hai")),
      ),
    );
  }

  Widget _drawer() {
    return Drawer(
      elevation: 0,
      shape: RoundedRectangleBorder(),
      backgroundColor: Colors.blue,
      width: 300,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Material(
            color:  Colors.blue,
            child: SafeArea(
              child: InkWell(
                onTap: () {
                  _scaffoldKey.currentState!.openEndDrawer();
                  setState(() {
                    //  _selectedIndex = 3;
                  });
                },
                child: Container(
                    padding: EdgeInsets.fromLTRB(26, 26, 26, 26),
                    child: Row(mainAxisSize: MainAxisSize.max, children: [
                      InkWell(
                        onTap: () {
                          _scaffoldKey.currentState!.openEndDrawer();
                          setState(() {
                            _selectedIndex = 3;
                          });
                        },
                        child: Container(
                            width: MediaQuery.of(context).size.width * .09,
                            height: MediaQuery.of(context).size.height * .08,
                            padding: EdgeInsets.all(1),
                            decoration: BoxDecoration(
                              color: Colors.black87,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child:Image(
                                    fit: BoxFit.fill,
                                    image: AssetImage('assets/images/dp.png'),
                                    height: double.infinity,
                                    width: double.infinity,
                                  ),
                                ),

                            )),

                      SizedBox(width: 12),
                      Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Text(
                                'Anjana',
                                style: TextStyle(
                                    color: Colors.black87,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500),
                              ),
                              SizedBox(height: 4),
                              Text(
                                'anajn@gmail.com',
                                style: TextStyle(
                                    color: Colors.black87,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          )),
                      // Spacer(),
                      Icon(Icons.close_outlined)
                    ])),
              ),
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.blue,

              child: ListView(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                children: [
                  _drawerMenuItem(
                      Image.asset('assets/icons/package.png'), 'Academy', () {
                    Get.to(() => LoginScreen());
                  }),
                  _drawerMenuItem(Image.asset('assets/icons/history.png'),
                      'CLASS', () async {
                        Get.to(() => LoginScreen());
                      }),
                  _drawerMenuItem(
                      Image.asset('assets/icons/order.png'), 'TEACHERS LIST',
                          () async {
                        Get.to(() => LoginScreen());
                      }),
                  _drawerMenuItem(
                      Image.asset('assets/icons/my_booking.png'), 'TIME TABLE',
                          () {
                        Get.to(() => LoginScreen());
                      }),
                  _drawerMenuItem(Image.asset('assets/icons/privacy.png'),
                      'Privacy Policy', () {}),
                  _drawerMenuItem(Image.asset('assets/icons/terms.png'),
                      'Terms and Conditions', () {}),
                ],
              ),
            ),
          ),
          InkWell(
              child: Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.all(6),
                  child: Center(
                    child: Container(
                      width: 120,
                      decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(10)),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                  height: 32,
                                  decoration: BoxDecoration(
                                      color:  Colors.green[900],
                                      shape: BoxShape.circle),
                                  child: Image.asset(
                                    'assets/icons/logout.png',
                                    color: Colors.green[900],
                                  )),
                              SizedBox(width: 12),
                              Expanded(
                                  child: Text(
                                    'Logout',
                                    style: TextStyle(
                                        color: Colors.black87,
                                        fontSize: 17,
                                        fontWeight: FontWeight.w500),
                                  ))
                            ]),
                      ),
                    ),
                  )),
              onTap: () {
                _scaffoldKey.currentState!.openEndDrawer();
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      content: Text(
                        'Are you sure want to log out?',
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                      actions: [
                        OutlinedButton(
                          child: Text('No'),
                          onPressed: () {
                            Get.back();
                          },
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        ElevatedButton(
                          child: Text('Yes'),
                          onPressed: () {
                            Get.back();
                           // SharedPrefs.logOut();
                          },
                        ),
                      ],
                    );
                  },
                );
              }),
        ],
      ),
    );
  }

  Widget _drawerMenuItem(Widget widget, String title, Function onTap) {
    return Material(
      color: Colors.white,
      child: InkWell(
          child: Container(
              color: Colors.white10,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(children: [
                    Container(
                      height: 30.0,
                      width: 30.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: widget,
                    ),
                    SizedBox(width: 14),
                    Expanded(
                        child: Text(
                          title,
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.black87,
                            fontSize: 18,
                          ),
                        ))
                  ]),
                ),
              )),
          onTap: () {
            _scaffoldKey.currentState!.openEndDrawer();
            onTap();
          }),
    );
  }

  void _showModalSheet() {
    showModalBottomSheet(
        context: context,
        builder: (builder) {
          return new Container(
            height: MediaQuery.of(context).size.height * 0.37,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Help",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500),
                      ),
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          CupertinoIcons.clear_thick_circled,
                          color: Colors.green,
                          size: 30,
                        ),
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: Center(
                      child: Text(
                        "Hi,how i can help you..",
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.grey,
                            fontWeight: FontWeight.w500),
                      )),
                ),
                Container(
                  height: 50,
                  decoration: BoxDecoration(
                    color:  Colors.green,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextField(
                            decoration: InputDecoration(
                              filled: true,
                              contentPadding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                                borderSide: BorderSide(color:  Colors.green),
                                borderRadius:
                                BorderRadius.all(Radius.circular(20)),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color:  Colors.green),
                                borderRadius:
                                BorderRadius.all(Radius.circular(20)),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color:  Colors.green),
                                borderRadius:
                                BorderRadius.all(Radius.circular(20)),
                              ),
                              hintText: 'Write a reply',
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CircleAvatar(
                          backgroundColor:  Colors.green,
                          child: Center(
                            child: Icon(
                              Icons.send_outlined,
                              color:  Colors.green,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          );
        });
  }
}
