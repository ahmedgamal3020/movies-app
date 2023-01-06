import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies/core/services/services_locator.dart';
import 'package:movies/modules/movies/presentation/components/now_playing_movies_component.dart';
import 'package:movies/modules/movies/presentation/components/popular_component.dart';
import 'package:movies/modules/movies/presentation/components/top_rated_component.dart';
import 'package:movies/modules/movies/presentation/cubit/cubit.dart';

class MoviesScreen extends StatelessWidget {
  const MoviesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<MoviesCubit>()..getNowPlayingMovies()..getPopularMovies()..getTopRatedMovies(),
          child: Scaffold(
              body: SingleChildScrollView(
                key: const Key('movieScrollView'),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 50,),
                    const NowPlayingWidget(),
                    Container(
                      margin: const EdgeInsets.fromLTRB(16.0, 24.0, 16.0, 8.0),
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Popular",
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 19,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 0.15,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          /// TODO : NAVIGATION TO POPULAR SCREEN
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children:  [
                              Text('See More',
                              style: Theme.of(context).textTheme.headline5,
                              ),
                             const  Icon(
                                Icons.arrow_forward_ios,
                                size: 16.0,
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const PopularWidget(),
                Container (
                  margin: const EdgeInsets.fromLTRB(
                    16.0,
                    24.0,
                    16.0,
                    8.0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Top Rated",
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 19,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 0.15,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          /// TODO : NAVIGATION TO Top Rated Movies Screen
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Text('See More',
                                style:Theme.of(context).textTheme.headline5 ,),
                             const Icon(
                                Icons.arrow_forward_ios,
                                size: 16.0,
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const TopRatedWidget(),
                const SizedBox(height: 50.0),
              ],
            ),
        ),
    ),
    );
  }

  }
