import 'package:bloc/bloc.dart';

class SimpleBlockDelegate extends BlocDelegate {

  @override
  void onTransition(Transition transition) {
    print('Simple bloc delegate, transition: $transition');
  }
}