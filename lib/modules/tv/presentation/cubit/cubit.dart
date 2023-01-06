import 'package:bloc/bloc.dart';
import 'package:movies/modules/tv/presentation/cubit/states.dart';


class TvCubit extends Cubit<TvStates> {
  TvCubit() : super(TvInitialState());
}
