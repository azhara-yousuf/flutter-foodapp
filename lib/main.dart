import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (kIsWeb) {
    await Firebase.initializeApp(
      options: FirebaseOptions(
        apiKey: "AIzaSyAVxkG7CWRg9SHDNZK1hXlKejMUaIzL_6M",
  authDomain: "madassignment-d77da.firebaseapp.com",
  projectId: "madassignment-d77da",
  storageBucket: "madassignment-d77da.appspot.com",
  messagingSenderId: "58053961596",
  appId: "1:58053961596:web:2501df5f321b62daac66f9",
  measurementId: "G-N1TX4HQSBX"
      ),
    );
  } else {
    await Firebase.initializeApp();  
  }

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food Delivery App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginScreen(),  
    );
  }
}
