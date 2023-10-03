import 'package:flutter/material.dart';
import 'package:supa_flutter/login_page.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
   await Supabase.initialize(
    url: 'https://smgaepbxjafvndrbbmjl.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InNtZ2FlcGJ4amFmdm5kcmJibWpsIiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTU3OTgzNjEsImV4cCI6MjAxMTM3NDM2MX0.niAmLkNtPTR5kYp3xjqD_B27WZsh_5ty6hrC5JdIcYA',
  );
  runApp(const MyApp());
}

final supabase = Supabase.instance.client;


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const LoginPage(),
    );
  }
}
