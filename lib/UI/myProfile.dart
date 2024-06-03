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
    
    // TODO: implement initState
    SharedPreferences.getInstance().then((prefs) {
      token = prefs.getString('token');
      user_email = prefs.getString('user_email');
      user_nicename = prefs.getString('user_nicename');
      user_display_name = prefs.getString('user_display_name');
      
      //print(token);
      setState(() {});
    });

    super.initState();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(248, 248, 250, 1),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(248, 248, 250, 1),
        automaticallyImplyLeading: false,
        title: Text(
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
            SizedBox(height: 20.0),
            CircleAvatar(
              radius: 50.0,
              backgroundImage: AssetImage(
                  'assets/images/profile.png'), // Replace with your image
            ),
            SizedBox(height: 20.0),
            Text(
              '$user_display_name',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: MyColors().blackColor),
            ),
            SizedBox(height: 2),
            Text(
              '$user_email',
              style: TextStyle(fontSize: 14.0, color: MyColors().font),
            ),
            SizedBox(height: 20.0),
            Card(
              color: MyColors().white,
              margin: EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: [
                  ExpansionTile(
                    leading: Icon(Icons.person),
                    title: Text('Account'),
                    trailing: _isExpanded
                        ? Icon(Icons.keyboard_arrow_down)
                        : Icon(Icons.keyboard_arrow_right),
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
                            Text(
                              'Email',
                              style: TextStyle(
                                color: Color.fromRGBO(38, 50, 56, 1),
                              ),
                            ),
                            SizedBox(height: 5),
                            TextField(
                              controller: mail,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                labelText: '$user_email',
                                labelStyle: TextStyle(
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
                        padding: EdgeInsets.all(15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Nick Name',
                              style: TextStyle(
                                color: Color.fromRGBO(38, 50, 56, 1),
                              ),
                            ),
                            SizedBox(height: 5),
                            TextField(
                              controller: name,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                labelText: '$user_nicename',
                                labelStyle: TextStyle(
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
                        padding: EdgeInsets.all(15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Street Address',
                              style: TextStyle(
                                color: Color.fromRGBO(38, 50, 56, 1),
                              ),
                            ),
                            SizedBox(height: 5),
                            TextField(
                              controller: street,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                labelText: 'Mirpur,Dhaka',
                                labelStyle: TextStyle(
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
                        padding: EdgeInsets.all(15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Zip Code',
                              style: TextStyle(
                                color: Color.fromRGBO(38, 50, 56, 1),
                              ),
                            ),
                            SizedBox(height: 5),
                            TextField(
                              controller: zip,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                labelText: '1212',
                                labelStyle: TextStyle(
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
                            SizedBox(
                              width: 5,
                            ),
                            ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                fixedSize: Size(140, 50),
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
                              child: Text(
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
                    leading: Icon(Icons.lock_outline),
                    title: Text('Passwords'),
                    trailing: Icon(Icons.keyboard_arrow_right),
                    onTap: () {
                      // Add functionality to show phone information
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.notifications_none),
                    title: Text('Notification'),
                    trailing: Icon(Icons.keyboard_arrow_right),
                    onTap: () {
                      // Add functionality to show location information
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.favorite_border),
                    title: Text('Wishlist (00)'),
                    trailing: Icon(Icons.keyboard_arrow_right),
                    onTap: () {
                      // Add functionality to show security information
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
