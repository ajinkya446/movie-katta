import 'package:eMeet/business_logic/blocs/home_bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

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

  //
  @override
  void initState() {
    BlocProvider.of<HomeBloc>(context).onLoadTrendingMovies();
    BlocProvider.of<HomeBloc>(context).onLoadTopMovies();
    BlocProvider.of<HomeBloc>(context).onLoadUpComingMovies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocConsumer<HomeBloc, HomeState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return state is HomeLoading
              ? const Center(child: SizedBox(height: 50, width: 50, child: CircularProgressIndicator()))
              : Scaffold(
                  appBar: AppBar(
                    backgroundColor: Colors.transparent,
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.movie, color: Colors.yellow),
                        const SizedBox(width: 10),
                        Text("फिल्मी कट्टा",
                            style: GoogleFonts.roboto(
                              textStyle: const TextStyle(color: Color(0xffffffff), fontWeight: FontWeight.bold, fontSize: 20),
                            )),
                      ],
                    ),
                    centerTitle: true,
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
                          if (state is TrendingMoviesLoaded)
                            if ((state.trendingMovies?.results?.isNotEmpty ?? false) && state.trendingMovies != null) TrendingSlider(trendingMovies: state.trendingMovies),
                          const SizedBox(height: 32),
                          Text("Top rated movies.",
                              style: GoogleFonts.roboto(
                                textStyle: const TextStyle(color: Color(0xffffffff), fontWeight: FontWeight.bold, fontSize: 16),
                              )),
                          const SizedBox(height: 12),
                          if (state is TopMoviesLoaded)
                            if ((state.topRatedMovies?.results?.isNotEmpty ?? false) && state.topRatedMovies != null) MoviesSlider(topRatedMovies: state.topRatedMovies),
                          const SizedBox(height: 32),
                          Text("Upcoming movies.",
                              style: GoogleFonts.roboto(
                                textStyle: const TextStyle(color: Color(0xffffffff), fontWeight: FontWeight.bold, fontSize: 16),
                              )),
                          const SizedBox(height: 12),
                          if (state is UpcomingMoviesLoaded)
                            if ((state.upcomingMovies?.results?.isNotEmpty ?? false) && state.upcomingMovies != null) MoviesSlider(upcomingMovies: state.upcomingMovies),

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
                  ));
        },
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
