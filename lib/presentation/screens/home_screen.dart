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
    BlocProvider.of<HomeBloc>(context).fetchGenreList();
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
                      title: Image.asset("assets/home_logo.png", width: 200),
                      centerTitle: true,
                      actions: [
                        if (state.genreList?.genres?.isNotEmpty ?? false)
                          PopupMenuButton<String>(
                            icon: const Icon(Icons.filter_list_outlined, color: Colors.white),
                            padding: const EdgeInsets.all(2),
                            onSelected: (String value) {
                              BlocProvider.of<HomeBloc>(context).fetchGenreList();
                              BlocProvider.of<HomeBloc>(context).discoverMovies(value);
                            },
                            itemBuilder: (BuildContext context) {
                              return List.generate(
                                  state.genreList!.genres!.length,
                                  (index) => PopupMenuItem<String>(
                                        value: (state.genreList!.genres![index].id ?? "0").toString(),
                                        child: Text(
                                          state.genreList!.genres![index].name ?? "",
                                          style: GoogleFonts.roboto(
                                            textStyle: const TextStyle(color: Color(0xffffffff), fontWeight: FontWeight.w400, fontSize: 14),
                                          ),
                                        ),
                                      ));
                            },
                          )
                      ],
                    ),
                    body: state.selectedIndex == 0
                        ? state.discoverMovies?.results?.isNotEmpty ?? false
                            ? Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
                                child: GridView.builder(
                                    itemCount: state.discoverMovies?.results?.length,
                                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(childAspectRatio: 8 / 12, crossAxisCount: 2, mainAxisSpacing: 8.0, crossAxisSpacing: 8.0),
                                    itemBuilder: (ctx, index) {
                                      return ClipRRect(
                                          borderRadius: BorderRadius.circular(12),
                                          child: Container(
                                            color: Colors.yellow,
                                            child: Image.network("https://image.tmdb.org/t/p/w500${(state.discoverMovies?.results?[index].posterPath ?? "")}",
                                                width: 200, height: MediaQuery.of(context).size.height * 0.3, fit: BoxFit.cover),
                                          ));
                                    }),
                              )
                            : MovieListScreen(state: state)
                        : Container(),
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
