import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:weather_go/my_app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'core/helper/initil_repositories.dart';
import 'core/manger/user_provider.dart';
import 'features/auth/forgetPassword/presentation/manger/forget_password_provider.dart';
import 'features/auth/login/presentation/manger/provider.dart';
import 'features/auth/signUp/presentation/manger/provider.dart';
import 'firebase_options.dart';
import 'package:provider/provider.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  final userProvider = UserProvider();
  await userProvider.loadUsername();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final repositories = RepositoriesInitializer(firebaseAuth);
  runApp(
      MultiProvider(
        providers:[
          ChangeNotifierProvider(
            create:(context) => LoginProvider(repositories.loginUseCase),
          ),
          ChangeNotifierProvider(
            create:(context) => SignupProvider(repositories.signupUseCase)
          ),
          ChangeNotifierProvider(
            create:(context)=>ForgetPasswordProvider(repositories.forgetPasswordUseCase),
          ),
          ChangeNotifierProvider(
            create:(context)=>userProvider
          )
        ],
       child:const WeatherGo(),
      )
  );

}
