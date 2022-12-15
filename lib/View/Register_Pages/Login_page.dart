import 'dart:developer';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:safar/lib_orgnaizer.dart';


class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final UserService _userService = UserService();
  var email = TextEditingController();
  var password = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey();
  final GlobalKey<State> _keyLoader = GlobalKey<State>();
  bool pass=true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Card(
                child: Form(
                  key: _formKey,
                  child: Padding(
                    padding: EdgeInsets.all(1),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Align(
                          alignment: Alignment.topCenter,
                          child: Container(
                            height: 230,
                            width: double.infinity,
                            child: Image.asset(
                              'assets/images/friendship.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),


                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Align(
                              alignment: Alignment.topLeft,
                              child: Padding(
                                padding: EdgeInsets.only( left: 20),
                                child: Text(
                                  "Log in",
                                  style: TextStyle(
                                      fontSize: 30,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: 50,
                                width: 70,
                                child: Image.asset(
                                    'assets/images/logo.png'
                                ),
                              ),
                            ),


                          ],
                        ),

                        Padding(
                            padding: EdgeInsets.only(top: 50,left: 15,right: 15),
                            child: TextFormField(
                              controller: email,
                              decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      borderSide: BorderSide(color: Colors.black)),
                                  suffixIcon: IconButton(
                                      icon: Icon(Icons.email_outlined),
                                      color: Colors.black,
                                      onPressed: () {}),
                                  border: InputBorder.none,
                                  labelText: 'Email',
                                  hintText: 'example@gmail.com',
                                  labelStyle: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                  hintStyle: TextStyle(fontWeight: FontWeight.bold)),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "* Required";
                                }
                                if (!validateEmail(value)) {
                                  return "* Not Valid Email";
                                }
                                return null;
                              },
                              keyboardType: TextInputType.emailAddress,
                              obscureText: false,
                            )),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                            padding: EdgeInsets.only(top: 20,left: 15,right: 15),
                            child: TextFormField(
                              controller: password,
                              obscureText: pass,
                              decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      borderSide: BorderSide(color: Colors.black)),
                                  suffixIcon: IconButton(
                                      icon: Icon(
                                          pass ? Icons.visibility : Icons.visibility_off),
                                      color: Colors.black,
                                      onPressed: () {
                                        setState(() {
                                          pass = !pass;
                                        });
                                      }),
                                  border: InputBorder.none,
                                  labelText: 'Password',
                                  hintText: '*********',
                                  labelStyle: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                  hintStyle: TextStyle(fontWeight: FontWeight.bold)),
                              validator: (value) =>
                              value!.isEmpty ? 'Password can\'t be empty' : null,
                              keyboardType: TextInputType.visiblePassword,
                            )),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextButton(
                                child: Text(
                                  'Sign Up',
                                  style: TextStyle(color: Colors.blue,fontSize: 25),
                                ),
                                onPressed: () {
                                  Navigator.of(context).pushNamed(signUpRoute);
                                },
                              ),
                            ),
                            RichText(
                              textAlign: TextAlign.end,
                              text: TextSpan(
                                  text: 'Forget Password?',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      //Navigator.of(context).pushNamed(forgetPasswordRoute);
                                    }),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Padding(
                          padding:  EdgeInsets.all(15.0),
                          child: ElevatedButton(
                              onPressed: () async {
                                validateAndSubmit(context);
                              },
                              child: Text('Log in'),
                              style: ButtonStyle(
                                  padding: MaterialStateProperty.all(
                                      EdgeInsets.symmetric(vertical: 15,horizontal: 25)),
                                  backgroundColor: MaterialStateProperty.all(
                                      Colors.blue))),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 50,
                width: MediaQuery.of(context).size.width,
                child: Center(
                  child: Text(
                    '- OR -',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Container(
                      width: 160,
                      child: SignInButton(
                        Buttons.FacebookNew,
                        text: "Sign in Facebook",
                        onPressed: () {},
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Container(
                      width: 150,
                      child: SignInButton(
                        Buttons.Google,
                        text: "Sign in Google",
                        onPressed: () {},
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
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
  void validateAndSubmit(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      if (await ConnectivityService.checkInternetConnectivity()) {
        Loader.showLoadingScreen(context, _keyLoader);
        var result =
        await _userService.signIn(email.text.trim(), password.text.trim());
        Navigator.of(_keyLoader.currentContext ?? context, rootNavigator: true)
            .pop();
        if (result == 'No user found for that email.') {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text('No user found for this email.'),
          ));
        } else if (result == 'Wrong password provided for that user.') {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text('Wrong password provided for this user.'),
          ));
        } else {
          Navigator.of(context).popAndPushNamed(jordanRoute);
        }
      } else {
        internetConnectionDialog(context);
      }
    }
  }
  bool validateEmail(value) {
    return RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(value);
  }

}