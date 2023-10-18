import 'package:flutter/material.dart';
import 'package:movieapp/Responsive/responsive.dart';
import 'package:movieapp/component/sign_button.dart';
import 'package:movieapp/component/text_field.dart';
import 'package:movieapp/view/home_page.dart';
import 'package:movieapp/view/sign/sign_up.dart';

class Login extends StatelessWidget {
  Login({super.key});

  final emailText = TextEditingController();
  final passwordText = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(Responsive.width(20, context)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: Responsive.height(30, context)),
                Text(
                  'Log in',
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: Responsive.width(35, context)),
                ),
                SizedBox(height: Responsive.height(75, context)),
                const Text(
                  'Log in with :',
                  style: TextStyle(),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.all(Responsive.width(5, context)),
                      margin:
                          EdgeInsets.only(top: Responsive.height(10, context)),
                      height: Responsive.height(70, context),
                      width: MediaQuery.of(context).size.width / 2.35,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 31, 31, 31),
                        borderRadius: BorderRadius.circular(
                            Responsive.width(20, context)),
                        border: Border.all(
                          width: 1,
                          color: const Color(0x28FFFFFF),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/google-removebg-preview.png',
                            color: Colors.white,
                            width: Responsive.width(30, context),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(Responsive.width(15, context)),
                      margin:
                          EdgeInsets.only(top: Responsive.height(15, context)),
                      height: Responsive.height(70, context),
                      width: MediaQuery.of(context).size.width / 2.35,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 31, 31, 31),
                        borderRadius: BorderRadius.circular(
                            Responsive.width(20, context)),
                        border: Border.all(
                          width: 1,
                          color: const Color(0x28FFFFFF),
                        ),
                      ),
                      child: Image.asset(
                        'assets/apple-removebg-preview.png',
                        color: Colors.white,
                        width: Responsive.width(30, context),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: Responsive.height(45, context)),
                Text(
                  'Email',
                  style: TextStyle(fontSize: Responsive.width(20, context)),
                ),
                SizedBox(height: Responsive.height(10, context)),
                CustomeTextfield(
                  label: 'Enter Your Email',
                  controller: emailText,
                ),
                SizedBox(height: Responsive.height(25, context)),
                Text('Password',
                    style: TextStyle(fontSize: Responsive.width(20, context))),
                SizedBox(height: Responsive.height(10, context)),
                CustomeTextfield(
                  label: 'Enter Your Password',
                  controller: passwordText,
                ),
                SizedBox(height: Responsive.height(55, context)),
                InkWell(
                    onTap: () => Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HomePage())),
                    child: Signbutton(label: 'Log in')),
                SizedBox(height: Responsive.height(18, context)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Dont have a account?\t\t',
                      style: TextStyle(
                          color: Colors.white.withOpacity(0.8), fontSize: 17),
                    ),
                    InkWell(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Signup(),
                          )),
                      child: Text(
                        'Sign up',
                        style: TextStyle(
                            color: Colors.white.withOpacity(0.8),
                            fontSize: 17,
                            fontWeight: FontWeight.w900),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
