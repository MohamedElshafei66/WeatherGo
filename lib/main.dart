import 'package:flutter/material.dart';
import 'package:weather_go/my_app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:device_preview/device_preview.dart';
void main()async{
  runApp(
    DevicePreview(
      enabled:true,
      builder: (context) => const WeatherGo(),

    ),
  );
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options:DefaultFirebaseOptions.currentPlatform
  );
}


/*void main()async{
  runApp(const WeatherGo());
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options:DefaultFirebaseOptions.currentPlatform
  );
}*/