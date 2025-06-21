import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safetrack/src/domain/useCases/auth/AuthUseCases.dart';
import 'package:safetrack/src/presentation/pages/client/home/bloc/ClientHomeEvent.dart';
import 'package:safetrack/src/presentation/pages/client/home/bloc/ClientHomeState.dart';

class ClientHomeBloc extends Bloc<ClientHomeEvent, ClientHomeState> {

  AuthUseCases authUseCases;

  ClientHomeBloc(this.authUseCases) : super(ClientHomeState()) {
    on<ChangeDrawerPage>((event, emit) {
      emit(state.copyWith(pageIndex: event.pageIndex));
    });

    on<Logout>((event, emit) async{
      await authUseCases.logout.run();
    });
  }
}
