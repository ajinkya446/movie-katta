import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ArchiveScreen extends StatefulWidget {
  const ArchiveScreen({super.key});

  @override
  State<ArchiveScreen> createState() => _ArchiveScreenState();
}

class _ArchiveScreenState extends State<ArchiveScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text("Archive",
                style: GoogleFonts.roboto(
                  textStyle: const TextStyle(color: Color(0xffffffff), fontWeight: FontWeight.bold, fontSize: 15),
                ))));
  }
}
