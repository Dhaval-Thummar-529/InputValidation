import 'dart:async';

import 'package:details_application/secondScreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const myApp());
}

class myApp extends StatelessWidget {
  const myApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Details Application",
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: const myHomePage(),
    );
  }
}

class myHomePage extends StatefulWidget {
  const myHomePage({super.key});

  @override
  _myHomePage createState() => _myHomePage();
}

class _myHomePage extends State<myHomePage> {
  var visible = false;
  bool isLoading = false;
  final _controller = TextEditingController();
  final _phone = TextEditingController();
  final _email = TextEditingController();

  FocusNode focusNode1 = FocusNode();
  FocusNode focusNode2 = FocusNode();
  FocusNode focusNode3 = FocusNode();

  @override
  void dispose() {
    _controller.dispose();
    _phone.dispose();
    _email.dispose();
    focusNode1.dispose();
    focusNode2.dispose();
    focusNode3.dispose();
    super.dispose();
  }

  loadProgress() {
    if (visible == true) {
      setState(() {
        visible = false;
      });
    } else {
      setState(() {
        visible = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Detailing Application",
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {},
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.all(12),
                    child: const Text("Please Fill Details"),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Column(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Name : ",
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              color: Colors.black),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        TextField(
                          controller: _controller,
                          enabled: isLoading ? false : true,
                          focusNode: focusNode1,
                          keyboardType: TextInputType.name,
                          textInputAction: TextInputAction.next,
                          decoration: const InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 0, horizontal: 10),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        )
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Email : ",
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              color: Colors.black),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        TextField(
                          controller: _email,
                          enabled: isLoading ? false : true,
                          focusNode: focusNode2,
                          keyboardType: TextInputType.emailAddress,
                          textInputAction: TextInputAction.next,
                          decoration: const InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 0, horizontal: 10),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        )
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Phone Number : ",
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              color: Colors.black),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        TextField(
                          controller: _phone,
                          enabled: isLoading ? false : true,
                          focusNode: focusNode3,
                          maxLength: 10,
                          keyboardType: TextInputType.phone,
                          textInputAction: TextInputAction.done,
                          decoration: const InputDecoration(
                            counterText: "",
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 0, horizontal: 10),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: isLoading
                    ? const CircularProgressIndicator(
                        color: Colors.redAccent,
                        strokeWidth: 5.0,
                      )
                    : Container(
                        padding: const EdgeInsets.only(top: 3, left: 3),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          border: const Border(
                            top: BorderSide(color: Colors.black),
                            bottom: BorderSide(color: Colors.black),
                            left: BorderSide(color: Colors.black),
                            right: BorderSide(color: Colors.black),
                          ),
                        ),
                        child: MaterialButton(
                          minWidth: double.infinity,
                          onPressed: () {
                            final text = _controller.value.text;
                            final phone = _phone.value.text;
                            final email = _email.value.text;
                            final nameRegExp = RegExp(r"^[a-zA-Z ]*$");
                            final phoneRegExp = RegExp(r"^\d{10}$");
                            final emailRegExp =
                                RegExp(r"^[a-zA-Z\d.]+@[a-zA-Z\d]+\.[a-zA-Z]+");
                            if (text.isEmpty) {
                              showSnackBar(
                                  label: "Please enter name!",
                                  context: context);
                              focusNode1.requestFocus();
                            } else if (!nameRegExp.hasMatch(text)) {
                              showSnackBar(
                                  label: "Please enter valid name!",
                                  context: context);
                              focusNode1.requestFocus();
                            } else if (email.isEmpty) {
                              showSnackBar(
                                  label: "Please enter email!",
                                  context: context);
                              focusNode2.requestFocus();
                            } else if (!emailRegExp.hasMatch(email)) {
                              showSnackBar(
                                  label: "Please enter valid email!",
                                  context: context);
                              focusNode2.requestFocus();
                            } else if (phone.isEmpty) {
                              showSnackBar(
                                  label: "Please enter phone number!",
                                  context: context);
                              focusNode3.requestFocus();
                            } else if (!phoneRegExp.hasMatch(phone)) {
                              showSnackBar(
                                  label: "Please enter valid phone number!",
                                  context: context);
                              focusNode3.requestFocus();
                            } else {
                              FocusManager.instance.primaryFocus!.unfocus();
                              if (isLoading) return;
                              setState(() {
                                isLoading = true;
                              });
                              Timer(
                                  const Duration(seconds: 3),
                                  () => {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    secondScreen(
                                                        name: text,
                                                        email: email,
                                                        phone: phone))),
                                        Timer(
                                            const Duration(seconds: 1),
                                            () => setState(() {
                                                  isLoading = false;
                                                }))
                                      });
                            }
                          },
                          height: 60,
                          color: Colors.redAccent,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40)),
                          child: const Text(
                            "Submit",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 16),
                          ),
                        ),
                      ),
              ),
              const SizedBox(
                height: 20,
              ),
              Visibility(
                  maintainSize: true,
                  maintainAnimation: true,
                  maintainState: true,
                  visible: visible,
                  child: Container(
                      margin: const EdgeInsets.only(top: 50, bottom: 30),
                      child: const CircularProgressIndicator())),
            ],
          ),
        ),
      ),
    );
  }
}

void showSnackBar({label, context}) {
  final snackBar = SnackBar(
    content: Text(label),
    duration: const Duration(seconds: 5),
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
