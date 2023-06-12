import 'package:chat_app/components/custom_textfiled.dart';
import 'package:chat_app/constants/constants.dart';
import 'package:chat_app/screens/register_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../components/custom_button.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);
  static String id = 'LoginScreen';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

String? email, password;
GlobalKey<FormState> formKey = GlobalKey();
bool isLoading = false;

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        backgroundColor: kPrimaryColor,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8),
          child: Form(
            key: formKey,
            child: ListView(
              children: [
                Column(
                  children: [
                    SizedBox(
                      height: 75,
                    ),
                    Image.asset(
                      "assets/images/scholar.png",
                      height: 100,
                    ),
                    Text(
                      "Scholar Chat",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 32,
                        fontFamily: "pacifico",
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Text(
                          "LOGIN",
                          style: TextStyle(fontSize: 24, color: Colors.grey),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    CustomTextFormFiled(
                      hintText: "Email",
                      change: (data) {
                        email = data;
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    CustomTextFormFiled(
                      hintText: "Password",
                      change: (data) {
                        password = data;
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    CustomButton(
                      text: "Register",
                      onTab: () async {
                        isLoading = true;
                        setState(() {});
                        await loginUser();
                        if (formKey.currentState!.validate()) {
                          try {} on FirebaseAuthException catch (e) {
                            if (e.code == 'weak-password') {
                              showSnackBar(context, "Weak Passwrod");
                            } else if (e.code == 'email-already-in-use') {
                              showSnackBar(context, "Email Already Existed");
                            }
                          } catch (e) {
                            print("error :$e");
                            showSnackBar(context, "Success");
                          }
                          isLoading = false;
                          setState(() {});
                        }
                      },
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "don't have an account ?",
                          style: TextStyle(color: Colors.grey),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, RegisterScreen.id);
                          },
                          child: Text(
                            "Register",
                            style: TextStyle(
                              color: Color(0xffC4E9E7),
                            ),
                          ),
                        )
                      ],
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

  void showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text("$message"),
    ));
  }

  Future<void> loginUser() async {
    UserCredential credential =
        await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email.toString().trim(),
      password: password.toString().trim()
    );
  }
}
