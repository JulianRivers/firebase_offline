import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_offline/core/navigation/app_routing_config.dart';
import 'package:firebase_offline/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:firebase_offline/service_locator.dart';
import 'package:flutter/material.dart';
import 'firebase_options.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  serviceLocatorInit();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  getIt.get<FirebaseFirestore>().settings = const Settings(
    cacheSizeBytes: Settings.CACHE_SIZE_UNLIMITED,
  );
  runApp(const BlocProviders());
}

class BlocProviders extends StatelessWidget {
  const BlocProviders({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (context) => getIt.get<AuthBloc>())],
      child: MainApp(),
    );
  }
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          title: "Firebase Offline App",
          routerConfig: AppRoutingConfig.router,
        );
      },
    );
  }
}
