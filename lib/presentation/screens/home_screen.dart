import 'package:eMeet/business_logic/blocs/home_bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import 'movies/movie_list_screen.dart';

// import 'chat_screen/chat_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isStatus = false;

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
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return SafeArea(
            child: state is HomeLoading
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
                    body: state.selectedIndex == 0 ? MovieListScreen(state: state) : Container(),
                    bottomNavigationBar: BottomNavigationBar(
                      onTap: (value) {
                        BlocProvider.of<HomeBloc>(context).onButtonSelected(value);
                      },
                      currentIndex: state.selectedIndex,
                      items: const [
                        BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: 'Home', activeIcon: Icon(Icons.home, color: Colors.white)),
                        BottomNavigationBarItem(icon: Icon(Icons.tv), label: 'TV', activeIcon: Icon(Icons.tv_off, color: Colors.white)),
                        BottomNavigationBarItem(icon: Icon(Icons.favorite_border), label: 'Favorite', activeIcon: Icon(Icons.favorite, color: Colors.white)),
                      ],
                    )));
      },
    );
  }
}
