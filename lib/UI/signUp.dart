import 'package:dokan/UI/login.dart';
import 'package:dokan/services/all_service.dart';
import 'package:dokan/services/repositories/data_response.dart';
import 'package:dokan/widget/default_text_form_field.dart';
import 'package:dokan/widget/socialIcon.dart';
import 'package:flutter/material.dart';

import '../widget/my_colors.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  //==========Here is the textField=============//
  TextEditingController userName = TextEditingController();
  TextEditingController userMail = TextEditingController();
  TextEditingController userPass = TextEditingController();
  TextEditingController confirmPass = TextEditingController();
  bool obcure = true;
  clearData() {
    userName.clear();
    userMail.clear();
    userPass.clear();
  }

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(248, 248, 248, 1),
      body: SingleChildScrollView(
        // padding: EdgeInsets.fromLTRB(10, 0, 5, 20),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10,30,10,0),
          child: Column(
            children: [
              Container(
                width: 130,
                height: 130,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(width: 5, color: Colors.white),
                  // boxShadow: [
                  //   BoxShadow(
                  //     color: Colors.white.withOpacity(0.2),
                  //   )
                  // ],
                  shape: BoxShape.circle,
                ),
                //
                child: Stack(
                  children: [
                    Positioned(
                      top: 25,
                      right: 25,
                      child: Icon(
                        Icons.person,
                        size: 60,
                        color: MyColors().font,
                      ),
                    ),
                    Positioned(
                      top: 80,
                      right: 0,
                      child: Container(
                        width: 35,
                        height: 35,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: MyColors().mainColor.withOpacity(
                              0.7), // Adjust the color and opacity of the circle
                        ),
                        child: Icon(
                          Icons.camera_alt,
                          size: 16,
                          color: MyColors().white,
                        ),
                      ),
                    ),
                  ],
                ),
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
                          emptyMessage: 'Please enter your Name',
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
                          text: "Email",
                          imageUrl: 'assets/icons/email-svgrepo-com.svg',
                          isvisibleicon: false,
                          controller: userMail,
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
                          isvisibleicon: false,
                          controller: userPass,
                          inputType: TextInputType.text,
                          emptyMessage: 'Please enter your password',
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
                          text: 'Confirm Password',
                          imageUrl: 'assets/icons/lock.svg',
                          isvisibleicon: false,
                          controller: confirmPass,
                          inputType: TextInputType.text,
                          emptyMessage: 'Please enter your Confirm password',
                          obscure: false,
                          obsState: () {},
                        ),
                      ),
                    ),
                  ],
                ),
              ),
             
              const SizedBox(
                height: 60,
              ),
              InkWell(
                onTap: () async {
                  if (userName.text.isEmpty || userMail.text.isEmpty || userPass.text.isEmpty || confirmPass.text.isEmpty) {
                    // Add your validation message here
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          iconColor: MyColors().mainColor,
                          content: const Text(
                              "Please fill in both username,email and password fields !"),
                          actions: [
                            TextButton(
                              child: const Text("OK"),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        );
                      },
                    );
                  } else if (userPass.text != confirmPass.text) {
                     showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          iconColor: MyColors().mainColor,
                          title: Text("Error"),
                          content: const Text(
                              "The passwords provided do not match. Please make sure they are the same."),
                          actions: [
                            TextButton(
                              child: const Text("OK"),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        );
                      },
                    );
                  } else {
                    Repositoris().userRegisterRP(
                        userName.text, userMail.text, userPass.text);
                    Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginPage()),
                              );
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: const Text(
                          'User Registration Successful, Now Log In.',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white),
                        ),
                        backgroundColor: MyColors().mainColor,
                        duration: const Duration(seconds: 5),
                      ),
                    );
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
                    'Sign Up',
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
                        MaterialPageRoute(builder: (context) => SignUp()),
                      );
                    },
                    child: Align(
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Already have an account?',
                            style: TextStyle(
                              fontSize: 16,
                              color: Color.fromRGBO(56, 60, 64, 1),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              // Navigate to the login page here
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginPage()),
                              );
                            },
                            child: const Text(
                              ' Login',
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.blueAccent,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
