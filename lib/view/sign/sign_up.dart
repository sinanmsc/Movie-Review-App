import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movieapp/Responsive/responsive.dart';
import 'package:movieapp/component/sign_button.dart';
import 'package:movieapp/component/text_field.dart';
import 'package:movieapp/providers/auth_provider.dart';
import 'package:movieapp/services/firestore_services.dart';

class Signup extends ConsumerWidget {
  Signup({super.key});
  final nameText = TextEditingController();
  final emailText = TextEditingController();

  final passewordText = TextEditingController();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
                CustomeTextfield(
                  label: 'Enter Your Name',
                  controller: nameText,
                ),
                SizedBox(height: Responsive.height(20, context)),
                Text(
                  'Email',
                  style: TextStyle(fontSize: Responsive.width(20, context)),
                ),
                SizedBox(height: Responsive.height(10, context)),
                CustomeTextfield(
                  label: 'Enter Your Email',
                  controller: emailText,
                ),
                SizedBox(height: Responsive.height(20, context)),
                Text(
                  'Password',
                  style: TextStyle(fontSize: Responsive.width(20, context)),
                ),
                SizedBox(height: Responsive.height(10, context)),
                CustomeTextfield(
                  label: 'Pick a strong password',
                  controller: passewordText,
                ),
                SizedBox(height: Responsive.height(55, context)),
                InkWell(
                    onTap: () async {
                      try {
                        final UserCredential userCredential = await ref
                            .read(authServicesProvider)
                            .signup(emailText.text, passewordText.text);
                        if (userCredential.user != null) {
                          await FirestoreServices.addUserData(
                            userCredential.user!.uid,
                            userCredential.user!.displayName ?? nameText.text,
                            userCredential.user!.email!,
                            userCredential.user?.photoURL,
                          );
                          if (context.mounted) {
                            Navigator.pop(context);
                          }
                        }
                      } on FirebaseAuthException catch (e) {
                        if (context.mounted) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('${e.message}')));
                        }
                      } on FirebaseException catch (e) {
                        if (context.mounted) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('${e.message}')));
                        }
                      }
                    },
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
