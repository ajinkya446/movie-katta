import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ChatScreen extends StatefulWidget {
  final String userName;

  const ChatScreen({super.key, required this.userName});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  TextEditingController messageController = TextEditingController();
  double _textFieldHeight = 56.0;

  void _updateHeight(String text) {
    // Calculate the height based on the text length
    final lines = (text.length / 20).ceil(); // Assume ~40 characters per line
    setState(() {
      _textFieldHeight = (lines.clamp(1, 5) * 24.0 + 26.0); // Max 5 lines
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.userName,
            style: GoogleFonts.roboto(
              textStyle: const TextStyle(color: Color(0xffffffff), fontWeight: FontWeight.bold, fontSize: 15),
            )),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.videocam_outlined, size: 20, color: Colors.white)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.call_outlined, size: 20, color: Colors.white)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.search, size: 20, color: Colors.white)),
          SizedBox(
            width: 20,
            child: PopupMenuButton(
              position: PopupMenuPosition.under,
              itemBuilder: (context) => [
                PopupMenuItem(
                  value: 1,
                  child: Text("Contacts",
                      style: GoogleFonts.poppins(
                        textStyle: const TextStyle(color: Color(0xffffffff), fontWeight: FontWeight.w500, fontSize: 14),
                      )),
                ),
                PopupMenuItem(
                  value: 2,
                  child: Text("Archives",
                      style: GoogleFonts.poppins(
                        textStyle: const TextStyle(color: Color(0xffffffff), fontWeight: FontWeight.w500, fontSize: 14),
                      )),
                ),
                PopupMenuItem(
                  value: 3,
                  child: Text("Block Contacts",
                      style: GoogleFonts.poppins(
                        textStyle: const TextStyle(color: Color(0xffffffff), fontWeight: FontWeight.w500, fontSize: 14),
                      )),
                ),
                PopupMenuItem(
                  value: 4,
                  child: Text("Settings",
                      style: GoogleFonts.poppins(
                        textStyle: const TextStyle(color: Color(0xffffffff), fontWeight: FontWeight.w500, fontSize: 14),
                      )),
                ),
                PopupMenuItem(
                  value: 5,
                  child: Text("Help & Feedback",
                      style: GoogleFonts.poppins(
                        textStyle: const TextStyle(color: Color(0xffffffff), fontWeight: FontWeight.w500, fontSize: 14),
                      )),
                ),
              ],
              color: const Color(0xff595959),
              elevation: 1,
              // on selected we show the dialog box
              onSelected: (value) {},
            ),
          ),
          const SizedBox(width: 20)
        ],
      ),
      floatingActionButton: Container(
        height: _textFieldHeight,
        margin: const EdgeInsets.symmetric(horizontal: 16),
        alignment: Alignment.center,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), color: const Color(0xffDADADA).withOpacity(0.17)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.attach_file)),
            Expanded(
                child: TextField(
              controller: messageController,
              keyboardType: TextInputType.text,
              onChanged: _updateHeight,
              maxLines: 5,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "start typin here .........",
                  hintStyle: GoogleFonts.roboto(
                    textStyle: const TextStyle(color: Colors.white, fontStyle: FontStyle.italic, fontWeight: FontWeight.w300, fontSize: 12),
                  )),
            )),
            IconButton(
                onPressed: () {
                  messageController.clear();
                  _updateHeight("");
                },
                icon: const Icon(Icons.send_outlined)),
            IconButton(onPressed: () {}, icon: const Icon(Icons.mic_rounded)),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
