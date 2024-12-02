import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:toastification/toastification.dart';

import '../home_screen.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  TextEditingController nameController = TextEditingController(), userNameController = TextEditingController();

  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/eMeet.png", width: 60, height: 60),
            Text("eMeet",
                style: GoogleFonts.roboto(
                  textStyle: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 17),
                )),
          ],
        ),
      ),
      bottomNavigationBar: GestureDetector(
        onTap: () {
          if (nameController.text.isEmpty) {
            toastification.show(
              type: ToastificationType.error,
              style: ToastificationStyle.fillColored,
              context: context,
              title: const Text('Please enter valid display name'),
              autoCloseDuration: const Duration(seconds: 5),
            );
            setState(() {});
          } else if (userNameController.text.isEmpty) {
            toastification.show(
              type: ToastificationType.error,
              style: ToastificationStyle.fillColored,
              context: context,
              title: const Text('Please enter valid user name'),
              autoCloseDuration: const Duration(seconds: 5),
            );
            setState(() {});
          } else {
            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (ctx) => const HomeScreen()), (Route<dynamic> route) => false);
          }
        },
        child: Container(
          height: 55,
          alignment: Alignment.center,
          width: double.maxFinite,
          margin: const EdgeInsets.only(bottom: 16, left: 16, right: 16),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), color: const Color(0xffFCFCFC)),
          child: Text("Send login code",
              style: GoogleFonts.poppins(
                textStyle: const TextStyle(color: Colors.black, fontWeight: FontWeight.w500, fontSize: 13),
              )),
        ),
      ),
      body: SafeArea(
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Welcome to eMeet ! Now  Let’s\nyou set up real quick 🎊",
                style: GoogleFonts.roboto(
                  textStyle: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 27),
                )),
            const SizedBox(height: 30),
            Container(
                margin: const EdgeInsets.symmetric(horizontal: 16),
                child: TextField(
                  controller: nameController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      hintText: "Your display name (Greg Philip)",
                      hintStyle: GoogleFonts.roboto(
                        textStyle: const TextStyle(color: Colors.white, fontWeight: FontWeight.w300, fontSize: 12),
                      )),
                )),
            const SizedBox(height: 12),
            Container(
                margin: const EdgeInsets.symmetric(horizontal: 16),
                child: TextField(
                  controller: userNameController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      hintText: "User name (@gregphilip)",
                      hintStyle: GoogleFonts.roboto(
                        textStyle: const TextStyle(color: Colors.white, fontWeight: FontWeight.w300, fontSize: 12),
                      )),
                )),
            const SizedBox(height: 30),
            ListTile(
              title: Text("I have read all the Terms and conditions and i\nhere by agree to the T & Cs of eMeet Chat\napplication.",
                  style: GoogleFonts.roboto(
                    textStyle: const TextStyle(color: Color(0xffE5E5E5), fontWeight: FontWeight.w500, fontSize: 11),
                  )),
              leading: Radio(
                value: true,
                groupValue: isSelected,
                onChanged: (bool? value) {
                  setState(() {
                    isSelected = value!;
                  });
                },
              ),
            ),
          ],
        )),
      ),
    );
  }
}
