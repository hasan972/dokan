import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:dokan/UI/login.dart';
import 'package:dokan/UI/product.dart';
import 'package:dokan/widget/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyProfile extends StatefulWidget {
  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  TextEditingController mail = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController street = TextEditingController();
  TextEditingController zip = TextEditingController();
  bool _isExpanded = false;
  SharedPreferences? prefs;
  String? token;
  String? user_email;
  String? user_nicename;
  String? user_display_name;

  @override
  void initState() {
    SharedPreferences.getInstance().then((prefs) {
      token = prefs.getString('token');
      user_email = prefs.getString('user_email');
      user_nicename = prefs.getString('user_nicename');
      user_display_name = prefs.getString('user_display_name');
      setState(() {});
    });

    super.initState();
  }

  void clearSharedPreferencesData() async {
    final preferences = await SharedPreferences.getInstance();
    preferences.clear(); // Clear all SharedPreferences data
  }

  int selectedIndex = 2;
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 239, 239, 241),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 239, 239, 241),
        automaticallyImplyLeading: false,
        title: const Text(
          'My Account',
          textAlign: TextAlign.center,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Color.fromRGBO(34, 36, 85, 1)),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20.0),
            const CircleAvatar(
              radius: 50.0,
              backgroundImage: AssetImage('assets/images/profile.png'),
            ),
            const SizedBox(height: 20.0),
            Text(
              '$user_display_name',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: MyColors().blackColor),
            ),
            const SizedBox(height: 2),
            Text(
              '$user_email',
              style: TextStyle(fontSize: 14.0, color: MyColors().font),
            ),
            const SizedBox(height: 20.0),
            Card(
              color: MyColors().white,
              margin: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: [
                  ExpansionTile(
                    leading: const Icon(Icons.person),
                    title: const Text('Account'),
                    trailing: _isExpanded
                        ? const Icon(Icons.keyboard_arrow_down)
                        : const Icon(Icons.keyboard_arrow_right),
                    onExpansionChanged: (bool expanded) {
                      setState(() {
                        _isExpanded = expanded;
                      });
                    },
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Email',
                              style: TextStyle(
                                color: Color.fromRGBO(38, 50, 56, 1),
                              ),
                            ),
                            const SizedBox(height: 5),
                            TextField(
                              controller: mail,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                labelText: '$user_email',
                                labelStyle: const TextStyle(
                                    color: Color.fromRGBO(38, 50, 56, 1),
                                    fontSize: 14),
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 12, horizontal: 10),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Nick Name',
                              style: TextStyle(
                                color: Color.fromRGBO(38, 50, 56, 1),
                              ),
                            ),
                            const SizedBox(height: 5),
                            TextField(
                              controller: name,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                labelText: '$user_nicename',
                                labelStyle: const TextStyle(
                                    color: Color.fromRGBO(38, 50, 56, 1),
                                    fontSize: 14),
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 12, horizontal: 10),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Street Address',
                              style: TextStyle(
                                color: Color.fromRGBO(38, 50, 56, 1),
                              ),
                            ),
                            const SizedBox(height: 5),
                            TextField(
                              controller: street,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                labelText: 'Mirpur,Dhaka',
                                labelStyle: const TextStyle(
                                    color: Color.fromRGBO(38, 50, 56, 1),
                                    fontSize: 14),
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 12, horizontal: 10),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Zip Code',
                              style: TextStyle(
                                color: Color.fromRGBO(38, 50, 56, 1),
                              ),
                            ),
                            const SizedBox(height: 5),
                            TextField(
                              controller: zip,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                labelText: '1212',
                                labelStyle: const TextStyle(
                                    color: Color.fromRGBO(38, 50, 56, 1),
                                    fontSize: 14),
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 12, horizontal: 10),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                                setState(() {
                                  _isExpanded = false;
                                });
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => MyProfile()));
                              },
                              style: ElevatedButton.styleFrom(
                                fixedSize: Size(140, 50),
                                padding: EdgeInsets.zero,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  side: const BorderSide(
                                    width: 0.69,
                                    color: Colors.black,
                                  ),
                                ),
                                elevation: 0,
                                primary: Colors.white,
                                onPrimary: Colors.transparent,
                              ),
                              child: Text(
                                'Cancel',
                                style: TextStyle(
                                    color: MyColors().font, fontSize: 17),
                              ),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            ElevatedButton(
                              onPressed: () {
                                user_display_name = name.text;
                                user_email = mail.text;
                                setState(() {});
                              },
                              style: ElevatedButton.styleFrom(
                                fixedSize: const Size(140, 50),
                                padding: EdgeInsets.zero,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  side: const BorderSide(
                                    width: 0.69,
                                    color: Colors.transparent,
                                  ),
                                ),
                                elevation: 0,
                                primary: MyColors().applyButton,
                                onPrimary: MyColors().white,
                              ),
                              child: const Text(
                                'Save',
                                style: TextStyle(fontSize: 17),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  ListTile(
                    leading: const Icon(Icons.lock_outline),
                    title: const Text('Passwords'),
                    trailing: const Icon(Icons.keyboard_arrow_right),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: const Icon(Icons.notifications_none),
                    title: const Text('Notification'),
                    trailing: Icon(Icons.keyboard_arrow_right),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: const Icon(Icons.favorite_border),
                    title: const Text('Wishlist (00)'),
                    trailing: const Icon(Icons.keyboard_arrow_right),
                    onTap: () {},
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      clearSharedPreferencesData();
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const LoginPage()));
                    },
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(80, 40),
                      padding: EdgeInsets.zero,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                        side: BorderSide(
                          width: 0.69,
                          color: MyColors().font,
                        ),
                      ),
                      elevation: 0,
                      primary: Colors.white,
                      onPrimary: Colors.transparent,
                    ),
                    child: Text(
                      'Logout',
                      style: TextStyle(color: MyColors().font, fontSize: 17),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.transparent,
        buttonBackgroundColor: MyColors().mainColor,
        color: MyColors().white,
        index: selectedIndex,
        height: 60,
        items: [
          CurvedNavigationBarItem(
            child: GestureDetector(
              onTap: () {
                if (selectedIndex == 0) {
                  setState(() {
                    selectedIndex = 0;
                  });
                } else {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ProductPage()),
                  );
                }
              },
              child: Icon(
                Icons.home_outlined,
                color: selectedIndex == 4
                    ? Colors.white
                    : Color.fromRGBO(110, 127, 170, 1),
              ),
            ),
          ),
          CurvedNavigationBarItem(
            child: Icon(
              Icons.border_all,
              color: selectedIndex == 1
                  ? Colors.white
                  : Color.fromRGBO(110, 127, 170, 1),
            ),
          ),
          CurvedNavigationBarItem(
            child: Icon(
              Icons.search,
              color: selectedIndex == 2
                  ? Colors.white
                  : Color.fromRGBO(110, 127, 170, 1),
            ),
          ),
          CurvedNavigationBarItem(
            child: Icon(
              Icons.shopping_cart,
              color: selectedIndex == 3
                  ? Colors.white
                  : Color.fromRGBO(110, 127, 170, 1),
            ),
          ),
          CurvedNavigationBarItem(
            child: Icon(Icons.person,
                color: selectedIndex == 4
                    ? MyColors().mainColor
                    : MyColors().mainColor),
          ),
        ],
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
      ),
    );
  }
}
