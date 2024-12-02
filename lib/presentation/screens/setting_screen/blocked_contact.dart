import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BlockedContact extends StatefulWidget {
  const BlockedContact({super.key});

  @override
  State<BlockedContact> createState() => _BlockedContactState();
}

class _BlockedContactState extends State<BlockedContact> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text("Blocked Contact",
                style: GoogleFonts.roboto(
                  textStyle: const TextStyle(color: Color(0xffffffff), fontWeight: FontWeight.bold, fontSize: 15),
                ))));
  }
}
