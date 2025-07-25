import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safetrack/src/domain/models/AuthResponse.dart';
import 'package:safetrack/src/domain/useCases/auth/AuthUseCases.dart';
import 'package:safetrack/src/presentation/pages/profile/info/bloc/ProfileInfoEvent.dart';
import 'package:safetrack/src/presentation/pages/profile/info/bloc/ProfileInfoState.dart';

class ProfileInfoBloc extends Bloc<ProfileInfoEvent,ProfileInfoState>{
  AuthUseCases authUseCases;
  ProfileInfoBloc(this.authUseCases): super(ProfileInfoState()){

    on<GetUserInfo>((event, emit) async{
      AuthResponse authResponse = await authUseCases.getUserSession.run();
      emit(
        state.copyWith(
          user: authResponse.user
        )

      );
    });

  }
}