import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/core/services/services_locator.dart';
import 'package:movies/core/utils/constants/api_constants.dart';
import 'package:movies/modules/movies/presentation/screens/movie_screen/cubit/cubit.dart';
import 'package:movies/modules/movies/presentation/screens/movie_screen/cubit/states.dart';
import 'package:movies/style/colors.dart';
import 'package:shimmer/shimmer.dart';

class TopRatedScreen extends StatelessWidget {
  const TopRatedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<MoviesCubit>()..getTopRatedMovies(),
      child: BlocBuilder<MoviesCubit, MoviesStates>(
      builder: (context, state) {
        var cubit =MoviesCubit.get(context).topRatedModel;
        return Scaffold(
          appBar: AppBar(
            title:  Text('top rated'.toUpperCase(),
            style: Theme.of(context).textTheme.headline1,
            ),
            centerTitle: true,
          ),
          body: Column(
            children: [
              Expanded(
                child: ListView.separated(
                  itemBuilder:(context,index){
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Container(
                        height: 150.0,
                        decoration: BoxDecoration(
                          color: Colors.black45,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          children: [
                            Padding(
                              padding:const EdgeInsets.all(8),
                              child: ClipRRect(

                                borderRadius: BorderRadius.circular(8),
                                child: CachedNetworkImage(

                                  width:MediaQuery.of(context).size.width/4,
                                  height: 150.0,
                                  imageUrl: ApiConstants.imageUrl(cubit[index].backDropPath),
                                  fit: BoxFit.cover,
                                  placeholder: (context, url) => Shimmer.fromColors(
                                    baseColor: Colors.grey[850]!,
                                    highlightColor: Colors.grey[800]!,
                                    child: Container(
                                      height: 150.0,
                                      decoration: BoxDecoration(
                                        color: Colors.black,
                                        borderRadius: BorderRadius.circular(8.0),
                                      ),
                                    ),
                                  ),
                                ),

                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(vertical: 16),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(cubit[index].title,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                                        fontStyle: FontStyle.italic,
                                        overflow: TextOverflow.ellipsis

                                      ),
                                    ),
                                    const SizedBox(height: 8,),
                                    Row(
                                      children: [
                                        Container(
                                          height: 25,
                                          width: 50,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(8),
                                            color: Colors.red,
                                          ),
                                          child: Text(cubit[index].releaseDate.split('-').first,
                                            textAlign: TextAlign.center,
                                            style: Theme.of(context).textTheme.headline1
                                          ),
                                        ),
                                        const SizedBox(width: 10,),
                                        const Icon(Icons.star,color: Colors.amber,),
                                        const SizedBox(width: 10,),
                                        Text('${cubit[index].voteAverage}',
                                        style: Theme.of(context).textTheme.headline1,
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(cubit[index].overView,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: Theme.of(context).textTheme.headline1,
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  } ,
                  separatorBuilder: (context,index)=>const SizedBox(height: 10,),
                  itemCount: cubit.length,
                ),
              ),
            ],
          ),
        );
      },
    ),
);
  }
}
