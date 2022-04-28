import 'package:flutter_bloc/flutter_bloc.dart';



enum BlocProcessState { busy, idle }

class BaseBloc<E, S> extends Bloc<E, S> {
  BaseBloc(S initialState) : super(initialState);

  BlocProcessState _state = BlocProcessState.idle;

  BlocProcessState get processState => _state;

  Stream<S> runBlocProcess(Stream<S> Function() process) async* {}
}
