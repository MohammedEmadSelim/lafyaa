import 'package:flutter_bloc/flutter_bloc.dart';

part 'carousel_state.dart';


class CarouselCubit extends Cubit<CcarouselState> {
   CarouselCubit() : super(IndexForCarouselCircle());
  int indexForCircls = 0;
  void runIndex(int i) {
    indexForCircls = i;
    print(indexForCircls);
    print(i);
    emit(IndexForCarouselCircle() );
  }
}