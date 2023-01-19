import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies/core/services/services_locator.dart';
import 'package:movies/core/utils/widgets_components/components.dart';
import 'package:movies/modules/movies/presentation/components/now_playing_movies_component.dart';
import 'package:movies/modules/movies/presentation/components/popular_component.dart';
import 'package:movies/modules/movies/presentation/components/top_rated_component.dart';
import 'package:movies/modules/movies/presentation/screens/movie_screen/cubit/cubit.dart';
import 'package:movies/modules/movies/presentation/screens/movie_screen/cubit/states.dart';
import 'package:movies/modules/movies/presentation/screens/popular_screen/popular_screen.dart';
import 'package:movies/modules/movies/presentation/screens/top_rated_screen/popular_screen.dart';
import 'package:shimmer/shimmer.dart';

class MoviesScreen extends StatelessWidget {
  const MoviesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => sl<MoviesCubit>()..getNowPlayingMovies()..getPopularMovies()..getTopRatedMovies(),
    child:BlocBuilder<MoviesCubit, MoviesStates>(
        builder: (context, state) {
          MoviesCubit cubit =MoviesCubit.get(context);
          return Scaffold(
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
                            navigateTo(context, const PopularScreen());

                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Text('See More',
                                  style: Theme
                                      .of(context)
                                      .textTheme
                                      .headline5,
                                ),
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
                  cubit.popularModel.length>1?
                  const PopularWidget():
                  Shimmer.fromColors(
                    baseColor: Colors.grey[850]!,
                    highlightColor: Colors.grey[800]!,
                    child:  Container(
                      height: 150.0,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),

                  ),
                  Container(
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
                            navigateTo(context,const TopRatedScreen());
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Text('See More',
                                  style: Theme
                                      .of(context)
                                      .textTheme
                                      .headline5,),
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
                  cubit.topRatedModel.length>1?
                  const TopRatedWidget():
                  Shimmer.fromColors(
                    baseColor: Colors.grey[850]!,
                    highlightColor: Colors.grey[800]!,
                    child:  Row(
                      children: [
                        Container(
                          height: 150.0,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      ],
                    ),

                  ),
                  const SizedBox(height: 50.0),
                ],
              ),
            ),

          );
        }
    )
    );
  }
}


