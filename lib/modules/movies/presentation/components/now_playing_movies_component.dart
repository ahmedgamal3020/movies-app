import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/core/utils/constants/api_constants.dart';
import 'package:movies/core/utils/widgets_components/components.dart';
import 'package:movies/modules/movies/presentation/screens/movie_details_screen/movie_detail_screen.dart';
import 'package:movies/modules/movies/presentation/screens/movie_screen/cubit/cubit.dart';
import 'package:movies/modules/movies/presentation/screens/movie_screen/cubit/states.dart';

class NowPlayingWidget extends StatelessWidget {
  const NowPlayingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoviesCubit,MoviesStates>(
        builder:(context,state){
          print("BlocBuilder NowPlayingWidget");
          MoviesCubit cubit =MoviesCubit.get(context);
          return  FadeIn(
            duration: const Duration(milliseconds: 500),
            child: CarouselSlider(
              options: CarouselOptions(
                height: 400.0,
                viewportFraction: 1.0,
                onPageChanged: (index, reason) {},
              ),
              items:
                  cubit.nowPlayingModel.map(
                    (item) {
                  return GestureDetector(
                    key: const Key('openMovieMinimalDetail'),
                    onTap: () {
                      navigateTo(context, MovieDetailScreen(id: item.id));

                    },
                    child: Stack(
                      children: [
                        ShaderMask(
                          shaderCallback: (rect) {
                            return const LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                // fromLTRB
                                Colors.transparent,
                                Colors.black,
                                Colors.black,
                                Colors.transparent,
                              ],
                              stops: [0, 0.3, 0.5, 1],
                            ).createShader(
                              Rect.fromLTRB(0, 0, rect.width, rect.height),
                            );
                          },
                          blendMode: BlendMode.dstIn,
                          child: CachedNetworkImage(
                            height: 560.0,
                            imageUrl: ApiConstants.imageUrl(item.backDropPath),
                            fit: BoxFit.fill,
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: 16.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Icon(
                                      Icons.circle,
                                      color: Colors.redAccent,
                                      size: 16.0,
                                    ),
                                    const SizedBox(width: 4.0),
                                    Text(
                                        'Now Playing'.toUpperCase(),
                                        style: Theme
                                            .of(context)
                                            .textTheme
                                            .bodyText1
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 16.0),
                                child: Text(
                                    item.title,
                                    textAlign: TextAlign.center,
                                    style: Theme
                                        .of(context)
                                        .textTheme
                                        .bodyText2
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
                  ).toList(),
            ),
          );
    }
    );
  }
}
