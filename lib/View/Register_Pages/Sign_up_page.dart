import 'dart:collection';
import 'dart:developer';
import 'package:safar/lib_orgnaizer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final UserService _userService = UserService();
  final _formKey = GlobalKey<FormState>();

  final GlobalKey<State> _keyLoader = GlobalKey<State>();

  var name = TextEditingController();
  var email = TextEditingController();
  var password = TextEditingController();

  bool colorManageName = false;
  bool colorManageEmail = false;
  bool colorManagePassword = false;
  bool pass = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
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
                    Align(
                      alignment: Alignment.topLeft,
                      child: Container(
                          margin: EdgeInsets.all(10),
                          height: 30,
                          child: IconButton(
                            onPressed: () {
                              Navigator.of(context).pushNamed(loginRoute);
                            },
                            icon: Icon(
                              Icons.arrow_back_ios,
                              size: 30,
                            ),
                            color: Colors.blue,
                          )),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: Text(
                          " Sign_up",
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
                        child: Image.asset('assets/images/logo.png'),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Card(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                            padding: EdgeInsets.only(top: 10),
                            child: TextFormField(
                              controller: name,
                              decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      borderSide:
                                      BorderSide(color: Colors.black)),
                                  suffixIcon: IconButton(
                                      icon: Icon(Icons.person),
                                      color: Colors.black,
                                      onPressed: () {}),
                                  border: InputBorder.none,
                                  labelText: 'Name',
                                  hintText: 'any thing',
                                  labelStyle: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                  hintStyle:
                                  TextStyle(fontWeight: FontWeight.bold)),
                              validator: (value) => value!.isEmpty
                                  ? 'Name can\'t be empty'
                                  : null,
                              keyboardType: TextInputType.emailAddress,
                              obscureText: false,
                            )),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                            padding: EdgeInsets.only(top: 10),
                            child: TextFormField(
                              controller: email,
                              decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      borderSide:
                                      BorderSide(color: Colors.black)),
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
                                  hintStyle:
                                  TextStyle(fontWeight: FontWeight.bold)),
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
                            padding: EdgeInsets.only(top: 10),
                            child: TextFormField(
                              controller: password,
                              obscureText: pass,
                              decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      borderSide:
                                      BorderSide(color: Colors.black)),
                                  suffixIcon: IconButton(
                                      icon: Icon(pass
                                          ? Icons.visibility
                                          : Icons.visibility_off),
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
                                  hintStyle:
                                  TextStyle(fontWeight: FontWeight.bold)),
                              validator: (value) => value!.isEmpty
                                  ? 'Password can\'t be empty'
                                  : null,
                              keyboardType: TextInputType.visiblePassword,
                            )),
                        const SizedBox(
                          height: 10,
                        ),

                        Padding(
                          padding: EdgeInsets.all(15.0),
                          child: ElevatedButton(
                              onPressed: () async {
                                validateAndSubmit(context);
                              },
                              child: Text('SIGN UP'),
                              style: ButtonStyle(
                                  padding: MaterialStateProperty.all(
                                      EdgeInsets.symmetric(
                                          vertical: 15, horizontal: 25)),
                                  backgroundColor:
                                  MaterialStateProperty.all(
                                      Colors.blue))),
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
                      ],
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
      ),
    );
  }

  bool validateEmail(value) {
    return RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(value);
  }

  void validateAndSubmit(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      if (await ConnectivityService.checkInternetConnectivity()) {
        //Loader.showLoadingScreen(context, _keyLoader);
        log('email : ${email.text.trim()} | password : ${password.text.trim()}');
        var userValues = HashMap();
        userValues['email'] = email.text.trim();
        userValues['name'] = name.text.trim();
        userValues['password'] = password.text.trim();
        var result = await _userService.signUp(userValues);
        // Navigator.of(_keyLoader.currentContext ?? context, rootNavigator: true)
        //     .pop();
        if (result == 'The password provided is too weak.') {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text('The password provided is too weak.'),
          ));
        } else if (result == 'The account already exists for that email.') {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text('The account already exists for that email.'),
          ));
        } else {
          log('uid2 : $result');
          Navigator.of(context)
              .popAndPushNamed(jordanRoute, arguments: result);
        }
      } else {
        internetConnectionDialog(context);
      }
    }
  }
}