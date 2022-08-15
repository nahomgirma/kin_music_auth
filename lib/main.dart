import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutterfire_ui/auth.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: AuthGate(),
    );
  }
}

class AuthGate extends StatelessWidget {
  const AuthGate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        return StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            // User is not signed in
            if (!snapshot.hasData) {
              return const SignInScreen(
                providerConfigs: [
                   EmailProviderConfiguration(
                    if(!snapshot.hasdata){
                      return Signin
                    }),
                   GoogleProviderConfiguration(
                      clientId: '898355390271-insdtk6joqkqma1fuogjrs18tkm959cg.apps.googleusercontent.com',
                    ),
                   PhoneProviderConfiguration(),
                   FacebookProviderConfiguration(
                        clientId: '1183416785781282',
                      ),
                ]
              );
            }
            // if (snapshot.hasData) {
            //   return Homepage(); //this is the application scheme
            // }

            // Render your application if authenticated
            return const MyApp();
          },
        );
      },
    );
  }
}
