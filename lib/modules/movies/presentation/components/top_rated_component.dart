import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/core/utils/constants/api_constants.dart';
import 'package:movies/modules/movies/presentation/cubit/cubit.dart';
import 'package:movies/modules/movies/presentation/cubit/states.dart';
import 'package:shimmer/shimmer.dart';

class TopRatedWidget extends StatelessWidget {
  const TopRatedWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoviesCubit, MoviesStates>(
      builder: (context, state) {
        print("BlocBuilder TopRatedWidget");
        MoviesCubit cubit = MoviesCubit.get(context);

        return FadeIn(
          duration: const Duration(milliseconds: 500),
          child: SizedBox(
            height: 170.0,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              itemCount: cubit.topRatedModel.length,
              itemBuilder: (context, index) {
                return Container(
                padding: const EdgeInsets.only(right: 8.0),
                child: InkWell(
                onTap: () {
                /// TODO : NAVIGATE TO  MOVIE DETAILS
                },
                child: ClipRRect(
                borderRadius:
                const BorderRadius.all(Radius.circular(8.0)),
                child: CachedNetworkImage(
                width: 120.0,
                fit: BoxFit.cover,
                imageUrl: ApiConstants.imageUrl(cubit.topRatedModel[index].backDropPath),
                placeholder: (context, url) => Shimmer.fromColors(
                baseColor: Colors.grey[850]!,
                highlightColor: Colors.grey[800]!,
                child: Container(
                height: 170.0,
                width: 120.0,
                decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(8.0),
                ),
                ),
                ),
                errorWidget: (context, url, error) =>
                const Icon(Icons.error),
                ),
                ),
                ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
