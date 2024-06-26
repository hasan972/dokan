import 'package:dokan/UI/product.dart';
import 'package:dokan/UI/signUp.dart';
import 'package:dokan/services/all_service.dart';
import 'package:dokan/services/repositories/data_response.dart';
import 'package:dokan/widget/default_text_form_field.dart';
import 'package:dokan/widget/my_colors.dart';
import 'package:dokan/widget/socialIcon.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //==========Here is the textField=============//
  TextEditingController userName = TextEditingController();
  TextEditingController userPass = TextEditingController();
  SharedPreferences? prefs;
  String? token;
  String? user_email;
  String? user_nicename;
  String? user_display_name;
  bool obcure = true;
  // bool _isLoading = false;

  @override
  void initState() {
    // TODO: implement initState
    SharedPreferences.getInstance().then((prefs) {
      token = prefs.getString('token');
      user_display_name = prefs.getString('user_display_name');

      if (token != null) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductPage(),
          ),
        );
      }

      // print(token);
      setState(() {
       //clearData();
      });
    });

    super.initState();
  }

  clearData() {
    userName.clear();
    userPass.clear();
  }

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(248, 248, 248, 1),
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(5, 0, 5, 20),
        child: Column(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 3.8,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/dokan.PNG',
                    height: MediaQuery.of(context).size.height / 4,
                  ),
                ],
              ),
            ),
            const Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Sign In",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 30,
                      right: 30,
                      top: 15,
                    ),
                    child: Card(
                      color: MyColors().white,
                      child: DefaultTextFormField(
                        text: "Name",
                        imageUrl: 'assets/icons/user.svg',
                        isvisibleicon: false,
                        controller: userName,
                        inputType: TextInputType.emailAddress,
                        emptyMessage: 'Please enter your Email',
                        obscure: false,
                        obsState: () {},
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 30,
                      right: 30,
                      top: 15,
                    ),
                    child: Card(
                      color: MyColors().white,
                      child: DefaultTextFormField(
                        text: 'Password',
                        imageUrl: 'assets/icons/lock.svg',
                        isvisibleicon: true,
                        controller: userPass,
                        inputType: TextInputType.text,
                        emptyMessage: 'Please enter your password',
                        obscure: obcure,
                        obsState: () {
                          setState(() {
                            obcure = !obcure;
                          });
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Column(
              children: [
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    'Forgot Password?         ',
                    style: TextStyle(fontSize: 14, color: MyColors().font),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 60,
            ),
            InkWell(
              onTap: () async {
                if (userName.text.isEmpty || userPass.text.isEmpty) {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        iconColor: MyColors().mainColor,
                        title: const Text("Error"),
                        content: const Text(
                            "Please fill in both email and password fields !"),
                        actions: [
                          TextButton(
                            child: const Text("OK"),
                            onPressed: () {
                              Navigator.of(context).pop();
                              clearData();
                            },
                          ),
                        ],
                      );
                    },
                  );
                } else {
                  Map<String, dynamic>? returnDataa = await Repositoris()
                      .userLoginRP(context, userName.text, userPass.text);

                  prefs = await SharedPreferences.getInstance();

                  await prefs!.setString('token', returnDataa?['token']);
                  await prefs!
                      .setString('user_email', returnDataa?['user_email']);
                  await prefs!.setString(
                      'user_nicename', returnDataa?['user_nicename']);
                  await prefs!.setString(
                      'user_display_name', returnDataa?['user_display_name']);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProductPage(),
                    ),
                  );

                  AllService().toastMessage('Login Successfully', 14);
                }
              },
              child: Container(
                alignment: Alignment.center,
                height: MediaQuery.of(context).size.height / 12,
                width: MediaQuery.of(context).size.width / 1.2,
                decoration: BoxDecoration(
                  color: MyColors().mainColor,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Text(
                  'Login',
                  style: TextStyle(
                      color: MyColors().white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SocialIcon(
                  image: AssetImage('assets/images/facebook.png'),
                ),
                SocialIcon(
                  image: AssetImage('assets/images/search.png'),
                ),
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            Column(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SignUp(),
                      ),
                    );
                  },
                  child: const Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Create New Account',
                      style: TextStyle(
                        fontSize: 16,
                        color: Color.fromRGBO(56, 60, 64, 1),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
