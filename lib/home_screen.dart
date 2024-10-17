import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:office_meet/chat_screen/chat_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isStatus = false;

  @override
  void initState() {
    // TODO: implement initState
    Future.delayed(const Duration(seconds: 3), () {
      setState(() {
        isStatus = true;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Messages",
            style: GoogleFonts.roboto(
              textStyle: const TextStyle(color: Color(0xffffffff), fontWeight: FontWeight.bold, fontSize: 15),
            )),
        centerTitle: true,
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.call_missed, color: Colors.white)),
          PopupMenuButton(
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
          )
          // IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert, color: Colors.white)),
        ],
      ),
      body: isStatus
          ? listChatItems()
          : Center(
              child: Image.asset("assets/no_chats.png", width: 200, height: 158),
            ),
      floatingActionButton: Container(
        width: 150,
        height: 55,
        alignment: Alignment.center,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(24), color: const Color(0xffFCFCFC)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.chat_outlined, color: Colors.black, size: 18),
            const SizedBox(width: 12),
            Text("Start Chat",
                style: GoogleFonts.poppins(
                  textStyle: const TextStyle(color: Color(0xff111111), fontWeight: FontWeight.w500, fontSize: 11),
                )),
          ],
        ),
      ),
    );
  }

  Widget listChatItems() {
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: ListView.builder(
          itemBuilder: (ctx, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (ctxChat) => ChatScreen(userName: "Alice Dayo")));
              },
              child: Container(
                margin: const EdgeInsets.only(bottom: 12),
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ClipOval(child: Image.network("https://www.gravatar.com/avatar/2c7d99fe281ecd3bcd65ab915bac6dd5?s=250", height: 45, width: 45)),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Alice Dayo",
                            style: GoogleFonts.roboto(
                              textStyle: const TextStyle(color: Color(0xffffffff), fontWeight: FontWeight.bold, fontSize: 15),
                            )),
                        const SizedBox(height: 12),
                        Text("Hey Greg, how are you doing? Long time!",
                            style: GoogleFonts.roboto(
                              textStyle: const TextStyle(color: Color(0xffE5E5E5), fontWeight: FontWeight.w400, fontSize: 11),
                            )),
                      ],
                    ),
                    const SizedBox(width: 20),
                    Column(
                      children: [
                        Text("23:22",
                            style: GoogleFonts.roboto(
                              textStyle: const TextStyle(color: Color(0xffE5E5E5), fontWeight: FontWeight.w400, fontSize: 11),
                            )),
                        const SizedBox(height: 12),
                        Container(
                          height: 17,
                          width: 17,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(color: const Color(0xffFCFCFC), borderRadius: BorderRadius.circular(100)),
                          child: Text("1",
                              style: GoogleFonts.roboto(
                                textStyle: const TextStyle(color: Color(0xff111111), fontWeight: FontWeight.w400, fontSize: 11),
                              )),
                        )
                      ],
                    )
                  ],
                ),
              ),
            );
          },
          itemCount: 20,
          shrinkWrap: true,
        ));
  }
}
