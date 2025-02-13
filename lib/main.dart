import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:weather_go/features/auth/login/presentation/manger/provider.dart';
import 'package:weather_go/features/auth/signUp/presentation/manger/provider.dart';
import 'package:weather_go/my_app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'features/auth/login/data/repositories/login_repository_impl.dart';
import 'features/auth/login/domain/repositories/login_repository.dart';
import 'features/auth/login/domain/usecases/login_usecase.dart';
import 'features/auth/signUp/data/repositories/signup_repository_impl.dart';
import 'features/auth/signUp/domain/repositories/signup_repository.dart';
import 'features/auth/signUp/domain/usecases/signup_usecase.dart';
import 'firebase_options.dart';
import 'package:provider/provider.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final LoginRepository loginRepository = LoginRepositoryImpl(firebaseAuth);
  final LoginUseCase loginUseCase = LoginUseCase(loginRepository);
  final SignupRepository signupRepository = SignupRepositoryImpl(firebaseAuth);
  final SignupUseCase signupUseCase = SignupUseCase(signupRepository);
  runApp(
      MultiProvider(
        providers:[
          ChangeNotifierProvider(
            create:(context) => LoginProvider(loginUseCase),
          ),
          ChangeNotifierProvider(
            create:(context) => SignupProvider(signupUseCase)
          )
        ],
        child:const WeatherGo(),
      )
  );

}


/*void main()async{
  runApp(const WeatherGo());
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options:DefaultFirebaseOptions.currentPlatform
  );
}*/