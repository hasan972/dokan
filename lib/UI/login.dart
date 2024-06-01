import 'package:dokan/widget/default_text_form_field.dart';
import 'package:dokan/widget/my_colors.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //==========Here is the textField=============//
  TextEditingController mail = TextEditingController();
  TextEditingController userPass = TextEditingController();
  bool obcure = true;

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromRGBO(248, 248, 248, 1),
        body: SingleChildScrollView(
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
              SizedBox(
                height: 50,
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
                        child: DefaultTextFormField(
                          text: "Email",
                          imageUrl: 'assets/icons/email-svgrepo-com.svg',
                          isvisibleicon: false,
                          controller: mail,
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
                height: 70,
              ),
              Container(
                alignment: Alignment.center,
                height: MediaQuery.of(context).size.height / 15,
                width: MediaQuery.of(context).size.width / 2,
                decoration: BoxDecoration(
                  color: MyColors().mainColor,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Text(
                  'Login',
                  style: TextStyle(color: MyColors().white, fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
