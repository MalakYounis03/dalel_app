import 'package:bloc/bloc.dart';
import 'package:dalel_app/features/auth/presentation/auth_cubit/cubit/auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());
}
