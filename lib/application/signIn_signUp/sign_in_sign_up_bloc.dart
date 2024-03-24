import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'sign_in_sign_up_event.dart';
part 'sign_in_sign_up_state.dart';

class SignInSignUpBloc extends Bloc<SignInSignUpEvent, SignInSignUpState> {
  SignInSignUpBloc() : super(SignInSignUpInitial()) {
    on<ToggleSignInEvent>((event, emit) {
      final currentState = state;
      emit(SignInSignUpState(signIn: !currentState.signIn));
    });
  }
}
