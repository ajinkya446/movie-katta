import 'package:eMeet/config/constants.dart';
import 'package:eMeet/data/models/trending_movies.dart';
import 'package:eMeet/data/models/upcoming_movies.dart';
import 'package:eMeet/services/api_service.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../data/models/top_rated_movies.dart';
import '../widgets/movies_slider.dart';
import '../widgets/trending_slider.dart';

// import 'chat_screen/chat_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isStatus = false;
  int selectedIndex = 0;

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

  Future<TrendingMovies> getTrendingMovie() async {
    final result = await APIService().getMethod(Constants.trendingMovies);
    TrendingMovies trendingMovies = TrendingMovies.fromJson(result ?? "");
    return trendingMovies;
  }

  Future<TopRatedMovies> getTopMovie() async {
    final result = await APIService().getMethod(Constants.topRatedMovies);
    TopRatedMovies topRatedMovies = TopRatedMovies.fromJson(result ?? "");
    return topRatedMovies;
  }

  Future<UpcomingMovies> getUpcomingMovie() async {
    final result = await APIService().getMethod(Constants.trendingMovies);
    UpcomingMovies upcomingMovies = UpcomingMovies.fromJson(result ?? "");
    return upcomingMovies;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.movie, color: Colors.yellow),
              const SizedBox(width: 10),
              Text("Filmora",
                  style: GoogleFonts.roboto(
                    textStyle: const TextStyle(color: Color(0xffffffff), fontWeight: FontWeight.bold, fontSize: 20),
                  )),
            ],
          ),

          centerTitle: true,
          // actions: [
          //   IconButton(onPressed: () {}, icon: const Icon(Icons.call_missed, color: Colors.white)),
          //   PopupMenuButton(
          //     position: PopupMenuPosition.under,
          //     itemBuilder: (context) => [
          //       PopupMenuItem(
          //         value: 1,
          //         child: Text("Contacts",
          //             style: GoogleFonts.poppins(
          //               textStyle: const TextStyle(color: Color(0xffffffff), fontWeight: FontWeight.w500, fontSize: 14),
          //             )),
          //       ),
          //       PopupMenuItem(
          //         value: 2,
          //         child: Text("Archives",
          //             style: GoogleFonts.poppins(
          //               textStyle: const TextStyle(color: Color(0xffffffff), fontWeight: FontWeight.w500, fontSize: 14),
          //             )),
          //       ),
          //       PopupMenuItem(
          //         value: 3,
          //         child: Text("Block Contacts",
          //             style: GoogleFonts.poppins(
          //               textStyle: const TextStyle(color: Color(0xffffffff), fontWeight: FontWeight.w500, fontSize: 14),
          //             )),
          //       ),
          //       PopupMenuItem(
          //         value: 4,
          //         child: Text("Settings",
          //             style: GoogleFonts.poppins(
          //               textStyle: const TextStyle(color: Color(0xffffffff), fontWeight: FontWeight.w500, fontSize: 14),
          //             )),
          //       ),
          //       PopupMenuItem(
          //         value: 5,
          //         child: Text("Help & Feedback",
          //             style: GoogleFonts.poppins(
          //               textStyle: const TextStyle(color: Color(0xffffffff), fontWeight: FontWeight.w500, fontSize: 14),
          //             )),
          //       ),
          //     ],
          //     color: const Color(0xff595959),
          //     elevation: 1,
          //     // on selected we show the dialog box
          //     onSelected: (value) {
          //       if (value == 1) {
          //       } else if (value == 2) {
          //       } else if (value == 3) {
          //       } else if (value == 4) {}
          //     },
          //   )
          //   // IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert, color: Colors.white)),
          // ],
        ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Trending Movies",
                    style: GoogleFonts.roboto(
                      textStyle: const TextStyle(color: Color(0xffffffff), fontWeight: FontWeight.bold, fontSize: 16),
                    )),
                const SizedBox(height: 12),
                FutureBuilder(
                    future: getTrendingMovie(),
                    builder: (ctx, snapshot) {
                      if (snapshot.hasData) {
                        TrendingMovies? trendingMovies = snapshot.data;
                        if ((trendingMovies?.results?.isNotEmpty ?? false) && trendingMovies != null) {
                          return TrendingSlider(trendingMovies: snapshot.data);
                        }
                      } else if (snapshot.hasError) {
                        return Center(child: Text(snapshot.error.toString()));
                      }
                      return Container();
                    }),
                const SizedBox(height: 32),
                Text("Top rated movies.",
                    style: GoogleFonts.roboto(
                      textStyle: const TextStyle(color: Color(0xffffffff), fontWeight: FontWeight.bold, fontSize: 16),
                    )),
                const SizedBox(height: 12),
                FutureBuilder(
                    future: getTopMovie(),
                    builder: (ctx, snapshot) {
                      if (snapshot.hasData) {
                        TopRatedMovies? topRatedMovies = snapshot.data;
                        if ((topRatedMovies?.results?.isNotEmpty ?? false) && topRatedMovies != null) {
                          return MoviesSlider(topRatedMovies: topRatedMovies);
                        }
                      } else if (snapshot.hasError) {
                        return Center(child: Text(snapshot.error.toString()));
                      }
                      return Container();
                    }),
                const SizedBox(height: 32),
                Text("Upcoming movies.",
                    style: GoogleFonts.roboto(
                      textStyle: const TextStyle(color: Color(0xffffffff), fontWeight: FontWeight.bold, fontSize: 16),
                    )),
                const SizedBox(height: 12),
                FutureBuilder(
                    future: getUpcomingMovie(),
                    builder: (ctx, snapshot) {
                      if (snapshot.hasData) {
                        UpcomingMovies? upcomingMovies = snapshot.data;
                        if ((upcomingMovies?.results?.isNotEmpty ?? false) && upcomingMovies != null) {
                          return MoviesSlider(upcomingMovies: upcomingMovies);
                        }
                      } else if (snapshot.hasError) {
                        return Center(child: Text(snapshot.error.toString()));
                      }
                      return Container();
                    }),
                // const MoviesSlider(),
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          onTap: (value) {
            setState(() {
              selectedIndex = value;
            });
          },
          currentIndex: selectedIndex,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: 'Home', activeIcon: Icon(Icons.home, color: Colors.white)),
            BottomNavigationBarItem(icon: Icon(Icons.tv), label: 'TV', activeIcon: Icon(Icons.tv_off, color: Colors.white)),
            BottomNavigationBarItem(icon: Icon(Icons.favorite_border), label: 'Favorite', activeIcon: Icon(Icons.favorite, color: Colors.white)),
          ],
        )

        /*isStatus
            ? listChatItems()
            : Center(
                child: Image.asset("assets/no_chats.png", width: 200, height: 158),
              )*/
        ,
        /*floatingActionButton: Container(
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
        ),*/
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
                // Navigator.push(context, MaterialPageRoute(builder: (ctxChat) => const ChatScreen(userName: "Alice Dayo")));
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