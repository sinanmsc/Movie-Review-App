import 'package:flutter/material.dart';
import 'package:movieapp/Responsive/responsive.dart';
import 'package:movieapp/component/sign_button.dart';
import 'package:movieapp/component/text_field.dart';
import 'package:movieapp/view/home_page.dart';

class Signup extends StatelessWidget {
  const Signup({super.key});

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
                SizedBox(height: Responsive.height(20, context)),
                Text(
                  'Sign up',
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: Responsive.width(35, context)),
                ),
                SizedBox(height: Responsive.height(45, context)),
                const Text(
                  'Sign up with :',
                  style: TextStyle(),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.all(Responsive.width(15, context)),
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
                      child: Image.asset(
                        'assets/google-removebg-preview.png',
                        color: Colors.white,
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
                      ),
                    ),
                  ],
                ),
                SizedBox(height: Responsive.height(30, context)),
                Text(
                  'Name',
                  style: TextStyle(fontSize: Responsive.width(20, context)),
                ),
                SizedBox(height: Responsive.height(10, context)),
                CustomeTextfield(label: 'Enter Your Name'),
                SizedBox(height: Responsive.height(20, context)),
                Text(
                  'Email',
                  style: TextStyle(fontSize: Responsive.width(20, context)),
                ),
                SizedBox(height: Responsive.height(10, context)),
                CustomeTextfield(label: 'Enter Your Email'),
                SizedBox(height: Responsive.height(20, context)),
                Text(
                  'Password',
                  style: TextStyle(fontSize: Responsive.width(20, context)),
                ),
                SizedBox(height: Responsive.height(10, context)),
                CustomeTextfield(label: 'Pick a strong password'),
                SizedBox(height: Responsive.height(55, context)),
                InkWell(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HomePage(),
                        )),
                    child: Signbutton(label: 'Sign up')),
                SizedBox(height: Responsive.height(18, context)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already have an account?\t\t',
                      style: TextStyle(
                          color: Colors.white.withOpacity(0.8), fontSize: 17),
                    ),
                    InkWell(
                      onTap: () => Navigator.pop(context),
                      child: Text(
                        'Log in',
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