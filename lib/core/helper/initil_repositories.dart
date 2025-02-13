import 'package:firebase_auth/firebase_auth.dart';
import '../../features/auth/forgetPassword/data/repositories/forget_password_repository_impl.dart';
import '../../features/auth/forgetPassword/domain/repositories/forget_password_repository.dart';
import '../../features/auth/forgetPassword/domain/usecases/forget_password_usecase.dart';
import '../../features/auth/login/data/repositories/login_repository_impl.dart';
import '../../features/auth/login/domain/repositories/login_repository.dart';
import '../../features/auth/login/domain/usecases/login_usecase.dart';
import '../../features/auth/signUp/data/repositories/signup_repository_impl.dart';
import '../../features/auth/signUp/domain/repositories/signup_repository.dart';
import '../../features/auth/signUp/domain/usecases/signup_usecase.dart';


class RepositoriesInitializer {
  final LoginRepository loginRepository;
  final LoginUseCase loginUseCase;
  final SignupRepository signupRepository;
  final SignupUseCase signupUseCase;
  final ForgetPasswordRepository forgetPasswordRepository;
  final ForgetPasswordUseCase forgetPasswordUseCase;

  RepositoriesInitializer(FirebaseAuth firebaseAuth)
      : loginRepository = LoginRepositoryImpl(firebaseAuth),
        loginUseCase = LoginUseCase(LoginRepositoryImpl(firebaseAuth)),
        signupRepository = SignupRepositoryImpl(firebaseAuth),
        signupUseCase = SignupUseCase(SignupRepositoryImpl(firebaseAuth)),
        forgetPasswordRepository = ForgetPasswordRepositoryImpl(firebaseAuth),
        forgetPasswordUseCase = ForgetPasswordUseCase(ForgetPasswordRepositoryImpl(firebaseAuth));
}
